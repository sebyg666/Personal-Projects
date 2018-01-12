-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
     mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
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
    
    state.MagicBurst 		= M(false, 'Magic Burst')
	state.PreserveMP 		= M(false, 'Preserve MP')
    
	state.PhysicalDefense   = M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	state.CP  				= M(false, 'CP')
	
    -- Additional local binds
	
	send_command('bind ^] gs c toggle MagicBurst')
	send_command('bind !] gs c toggle PreserveMP')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f11 gs c cycle CP')
	send_command('bind ^f12 gs c cycle CastingMode')
	
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	send_command('text textbox create "this box exists"')
	send_command('text textbox size 10')
	send_command('text textbox pos 1085 610')
	
	old_text = ''
	
    select_default_macro_book()
	
	windower.raw_register_event('prerender',update_text)
	windower.raw_register_event('logout',reset_text)
	send_command('gs c update')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('text textbox delete')
end

function reset_text()
	send_command('text textbox delete')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			sub={name="Fulcio Grip",priority=-1},
			neck="Colossus's Torque",
			body="Telchine Chas.",
			back="Merciful Cape",waist="Olympus Sash"})
			
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1}})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",feet="Inspirited Boots"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {
		neck="Nodens Gorget",ear1='Earthcry Earring',
		waist="Siegel Sash",legs="Haven Hose"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell
    

    sets.midcast['Mnd Enfeebles'] = {main="Lathi",sub={name="Mephitis Grip",priority=-1},ranged="Aureole",
        head="Merlinic Hood",neck="Weike Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Leviathan Ring",ring2="Leviathan Ring",
        back="Ogapepo Cape",waist="Ovate Rope",legs="Psycloth Lappas",feet="Merlinic Crackows"}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {})
	
    sets.midcast['Int Enfeebles'] = {main="Lathi",sub={name="Mephitis Grip",priority=-1},ranged="Aureole",
        head="Merlinic Hood",neck="Weike Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Ogapepo Cape",waist="Ovate Rope",legs="Psycloth Lappas",feet="Merlinic Crackows"}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {})

    sets.midcast['Dark Magic'] = {main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Kalboron Stone",
		head="Merlinic Hood",neck="Dark Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Perception Ring",ring2='Weatherspoon Ring',
        back="Ogapepo Cape",waist="Ovate Rope",legs="Psycloth Lappas",feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Kalboron Stone",
        head="Merlinic Hood",neck="Dark Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Evanescence Ring",ring2='Weatherspoon Ring',
        back="Ogapepo Cape",waist="Ovate Rope",legs="Psycloth Lappas",feet=Merl_feet_Nuke}
	
	sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
		main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Dosis Tathlum",
        head="Merlinic Hood",neck="Stoicheion Medal",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Merlinic Crackows"}

	sets.midcast['Elemental Magic']['Magic Burst'] = set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizu. Kubikazari",
		ring1="Locus Ring",ring2="Mujin Band",
		back="Seshaw Cape"})
	sets.midcast['Elemental Magic']['Preserve MP'] = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's Coat"})
	sets.midcast['Elemental Magic']['MagicBurst + PreserveMP'] = set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizu. Kubikazari",
		body="Spaekona's Coat",ring1="Locus Ring",ring2="Mujin Band",
		back="Seshaw Cape"})
	
	sets.midcast['Elemental Magic'].Resistant 					= set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 	= set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizu. Kubikazari",
		ring1="Locus Ring",ring2="Mujin Band",
		back="Seshaw Cape"})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's Coat"})
	sets.midcast['Elemental Magic']['MagicBurst + PreserveMP'].Resistant	= set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizu. Kubikazari",
		body="Spaekona's Coat",
		back="Seshaw Cape"})
	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",ammo="Clarus Stone",
        head="Nefer Khat +1",neck="Grandiose Chain",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main="Earth Staff",sub="Zuuxowu Grip",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}
	sets.CP = {back="Aptitude Mantle"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- if spellMap == 'Cure' or spellMap == 'Curaga' then
        -- gear.default.obi_waist = "Goading Belt"
    -- elseif spell.skill == 'Elemental Magic' then
        -- gear.default.obi_waist = "Sekhmet Corset"
    -- end
	job_get_spell_map(spell, default_spell_map)
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	get_casting_style(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.CP.value == true then
		equip(sets.CP)
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
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
	end
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
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
	
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

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
    if spell.skill == 'Elemental Magic' then
		if state.MagicBurst.value == true and state.PreserveMP.value == false then
			classes.CustomClass = 'Magic Burst'
		elseif state.MagicBurst.value == false and state.PreserveMP.value == true then
			classes.CustomClass = 'Preserve MP'
		elseif state.MagicBurst.value == true and state.PreserveMP.value == true then
			classes.CustomClass = 'MagicBurst + PreserveMP'
		end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	if state.CP.value == true then
		idleSet = set_combine(idleSet, sets.CP)
	end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
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
	
	msg = msg .. ('[Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
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
end

function update_text()

	local msg = '[Melee'
	
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
	if #classes.CustomMeleeGroups > 0 then
        for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then
					msg = msg .. ' ('
				end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then
					msg = msg .. ' + '
				end
				if i == #classes.CustomMeleeGroups then
					msg = msg .. ')'
				end
			end
        end
    end
	
    msg = msg .. ': '
    
   if state.DefenseMode.value == 'None' then
		msg = msg .. state.OffenseMode.value .. '] '
	else
		msg = msg ..'LOCKED: ' .. state.OffenseMode.value .. '] '
	end
	
    msg = msg .. '\n[Casting: ' .. state.CastingMode.value .. '] '
	
	if state.MagicBurst.value == true or state.PreserveMP.value == true then
		msg = msg .. '\n'
	end
	if state.MagicBurst.value == true then
		msg = msg .. '[MB] '
	end
	if state.PreserveMP.value == true then
		msg = msg .. '[Preserve MP] '
	end
	
	msg = msg .. '\n[Idle: ' .. state.IdleMode.value .. ']'
	
	if state.Kiting.value == true or state.CP.value == true then
        msg = msg .. '\n'
    end
	
    if state.Kiting.value == true then
        msg = msg .. '[Kiting] '
    end
	
	if state.CP.value == true then
        msg = msg .. '[CP Cape] '
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. '\n[' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')] '
    end
	
	if msg ~= old_text then
		send_command('text textbox text ' .. msg)
		old_text = msg
	end
		
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end
