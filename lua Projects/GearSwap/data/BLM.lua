-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Make-Settings.lua')
include('Organizer-lib.lua')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
	
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	 
	state.MagicBurst 			= M(false, 'Magic Burst')
	state.PreserveMP 			= M(false, 'Preserve MP')
	state.Death					= M(false, 'Death')
	state.PhysicalDefense     	= M(false, 'PhysicalDefense')
	state.MagicalDefense      	= M(false, 'MagicalDefense')
	state.CP  					= M(false, 'CP')
    
    -- Additional local binds
	send_command('bind ^] gs c toggle MagicBurst')
	send_command('bind !] gs c toggle PreserveMP')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f11 gs c toggle CP')
	send_command('bind !f11 gs c toggle Death')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ![ gs c cycle PhysicalDefenseMode')
	
	send_command('gi ugs false')
	
	Ring_lock = S{"Warp Ring", "Resolution Ring", "Emperor Band", "Capacity Ring"}
	Ear_lock = S{"Reraise Earring"}

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
	-----------------------------
	-- Template Set
	-----------------------------

	-- gear.Staff.PDT = ""
	-- gear.default.weaponskill_waist = ""
	-- gear.default.obi_waist = ""
	-- gear.default.obi_back = ""
	-- gear.default.obi_ring = ""
    -- sets.precast.JA['Mana Wall'] = {}
    -- sets.precast.JA.Manafont = {}
    -- sets.precast.JA.Convert = {}
    -- sets.precast.FC = {}
    -- sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	-- sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    -- sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
	-- sets.precast.FC['Death'] = set_combine(sets.precast.FC, {})
    -- sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    -- sets.precast.FC.Curaga = sets.precast.FC.Cure
	-- sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
    -- sets.precast.WS = {}
	-- sets.precast.WS['Myrkr'] = {}
    
    -- ---- Midcast Sets ----

    -- sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
    -- sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {})
    -- sets.midcast.Curaga = sets.midcast.Cure
    -- sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {})
    -- sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	-- sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {})
	-- sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	-- sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	-- sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {})
    -- sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {})
    -- sets.midcast.Protect = {ring1="Sheltered Ring"}
    -- sets.midcast.Protectra = sets.midcast.Protect
    -- sets.midcast.Shell = {ring1="Sheltered Ring"}
    -- sets.midcast.Shellra = sets.midcast.Shell
    -- sets.midcast['Mnd Enfeebles'] = {}
	-- sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {})
    -- sets.midcast['Int Enfeebles'] = {}
	-- sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {})
	-- sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	-- sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	-- sets.midcast['Dark Magic'] = {}
	-- sets.midcast.Drain = {}
	-- sets.midcast.Aspir = sets.midcast.Drain
	-- sets.midcast.Aspir['Death'] = {}
	-- sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    -- sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})
	-- sets.midcast['Elemental Magic'] = {}
	-- sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	-- sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	-- sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	-- sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	-- sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{})
	-- sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{})
	-- sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{})
	-- sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	-- sets.midcast['Death'] = {}
	-- sets.DarkNuke = {}
	-- sets.EarthNuke = {}
	-- sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})
    
    -- -- Sets to return to when not performing an action.
	
    -- sets.resting = set_combine(sets.idle.Weak, {})
    -- sets.idle = {}
	-- sets.idle['Death'] = {}
    -- sets.idle.PDT = {}
    -- sets.idle.Weak = {}
    -- sets.idle.Town = {}
    -- sets.defense.PDT = {}
    -- sets.defense.MDT = {}
    -- sets.Kiting = {}
    -- sets.latent_refresh = {}
	
    -- -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    -- sets.buff['Mana Wall'] = {}
	-- sets.buff.Reive = {}
	-- sets.CP = {}
	-- sets.Locked_Main_Sub = {}
	-- sets.Locked_Main_Sub.Death = {}
    -- Engaged sets
	
    sets.engaged = {}
			
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
		if state.Death.value == true then
			equip(sets.precast.FC['Death'])
			eventArgs.handled = true
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
end

