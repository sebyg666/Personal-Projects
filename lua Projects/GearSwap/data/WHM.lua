-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Make-Settings.lua')

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	state.Buff['Divine Caress'] = buffactive['Divine Caress'] or false
	Bar_Status = S{'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barsilencra','Barvira','Barpetra','Baramnesra',
						'Barsleep','Barpoison','Barparalyze','Barblind','Barsilence','Barvirus','Barpetrify','Baramnesia'}
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
	
	state.PhysicalDefense    = M(false, 'PhysicalDefense')
	state.MagicalDefense     = M(false, 'MagicalDefense')
	state.CP  				  		= M(false, 'CP')
	state.Auto_Kite  			= M(false, 'Auto_Kite')
	
	send_command('bind ^[ gs c cycle OffenseMode')
	send_command('bind ^] gs c cycle DefenseMode')
	send_command('bind [ gs c toggle PhysicalDefense')
	send_command('bind ] gs c toggle MagicalDefense')
	send_command('bind f12 gs c update user')
	send_command('bind @f12 gs c toggle kiting')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f11 gs c toggle CP')
	send_command('bind ^f12 gs c cycle CastingMode')
	
    select_default_macro_book()
	
	send_command('gi ugs true')
	
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	initialize(text_box)
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Augmented Gear and other gear Renames
	--------------------------------------

	Grioavolr	={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +7','Mag. Acc.+28','"Mag.Atk.Bns."+7','Magic Damage +4',}} 
	Arka_IV		={ name="Arka IV", augments={'"Cure" potency +24%',}}
	Tamaxchi	={ name="Tamaxchi", augments={'Mag. Acc.+30','Enmity-10',}}
	Queller_Rod	={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}
	Gada		={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+8','Mag. Acc.+18','"Mag.Atk.Bns."+24',}}

	Gende_hands	={ name="Gende. Gages +1", augments={'Phys. dmg. taken -2%','"Cure" potency +6%',}}
	Gende_feet	={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -2%','Magic dmg. taken -3%','"Cure" potency +1%',}}
	
	Vanya_head_FC	={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	
	Vanya_head_Cure	={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_body_Cure	={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	Telch_head_Enh	={ name="Telchine Cap", augments={'Pet: "Mag.Atk.Bns."+4','Pet: "Regen"+3','Enh. Mag. eff. dur. +7',}}
	Telch_body_Enh	={ name="Telchine Chas.", augments={'Mag. Evasion+14','Pet: "Regen"+2','Enh. Mag. eff. dur. +7',}}
	Telch_legs_Enh	={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +9',}}
    Telch_feet_Enh	={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +7',}}
	
	Telch_hands_regen	={ name="Telchine Gloves", augments={'"Fast Cast"+5','"Regen" potency+2',}}
	--hands={ name="Telchine Gloves", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','"Fast Cast"+3','INT+2 MND+2',}}
	
	Chironic_hands_phalanx		={ name="Chironic Gloves", augments={'Magic dmg. taken -2%','AGI+5','Phalanx +4','Accuracy+9 Attack+9','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}
	
	Chironic_body				={ name="Chironic Doublet", augments={'Mag. Acc.+15','"Cure" potency +11%','"Mag.Atk.Bns."+14',}}
	Chironic_hands				={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+11','"Drain" and "Aspir" potency +8','Mag. Acc.+3',}}
	Chironic_legs				={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Cure" potency +3%','INT+2',}}
	Chironic_feet				={ name="Chironic Slippers", augments={'Mag. Acc.+25','Attack+4','Magic burst dmg.+15%','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	
	Kaykaus_head	={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}
	Kaykaus_hands	={ name="Kaykaus cuffs", augments={'MP+60','MND+10','Mag. Acc.+15'}}
	Kaykaus_feet	={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}
	
	DT_ring		={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Phys. dmg. taken -4%','Magic dmg. taken -3%',}}
	
	FC_back		={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Evasion+4','"Fast Cast"+10',}}
	Mending_back	={ name="Mending Cape", augments={'Healing magic skill +10','Enha.mag. skill +9','Mag. Acc.+10',}}
	
	AF_head 			={ name="Theophany Cap +1" }
	AF_body				={ name="Theophany Briault +2" }
	AF_hands 			={ name="Theophany Mitts +2" }
	AF_legs 			={ name="Theophany Pantaloons +2" }
	AF_feet 			={ name="Theophany Duckbills +2" }
	
	Relic_head			={ name="Piety Cap", 			augments={'Enhances "Devotion" effect',}}
	Relic_body			={ name="Piety Briault +1", 	augments={'Enhances "Benediction" effect',}}
    Relic_hands			={ name="Piety Mitts",			augments={'Enhances "Martyr" effect',}}
	Relic_legs			={ name="Piety Pantaloons +1", 	augments={'Enhances "Shellra V" effect',}}
	Relic_feet			={ name="Piety Duckbills +1", 	augments={'Enhances "Protectra V" effect',}}
		
	Empy_head 			={ name="Ebers Cap +1" }
	Empy_body			={ name="Ebers Bliaud +1" }
	Empy_hands			={ name="Ebers Mitts +1" }
	Empy_legs 			={ name="Ebers Pantaloons +1" }
	Empy_feet 			={ name="Ebers Duckbills" }
	
	----
	-- items to get
	---
	-- Regal pumps to +1
	-- kaykaus head path B, hands path A
	-- grioavolr (staff for FC) augmented
	-- Chironic head
	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
	-- 69% FC
    sets.precast.FC = {main=Grioavolr,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
		haed=Vanya_head_FC,neck="Orunmila's Torque",ear1="Loquacious earring",ear2="Enchntr. Earring +1",
		body="Anhur Robe",hands=Gende_hands,ring1="Prolix Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful belt",legs="Aya. Cosciales +1",feet="Regal Pumps"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",legs="Doyen Pants"})
	
	--64% FC + 13% healing cast time = 77%
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs=Empy_legs})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
	--26% cure cast time + 13% healing cast time + 49% FC = 88% FC (80% cap) + 4% quick
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main=Queller_Rod,sub={name="Sors Shield",priority=-1},
		ear1="Nourish. Earring +1",ear2="Mendi. Earring",
		ring1="Lebeche ring",
		feet=Kaykaus_feet})
		
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Benediction'] = {body=Relic_body}
	 sets.precast.JA['Devotion'] = {head=Relic_head}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    
    sets.precast.WS['Flash Nova'] = {}
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = sets.precast.FC
    
    -- Cure sets
    sets.midcast.Cure = {main=Queller_Rod,sub={name="Sors Shield",priority=-1},
		head=Kaykaus_head,neck="Incanter's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body=Empy_body,hands=AF_hands,ring1="Lebeche ring",ring2="Levia. Ring +1",
		back=Mending_back,waist="Witful Belt",legs=Empy_legs,feet=Kaykaus_feet}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast['Cure With Weather'] = {main="Chatoyant Staff",
		head=Kaykaus_head,neck="Incanter's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body=Empy_body,hands=Empy_hands,ring1="Lebeche ring",ring2="Levia. Ring +1",   ----- replace hands for kaykaus path A
		back="Twilight Cape",waist="Hachirin-no-Obi",legs=Empy_legs,feet=Kaykaus_feet}
	
	sets.midcast['Curaga With Weather'] = set_combine(sets.midcast['Cure With Weather'], {neck="Nuna Gorget +1",body=AF_body,ring2="Levia. Ring +1"})
	
    sets.midcast.Cursna = {
		main=Gada,sub={name="Sors Shield",priority=-1},
		head=Vanya_head_Cure,neck="Malison Medalion",ear1="Healing Earring",ear2="Beatific Earring",
		body=Empy_body,ring1="Ephedra Ring",ring1="Haoma's Ring",
		back=FC_back,waist="Witful Belt",legs=AF_legs,feet=Gende_feet}

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,{head=Empy_head,hands=Empy_hands,
		back=Mending_back,legs=Empy_legs})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr,
		head=Telch_head_Enh,
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		waist="Olympus Sash",legs=Telch_legs_Enh,feet=AF_feet})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",head="Inyanga Tiara +1",body=Relic_body,hands=Empy_hands,legs=AF_legs})

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})
    
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main="Beneficus",
		head=Empy_head,neck="Incanter's Torque",
		body=Empy_body,hands=Empy_hands,
		back=FC_back,legs=Relic_legs,feet=Empy_feet
		})
	
	sets.midcast.bar_status	= sets.midcast.BarElement
	
	sets.midcast['Auspice'] = set_combine(sets.midcast['Enhancing Magic'], {feet=Empy_feet})
	
	-- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring",feet=Relic_feet})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring",legs=Relic_legs})
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})


    sets.midcast['Divine Magic'] = set_combine(sets.midcast.FastRecast,{})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast,{})

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main=Grioavolr,sub={name="Enki Strap",priority=-1},
		head="Befouled Crown",neck="Imbodla Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body=AF_body,hands=Kaykaus_hands,ring1="Levia. Ring +1",ring2="Kishar Ring",
		back=FC_back,waist="Ovate Rope",legs=Chironic_legs,feet=AF_feet}

    sets.midcast.IntEnfeebles = set_combine( sets.midcast.MndEnfeebles, {ring1="Vertigo Ring"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

    sets.idle.PDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.idle.Town = {}
    
    sets.idle.Weak = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}
    
    -- Defense sets

    sets.defense.PDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.defense.MDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.CP = {back="Mecistopins Mantle"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 and spellMap == 'Cure' then
			if spell.en == 'Cure III' then
				cancel_spell()
				send_command('input /ma "Cure IV" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			elseif spell.en == 'Cure IV' then
				cancel_spell()
				send_command('input /ma "Cure V" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			elseif spell.en == 'Cure V' then
				cancel_spell()
				send_command('input /ma "Cure VI" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
			if spell.en == 'Curaga II' then
				cancel_spell()
				send_command('input /ma "Curaga III" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			elseif spell.en == 'Curaga III' then
				cancel_spell()
				send_command('input /ma "Curaga IV" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			elseif spell.en == 'Curaga IV' then
				cancel_spell()
				send_command('input /ma "Curaga V" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		end
	end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' then
            if world.weather_element == 'Light' or windower.ffxi.get_info().day == 'Lightsday' then
                equip(sets.midcast['Cure With Weather'])
            end
		elseif spellMap == 'Curaga' then
			if world.weather_element == 'Light' or windower.ffxi.get_info().day == 'Lightsday' then
                equip(sets.midcast['Curaga With Weather'])
            end
		elseif Bar_Status:contains(spell.en) and sets.midcast.bar_status then
			equip(sets.midcast.bar_status)
		elseif spellMap == StatusRemoval then
			
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
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_handle_equipping_gear(playerStatus, eventArgs)
	check_moving()
	update()
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
	
    if field == 'Offense Mode' then
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
        if spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
	lockouts()
	if state.OffenseMode.value == 'None' then
		enable('main','sub')
	end
	if state.DefenseMode.current == 'None' then
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
		if state.Auto_Kite.value == true then
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end
    
    return idleSet
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
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
	handle_equipping_gear(player.status)
end

function job_self_command(cmdParams, eventArgs)

    gearinfo(cmdParams, eventArgs)
	
	if cmdParams[1] == 'hide' then
		if hide_window then
			hide_window = false
		else
			hide_window = true
		end
		old_inform.hide_window = hide_window
	end
	
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

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
	local msg = ''
	msg = ('[Melee: '):color(Notification_color)
	
	if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end
	
	msg = msg .. ('] [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
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
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

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

	local white = '\\cs(220,220,220)'
	local blue = '\\cs(150,150,235)'
	local red = '\\cs(255,0,0)'
	local orange = '\\cs(232,138,13)'
	local yellow = '\\cs(220,220,0)'
	local green = '\\cs(0,225,0)'
	local purple = '\\cs(213,43,196)'

	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() or zoning_bool or hide_window then
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
	
	if state.DefenseMode.value == 'None' then
		if moving == true then
			inform.is_Moving = (yellow .. ('\n [Moving]' )) .. '\\cr'
		else
			inform.is_Moving = ('')
		end
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
	set_macro_page(1, 10)
end
