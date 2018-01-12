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
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
	state.SingingMode = M{['description']='Singing Style', 'Full_AF3', 'Etra_Length'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	
	song_buffsSpellMap = S{'Minuet', 'Minne', 'March', 'Madrigal', 'Prelude', 'Mambo', 'Mazurka', 'Etude', 'Ballad', 'Paeon', 'Carol'}
	song_buffsSpellName = S{"Fowl Aubade", "Herb Pastoral", "Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte", "Goddess's Hymnus", "Maiden's Virelai", "Sentinel's Scherzo"}
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
	
	DW_needed = 0
	DW = false
	
	send_command('gi update')
    update_combat_form()
    
    -- Adjust this if using the Terpander (new +song instrument)
    -- info.ExtraSongInstrument = 'Daurdabla'
	info.ExtraSongInstrument = 'Terpander'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
    
    -- Additional local binds
	
	send_command('bind !F12 gs c toggle Pianissimo')
	send_command('bind ^F12 gs c cycle CastingMode')
    send_command('bind @F11 gs c cycle ExtraSongsMode')
	send_command('bind !F11 gs c cycle SingingMode')
	send_command('bind ^F11 gs c cycle CP')
	
	Notification_color = 200
	text_color = 160
	warning_text = 167

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
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
	
    -- Precast Sets
    sets.precast.JA.Nightingale = {}
    sets.precast.JA.Troubadour = {}
    sets.precast.JA['Soul Voice'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {}
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})     

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
	-- Weaponskill sets
	sets.precast.WS = {}
	sets.precast.WS['Evisceration'] = {}
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Rudra's Storm"] = {}
	sets.precast.WS['Mordant Rime'] = {}
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {}	
	sets.midcast['Enfeebling Magic'] = {}
				
	-- TH belt	
	-- sets.midcast['Dia'] = set_combine(sets.midcast['Enfeebling Magic'] ,{waist="Tarutaru sash"})
        
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
    sets.midcast['Foe Lullaby'] 		= {}
	sets.midcast['Foe Lullaby II'] 		= {}
	sets.midcast['Horde Lullaby'] 		= {}
	sets.midcast['Horde Lullaby II'] 	= {}
	sets.midcast["Sentinel's Scherzo"]	= {}
	sets.midcast['Magic Finale'] 		= {}
	sets.midcast['Pinning Nocturne'] 	= {}
	sets.midcast.Ballad 				= {}
	sets.midcast.Madrigal 				= {}
	sets.midcast.March 					= {}
	sets.midcast.Minuet 				= {}
	sets.midcast.Minne 					= {}
	sets.midcast.Elegy 					= {}
	sets.midcast.Etude 					= {}
	sets.midcast.Prelude 				= {}
	sets.midcast.Requiem 				= {}
	sets.midcast.Mambo 					= {}
	sets.midcast.Threnody 				= {}
	sets.midcast.Hymnus 				= {}
	sets.midcast.Mazurka 				= {}
	sets.midcast.Paeon					= {}
	sets.midcast.Virelai 				= {}
	sets.midcast.Carol 					= {}
    
     -- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffectLength = {}
			
	sets.midcast.SongEffectFullAF = set_combine(sets.midcast.SongEffectLength, {})

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {}
			
	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {}

    -- Other general spells and classes.
	sets.midcast.Cure = {}			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Protect = {}
	sets.midcast.Shell = {}
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {}
	sets.idle.PDT = {}
	sets.idle.Town = {}
	sets.idle.Weak = {}
	
	-- Defense sets

	sets.defense.PDT = {}
	sets.defense.MDT = {}
	sets.Kiting = {}
	sets.CP = {}
	sets.latent_refresh = {}

    -- Engaged sets
    sets.engaged = {}
	sets.engaged = {}
	sets.engaged.DW = {}
	sets.engaged.DW.Acc = {}
	sets.buff.Reive = {}
		
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			get_casting_style(spell, action, spellMap, eventArgs)
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
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
		elseif spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.CureSelf)
			end
		end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            equip(sets.midcast.Daurdabla)
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
	state.ExtraSongsMode:reset()
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
		if not midaction() then
			handle_equipping_gear(player.status)
		end
	end
	if buff == 'Goldsmithing Imagery' and gain then
		 send_command('timers create "'..buff..'" 480 down abilities/00121.png')
	end
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
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
	
	msg = msg .. (' [Singing Mode: '):color(Notification_color) .. (state.SingingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
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
function get_casting_style(spell, action, spellMap, eventArgs)
	if not (buffactive['Amnesia'] or buffactive['impairment']) and song_buffsSpellMap:contains(spellMap) or song_buffsSpellName:contains(spell.name) then 
		if state.Pianissimo.value == true and ((spell.target.type == 'PLAYER' or spell.target.type == 'SELF' and not spell.target.charmed) or npcs.Trust:contains(spell.target.name)) then
			if not state.Buff['Pianissimo'] then
				cancel_spell()
				send_command('input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
				eventArgs.cancel = true
				return
			end
		else
			if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or npcs.Trust:contains(spell.target.name)) then
				if not state.Buff['Pianissimo'] then
					cancel_spell()
					send_command('input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
					eventArgs.cancel = true
					return
				end
			end
		end
	elseif (buffactive['Amnesia'] or buffactive['impairment']) then 
		if spell.target.type == 'PLAYER' then
			cancel_spell()
			send_command('input /ma "'..spell.name..'" <me>')
			add_to_chat(200,'***** Job Abilities not available. Redirecting spell to SELF *****')
			eventArgs.cancel = true
			return
		end
	end
end

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        return 'DaurdablaDummy'
	end
    if state.SingingMode.value == 'Etra_Length' then
        return 'SongEffectLength'
	elseif state.SingingMode.value == 'Full_AF3' then 
		return 'SongEffectFullAF'
    end
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
    if cmdParams[1] == 'gearinfo' then
		if type(tonumber(cmdParams[2])) == 'number' then
			if tonumber(cmdParams[2]) ~= DW_needed then
				DW_needed = tonumber(cmdParams[2])
				DW = true
			end
			if not midaction() then
				send_command('gs c update')
			end
		elseif type(cmdParams[2]) == 'string' then
			if cmdParams[2] == 'false' then
				DW_needed = 0
				DW = false
			end
			if not midaction() then
				send_command('gs c update')
			end
		end
	   --add_to_chat(cmdParams[2])
    end
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
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
        text_box:hide()
        return
    end

	local inform = {}
	local msg = ' [Melee'
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg .. ')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value ~= 'None' then 
		inform.OffenseMode = ('\\cs(255,0,0)' .. (' [Melee: '..state.OffenseMode.value:lpad(' ', 2) .. '] LOCKED ' )) .. '\\cr'
	else
		inform.OffenseMode = ('\\cs(0,255,0)' .. (' [Melee: '..state.OffenseMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	end
			
	inform.CastingMode = ('\\cs(0,255,0)' .. ('\n [Casting: '..state.CastingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	inform.SingingMode = ('\\cs(150,150,255)' .. ('\n [Singing: '..state.SingingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	
	if state.Pianissimo.value == true then
		inform.Pianissimo = ('\\cs(213,43,196)' .. ('\n [Pianissimo] ' )) .. '\\cr'
	elseif state.Pianissimo.value == false then
		inform.Pianissimo = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = ('\\cs(0,255,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = ('\\cs(255,0,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] LOCKED ' )) .. '\\cr'
	end
		
	if state.DefenseMode.value == 'None' then
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('\\cs(232,138,13)' .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = ('\\cs(232,138,13)' .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	else
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('\\cs(255,0,0)' .. ('[CP Cape]  LOCKED ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = ('\\cs(255,0,0)' .. ('\n [CP Cape]  LOCKED ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	end
	
	if state.DefenseMode.value ~= 'None' then
		inform.DefenseMode = ('\\cs(255,0,0)' .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')]' )) .. '\\cr'
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
