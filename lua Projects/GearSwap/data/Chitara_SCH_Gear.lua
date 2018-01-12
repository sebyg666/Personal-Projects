 
function init_gear_sets()
		
	print('Chitara_SCH_Gear.lua sidecar loaded')
  	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Rubicundity			={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}}
	Serenity			={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	Witching_Robe		={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}}
	
	Akademos_Nuke		={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}
	Akademos_Enf		={ name="Akademos", augments={'Mag. Acc.+20','Enha.mag. skill +15','Enfb.mag. skill +15',}}
	
	Hagondes_head		={ name="Hagondes Hat", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}}
    Hagondes_body		={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Avatar perpetuation cost" -5',}}
    Hagondes_hands		={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+5',}}
    Hagondes_legs		={ name="Hagondes Pants", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+24',}}
	
	Gendewitha_hands	={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
	Gendewitha_feet		={ name="Gende. Galoshes", augments={'Phys. dmg. taken -2%','Song spellcasting time -2%',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	Telch_body_Enh		={ name="Telchine Chas.", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
	Telch_legs_Enh		={ name="Telchine Braconi", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +9',}}
	Telch_Feet_Enh		={ name="Telchine Pigaches", augments={'Mag. Acc.+22','"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	
	Telch_body_Pet		={ name="Telchine Chas.", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
	
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
	
	Chironic_body		={ name="Chironic Doublet", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Resist Silence"+9','CHR+10','Mag. Acc.+15','"Mag.Atk.Bns."+9',}}
	
	Chironic_head_TP	={ name="Chironic Hat", augments={'Pet: Mag. Acc.+5','"Store TP"+7','Haste+1','Accuracy+11 Attack+11','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
	Chironic_hands_TP	={ name="Chironic Gloves", augments={'Attack+4','"Dbl.Atk."+3','Accuracy+15',}}
	Chironic_legs_TP	={ name="Chironic Hose", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','STR+7',}}
	Chironic_feet_TP	={ name="Chironic Slippers", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','CHR+7','Accuracy+1',}}
	
	Chironic_legs_Macc	={ name="Chironic Hose", augments={'Mag. Acc.+25','"Fast Cast"+1','CHR+9','"Mag.Atk.Bns."+9',}}
	
	Chironic_head_TH	={ name="Chironic Hat", augments={'DEX+7','Pet: AGI+5','"Treasure Hunter"+1','Accuracy+14 Attack+14',}}
	Chironic_body_TH	={ name="Chironic Doublet", augments={'"Conserve MP"+3','Pet: Mag. Acc.+2','"Treasure Hunter"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
	Chironic_hands_TH	={ name="Chironic Gloves", augments={'"Fast Cast"+2','Attack+4','"Treasure Hunter"+1',}}
	
	Chironic_head_Refr	={ name="Chironic Hat", augments={'Accuracy+4 Attack+4','"Refresh"+2',}}
	Chironic_hands_Refr	={ name="Chironic Gloves", augments={'Pet: Mag. Acc.+2','AGI+3','"Refresh"+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}

	Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_hands		={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	
	Kaykaus_head		={ name="Kaykaus Mitra", augments={'MP+60','MND+10','Mag. Acc.+15',}}
    Kaykaus_legs		={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}}
	
    Relic_body			={ name="Pedagogy Gown", augments={'Enhances "Enlightenment" effect',}}
    Relic_legs			={ name="Pedagogy Pants", augments={'Enhances "Tabula Rasa" effect',}}
    Relic_feet			={ name="Peda. Loafers", augments={'Enhances "Stormsurge" effect',}}
	
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+31%','Rng.Acc.+1','DEF+1',}}
	FC_back				={ name="Lugh's Cape", augments={'"Fast Cast"+10',}}
	Nuke_back			={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	Bookworms_back		={ name="Bookworm's Cape", augments={'INT+2','MND+4','Helix eff. dur. +17','"Regen" potency+2',}}
	
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
    -- Start defining the sets
    --------------------------------------
	
	gear.Resist_Waste = "Eschan Stone"
	gear.Nuke_Waste = "Refoccilation Stone"
	gear.default.obi_waist = gear.Nuke_Waste
	--gear.default.obi_back = Nuke_back

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs=Relic_legs}

    -- Fast cast sets for spells

    sets.precast.FC = {main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Anhur Robe",hands=Merl_hands_FC,ring1="Veneficium Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful belt",legs=Psycloth_legs,feet=Merl_feet_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=Serenity,back="Pahtli Cape",legs="Doyen Pants"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.precast.RA = {}


    -- Midcast Sets
	 sets.precast.WS = {
		ammo="Hydrocera",
        head=Chironic_head_TH,neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body=Amalric_body,hands=Chironic_hands_TP,ring1="Rajas Ring",ring2="Apate Ring",
		back="Cheviot Cape",waist="Sarissaphoroi Belt",legs=Telch_legs_TP,feet=Chironic_feet_TP}
		
	sets.precast.WS['Myrkr'] = {
		ammo="Hydrocera",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear1="Moonshade Earring",ear2="Barkarole Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back="Pahtli Cape",waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Refr}
	
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {ammo="Sapience Orb",ring1="Prolix Ring"})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main=Serenity,sub={name="Clerisy Strap",priority=-1},
        head=Kaykaus_head,neck="Phalaina Locket",ear2="Healing Earring",
        body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
        waist="Bishop's Sash",legs=Kaykaus_legs,feet=Vanya_feet})

    sets.midcast.CureWithLightWeather = set_combine(sets.precast.CureWithLightWeather, {
		ammo="Sapience Orb",
		head=Kaykaus_head,ear2="Healing Earring",
        body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
        waist="Hachirin-no-Obi",legs=Kaykaus_legs,feet=Relic_feet})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Enh,sub={name='Clerisy strap',priority=-1},
			neck="Malison Medallion",ear2="Healing Earring",
			body=Relic_body,ring1="Ephedra Ring",ring2="Sirona's Ring",
			waist="Bishop's Sash",feet=Gendewitha_feet})

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Enh,sub={name="Fulcio Grip",priority=-1},
			head=Telch_head_Enh,neck="Incanter's Torque",ear1='Andoaa Earring',
			body=Telch_body_Enh,hands=Telch_hands_Enh,
			back='Merciful Cape',waist="Olympus Sash",legs=Telch_legs_Enh,feet=Telch_Feet_Enh})
			
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1},back=FC_back})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub={name="Genbu's Shield",priority=-1},head="Amalric Coif",waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {}) --feet=Relic_feet
	
	sets.midcast['Embrava'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	-- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",feet="Inspirited Boots"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
    sets.midcast['Mnd Enfeebles'] = {main=Akademos_Enf,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Dignitary's Earring",
        body=Vanya_body,hands="Lurid Mitts",ring1="Leviathan Ring",ring2="Leviathan Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Chironic_legs_Macc,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {neck="Incanter's Torque",ring1="Vertigo Ring",body=Merl_body_Nuke,hands="Jhakri Cuffs +1",})

    sets.midcast['Int Enfeebles'] = {main=Akademos_Enf,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Dignitary's Earring",
        body=Vanya_body,hands="Lurid Mitts",ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Chironic_legs_Macc,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {neck="Incanter's Torque",ring1="Vertigo Ring",body=Merl_body_Nuke,hands="Jhakri Cuffs +1",})
	
	sets.midcast['Dia'] 	= set_combine(sets.midcast['Enfeebling Magic'], {head=Chironic_head_TH,body=Chironic_body_TH,hands=Chironic_hands_TH})
	sets.midcast['Dia II'] 	= sets.midcast['Dia']
	
    sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant

    sets.midcast['Dark Magic'] = {main=Akademos_Enf,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
		head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Perception Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Eschan Stone",legs=Chironic_legs_Macc,feet=Merl_feet_Nuke}
		
	sets.midcast['Klimaform'] = set_combine(sets.midcast.FastRecast, {})

    sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Merl_hands_Asp,ring1="Evanescence Ring",ring2="Kishar Ring",
        back=Nuke_back,waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}

    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {main=Akademos_Nuke,sub={name="Niobid Strap",priority=-1}})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
		
    sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main=Grioavolr_Enh})
	
	sets.midcast['Elemental Magic'] = {
		main=Akademos_Nuke,sub={name="Niobid Strap",priority=-1},ammo="Dosis Tathlum",
        head=Merl_head_Burst,neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist=gear.ElementalObi,legs=Merl_legs_Burst,feet=Merl_feet_Nuke}
	
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 					{})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 					{neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 					{})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 					{neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast['Helix'] 													= set_combine(sets.midcast['Elemental Magic'], 					{waist="Eschan Stone"})
	sets.midcast['Helix'].Resistant 										= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{waist="Eschan Stone"})
	sets.midcast['Helix']['Magic Burst'] 									= set_combine(sets.midcast['Elemental Magic'], 					{neck="Mizu. Kubikazari",ring2="Mujin Band",waist="Eschan Stone"})
	sets.midcast['Helix']['Magic Burst'].Resistant 							= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{neck="Mizu. Kubikazari",ring2="Mujin Band",waist="Eschan Stone"})
	-- sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Helix'], 							{})
	-- sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Helix'].Resistant, 					{})
	-- sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Helix']['Magic Burst'] , 			{ring1="Mujin Band"})
	-- sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Helix']['Magic Burst'] .Resistant, 	{ring1="Mujin Band"})
	sets.midcast.Kaustra  													= set_combine(sets.midcast['Elemental Magic'], 					{head="Pixie Hairpin +1"})
	sets.midcast.Kaustra['Magic Burst']   									= set_combine(sets.midcast['Elemental Magic'], 					{head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast.Kaustra.Resistant   										= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{head="Pixie Hairpin +1"})
	sets.midcast.Kaustra['Magic Burst'].Resistant    						= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 					{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 		{head=empty,body="Twilight Cloak"})
		
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Resting sets
	sets.resting = set_combine(sets.idle, {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},hands=Chironic_hands_Refr,legs="Assiduity Pants +1",feet=Merl_feet_Refr})


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.idle = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},ammo="Sapience Orb",
        head=Chironic_head_Refr,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Witching_Robe,hands=Chironic_hands_Refr,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
	
	sets.idle.Refresh = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},ammo="Sapience Orb",
        head=Chironic_head_Refr,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Witching_Robe,hands=Chironic_hands_Refr,ring1="Patricius Ring",ring2="Defending Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}
	
    -- sets.idle.Town = {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},ammo="Sapience Orb",
        -- head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        -- body="Arbatel Gown",hands=Chironic_hands_Refr,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        -- back="Cheviot Cape",waist="Slipor Sash",legs="Arbatel Pants",feet="Herald's Gaiters"}

    sets.idle.PDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},ammo="Sapience Orb",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Gendewitha_hands,ring1="Patricius Ring",ring2="Defending Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.idle.Weak = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},ammo="Sapience Orb",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Gendewitha_hands,ring1="Patricius Ring",ring2="Defending Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},ammo="Sapience Orb",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Gendewitha_hands,ring1="Patricius Ring",ring2="Defending Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub={name="Irenic Strap +1",priority=-1},ammo="Sapience Orb",
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Amalric_body,hands=Gendewitha_hands,ring1="Patricius Ring",ring2="Defending Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet=Vanya_feet}

    sets.Kiting 			= {feet="Herald's Gaiters"}
	sets.CP 				= {back=CP_back}
    sets.latent_refresh 	= {waist="Fucho-no-obi"}
	sets.Locked_Main_Sub 	= {main=Akademos_Nuke,sub={name="Niobid Strap",priority=-1}}
	sets.crafting 			= {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main=Akademos_Nuke,sub={name="Giuoco Grip",priority=-1},ammo="Sapience Orb",
        head=Chironic_head_TH,neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body=Amalric_body,hands="Gazu Bracelet +1",ring1="Rajas Ring",ring2="Petrov Ring",
		back="Cheviot Cape",waist="Sarissaphoroi Belt",legs=Telch_legs_TP,feet=Chironic_feet_TP}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet=Relic_feet}
    sets.buff['Alacrity'] = {feet=Relic_feet}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
    sets.buff.FullSublimation = {main="Siriti",sub={name="Genbu's Shield",priority=-1},head="Academic's Mortarboard",ear1="Savant's Earring",body=Relic_body}
    sets.buff.PDTSublimation = {main="Siriti",sub={name="Genbu's Shield",priority=-1},head="Academic's Mortarboard",ear1="Savant's Earring"}
	
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	
    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
			
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 13)
	
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Aquaveil" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^` input /ma "Aquaveil" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind F8 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
	elseif player.sub_job:upper() == 'BLM' then
		send_command('bind ^` input /ma "Stun" <t>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	end
end
 