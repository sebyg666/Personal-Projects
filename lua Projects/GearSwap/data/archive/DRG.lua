	

-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file to go with this.
 
function get_sets()
	mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')   
end
 
-- Setup vars that are user-independent.
function job_setup()
	HBreath = false
    SBreath = false
	state.Buff.doom = buffactive.doom or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	
	melee_subjobs = S{'SAM','BST','THF','MNK','WAR','PUP','COR','RNG','DNC','RUN'}
	wyvern_breaths = S{'Flame Breath', 'Frost Breath', 'Gust Breath', 'Hydro Breath', 'Lightning Breath', 'Sand Breath','Healing Breath'}
	
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PetPDT', 'PetMDT', 'PetREGEN')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
	options.MagicalDefenseModes = {'MDT', 'Reraise'}
	
	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	state.OneirosRing 			= M(false, 'Oneiros Ring')
	
	gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Zoran's belt"
	
	send_command('bind ^] gs c cycle HybridMode')
	send_command('bind !F12 gs c toggle OneirosRing')
			
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

end
     
     
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' and not state.DefenseMode.current == 'None' then
		eventArgs.handled = true
	end

	if spell.name == "Smiting Breath" then
		SBreath = true
	elseif spell.name == "Restoring Breath" then
		HBreath = true
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.Buff.doom then
        equip(sets.buff.Doom)
    end
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and pet.isvalid and melee_subjobs:contains(player.sub_job) then
		meleeSet = set_combine(meleeSet, sets.precast.JA['Smiting Breath'])
		SBreath = true
		equip(meleeSet)
		send_command('wait 4;input //gs c update internal')
	elseif spell.name == 'Restoring Breath' then
		eventArgs.handled = true
	end
	
	if not spell.interrupted then
		if state.Buff[spell.name] ~= nil then
			state.Buff[spell.name] = true
		end
	end
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)
	if wyvern_breaths:contains(spell.name) or spell.interrupted then
		HBreath = false
		SBreath = false
	end
end
 
 -------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if state.Buff[buff] ~= nil then
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
end

function job_status_change(new_status, old_status)
	if new_status == 'Engaged' then
        update_combat_form()
    end
end

 
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	 if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
	return idleSet
end
 
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	if SBreath then
		meleeSet = set_combine(meleeSet, sets.precast.PetCommand['Smiting Breath'])
	elseif HBreath then
		meleeSet = set_combine(meleeSet, sets.precast.PetCommand['Healing Breath'])
	end
	
	if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
	end
	if state.OneirosRing.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' then
		if player.mp > 99 then
			if state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' and not state.OffenseMode.value == 'Acc' then
				meleeSet = set_combine(meleeSet, sets.ExtraDlbAtt)
			end
		end
	end
	
	if state.Buff.sleep and player.inventory['Berserkers Torque'] then
		meleeSet = set_combine(meleeSet, sets.buff.sleep)
		add_to_chat(200,'***** Status Sleep while Engaged || Equiping Berserkers torque *****')
		if state.Buff.Stoneskin then
			send_command('cancel 37')
			add_to_chat(200,'***** Cancelling Stoneskin to wake up *****')
		end
	end
	return meleeSet
end
 

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_update(cmdParams, eventArgs)
	if cmdParams[1] == 'internal' then
		--add_to_chat(200,'***** Re-Equiping meleeset *****')
		HBreath = false
		SBreath = false
		handle_equipping_gear(player.status)
	end  
	update_combat_form()
end
     
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
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
	
	if state.OneirosRing.value == true then
		msg = msg .. ' / Oneiros Ring'
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
     
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
        state.CombatForm:set('Adoulin')
    else
        state.CombatForm:reset()
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
	set_macro_page(4, 6)
	send_command('track clear;wait 0.4;track add Angons: ${ALL:Angon}')
	send_command('track clear;wait 0.4;track add Echoes: ${INVENTORY:Echo Drops}')
	windower.send_command('bind ^` input /ja "spectral jig" <me>')
	windower.send_command('bind !` input /ja "Reverse Flourish" <me>')
	
	
	windower.send_command('bind F8 input /ja "Angon" <stnpc>')
	windower.send_command('bind ^F8 input /ja "Ancient Circle" <me>')
	windower.send_command('bind F9 input /ja "Spirit Jump" <stnpc>')
	windower.send_command('bind ^F9 input /ja "Dragon Breaker" <Stnpc>')
	windower.send_command('bind F10 input /ja "Soul Jump" <stnpc>')
	windower.send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
	windower.send_command('bind F11 input /ja "Super Jump" <t>')
	windower.send_command('bind ^F11 input /ja "Fly High" <me>')
	
	if player.sub_job:upper() == 'WAR' then		
		
	elseif player.sub_job:upper() == 'DNC' then
		set_macro_page(2, 6)
		windower.send_command('bind ^` input /ja "spectral jig" <me>')
		windower.send_command('bind !` input /ja "Reverse Flourish" <me>')
		
		windower.send_command('bind F7 input /ja "Box step" <stnpc>')
		windower.send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		windower.send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		windower.send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		windower.send_command('bind ^F9 input /ja "Haste Samba" <me>')
		windower.send_command('bind F10 input /ja "Curing Waltz II" <stal>')
		windower.send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		windower.send_command('bind F11 input /ja "Curing Waltz III" <stal>')
		windower.send_command('bind ^F11 input /ja "Divine Waltz" <me>')
	elseif player.sub_job:upper() == 'SAM' then
		classes.CustomMeleeGroups:clear()
		classes.CustomMeleeGroups:append('Sam')
		set_macro_page(3, 6)
	elseif player.sub_job:upper() == 'RDM' then
		set_macro_page(4, 6)
		windower.send_command('bind ^` input /ma "Blink" <me>')
		windower.send_command('bind !` input /ma "Stoneskin" <me>')
		windower.send_command('bind F7 input /ma "Haste" <stal>')
	elseif player.sub_job:upper() == 'WHM' then
		windower.send_command('bind ^` input /ma "Blink" <me>')
		windower.send_command('bind !` input /ma "Stoneskin" <me>')
	elseif player.sub_job:upper() == 'NIN' then
		set_macro_page(6, 6)
	end
	
end
