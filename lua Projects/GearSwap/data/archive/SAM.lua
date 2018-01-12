-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--include('Mote-SelfCommands_with_color.lua')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
	
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()	

    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
	
	state.Buff['Aftermath: Lv.1'] = buffactive['Aftermath: Lv.1'] or false
	state.Buff['Aftermath: Lv.2'] = buffactive['Aftermath: Lv.2'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
	state.Buff.doom = buffactive.doom or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	state.Buff.Reive = buffactive["Reive Mark"] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()

    state.OffenseMode:options('Normal', 'AvgACC','MidACC','HighACC','OshiACC')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'AvgACC','MidACC','HighACC','OshiACC')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')
	state.MagicalDefenseMode:options('MDT', 'Reraise')
	state.IdleMode:options('Normal','Refresh','Regen','Reraise')

	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	
	FudoDays = S{'Firesday', 'Lightsday', 'Lightningsday', 'Thundersday','Iceday','Watersday'}
	ShohaDays = S{'Darksday', 'Windsday', 'Lightningsday'}
	RanaDays = S{'Iceday', 'Darksday', 'Earthsday'}
	Ring_lock = S{"Warp Ring", "Resolution Ring", "Emperor Band", "Capacity Ring"}
	Ear_lock = S{"Reraise Earring"}
	ranged_ws = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Arching Arrow",
				"Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance", "Hot Shot", 
				"Split Shot", "Sniper Shot", "Slug Shot", "Heavy Shot", "Detonator", "Last Stand", "Trueflight","Wildfire"}
	
	send_command('bind ^[ gs c cycle OffenseMode')
	send_command('bind ^] gs c cycle HybridMode')
	send_command('bind ![ gs c cycle PhysicalDefenseMode')
	send_command('bind [ gs c toggle PhysicalDefense')
	send_command('bind !] gs c cycle MagicalDefenseMode')
	send_command('bind ] gs c toggle MagicalDefense')
	send_command('bind f12 gs c update user')
	send_command('bind ^f12 gs c cycle IdleMode')
	
	WSTP = 0
	Cureent_Aftermath = ''
	Temp_Aftermath = ''
	
	Notification_color = 200
	text_color = 160
	warning_text = 167
		
	update_combat_form()
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

   
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
	-- cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
	-- refine_waltz(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        -- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
		if (spell.target.distance > 5 and not ranged_ws[spell.name]) or spell.target.distance > 21 then
			cancel_spell()
			return
		end
        if player.equipment.main == 'Kogarasumaru' then
			WSTP = player.tp
        end
    end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
		if (spell.name == "Tachi: Fudo" and FudoDays:contains(world.day)) or (spell.name == "Tachi: Shoha" and ShohaDays:contains(world.day))  or (spell.name == "Tachi: Rana" and RanaDays:contains(world.day)) then
			add_to_chat(123,('[WS Bonus: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Matching Day Bonus.'):color(text_color) .. (']'):color(warning_text))
			equip(sets.Gavialis)
		end
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
		if state.Buff.Reive then
			equip(sets.buff.Reive)
		end
		-- Replace Moonshade Earring if we're at cap TP
        if player.tp > 2750 then
			equip(sets.precast.MaxTP)
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
		equip(sets.midcast.FastRecast)
	end
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
		--WSTP = 0
    end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

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
		if buff == 'Aftermath: Lv.1' and gain and player.equipment.main == 'Kogarasumaru' then
			create_Aftermath_timer(buff,Temp_Aftermath, WSTP, player.equipment.main)
		elseif buff == 'Aftermath: Lv.2' and gain and player.equipment.main == 'Kogarasumaru' then
			create_Aftermath_timer(buff,Temp_Aftermath, WSTP, player.equipment.main)
		elseif buff == 'Aftermath: Lv.3' and gain and player.equipment.main == 'Kogarasumaru' then
			classes.CustomMeleeGroups:append('Koga Aft Lv3')
			create_Aftermath_timer(buff,Temp_Aftermath, WSTP, player.equipment.main)
		end		
		handle_equipping_gear(player.status)
	end
end

function create_Aftermath_timer(New_Aftermath,Old_Aftermath, TP, weapon)

	WSTP = 0
	local timer = 0
	local wait = '0'
	if gain and TP == 0 then
		return
	end
	if Old_Aftermath then
		send_command('timers delete "'..Old_Aftermath..'"')
		add_to_chat(159,Old_Aftermath..': [OFF]')
	end
	if weapon == 'Kogarasumaru' and New_Aftermath then
		if New_Aftermath == 'Aftermath: Lv.1' then
			local acc = math.floor(TP / 100 + 20)
			Cureent_Aftermath = 'Aft Lv1: ACC = +'..acc
			Temp_Aftermath = Cureent_Aftermath
			timer = 90
			wait = '30'
		elseif New_Aftermath == 'Aftermath: Lv.2' then
			local att = math.floor(TP * 0.06 - 80)
			Cureent_Aftermath = 'Aft Lv2: ATT = +'..att
			Temp_Aftermath = Cureent_Aftermath
			timer = 120
			wait = '60'
		elseif New_Aftermath == 'Aftermath: Lv.3' then
			Cureent_Aftermath = 'Aft Lv3: OaT'
			Temp_Aftermath = Cureent_Aftermath
			timer = 180
			wait = '120'
		end
		send_command('timers create "'..Cureent_Aftermath..'" '..timer..' down abilities/00121.png')
	end
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	
	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == 'AvgACC' then
		state.WeaponskillMode:set('AvgACC')
	elseif state.OffenseMode.value == 'MidACC' then
		state.WeaponskillMode:set('MidACC')
	elseif state.OffenseMode.value == 'HighACC' then
		state.WeaponskillMode:set('HighACC')
	elseif state.OffenseMode.value == 'OshiACC' then
		state.WeaponskillMode:set('OshiACC')
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
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.Buff.Reive then
		idleSet = set_combine(idleSet, sets.buff.Reive)
	end
	---------------------------------
	if Ring_lock:contains(player.equipment.ring1) and areas.Cities:contains(world.area) then
		enable('ring1')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ring_lock:contains(player.equipment.ring1) then
		disable('ring1')
	end
	if Ring_lock:contains(player.equipment.ring2) and areas.Cities:contains(world.area) then
		enable('ring2')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ring_lock:contains(player.equipment.ring2) then
		disable('ring2')
	end
	---------------------------------
	if Ear_lock:contains(player.equipment.ear1) and areas.Cities:contains(world.area) then
		enable('Ear1')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ear1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) and areas.Cities:contains(world.area) then
		enable('Ear2')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ear2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	if Ring_lock:contains(player.equipment.ring1) then
		enable('ring1')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	if Ring_lock:contains(player.equipment.ring2) then
		enable('ring2')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	--------------------------------------
	if Ear_lock:contains(player.equipment.ear1) then
		enable('ear1')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ear1 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	if Ear_lock:contains(player.equipment.ear2) then
		enable('ear2')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ear2 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	---------------------------------------
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.Buff.sleep and player.inventory['Berserkers Torque'] or player.wardrobe['Berserkers Torque'] then
		meleeSet = set_combine(meleeSet, sets.buff.sleep)
		if state.Buff.Stoneskin then
			send_command('cancel 37')
			add_to_chat(200,('[Status '):color(warning_text) .. ('\"Sleep\"'):color(Notification_color) .. (' + '):color(text_color)  .. ('\"Stoneskin\"'):color(Notification_color) .. (' while Engaged: -> Equiping '):color(text_color) .. ('\"Berserkers Torque\"'):color(Notification_color) .. (' + Cancelling '):color(text_color) .. ('\"Stoneskin\"'):color(Notification_color) .. (']'):color(warning_text) )
		else
			add_to_chat(200,('[Status '):color(warning_text) .. ('\"Sleep\"'):color(Notification_color) .. (' while Engaged: -> Equiping '):color(text_color) .. ('\"Berserkers Torque\"'):color(Notification_color) .. (']'):color(warning_text) )
		end
	end
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
	classes.CustomMeleeGroups:clear()
	if state.Buff['Aftermath: Lv.3'] and player.equipment.main == 'Kogarasumaru' then
		classes.CustomMeleeGroups:append('Koga Aft Lv3')
	elseif areas.Adoulin:contains(world.area) and buffactive.ionis then
		state.CombatForm:set('Ionis')
    else
		state.CombatForm:reset()
	end
end

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
	
	if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
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
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

    -- Default macro set/book
	set_macro_page(2, 9)
end
