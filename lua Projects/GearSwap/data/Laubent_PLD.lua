-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Make-Settings.lua')
include('Organizer-lib.lua')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.doom = buffactive.doom or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Acc', 'Normal')
    state.HybridMode:options('Turtle', 'Normal')
    state.WeaponskillMode:options('Acc', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'Reraise')
	state.IdleMode:options('PDT','Refresh','Regen','Reraise')
    
    state.ExtraDefenseMode 	= M{['description']='Extra Defense Mode', 'None', 'MP','Resist_Death','Shield_Skill'}
	state.EquipShield 				= M(false, 'Equip Shield w/Defense')
	state.CP  							= M(false, 'CP')
	state.PhysicalDefense   		= M(false, 'PhysicalDefense')
	state.MagicalDefense			= M(false, 'MagicalDefense')
	state.Auto_Kite  				= M(false, 'Auto_Kite')
	
	gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Zoran's belt"
	
	send_command('bind ^] gs c cycle HybridMode')
    send_command('bind @] gs c cycle ExtraDefenseMode')
    send_command('bind @f11 gs c toggle EquipShield')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind ^f12 gs c cycle IdleMode')
	send_command('bind ![ gs c cycle PhysicalDefenseMode')
	send_command('bind !] gs c cycle MagicalDefenseMode')
	
	Ring_lock = S{"Warp Ring", "Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring", "Dim. Ring (Dem)"}
	Ear_lock = S{"Reraise Earring"}
	
	send_command('gi ugs true')
	
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	update_defense_mode()
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
function job_precast(spell, action, spellMap, eventArgs)
	if state.DefenseMode.value ~= 'None' and  spell.type == 'WeaponSkill' then
		eventArgs.cancel = true
	end
	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' and spell.target.type == 'SELF' and state.DefenseMode.current == 'None' then
			if spell.name == 'Cure IV' and player.hp > 1775 then
				--add_to_chat(200,('[Pre-Cast Curecheat:'):color(Notification_color) .. (' -> HP '):color(text_color) .. ('DOWN'):color(warning_text) .. (' set for: \"' ..spell.name.. '\"'):color(text_color) .. (']'):color(Notification_color))
				equip(sets.precast.FC.cureCheatFour)
				eventArgs.handled = true
			elseif spell.name == 'Cure III' and player.hp > 1950 then
				--add_to_chat(200,('[Pre-Cast Curecheat:'):color(Notification_color) .. (' -> HP '):color(text_color) .. ('DOWN'):color(warning_text) .. (' set for: \"' ..spell.name.. '\"'):color(text_color) .. (']'):color(Notification_color))
				equip(sets.precast.FC.cureCheatThree)
				eventArgs.handled = true
			elseif spell.name == 'Cure IV' and player.hp < 1776 then
				add_to_chat(200,('[Pre-Cast Curecheat:'):color(Notification_color) .. (' -> HP down '):color(text_color) .. ('LOCKED:'):color(warning_text) .. (' HP too low'):color(text_color) .. (']'):color(Notification_color))
			elseif spell.name == 'Cure III' and player.hp < 1951 then
				add_to_chat(200,('[Pre-Cast Curecheat:'):color(Notification_color) .. (' -> HP down '):color(text_color) .. ('LOCKED:'):color(warning_text) .. (' HP too low'):color(text_color) .. (']'):color(Notification_color))
			end
			
		elseif spellMap == 'Cure' and spell.target.type == 'SELF' and state.DefenseMode.current ~= 'None' then
			add_to_chat(200,('[Pre-Cast Curecheat:'):color(Notification_color) .. (' -> HP down '):color(text_color) .. ('LOCKED:'):color(warning_text) .. (' Defense Set Active'):color(text_color) .. (']'):color(Notification_color))
		end
	end	
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			equip(sets.buff.Reive)
		end
		-- Replace Moonshade Earring if we're at cap TP
        if player.tp > 2750 then
			if spell.name == "Savage Blade" then
				equip(sets.precast.MaxTP)
			end
        end
	end
