-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Footwork = buffactive.Footwork or false
    state.Buff.Impetus = buffactive.Impetus or false
	state.Buff.doom = buffactive.doom or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false

    state.FootworkWS 		= M(false, 'Footwork on WS')
	state.OneirosRing 		= M(true, 'Oneiros Ring')
	state.Rancor 			= M(false, 'Rancor Collar')

    info.impetus_hit_count = 0
    windower.raw_register_event('action', on_action_for_impetus)
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.WeaponskillMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	
	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	
	send_command('bind ^] gs c cycle HybridMode')
	send_command('bind ^F12 gs c toggle OneirosRing')
	
    update_combat_form()
    update_melee_groups()

    select_default_macro_book()
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
    -- Don't gearswap for weaponskills when Defense is on.
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        eventArgs.handled = true
    end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        if state.Buff.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
            -- Need 6 hits at capped dDex, or 9 hits if dDex is uncapped, for Tantra to tie or win.
            if (state.OffenseMode.current == 'Fodder' and info.impetus_hit_count > 5) or (info.impetus_hit_count > 8) then
                equip(sets.impetus_body)
            end
        elseif state.Buff.Footwork and (spell.english == "Dragon's Kick" or spell.english == "Tornado Kick") then
            equip(sets.footwork_kick_feet)
        end
        
        -- Replace Moonshade Earring if we're at cap TP
        if player.tp == 3000 then
            equip(sets.precast.MaxTP)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted and state.FootworkWS and state.Buff.Footwork then
        send_command('cancel Footwork')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
    -- Set Footwork as combat form any time it's active and Hundred Fists is not.
    if buff == 'Footwork' and gain and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    elseif buff == "Hundred Fists" and not gain and buffactive.footwork then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
    
    -- Hundred Fists and Impetus modify the custom melee groups
    if buff == "Hundred Fists" or buff == "Impetus" then
        classes.CustomMeleeGroups:clear()
        
        if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
            classes.CustomMeleeGroups:append('HF')
        end
        
        if (buff == "Impetus" and gain) or buffactive.impetus then
            classes.CustomMeleeGroups:append('Impetus')
        end
    end

    -- Update gear if any of the above changed
    if buff == "Hundred Fists" or buff == "Impetus" or buff == "Footwork" then
        handle_equipping_gear(player.status)
    end
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	
	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == ('Ilvl~118') then
		state.WeaponskillMode:set('Ilvl~118')
	elseif state.OffenseMode.value == ('Ilvl~122') then
		state.WeaponskillMode:set('Ilvl~122')
	elseif state.OffenseMode.value == ('Ilvl~124+') then
		state.WeaponskillMode:set('Ilvl~124+')
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
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if world.time > 0559 and world.time < 1800 and idleSet ~= sets.idle.Town and state.HybridMode.current == 'Normal' and state.DefenseMode.current == 'None' then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end
	if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
    return idleSet
end

function customize_melee_set(meleeSet)
	if state.OneirosRing.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' then
		if player.mp > 99 then
			meleeSet = set_combine(meleeSet, sets.TA_Ring)
		end
	end
	if state.Rancor.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' then
		meleeSet = set_combine(meleeSet, sets.Rancor)
	end
	if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
	if state.Buff.sleep then
		meleeSet = set_combine(meleeSet, sets.buff.sleep)
		add_to_chat(200,'***** Status Sleep while Engaged || Equiping Frenzy Sallet *****')
		if state.Buff.Stoneskin then
			send_command('cancel 37')
			add_to_chat(200,'***** Cancelling Stoneskin to wake up *****')
		end
	end
	
    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_combat_form()
    update_melee_groups()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if buffactive.footwork and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    
    if buffactive['hundred fists'] then
        classes.CustomMeleeGroups:append('HF')
    end
    
    if buffactive.impetus then
        classes.CustomMeleeGroups:append('Impetus')
    end
end

function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
	
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. ' / ' .. state.HybridMode.value
    end
	
	if state.Rancor.value == true then
		msg = msg .. ' / \"Rancor\"'
	end
	
	if state.OneirosRing.value == true then
		msg = msg .. ' / \"Oneiros Ring\"'
	end
	
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
	
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 14)
	send_command('track clear')
	send_command('bind ![ gs c cycle PhysicalDefenseMode')
	send_command('bind F8 input /ws "Backhand Blow" <t>')
	
	if player.sub_job:upper() == 'WAR' then
		send_command('bind !` input /ja "Boost" <me>')
		send_command('bind ^` input /ja "Perfect Counter" <me>')
		
		send_command('bind F9 input /ja "provoke" <stnpc>')
	elseif player.sub_job:upper() == 'RUN' then
		send_command('bind !` input /ja "Boost" <me>')
		send_command('bind ^` input /ja "Perfect Counter" <me>')
		
		send_command('bind F9 input /ma "flash" <stnpc>')
	elseif player.sub_job:upper() == 'NIN' then
		send_command('wait 0.7;track add Shihei: ${ALL:shihei}')
		
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	elseif player.sub_job:upper() == 'DNC' then
		send_command('bind ^` input /ja "spectral jig" <me>')
		send_command('bind !` input /ja "Boost" <me>')
		
		send_command('bind F7 input /ja "Box step" <stnpc>')
		send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Haste Samba" <me>')
		send_command('bind F10 input /ja "Curing Waltz III" <stal>')
		send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		send_command('bind F11 input /ja "Curing Waltz II" <stal>')
		send_command('bind ^F11 input /ja "Divine Waltz" <me>')
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------

-- Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
    if state.Buff.Impetus then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                info.impetus_hit_count = 0
                            elseif action.spike_effect_animation == 63 then
                                info.impetus_hit_count = info.impetus_hit_count + 1
                            end
                        end
                    end
                end
            end
        end
        
        --add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
    else
        info.impetus_hit_count = 0
    end
    
end
