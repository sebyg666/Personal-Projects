function init_gear_sets()
		
	print('Chitara_GEO_Gear.lua sidecar loaded')
	
	Gada				={ name="Gada", augments={'Indi. eff. dur. +9','STR+15','Mag. Acc.+1',}}
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Rubicundity			={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}}
	Serenity			={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	Witching_Robe		={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}}
	
	Hagondes_head		={ name="Hagondes Hat", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}}
    Hagondes_body		={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Avatar perpetuation cost" -5',}}
    Hagondes_hands		={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+5',}}
    Hagondes_legs		={ name="Hagondes Pants", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+24',}}
	
	Pet_Solstice		={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	Telch_body_Enh		={ name="Telchine Chas.", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
	Telch_legs_Enh		={ name="Telchine Braconi", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +9',}}
	Telch_Feet_Enh		={ name="Telchine Pigaches", augments={'Mag. Acc.+22','"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	
	Telch_head_Pet		={ name="Telchine Cap", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
    Telch_body_Pet		={ name="Telchine Chas.", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
    Telch_hands_Pet		={ name="Telchine Gloves", augments={'Pet: "Regen"+2','Pet: Damage taken -2%',}}
    Telch_legs_Pet		={ name="Telchine Braconi", augments={'Evasion+10','Pet: "Regen"+2','Pet: Damage taken -4%',}}
    Telch_feet_Pet		={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}}
	
	Telch_legs_TP		={ name="Telchine Braconi", augments={'Accuracy+11','"Dbl.Atk."+3','STR+7 AGI+7',}}
	
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
	
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}

	Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_hands		={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	
	Relic_head			={ name="Bagua Galero", augments={'Enhances "Primeval Zeal" effect',}}
    Relic_body			={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}}
    Relic_hands			={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}}
    Relic_legs			={ name="Bagua Pants", augments={'Enhances "Mending Halation" effect',}}
    Relic_feet			={ name="Bagua Sandals", augments={'Enhances "Radial Arcana" effect',}}
	
	Pet_back			={ name="Lifestream Cape", augments={'Geomancy Skill +5','Indi. eff. dur. +20','Pet: Damage taken -1%','Damage taken-3%',}}
	Nuke_back			={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	Pet_back_Regen		={ name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+31%','Rng.Acc.+1','DEF+1',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {waist="Hachirin-no-Obi"}
	
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	Nuke_waist = "Refoccilation Stone"
	}
	--------------------------------------
    -- Precast sets
    --------------------------------------

	gear.Staff.PDT = "Terra's Staff"
	gear.default.weaponskill_waist = "Windbuffet Belt +1"
	
	gear.Resist_Waste = "Eschan Stone"
	gear.Nuke_Waste = "Refoccilation Stone"
	gear.default.obi_waist = gear.Nuke_Waste
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Bolster'] = {body=Relic_body}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic", hands='Bagua Mitaines', back="Nantosuelta's Cape"}
	sets.precast.JA['Mending Halation'] = {legs=Relic_legs}
	sets.precast.JA['Radial Arcana'] = {feet=Relic_feet}

    -- Fast cast sets for spells
	
    sets.precast.FC = {main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Anhur Robe",hands=Merl_hands_FC,ring1="Prolix Ring",ring2="Kishar Ring",
		back=Pet_back,waist="Witful belt",legs="Geomancy Pants +1",feet=Merl_feet_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole Earring",hands=Relic_hands})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=Serenity,back="Pahtli Cape",legs="Doyen Pants",feet=Vanya_feet})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.precast.RA = {}
	
	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {
		main=Pet_Solstice,sub={name="Culminus",priority=-1},range="Dunna",ammo=empty,
		head=Vanya_head,neck="Incanter's Torque",ear1="Calamitous Earring",ear2="Lempo Earring",
		body=Amalric_body,hands="Geomancy Mitaines +1",
		back="Solemnity Cape",waist="Hachirin-no-Obi",legs="Azimuth Tights",feet=Mediums_Sabots})
		
	sets.precast.Indi = set_combine(sets.precast.FC, {
		main=Gada,sub={name="Culminus",priority=-1},range="Dunna",ammo=empty,
		head=Vanya_head,neck="Incanter's Torque",ear1="Calamitous Earring",ear2="Lempo Earring",
		body=Amalric_body,hands="Azimuth Gloves",
		back=Pet_back,waist="Hachirin-no-Obi",legs=Relic_legs,feet="Azimuth Gaiters"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Jhakri Coronal +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}		

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
        body=Amalric_body,hands=Merl_hands_FC,ring1="Prolix Ring",ring2="Kishar Ring",
        back=Pet_back,waist="Witful belt",legs="Geomancy Pants +1",feet=Merl_feet_FC}

    sets.midcast.Geomancy = set_combine(sets.midcast.FastRecast, {
		main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",ammo=empty,
		head="Azimuth Hood",neck="Incanter's Torque",
		body=Relic_body,hands="Geomancy Mitaines +1",
		back=Pet_back,legs="Azimuth Tights",feet="Azimuth Gaiters"})
		
	sets.midcast.Indi = set_combine(sets.midcast.FastRecast, {
		main=Gada,sub={name="Genbu's Shield",priority=-1},range="Dunna",ammo=empty,
		head="Azimuth Hood",neck="Incanter's Torque",
		body=Relic_body,hands="Geomancy Mitaines +1",
		back=Pet_back,legs=Relic_legs,feet="Azimuth Gaiters"})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
        main=Serenity,sub={name="Clerisy Strap",priority=-1},
		head=Vanya_head,neck="Phalaina Locket",ear2="Healing Earring",
        body=Vanya_body,hands="Telchine gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
       waist="Bishop's Sash",legs=Kaykaus_legs,feet=Vanya_feet})
		
    sets.midcast.Curaga = sets.midcast.Cure    
    
    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,sub={name='Clerisy strap',priority=-1},
		head=Vanya_head,neck="Incanter's Torque",ear2="Healing Earring",
		ring1="Ephedra Ring",ring2="Sirona's Ring",
		waist="Bishop's Sash",feet=Vanya_feet})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,sub={name='Clerisy strap',priority=-1},
		head=Telch_head_Enh,neck="Incanter's Torque",ear1='Andoaa Earring',
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		back='Merciful Cape',back=Pet_back,waist="Olympus Sash",legs=Telch_legs_Enh,feet=Telch_Feet_Enh})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1}})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",feet="Inspirited Boots"})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub={name="Genbu's Shield",priority=-1},head="Amalric Coif",waist="Emphatikos Rope"})
	
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

	-- Custom spell classes
    sets.midcast['Mnd Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Leviathan Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body=Merl_body_Nuke})

    sets.midcast['Int Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Shiva Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body=Merl_body_Nuke})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
	sets.midcast['Dark Magic'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Merl_hands_Asp,ring1="Perception Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body="Geomancy Tunic",hands="Lurid Mitts",ring1="Evanescence Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
	
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1}})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
	
	sets.midcast.Stun = {	
		main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Hydrocera",
		head=Merl_head_FC,neck="Voltsurge Torque",ear1="Digni. Earring",ear2="Enchntr. Earring +1",
		body=Merl_body_Nuke,hands=Merl_hands_FC,left_ring="Prolix Ring",right_ring="Kishar Ring",
		back=Pet_back,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_Nuke}
	
	sets.midcast['Elemental Magic'] = {
		main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Dosis Tathlum",
        head=Merl_head_Burst,neck="Mizu. Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring", 
        back=Nuke_back,waist=gear.ElementalObi,legs=Merl_legs_Burst,feet=Merl_feet_Nuke}
    
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{ear2="Enchanter Earring +1",ring2="Kishar Ring",})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{neck="Mizu. Kubikazari",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{neck="Mizu. Kubikazari",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,body="Twilight Cloak"})
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}

	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = set_combine(sets.idle, {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},range="Dunna",hands=Relic_hands,legs="Assiduity Pants +1",feet=Merl_feet_Refr})

    -- Idle sets

    sets.idle = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head="Befouled Crown",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Witching_Robe,hands=Relic_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}
		
	-- sets.idle.Town = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},range="Dunna",
        -- head="Azimuth Hood",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        -- body="Azimuth Coat",hands=Relic_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        -- back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.PDT = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}
		
	sets.idle.Refresh = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head="Befouled Crown",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Witching_Robe,hands=Relic_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Telch_head_Pet,neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Witching_Robe,hands=Relic_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back=Pet_back_Regen,waist="Isa Belt",legs="Assiduity Pants +1",feet=Merl_feet_Refr}

    sets.idle.Pet.PetDT = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Telch_head_Pet,neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Telch_body_Pet,hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Patricius Ring",
        back=Pet_back,waist="Isa Belt",legs=Psycloth_legs,feet=Telch_feet_Pet}
		
	sets.idle.Pet.PetRegen = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Telch_head_Pet,neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Telch_body_Pet,hands=Telch_hands_Pet,ring1="Defending Ring",ring2="Patricius Ring",
        back=Pet_back_Regen,waist="Isa Belt",legs=Telch_legs_Pet,feet=Telch_feet_Pet}

    sets.idle.Weak = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Hagondes_head,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands="Geomancy Mitaines +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main=Pet_Solstice,sub={name="Genbu's Shield",priority=-1},range="Dunna",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Hagondes_body,hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main=Grioavolr_Enh,sub={name="Irenic Strap +1",priority=-1},range="Dunna",
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back=Pet_back_Regen,waist="Slipor Sash",legs=Merl_legs_Burst,feet=Vanya_feet}

    sets.Kiting = {feet="Geomancy Sandals +1"}
	sets.CP = {back=CP_back}
	sets.warp = {ring2='Warp Ring'}
	sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group				
	sets.engaged = {main=Pet_Solstice,sub={name="Culminus",priority=-1},range="Dunna",
        head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Brutal Earring",
        body="Onca Suit",hands=empty,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",legs=empty,feet=empty}
		
	sets.engaged.acc = {main=Pet_Solstice,sub={name="Culminus",priority=-1},range="Dunna",
        head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Brutal Earring",
        body="Jhakri Robe +1",hands="Gazu Bracelet +1",ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.buff['Collimated Fervor'] = {head=Relic_head}
	
				
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 20)
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind @` input /ma "Aquaveil" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind @` input /ma "Aquaveil" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind ^F7 input /ma "Frazzle" <stnpc>')
		send_command('bind F8 input /ma "Refresh" <stal>')
		send_command('bind ^F8 input /ma "Aspir 3" <stnpc>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind ^F9 input /ma "Dispel" <stnpc>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
	elseif player.sub_job:upper() == 'BLM' then
		send_command('bind ^` input /ma "Stun" <t>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'DNC' then		
		send_command("bind F8 input /ws \"Exudation\" <t>")
		send_command('bind ^F8 input /ja "Hexa Strike" <t>')
		send_command('bind @F8 input /ja "Judgment" <t>')
	
		send_command('bind ^` input /ja "spectral jig" <me>')
		send_command('bind !` input /ja "Reverse Flourish" <me>')
		
		send_command('bind F7 input /ja "Violent flourish" <t>')
		send_command('bind ^F7 input /ja "Box step" <stnpc>')
		send_command('bind @F7 input /ja "Stutter step" <stnpc>')
		
		send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		send_command('bind @F9 input /ja "Haste Samba" <me>')
		
		send_command('bind F10 input /ja "Curing Waltz III" <stal>')
		send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		
		send_command('bind F11 input /ja "Curing Waltz II" <stal>')
		
	end
end