end

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
	
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
		if spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				add_to_chat(200,('[Mid-Cast Curecheat:'):color(Notification_color) .. (' -> Using \"HP Defense Set\" for HP up'):color(text_color) .. (']'):color(Notification_color))
				equip(sets.defense.HP)
				eventArgs.handled = true
			
			else
				handle_equipping_gear(player.status)
				eventArgs.handled = true
			end
		end
    end
	if state.DefenseMode.current == 'None' then

		if spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.cureCheat)
				eventArgs.handled = true
			end
		end
		
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_handle_equipping_gear(playerStatus, eventArgs)
	update()
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	
	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == 'Acc' then
		state.WeaponskillMode:set('Acc')
	end
	
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
	
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.

function job_update(cmdParams, eventArgs)
	handle_equipping_gear(player.status)
	update_defense_mode()
end

function check_moving()
	if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
		if state.Auto_Kite.value == false and moving then
			state.Auto_Kite:set(true)
		elseif state.Auto_Kite.value == true and moving == false then
			state.Auto_Kite:set(false)
		end
	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	
	lockouts()
	
    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	---------------------------------
	if state.DefenseMode.current == 'None' then 
		if state.Buff.Cover then
			idleSet = set_combine(idleSet, sets.buff.Cover)
		end
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.Auto_Kite.value == true then
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	
	lockouts()
	
	if state.ExtraDefenseMode.value == 'MP' and state.DefenseMode.current ~= 'Magical' then
        meleeSet = set_combine(meleeSet, sets[state.ExtraDefenseMode.value])
    end
	
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
    if state.Buff.Sentinel then
		meleeSet = set_combine(meleeSet, sets.buff.Sentinel)
	end
	if state.Buff.Cover then
		meleeSet = set_combine(meleeSet, sets.buff.Cover)
	end
	if state.Buff.sleep and player.inventory['Berserkers Torque'] or player.wardrobe['Berserkers Torque'] or player.wardrobe2['Berserkers Torque'] then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 19 then
					meleeSet = set_combine(meleeSet, sets.buff.sleep)
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping Berserkers Torque '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 2 then
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Nightmare'):color(warning_text)  .. (' while Engaged *****__\\||//__'):color(text_color) )
				end
			end
		end
	end
	if state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			meleeSet = set_combine(meleeSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
	end
    return meleeSet
end

function customize_defense_set(defenseSet)

	lockouts()
	
    if state.ExtraDefenseMode.value ~= 'none' and state.DefenseMode.current ~= 'Magical' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
    
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
    
    if state.Buff.doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.Buff.Sentinel then
		defenseSet = set_combine(defenseSet, sets.buff.Sentinel)
	end
	if state.Buff.Cover then
		defenseSet = set_combine(defenseSet, sets.buff.Cover)
	end
    if state.Buff.sleep and player.inventory['Berserkers Torque'] or player.wardrobe['Berserkers Torque'] or player.wardrobe2['Berserkers Torque'] then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 19 then
					defenseSet = set_combine(defenseSet, sets.buff.sleep)
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping Berserkers Torque '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 2 then
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Nightmare'):color(warning_text)  .. (' while Engaged *****__\\||//__'):color(text_color) )
				end
			end
		end
	end
    return defenseSet
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

function display_current_job_state(eventArgs)
    local msg = ('[Melee'):color(Notification_color)
	
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
	
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. (' + '):color(text_color) .. (state.HybridMode.value):color(warning_text)
    end
	
	-- if state.ExtraDefenseMode.value ~= 'None' then
        -- msg = msg .. (' + \"Extra: '):color(text_color) .. (state.ExtraDefenseMode.value.. '\"'):color(text_color)
    -- end
	
	if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
	
	if state.IdleMode.value == 'PDT' and state.DefenseMode.value == 'None' then
		msg = msg .. ('[Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	elseif state.IdleMode.value ~= 'PDT' and state.DefenseMode.value == 'None' then
		msg = msg .. ('[Idle: '):color(Notification_color) .. ('PDT + ' .. state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	elseif state.IdleMode.value ~= 'PDT' and state.DefenseMode.value ~= 'None' then
		msg = msg .. ('[Idle: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. ('PDT + ' .. state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	elseif state.IdleMode.value == 'PDT' and state.DefenseMode.value ~= 'None' then
		msg = msg .. ('[Idle: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
	
    if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end

    if state.ExtraDefenseMode.value ~= 'None' and state.DefenseMode.value ~= 'None' then
        msg = msg .. ('+ [Extra: '):color(warning_text) .. (state.ExtraDefenseMode.value):color(text_color) .. ('] '):color(warning_text)
    end
    
    if state.EquipShield.value == true then
        msg = msg .. ('+ [Force:'):color(warning_text) .. (' -> Equip Shield with defense'):color(text_color) .. ('] '):color(warning_text)
    end
	
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ('[Target PC: '):color(Notification_color)..state.PCTargetMode.value .. ('] '):color(Notification_color)
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ('[Target NPCs'):color(Notification_color).. ('] '):color(Notification_color) .. ('] '):color(Notification_color)
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
	save_settings()
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)

    gearinfo(cmdParams, eventArgs)
	
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and not player.equipment.sub:contains('Grip') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode}')
    end
	if state.IdleMode then
        properties:append('${HybridMode}')
    end
	if state.EquipShield then
        properties:append('${EquipShield}')
    end
	if state.CastingMode then
        properties:append('${CastingMode}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
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
	properties:append('${is_Moving}')
    text:clear()
    text:append(properties:concat(''))
	update()
end

function update()
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
        text_box:hide()
        return
    end
    if zoning_bool then
        text_box:hide()
        return
	else
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
		
		if state.DefenseMode.value == 'None' then
			msg = msg .. state.OffenseMode.value
			if state.HybridMode.value ~= 'Normal' then
				msg = msg .. ' + ' .. state.HybridMode.value
			end
			msg = msg .. '] '
		else
			msg = msg .. state.OffenseMode.value
			if state.HybridMode.value ~= 'Normal' then
				msg = msg .. ' + ' .. state.HybridMode.value
			end
			msg = msg .. '] LOCKED '
		end
	
	
        if state.DefenseMode.value ~= 'None' then 
			inform.OffenseMode = ('\\cs(255,0,0)' .. (msg)) .. '\\cr'
		else
			inform.OffenseMode = ('\\cs(0,255,0)' .. (msg)) .. '\\cr'
		end
		
		inform.EquipShield = ('\\cs(150,150,255)' .. ('\n [EquipShield: '..tostring(state.EquipShield.value):lpad(' ', 2) .. '] ' )) .. '\\cr'
		
		inform.CastingMode = ('\\cs(0,255,0)' .. ('\n [Casting: '..state.CastingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		
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
				inform.CP = ('\\cs(255,0,0)' .. ('[CP Cape] LOCKED ' )) .. '\\cr'
			elseif state.Kiting.value == true and state.CP.value == false then
				inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
				inform.CP = ('')
			elseif state.Kiting.value == false and state.CP.value == true then
				inform.Kiting = ('')
				inform.CP = ('\\cs(255,0,0)' .. ('\n [CP Cape] LOCKED ' )) .. '\\cr'
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
		
		if state.DefenseMode.value == 'None' then
			if moving == true then
				inform.is_Moving = ('\\cs(255,255,0)' .. ('\n [Moving]' )) .. '\\cr'
			else
				inform.is_Moving = ('')
			end
		end
		
		if old_inform ~= inform then
			text_box:update(inform)
			text_box:show()
			old_inform = inform
		end
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