function job_midcast(spell, action, spellMap, eventArgs)
	if state.Death.value == true then
		if spellMap == 'Aspir' then
			equip(sets.midcast.Aspir['Death'])
		else
			equip(sets.midcast['Death'])
		end
		eventArgs.handled = true
	end
    if spell.action_type == 'Magic' and state.Death.value == false and spell.skill == 'Elemental Magic' and not spellMap == 'ElementalEnfeeble' then
		get_casting_style(spell, action, spellMap, eventArgs)
		eventArgs.handled = true
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.Death.value == true then
		eventArgs.handled = true
	end
	if spell.action_type == 'Magic' then
		if spell.skill == 'Elemental Magic' and state.MagicBurst.value == false then
			-- Reive bonus
			if state.Buff["Reive Mark"] then
				equip(sets.buff.Reive)
			end
			if spell.element == "Dark" and spell.name ~= "Impact" then
				equip(sets.DarkNuke)
			elseif spell.element == "Earth" and state.MagicBurst.value == false then
				equip(sets.EarthNuke)
            end
        end
    end
	if state.CP.value == true and state.Death.value == false and state.MagicBurst.value == false then
		equip(sets.CP)
	elseif state.CP.value == true and state.Death.value == false and state.MagicBurst.value == true then
		equip(sets.CPBurst)
	end	
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted and state.Death.value == false then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		if not midaction() then
			handle_equipping_gear(player.status)
		end
	end
	if buff == 'Goldsmithing Imagery' and gain then
		 send_command('timers create "'..buff..'" 480 down abilities/00121.png')
	end
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(field, newValue, oldValue)
	if state.Death.value == false then
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
				disable('main','sub')
			else
				enable('main','sub')
			end
		end
	else
		equip(sets.Locked_Main_Sub.Death)
		disable('main','sub')
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
	
	classes.SkipSkillCheck = classes.NoSkillSpells:contains(spell.english)
    -- Handle automatic selection of set based on spell class/name/map/skill/type.
    equipSet = select_specific_set(equipSet, spell, spellMap)
	if state.MagicBurst.value == true and state.PreserveMP.value == false then
		if equipSet and equipSet['Magic Burst'] then
			equipSet = equipSet['Magic Burst']
		end
	elseif state.MagicBurst.value == false and state.PreserveMP.value == true then
		if equipSet and equipSet['Preserve MP'] then
			equipSet = equipSet['Preserve MP']
		end
	elseif state.MagicBurst.value == true and state.PreserveMP.value == true then
		if equipSet and equipSet['Magic Burst']['Preserve MP'] then
			equipSet = equipSet['Magic Burst']['Preserve MP']
		end
	end

	if equipSet[state.CastingMode.current] then
		equipSet = equipSet[state.CastingMode.current]
	end
	
	equip(equipSet)
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if state.Death.value == false and state.DefenseMode.value == 'None' then
		if state.OffenseMode.value == 'None' then
			enable('main','sub')
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
	elseif state.Death.value then
		idleSet = sets.idle['Death']
	end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local msg = ''
	if state.Death.value == false then
		msg = ('[Melee: '):color(Notification_color)
		
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
	else
		msg = ('[Melee: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. ('DEATH]'):color(text_color)
		msg = msg .. (' [Casting: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. ('DEATH]'):color(text_color)
		msg = msg .. (' [Idle: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. ('DEATH]'):color(text_color)
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
	if state.Death.value ~= true then
		
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
			inform.PreserveMP = (purple .. ('\n [Preserve MP] ' )) .. '\\cr'
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
	else
		inform.OffenseMode = (yellow .. (' DEATH MODE ' )) .. '\\cr'
		inform.CastingMode = (red .. ('\n [Melee: '..state.OffenseMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		inform.MagicBurst = (red .. ('\n [Casting: '..state.CastingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		inform.PreserveMP = ('')
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		inform.Kiting = ('')
		inform.CP = ('')
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