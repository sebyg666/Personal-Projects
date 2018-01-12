-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
include('Make-Settings.lua')
include('Organizer-lib.lua')
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff['Collimated Fervor'] = buffactive['Collimated Fervor'] or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	
    indi_timer = ''
    indi_duration = 180
	
	custom_Enhancing_timers = {}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	state.MagicBurst 		= M(false, 'Magic Burst')
	state.PreserveMP 		= M(false, 'Preserve MP')	

	state.PhysicalDefense  	= M(false, 'PhysicalDefense')
	state.MagicalDefense  	= M(false, 'MagicalDefense')
	
	state.CP  				= M(false, 'CP')
	state.PetIdleMode 		= M{['PetIdleMode'] ='Pet Idle', 'PetRegen', 'PetDT', 'Refresh'}
	
	send_command('bind ^] gs c toggle MagicBurst')
	send_command('bind !] gs c toggle PreserveMP')
	send_command('bind @f11 gs c cycle PetIdleMode')
	send_command('bind ^f11 gs c cycle CP')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ![ gs c cycle PhysicalDefenseMode')
	
	send_command('gi ugs false')

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
    -- Precast sets
    --------------------------------------
	gear.Staff.PDT = ""
	gear.default.weaponskill_waist = ""
	gear.default.obi_waist = ""
	gear.default.obi_back = ""
	gear.default.obi_ring = ""
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Bolster'] = {}
	sets.precast.JA['Full Circle'] = {}
    sets.precast.JA['Life cycle'] = {}
	sets.precast.JA['Mending Halation'] = {}
	sets.precast.JA['Radial Arcana'] = {}

    -- Fast cast sets for spells
	
    sets.precast.FC = {}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.RA = {}
	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {})
	sets.precast.Indi = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    sets.precast.WS = {}
    sets.precast.WS['Flash Nova'] = {}
    sets.precast.WS['Starlight'] = {}
    sets.precast.WS['Moonlight'] = {}
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------
    -- Base fast recast for spells
    sets.midcast.FastRecast = {}
    sets.midcast.Geomancy = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.Indi = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Protectra = {}
    sets.midcast.Shellra = {}

	-- Custom spell classes
    sets.midcast['Mnd Enfeebles'] = {}
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {})
    sets.midcast['Int Enfeebles'] = {}
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {})
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	sets.midcast['Dark Magic'] = {}
	sets.midcast.Drain = {}
	sets.midcast.Aspir = sets.midcast.Drain	
	sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,body="Twilight Cloak"})
	sets.DarkNuke = {}
	sets.EarthNuke = {}
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {})

    -- Idle sets

    sets.idle = {}	
	sets.idle.Town = {}
    sets.idle.PDT = {}

    -- .Pet sets are for when Luopan is present.
	
    sets.idle.Pet = {}
    sets.idle.Pet.PetDT = {}
	sets.idle.Pet.PetRegen = {}
    sets.idle.Weak = {}

    -- Defense sets

    sets.defense.PDT = {}
    sets.defense.MDT = {}
    sets.Kiting = {}
	sets.CP = {}
    sets.latent_refresh = {}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    sets.engaged = {}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	sets.buff.Reive = {}
	sets.buff['Collimated Fervor'] = {}	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.english:startswith('Indi') then
			equip(sets.precast.Indi)
			eventArgs.handled = true
		end
		if state.CastingMode.value == "Resistant" then
			gear.default.obi_waist = gear.Resist_Waste
		else
			gear.default.obi_waist = gear.Nuke_Waste
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

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then	
		get_casting_style(spell, action, spellMap, eventArgs)
		eventArgs.handled = true
	end
end
		
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		if spell.english:startswith('Indi') then
			equip(sets.midcast.Indi)
		end
		if spell.skill == 'Elemental Magic' and state.MagicBurst.value == false then
			if state.Buff['Collimated Fervor'] then
				
			end
			-- Reive bonus
			if state.Buff["Reive Mark"] then
				equip(sets.buff.Reive)
			end
			--- elemental affinity gear
			if spell.element == "Dark" and spell.name ~= "Impact" then
				equip(sets.DarkNuke)
			elseif spell.element == "Earth" then
				equip(sets.EarthNuke)
            end
        end
    end
	if state.CP.value == true then
		equip(sets.CP)
	end	
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        -- if spell.english:startswith('Indi') then
			-- local mult = 1
			-- local dur = 0
			-- if player.equipment.back == "Lifestream Cape" then mult = mult + 0.20 end
			-- if player.equipment.legs == "Bagua Pants" then dur = dur + 12 end
			-- if player.equipment.feet == "Azimuth Gaiters" then dur = dur + 15 end
			-- dur = ((dur + indi_duration) * mult) + 3
            -- send_command('@timers d "'..indi_timer..'"')
            -- indi_timer = spell.english
            -- send_command('@timers c "'..indi_timer..'" '..dur..' down spells/00136.png')
        -- elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            -- send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        -- elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            -- send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        -- end
		-- if spell.skill == 'Enhancing Magic' then
			-- if spell.target then
				-- adjust_Enhancing_timers(spell, spellMap)
			-- end
		-- end
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
function job_buff_change(buff, gain, buff_info)
	-- add_to_chat(200,'buff: '..buff.." buff ID: "..buff_info.id)
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
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end


