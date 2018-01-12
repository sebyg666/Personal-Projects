-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Make-Settings.lua')
include('Organizer-lib.lua')
--[[
    Custom commands:
    
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy'}
	state.SingingMode = M{['description']='Singing Style', 'None', 'Etra_Length'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	state.Buff['Troubadour'] = buffactive['troubadour'] or false
	state.Buff['Nightingale'] = buffactive['nightingale'] or false
	
	song_buffsSpellMap = S{'Minuet', 'Minne', 'March', 'Madrigal', 'Prelude', 'Mambo', 'Mazurka', 'Etude', 'Ballad', 'Paeon', 'Carol'}
	song_buffsSpellName = S{"Honor March", "Fowl Aubade", "Herb Pastoral", "Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte", "Goddess's Hymnus", "Maiden's Virelai", "Sentinel's Scherzo"}
	song_sleepSpellName = S{'Foe Lullaby', 'Foe Lullaby II'}
	song_sleepAoESpellName = S{'Horde Lullaby', 'Horde Lullaby II'}
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	state.CP  				  = M(false, 'CP')
	state.Pianissimo	      = M(false, 'Pianissimo All Songs')
	state.SingingMode:set('Etra_Length')
	
	DW_needed = 0
	DW = false
	
	send_command('gi update')
    update_combat_form()
    
    -- Additional local binds
	
	send_command('bind !] gs c toggle Pianissimo')
	send_command('bind ^] gs c cycle SingingMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind @F11 gs c cycle ExtraSongsMode')
	send_command('bind !F12 gs c cycle IdleMode')
	send_command('bind ^F12 gs c cycle CastingMode')
	
	send_command('gi ugs true')
	
	Ring_lock = S{"Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring"}
	Tele_Ring = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)"}
	Ear_lock = S{"Reraise Earring"}
	
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
    select_default_macro_book()

	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	initialize(text_box)
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()
		
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			check_target(spell, action, spellMap, eventArgs)
			if state.Buff['Troubadour'] and state.Buff['Nightingale'] then
				get_casting_style(spell, action, spellMap, eventArgs)
				eventArgs.handled = true
			end
		end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 and spellMap == 'Cure' then
			if spell.en == 'Cure IV' then
				cancel_spell()
				send_command('input /ma "Cure III" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		end
	end
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if state.ExtraSongsMode.value == 'Dummy' then
		equip(sets.precast.FC.Daurdabla)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			get_casting_style(spell, action, spellMap, eventArgs)
			eventArgs.handled = true
		elseif spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.CureSelf)
				eventArgs.handled = true
			end
		end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		 if spellMap == 'Cure' or spellMap == 'Curaga' then
            if world.weather_element == 'Light' or windower.ffxi.get_info().day == 'Lightsday' then
                equip(sets.midcast['Cure day / weather'])
            end
		end
	end
	if state.CP.value == true then
		equip(sets.CP)
	end
end


-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.name] == false and not spell.interrupted then
		state.Buff[spell.name] = true
    end
	if spell.type == 'BardSong' and not spell.interrupted then
		if state.Buff['Pianissimo'] == true then
			state.Buff['Pianissimo'] = false
		end
		state.ExtraSongsMode:reset()
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_handle_equipping_gear(playerStatus, eventArgs)
	update_combat_form()
	update()
end

-- Handle notifications of general user state change.
function job_state_change(field, newValue, oldValue)

	if field == "PhysicalDefense" then
		if state.PhysicalDefense.value == true then
			state.DefenseMode.current = 'Physical'
			state.DefenseMode:set('Physical')
			state.MagicalDefense = M(false)
		end
	elseif field == "MagicalDefense" then
		if state.MagicalDefense.value == true then
			state.DefenseMode.current = 'Magical'
			state.DefenseMode:set('Magical')
			state.PhysicalDefense = M(false)
		end
	end
	if field == "MagicalDefense" or field == "PhysicalDefense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
	
    if field == 'Offense Mode' then
        if newValue ~= 'None' then
			if state.CombatForm == 'DW' then
				equip(sets.Locked_Main_Sub_DW)
			else
				equip(sets.Locked_Main_Sub)
			end
            disable('main','sub')
        else
            enable('main','sub')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		-- if not midaction() then
			-- handle_equipping_gear(player.status)
		-- end
	end
	if buff == 'Goldsmithing Imagery' and gain then
		 send_command('timers create "'..buff..'" 480 down abilities/00121.png')
	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	
	lockouts()

	if state.DefenseMode.current == 'None' then 
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
	end
    return idleSet
end

function customize_melee_set(meleeSet)
	
	lockouts()
	
	if state.DefenseMode.current == 'None' then 
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
	end
    return meleeSet
end

function lockouts()

	if Tele_Ring:contains(player.equipment.ring1) and unlock_em == false then
		if Ring_slot_locked_1 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_1 = true
		disable('ring1')
	end
	if Tele_Ring:contains(player.equipment.ring2) and unlock_em == false then
		if Ring_slot_locked_2 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_2 = true
		disable('ring2')
	end
	
	if (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then
		enable('ring1')
		enable('ring2')
	elseif not (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then 
		unlock_em = false
		Ring_slot_locked_1 = false
		Ring_slot_locked_2 = false
		add_to_chat(200,('[Zoned: '):color(Notification_color) .. ('-> Un-locking Tele/Warp Rings '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring1) and Ring_slot_locked_1 and unlock_em == false then 
		Ring_slot_locked_1 = false
		enable('ring1')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 1'):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring2) and Ring_slot_locked_2 and unlock_em == false then 
		Ring_slot_locked_2 = false
		enable('ring2')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 2'):color(text_color) .. (']'):color(Notification_color) )
	end
	--------------------------------
	-- Ring locks for exp ring use
	
	if Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		disable('ring1')
	elseif not Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		enable('ring1')
	end
	
	if Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		disable('ring2')
	elseif not Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		enable('ring2')
	end
	
	---------------------------------
	-- earring locks
	
	if Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	elseif not Ear_lock:contains(player.equipment.ear1) then
		enable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	elseif not Ear_lock:contains(player.equipment.ear2) then
		enable('Ear2')
	end
	
end

function reset_rings()
	if Ring_slot_locked_1 or Ring_slot_locked_2 then
		unlock_em = true
	end
end

windower.raw_register_event('zone change',reset_rings)

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
	
    local msg = ('   [Melee'):color(Notification_color)
    
    if state.CombatForm.has_value then
        msg = msg .. (' (' .. state.CombatForm.value .. ')'):color(text_color)
    end
    
	if #classes.CustomMeleeGroups > 0 then
        for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then
					msg = msg .. (' ('):color(Notification_color)
				end
				msg = msg .. (classes.CustomMeleeGroups[i]):color(Notification_color)
				if i < #classes.CustomMeleeGroups then
					msg = msg .. (' + '):color(Notification_color)
				end
				if i == #classes.CustomMeleeGroups then
					msg = msg .. (')'):color(Notification_color)
				end
			end
        end
    end
	
    msg = msg .. (': '):color(Notification_color)
    
	if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end
	
	msg = msg .. ('] [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Extra Length: '):color(Notification_color) .. (state.SingingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Dummy Song: '):color(Notification_color) .. (state.ExtraSongsMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	if state.Pianissimo.value == true then
		msg = msg .. ('[Pianissimo all Songs'):color(Notification_color) .. ('] '):color(Notification_color)
	end
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.CP.value == true then
        msg = msg .. ('[CP cape'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)

    eventArgs.handled = true
	save_settings()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function check_target(spell, action, spellMap, eventArgs)
	if not (buffactive['Amnesia'] or buffactive['impairment']) and song_buffsSpellMap:contains(spellMap) or song_buffsSpellName:contains(spell.name) then 
		if state.Pianissimo.value == true and (((spell.target.type == 'PLAYER' or spell.target.type == 'SELF') and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) then
			if not state.Buff['Pianissimo'] then
				cancel_spell()
				send_command('Pianissimo')
				send_command:schedule(1,'input /ma "'..spell.name.. '" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		else
			if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) then
				if not state.Buff['Pianissimo'] then
					cancel_spell()
					send_command('Pianissimo')
					send_command:schedule(2,'input /ma "'..spell.name.. '" ' .. spell.target.name)
					eventArgs.cancel = true
					return
				end
			end
		end
	elseif (buffactive['Amnesia'] or buffactive['impairment']) then 
		if spell.target.type == 'PLAYER' then
			cancel_spell()
			send_command('"'..spell.name..'" <me>')
			add_to_chat(200,'***** Job Abilities not available. Redirecting spell to SELF *****')
			eventArgs.cancel = true
			return
		end
	end
end

function get_casting_style(spell, action, spellMap, eventArgs)
	local equipSet = sets.midcast
	
	--classes.SkipSkillCheck = classes.NoSkillSpells:contains(spell.english)
    -- Handle automatic selection of set based on spell class/name/map/skill/type.
    equipSet = select_specific_set(equipSet, spell, spellMap)
	if spell.type == 'BardSong' then
		if set.contains(spell.targets, 'Enemy') then
			if song_sleepSpellName:contains(spell.name) then
				spellMap = "F-Lullaby" 
			elseif song_sleepAoESpellName:contains(spell.name) then
				spellMap = "H-Lullaby" 
			end
			equipSet = equipSet['Debuff']
			equipSet = select_specific_set(equipSet, spell, spellMap)
			
		else
			if state.ExtraSongsMode.value == 'None' then
				if state.SingingMode.value == 'None' then
					if equipSet['Buff'] then 
						equipSet = equipSet['Buff']
					end
				elseif state.SingingMode.value == 'Etra_Length' then 
					if equipSet['Extra Length'] then 
						equipSet = equipSet['Extra Length']
					elseif equipSet['Buff']['Extra Length'] then 
						equipSet = equipSet['Buff']['Extra Length']
					end
				end
				equipSet = select_specific_set(equipSet, spell, spellMap)
			elseif state.ExtraSongsMode.value == 'Dummy' then
				if equipSet['Dummy'] then 
					equipSet = equipSet['Dummy']
				end
			end
		end
	end

	if equipSet[state.CastingMode.current] then
		equipSet = equipSet[state.CastingMode.current]
	end
	
	equip(equipSet)
end

-- Examine equipment to determine what our current TP weapon is.
function update_combat_form()
	if DW == true then
		state.CombatForm:set('DW')
	elseif DW == false then
		state.CombatForm:reset()
	end
end

function job_self_command(cmdParams, eventArgs)
   gearinfo(cmdParams, eventArgs)
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.SingingMode then
        properties:append('${SingingMode}')
    end
	if state.ExtraSongsMode then
        properties:append('${ExtraSongsMode}')
    end
	if state.Pianissimo then
        properties:append('${Pianissimo}')
    end
	if state.Kiting then
        properties:append('${Kiting}')
    end
	if state.CP then
        properties:append('${CP}')
    end
	if state.DefenseMode then
        properties:append('${DefenseMode}')
    end
    text:clear()
    text:append(properties:concat(''))
	update()
end

function update()
	
	local white = '\\cs(220,220,220)'
	local blue = '\\cs(150,150,235)'
	local red = '\\cs(255,0,0)'
	local orange = '\\cs(232,138,13)'
	local yellow = '\\cs(220,220,0)'
	local green = '\\cs(0,225,0)'
	local purple = '\\cs(213,43,196)'
	
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
        text_box:hide()
        return
    end

	local inform = {}
	local msg = ' [Melee'
	if state.CombatForm.current == 'DW' then
		msg = msg .. ' (DW)'
	end
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg ..')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value == 'None' then
		msg = blue .. msg .. white .. state.OffenseMode.value .. blue..'] '
	else
		msg = red .. msg .. state.OffenseMode.value .. '] '
	end
	inform.OffenseMode = msg .. '\\cr'
			
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	
	if state.SingingMode.value ~= 'None' then
		inform.SingingMode = (purple .. ('\n [Singing: '.. white .. state.SingingMode.value:lpad(' ', 2) .. purple .. '] ' )) .. '\\cr'
	else
		inform.SingingMode = ('')
	end
	
	if state.ExtraSongsMode.value ~= 'None' then
		inform.ExtraSongsMode = (red .. ('\n [Extra Song: '.. yellow .. state.ExtraSongsMode.value:lpad(' ', 2) .. red .. '] ' )) .. '\\cr'
	else
		inform.ExtraSongsMode = ('')
	end
	
	if state.Pianissimo.value == true then
		inform.Pianissimo = (purple .. ('\n [Pianissimo] ' )) .. '\\cr'
	elseif state.Pianissimo.value == false then
		inform.Pianissimo = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '.. white .. state.IdleMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	end
		
	if state.DefenseMode.value == 'None' then
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (orange .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (orange .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	else
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (red .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (red .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	end
	
	if state.DefenseMode.value ~= 'None' then
		inform.DefenseMode = (red .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. white ..' (' ..state[state.DefenseMode.value .. 'DefenseMode'].value ..')'..red..']' )) .. '\\cr'
	else
		inform.DefenseMode = ('')
	end
	
	if not table.equals(old_inform, inform) then
		text_box:update(inform)
		text_box:show()
		old_inform = inform
	end
end

windower.register_event('unload', function()
	text_box:destroy()
	text_box = nil
	
	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')
	
	send_command('unbind f7')
	send_command('unbind ^f7')
	send_command('unbind !f7')
	send_command('unbind @f7')
	
	send_command('unbind f8')
	send_command('unbind ^f8')
	send_command('unbind !f8')
	send_command('unbind @f8')
	
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind @f10')
	
	send_command('unbind f11')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind @f11')
	
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')
	send_command('unbind @f12')
	
end)

windower.register_event('job change',function()
    send_command('gs r')
end)

function select_default_macro_book()
end
-- windower.raw_register_event('zone change',reset_timers)
-- windower.raw_register_event('logout',reset_timers)
