
function init_gear_sets()
	
	print('Chitara_SMN_Gear.lua sidecar loaded')
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	Grioavolr_Pet		={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: STR+11','Pet: Mag. Acc.+14','Pet: "Mag.Atk.Bns."+11',}}
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Serenity				={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	--Gada					={ name="Gada", augments={'Indi. eff. dur. +9','STR+15','Mag. Acc.+1',}}
	Rubicundity			={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}}
	Espiritus				={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}
	Gridarvor				={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}}
	
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}}
	Psycloth_Lappas		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	Lengo_Pants				={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}}
	--Witching_Robe			={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}
	
	Hagondes_head		={ name="Hagondes Hat", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}}
    Hagondes_body		={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Avatar perpetuation cost" -5',}}
    Hagondes_hands		={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+5',}}
    Hagondes_legs			={ name="Hagondes Pants", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+24',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	Telch_body_Enh		={ name="Telchine Chas.", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
	Telch_legs_Enh			={ name="Telchine Braconi", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +9',}}
	Telch_Feet_Enh		={ name="Telchine Pigaches", augments={'Mag. Acc.+22','"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	
	--Telch_head_Pet		={ name="Telchine Cap", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
    --Telch_body_Pet		={ name="Telchine Chas.", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
    --Telch_hands_Pet		={ name="Telchine Gloves", augments={'Pet: "Regen"+2','Pet: Damage taken -2%',}}
    --Telch_legs_Pet			={ name="Telchine Braconi", augments={'Evasion+10','Pet: "Regen"+2','Pet: Damage taken -4%',}}
    --Telch_feet_Pet			={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}}
	
    --Telch_legs_TP			={ name="Telchine Braconi", augments={'Accuracy+11','"Dbl.Atk."+3','STR+7 AGI+7',}}
	
	Apogee_head_phys 	={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
	Apogee_legs_phys	={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	Apogee_feet_phys 	={ name="Apogee Pumps +1", augments={'MP+80','Summoning magic skill +20','Blood Pact Dmg.+8',}}
	
	Apogee_body			={ name="Apogee Dalmatica +1"}
	
	Apogee_head_mag	={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	Apogee_legs_mag	={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	Apogee_feet_mag	={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	
	Merl_head_Burst		={ name="Merlinic Hood", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst dmg.+10%','INT+3','Mag. Acc.+13',}}
    Merl_legs_Burst		={ name="Merlinic Shalwar", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+10%','Mag. Acc.+9','"Mag.Atk.Bns."+11',}}
	Merl_feet_Burst		={ name="Merlinic Crackows", augments={'Mag. Acc.+28','Magic burst dmg.+10%','INT+7','"Mag.Atk.Bns."+8',}}
	
	Merl_body_Nuke		={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic Damage +5','CHR+11','Mag. Acc.+14','"Mag.Atk.Bns."+11',}}
	Merl_feet_Nuke		={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+7','Mag. Acc.+15','"Mag.Atk.Bns."+1',}}
	
	Merl_hands_Asp		={ name="Merlinic Dastanas", augments={'"Drain" and "Aspir" potency +9','CHR+2','"Mag.Atk.Bns."+7',}}
	Merl_legs_Asp		={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','"Drain" and "Aspir" potency +8','Mag. Acc.+8',}}
    Merl_feet_Asp		={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +9','"Mag.Atk.Bns."+15',}}
	
	Merl_head_FC		={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+7','Mag. Acc.+10',}}
	Merl_hands_FC		={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','INT+1','Mag. Acc.+4','"Mag.Atk.Bns."+5',}}
	Merl_feet_FC		={ name="Merlinic Crackows", augments={'Mag. Acc.+3','"Fast Cast"+7','"Mag.Atk.Bns."+8',}}
	
	Merl_feet_Refr		={ name="Merlinic Crackows", augments={'AGI+9','Crit.hit rate+3','"Refresh"+1','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	
	Merl_hands_Pet 	={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','INT+1','Mag. Acc.+4','"Mag.Atk.Bns."+5',}}
	
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_legs			={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	-- Kaykaus_head		={ name="Kaykaus Mitra", augments={'MP+60','MND+10','Mag. Acc.+15',}}
    -- Kaykaus_legs		={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}}
	
	--head="Amalric Coif",
	Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_hands		={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs			={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_feet			={ name="Amalric Nails", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	
	Enticers_Pants		={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Mag. Acc.+14','Pet: Damage taken -4%',}}
	
	AF_head 				={ name="Convoker's Horn +1" }
	AF_body				={ name="Convoker's Doublet +2" }
	AF_hands 			={ name="Convoker's Bracers +1" }
	AF_legs 				={ name="Convoker's Spats +1" }
	AF_feet 				={ name="Convoker's Pigaches +1" }
	
	Relic_head			={ name="Glyphic Horn +1", augments={'Enhances "Astral Flow" effect',}}
	Relic_body			={ name="Glyphic Doublet +1", augments={'Reduces Sp. "Blood Pact" MP cost',}}
	Relic_hands			={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}}
	Relic_legs				={ name="Glyphic Spats +1", augments={'Increases Sp. "Blood Pact" accuracy',}}
	Relic_feet				={ name="Glyph. Pigaches +1", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}}
	
	Empy_head 			={ name="Beckoner's Horn +1" }
	Empy_body			={ name="Beckoner's Doublet +1" }
	Empy_hands			={ name="Beckoner's Bracers +1" }
	Empy_legs 			={ name="Beckoner's Spats +1" }
	Empy_feet 			={ name="Beckoner's Pigaches +1" }
	
	Pet_Mag_Cape		={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','"Fast Cast"+10',}}
	Pet_Phys_Cape		={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}}
	WS_Cape				={ name="Campestres's Cape"} -- WSD cape
	
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+31%','Rng.Acc.+1','DEF+1',}}
	
	--------------------------------------
    -- Defaults
    --------------------------------------
	
	-- gear.perp_staff = {name = "Hoe"}
	-- gear.default.perp_staff = {name = "Hoe"}
	
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head=Relic_head}
    
    sets.precast.JA['Elemental Siphon'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Incanter's Torque",ear1="Evans Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.precast.JA['Mana Cede'] = {hands=Empy_hands}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Caller's Pendant",ear1="Evans Earring",ear2="Andoaa Earring",
		body=AF_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Fervor ring",
		back="Conveyance Cape",waist="Kobo Obi",legs=Empy_legs,feet=Apogee_feet_phys}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Merl_hands_FC,ring1="Veneficium Ring", ring2="Kishar Ring", 
		back=Pet_Mag_Cape,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_FC}
		
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=Serenity,back="Perimede Cape",legs="Doyen Pants",feet=Vanya_feet})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ring1="Veneficium Ring",waist="Siegel Sash"})
	
	 sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs",back="Perimede Cape",legs="Doyen Pants"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Welkin Crown",neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
        back=WS_Cape,waist="Fotia Belt",legs=Amalric_legs,feet=Amalric_feet}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	 sets.precast.WS['Myrkr'] = {
        head="Welkin Crown",neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
        back=WS_Cape,waist="Fotia Belt",legs=Amalric_legs,feet=Amalric_feet}
	
	 sets.precast.WS['Garland of Bliss'] = {
        head="Welkin Crown",neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
        back=WS_Cape,waist="Fotia Belt",legs=Amalric_legs,feet=Amalric_feet}
		
	 sets.precast.WS['Shattersoul'] = {
        head="Sukeroku Hachimaki",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Ishvara Earring",
        body=AF_body,hands=Amalric_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=WS_Cape,waist="Fotia Belt",legs="Tali'ah Seraweels +1",feet=AF_feet}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Merl_hands_FC,ring1="Veneficium Ring", ring2="Kishar Ring", 
		back=Pet_Mag_Cape,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_FC}

    sets.midcast.Cure = {main=Serenity,sub={name="Clerisy Strap",priority=-1},
		head=Vanya_head,neck="Incanter's Torque",ear1='Healing Earring',ear2="Beatific Earring",
		body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Solemnity Cape",waist="Bishop's Sash",legs=Vanya_legs,feet=Vanya_feet}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Cure day / weather'] = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
        
    sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,
		head=Vanya_head,neck="Incanter's Torque",ear1='Healing Earring',
		ring1="Ephedra Ring",ring2="Sirona's Ring",
		waist="Bishop's Sash",feet=Gendewitha_feet})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,sub={name="Fulcio Grip",priority=-1},
		head=Telch_head_Enh,neck="Incanter's Torque",ear1='Andoaa Earring',
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		back='Merciful Cape',waist="Olympus Sash",legs=Telch_legs_Enh,feet=Telch_Feet_Enh})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +1"})

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {head=Chironic_head_Refr,waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})
    
	-- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
	
	-- Custom spell classes
	
	-- Need to earring 1
	
    sets.midcast['Mnd Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Leviathan Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body=Merl_body_Nuke})

    sets.midcast['Int Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Shiva Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body=Merl_body_Nuke})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
    sets.midcast['Dark Magic'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Merl_hands_Asp,ring1="Perception Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands="Lurid Mitts",ring1="Evanescence Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
		
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1}})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant


    -- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet['BuffBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Gifted Earring",ear2="Andoaa Earring",
		body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_mag}
	
	sets.midcast.Pet['OtherBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Gifted Earring",ear2="Andoaa Earring",
		body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_mag}

    sets.midcast.Pet['DebuffBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Lugalbanda Earring",ear2="Enmerkar Earring",
		body=AF_body,hands=Merl_hands_Pet,ring1="Evoker's Ring",ring2="Fervor Ring",
		back=Pet_Mag_Cape,waist="Incarnation Sash",legs=Enticers_Pants,feet=AF_feet}
		  
    sets.midcast.Pet['PhysicalBloodPactRage'] = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_phys,neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_Pet,ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=Pet_Phys_Cape,waist="Incarnation Sash",legs=Apogee_legs_phys,feet=Apogee_feet_phys}

    sets.midcast.Pet['PhysicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['PhysicalBloodPactRage'], {})

    sets.midcast.Pet['MagicalBloodPactRage'] = {
		main=Grioavolr_Pet,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_mag,neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_Pet,ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=Pet_Mag_Cape,waist="Incarnation Sash",legs=Enticers_Pants,feet=Apogee_feet_mag}

    sets.midcast.Pet['MagicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['MagicalBloodPactRage'], {
		head=Empy_head,neck="Incanter's Torque",ear2="Enmerkar Earring",
		ring1="Evoker's Ring",ring2="Fervor Ring",
		feet=AF_feet})

	 sets.midcast.Pet['HybridlBloodPactRage'] = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_phys,neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_Pet,ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=Pet_Phys_Cape,waist="Incarnation Sash",legs=Apogee_legs_phys,feet=Apogee_feet_phys}
	
	
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = set_combine(sets.midcast.Pet['BuffBloodPactWard'], {})
    
    sets.midcast.Pet['Elemental Magic'] = set_combine( sets.midcast.Pet['MagicalBloodPactRage'], {})

    sets.midcast.Pet['Elemental Magic'].Resistant = set_combine( sets.midcast.Pet['MagicalBloodPactRage'].Acc, {})
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Sanctity Necklace",ear1="Infused Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}
    
    -- Idle sets
    sets.idle = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Sanctity Necklace",ear1="Infused Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}

    sets.idle.PDT = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Hagondes_body,hands=Hagondes_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

	-- Avatra Idle sets
    
    sets.idle.Avatar = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.idle.PDT.Avatar = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.idle.Spirit = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.idle.Avatar.Favor = set_combine(sets.idle.Avatar, {head=Empy_head})
	
    sets.idle.Avatar.Melee = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}
        
    sets.perp = {}
    sets.perp.Day = {hands=Empy_hands}
    sets.perp.Weather = {hands=Empy_hands}
	sets.perp["Carbuncle"] = {hands="Asteria Mitts +1"}
	sets.perp["Cait Sith"] = {hands="Lamassu Mitts +1"}
    sets.perp.Alexander = sets.midcast.Pet['BuffBloodPactWard']
    
    -- Defense sets
    sets.defense.PDT = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Hagondes_body,hands=Hagondes_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main=Grioavolr_Enh,sub={name="Irenic Strap +1",priority=-1},
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs=Merl_legs_Burst,feet=Vanya_feet}

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.CP = {back=CP_back}
	sets.warp = {ring2='Warp Ring'}
    sets.latent_refresh = {waist="Fucho-no-obi"}
    

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group				
	sets.engaged = {main="Nirvana",sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=AF_head,neck="Sanctity Necklace",ear1="Mache Earring",ear2="Brutal Earring",
        body="Onca Suit",hands=empty,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",waist="Klouskap Sash",legs=empty,feet=empty}
		
	sets.engaged.acc = {}
			
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
	 if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
	
    set_macro_page(1, 14)
	
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind F8 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind ^F9 input /ma "Dispel" <stnpc>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
	end
end
 