-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
		if state.PetIdleMode == 'PetRegen' then
			classes.CustomIdleGroups:append(state.PetIdleMode.value)
		elseif state.PetIdleMode == 'PetDT' then
			classes.CustomIdleGroups:append(state.PetIdleMode.value)
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'Mnd Enfeebles'
            else
                return 'Int Enfeebles'
            end
		elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function get_casting_style(spell, action, spellMap, eventArgs)
	local equipSet = sets.midcast
	
	--classes.SkipSkillCheck = classes.NoSkillSpells:contains(spell.english)
    -- Handle automatic selection of set based on spell class/name/map/skill/type.
    equipSet = select_specific_set(equipSet, spell, spellMap)
	if state.MagicBurst.value == true and state.PreserveMP.value == false then
		if equipSet['Magic Burst'] then
			equipSet = equipSet['Magic Burst']
		end
	elseif state.MagicBurst.value == false and state.PreserveMP.value == true then
		if equipSet['Preserve MP'] then
			equipSet = equipSet['Preserve MP']
		end
	elseif state.MagicBurst.value == true and state.PreserveMP.value == true then
		if equipSet['Magic Burst']['Preserve MP'] then
			equipSet = equipSet['Magic Burst']['Preserve MP']
		end
	end

	if equipSet[state.CastingMode.current] then
		equipSet = equipSet[state.CastingMode.current]
	end
	
	equip(equipSet)
end

function customize_idle_set(idleSet)
	if state.DefenseMode.current == 'None' then 
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if pet.isvalid then
			if state.PetIdleMode.value == 'PetRegen' then
				idleSet = sets.idle.Pet.PetRegen
			elseif state.PetIdleMode.value == 'PetDT' then
				idleSet = sets.idle.Pet.PetDT
			else
				idleSet = sets.idle.Pet
			end
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
	end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)

end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	
    local msg = ('[Melee: '):color(Notification_color)
    
	if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end
	
	msg = msg .. ('] [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	if state.MagicBurst.value == true then
		msg = msg .. ('[MB] '):color(Notification_color)
	end
	if state.PreserveMP.value == true then
		msg = msg .. ('[Preserve MP] '):color(Notification_color)
	end
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
    
	msg = msg .. (' [Pet Idle: '):color(Notification_color) .. (state.PetIdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
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

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.MagicBurst then
        properties:append('${MagicBurst}')
    end
	if state.PreserveMP then
        properties:append('${PreserveMP}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.PetIdleMode then
        properties:append('${PetIdleMode}')
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
	if state.DefenseMode.value ~= 'None' then 
		inform.OffenseMode = (red .. (' [Melee: '..state.OffenseMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	else
		inform.OffenseMode = (blue .. (' [Melee: '.. white .. state.OffenseMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	end
			
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
		
	if state.MagicBurst.value == true and state.PreserveMP.value == true then
		inform.MagicBurst = (purple .. ('\n [MB] ' )) .. '\\cr'
		inform.PreserveMP = (purple .. ('[Preserve MP] ' )) .. '\\cr'
	elseif state.MagicBurst.value == true and state.PreserveMP.value == false then
		inform.MagicBurst = (purple .. ('\n [MB] ' )) .. '\\cr'
		inform.PreserveMP = ('')
	elseif state.MagicBurst.value == false and state.PreserveMP.value == true then
		inform.MagicBurst = ('')
		inform.PreserveMP = (blue .. ('\n [Preserve MP] ' )) .. '\\cr'
	elseif state.MagicBurst.value == false and state.PreserveMP.value == false then
		inform.MagicBurst = ('')
		inform.PreserveMP = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '.. white .. state.IdleMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
		inform.PetIdleMode = (purple .. ('\n [Pet Idle: '.. white .. state.PetIdleMode.value:lpad(' ', 2) .. purple .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		inform.PetIdleMode = (red .. ('\n [Pet Idle: '..state.PetIdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
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