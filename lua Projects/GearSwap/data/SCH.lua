-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Make-Settings.lua')
include('Organizer-lib.lua')
--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration (/ws)     Perpetuance				Immanence
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity                             
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	
	state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false
    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
	state.Buff['Light Arts'] = buffactive['light arts'] or false
	state.Buff['Addendum: White'] = buffactive['addendum: white'] or false
	state.Buff['Dark Arts'] = buffactive['dark arts'] or false
	state.Buff['Addendum: Black'] = buffactive['addendum: black'] or false
	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
	
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

	RecastType = ''
    update_active_strategems()
	debugMsg = false

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','Refresh', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

	state.MagicBurst 		= M(false, 'Magic Burst')
	state.PreserveMP 		= M(false, 'Preserve MP')	
		
	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	state.CP  				= M(false, 'CP')
	
	send_command('bind ^] gs c toggle MagicBurst')
	send_command('bind !] gs c toggle PreserveMP')
    send_command('bind @` input /ja "Sublimation" <me>')
	send_command('bind ^f11 gs c cycle CP')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	
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
	text_box:destroy()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	gear.default.obi_waist = ""
	gear.default.obi_back = ""
	gear.default.obi_ring = ""

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {}

    -- Fast cast sets for spells

    sets.precast.FC = {}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.RA = {}

    -- Midcast Sets
	 sets.precast.WS = {}
	sets.precast.WS['Myrkr'] = {}
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.CureWithLightWeather = set_combine(sets.precast.CureWithLightWeather, {})
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {})
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Embrava'] = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Protect = {}
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = {}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
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

    -- Resting sets
	sets.resting = set_combine(sets.idle.Weak, {})
	sets.idle.Field = {}
    sets.idle.Town = {}
    sets.idle.Field.PDT = {}
    sets.idle.Weak = {}

    -- Defense sets
    sets.defense.PDT = {}
    sets.defense.MDT = {}

    sets.Kiting 			= {}
	sets.CP 				= {}
    sets.latent_refresh 	= {}
	sets.Locked_Main_Sub 	= {}

    -- Engaged sets
    sets.engaged = {}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {}
    sets.buff['Rapture'] = {}
    sets.buff['Perpetuance'] = {}
    sets.buff['Immanence'] = {}
    sets.buff['Penury'] = {}
    sets.buff['Parsimony'] = {}
    sets.buff['Celerity'] = {}
    sets.buff['Alacrity'] = {}
    sets.buff['Klimaform'] = {}
    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	sets.buff.Reive = {}
			
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
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
		job_get_spell_map(spell, default_spell_map)
	end
		
	if spell.name == 'addendum: white' and not buffactive['light arts'] then
		cancel_spell()
		send_command("light arts")
		eventArgs.cancel = true
		return
	end
	if spell.name == 'addendum: black' and not buffactive['dark arts'] then
		cancel_spell()
		send_command("dark arts")
		eventArgs.cancel = true
		return
	end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		if world.weather_element == spell.element then
			if state.Buff.Celerity then equip(sets.buff['Celerity']) end
			if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
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
		 if spellMap == 'Cure' or spellMap == 'Curaga' then
            if world.weather_element == 'Light' then
                equip(sets.midcast.CureWithLightWeather)
            end
		end
		if spell.skill == 'Elemental Magic' and state.MagicBurst.value == false then
			-- Reive bonus
			if state.Buff["Reive Mark"] then
				equip(sets.buff.Reive)
			end
			if spell.element == "Dark" and spell.name ~= "Impact" then
				equip(sets.DarkNuke)
			elseif spell.element == "Earth" then
				equip(sets.EarthNuke)
            end
        end
		-- if spell.skill == 'Enhancing Magic' and spellMap == "Storm" and spell.element ~= "Dark" and spell.element == "Ice" then
			-- equip(sets.midcast.Storm)
		-- end
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
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
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
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
			equip(sets.Locked_Main_Sub)
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
	update()
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
     if spell.action_type == 'Magic' then
		if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'Mnd Enfeebles'
            else
                return 'Int Enfeebles'
            end
		end
    end
end

function get_casting_style(spell, action, spellMap, eventArgs)
	local equipSet = sets.midcast
	
	--classes.SkipSkillCheck = classes.NoSkillSpells:contains(spell.english)
    -- Handle automatic selection of set based on spell class/name/map/skill/type.
    equipSet = select_specific_set(equipSet, spell, spellMap)
	if state.Buff['Immanence'] == false and spell.type == "Elemental Magic" then
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
	end

	if equipSet[state.CastingMode.current] then
		equipSet = equipSet[state.CastingMode.current]
	end
	
	equip(equipSet)
end

function customize_idle_set(idleSet)
	if state.DefenseMode.current == 'None' then 
		if state.Buff['Sublimation: Activated'] then
			if state.IdleMode.value == 'Normal' then
				idleSet = set_combine(idleSet, sets.buff.FullSublimation)
			elseif state.IdleMode.value == 'PDT' then
				idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
			end
		end

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

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_active_strategems()
    update_sublimation()
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
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
	
	state.Buff['Light Arts'] = buffactive['light arts'] or false
	state.Buff['Addendum: White'] = buffactive['addendum: white'] or false
	state.Buff['Dark Arts'] = buffactive['dark arts'] or false
	state.Buff['Addendum: Black'] = buffactive['addendum: black'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' and state.MagicBurst.value == false then
            equip(sets.buff['Ebullience'])
        end
        -- if state.Buff.Immanence and state.MagicBurst.value == false then
            -- equip(sets.buff['Immanence'])
        -- end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command("Addendum: White")
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command("Light Arts")
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command("Addendum: Black")
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command("Dark Arts")
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('Penury')
        elseif strategem == 'speed' then
            send_command('Celerity')
        elseif strategem == 'aoe' then
            send_command('Accession')
        elseif strategem == 'power' then
            send_command('Rapture')
        elseif strategem == 'duration' then
            send_command('Perpetuance')
        elseif strategem == 'accuracy' then
            send_command('Altruism')
        elseif strategem == 'enmity' then
            send_command('Tranquility')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command("Addendum: White")
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('Parsimony')
        elseif strategem == 'speed' then
            send_command('Alacrity')
        elseif strategem == 'aoe' then
            send_command('Manifestation')
        elseif strategem == 'power' then
            send_command('Ebullience')
        elseif strategem == 'duration' then
            send_command('Immanence')
        elseif strategem == 'accuracy' then
            send_command('Focalization')
        elseif strategem == 'enmity' then
            send_command('Equanimity')
        elseif strategem == 'duration' then
            send_command('Immanence')
        elseif strategem == 'addendum' then
            send_command('Addendum: Black')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end

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