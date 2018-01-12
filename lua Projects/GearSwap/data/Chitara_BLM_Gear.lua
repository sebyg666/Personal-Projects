
function init_gear_sets()
	
	print('Chitara_Blm_Gear.lua sidecar loaded')
	
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Rubicundity			={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}}
	Serenity			={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	Witching_Robe		={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}}
	
	Hagondes_head		={ name="Hagondes Hat", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}}
    Hagondes_body		={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Avatar perpetuation cost" -5',}}
    Hagondes_hands		={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+5',}}
    Hagondes_legs		={ name="Hagondes Pants", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+24',}}
	
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
	
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}

	Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_hands		={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	
	Taranus_Nuke 		={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	Taranus_FC			={ name="Taranus's Cape", augments={'"Fast Cast"+10',}}
	Bane_back			={ name="Bane Cape", augments={'Elem. magic skill +8','Dark magic skill +4','"Mag.Atk.Bns."+3','"Fast Cast"+1',}}
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+31%','Rng.Acc.+1','DEF+1',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	Nuke_waist = "Refoccilation Stone"
	}
	
	--------------------------------------
    -- Start sets
    --------------------------------------

	gear.Staff.PDT = "Terra's Staff"
	gear.default.weaponskill_waist = "Windbuffet Belt"
	
	gear.Resist_Waste = "Eschan Stone"
	gear.Nuke_Waste = "Refoccilation Stone"
	gear.default.obi_waist = gear.Nuke_Waste
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells

    sets.precast.FC = {main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Anhur Robe",hands=Merl_hands_FC,ring1="Prolix Ring",ring2="Kishar Ring",
		back=Taranus_FC,waist="Witful belt",legs=Psycloth_legs,feet=Merl_feet_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole Earring"})
	
	sets.precast.FC['Death'] = set_combine(sets.precast.FC, {
		main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head=Merl_head_Burst,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back=Bane_back,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_FC})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Pahtli Cape",legs="Doyen Pants"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Hydrocera",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back=Bane_back,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Refr}
		
	sets.precast.WS['Myrkr'] = {
        ammo="Hydrocera",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2='Fenrir Ring',
        back=Bane_back,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Refr}
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main=Serenity,sub={name="Clerisy Strap",priority=-1},
        head=Vanya_head,neck="Phalaina Locket",ear2="Loquacious Earring",ear2="Enchanter Earring +1",
        body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs=Psycloth_legs,feet=Vanya_feet})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Enh,sub={name='Clerisy strap',priority=-1},
			neck="Malison Medallion",ear2="Healing Earring",
			ring1="Ephedra Ring",ring2="Sirona's Ring",
			waist="Bishop's Sash",})

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Enh,sub={name="Fulcio Grip",priority=-1},
			head=Telch_head_Enh,neck="Incanter's Torque",ear1='Andoaa Earring',
			body=Telch_body_Enh,hands=Telch_hands_Enh,
			back='Merciful Cape',waist="Olympus Sash",legs=Telch_legs_Enh,feet=Telch_Feet_Enh})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1}})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub={name="Genbu's Shield",priority=-1},head="Amalric Coif",waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck="Nodens Gorget",ear1='Earthcry Earring',hands=Telch_hands_Enh,waist="Siegel Sash",legs="Haven Hose"})

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


    sets.midcast['Mnd Enfeebles'] = {main="Lathi",sub={name="Mephitis Grip",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Leviathan Ring",ring2="Leviathan Ring",
        back=Taranus_Nuke,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body=Merl_body_Nuke})

    sets.midcast['Int Enfeebles'] = {main="Lathi",sub={name="Mephitis Grip",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Shiva Ring",ring2="Shiva Ring",
        back=Taranus_Nuke,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body=Merl_body_Nuke})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
	sets.midcast['Dark Magic'] = {main="Lathi",sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
		head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Perception Ring",ring2="Kishar Ring",
        back=Taranus_Nuke,waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Enchanter Earring +1",
        body=Merl_body_Nuke,hands=Merl_hands_FC,ring1="Evanescence Ring",ring2="Kishar Ring",
        back=Taranus_Nuke,waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
	
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {main="Lathi",sub={name="Enki Strap",priority=-1}})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
	
	sets.midcast.Aspir['Death'] = {
		main="Lathi",sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back=Bane_back,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Asp}
	
	sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main=Grioavolr_Enh})
	
	sets.midcast['Elemental Magic'] = {
		main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Dosis Tathlum",
        head=Merl_head_Burst,neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs=Merl_legs_Burst,feet=Merl_feet_Nuke}
		
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{ear2="Enchanter Earring +1",ring2="Kishar Ring",})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{ear2="Enchanter Earring +1",neck="Mizu. Kubikazari",ring2="Kishar Ring",ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{body="Spaekona's Coat"})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{ear2="Enchanter Earring +1",body="Spaekona's Coat",ring2="Kishar Ring",})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",body="Spaekona's Coat",ring2="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{ear2="Enchanter Earring +1",neck="Mizu. Kubikazari",body="Spaekona's Coat",ring2="Kishar Ring",ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{ring2="Weatherspoon Ring"})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{ear2="Enchanter Earring +1",ring2="Kishar Ring"})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{ring2="Weatherspoon Ring",ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{ear2="Enchanter Earring +1",neck="Mizu. Kubikazari",ring2="Kishar Ring",ring1="Mujin Band",feet=Merl_feet_Burst})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,ear2="Enchanter Earring +1",body="Twilight Cloak",ring2="Kishar Ring"})
	
	sets.midcast['Death'] = {
		main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Nuke,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2='Fenrir Ring',
        back=Taranus_Nuke,waist=gear.ElementalObi,legs=Merl_legs_Burst,feet=Merl_feet_Burst}
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle, {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},legs="Assiduity Pants +1",feet=Merl_feet_Refr})
    
    -- Normal refresh idle set
    sets.idle = {main="Lathi",sub={name="Giuoco Grip",priority=-1},ammo="Dosis Tathlum",
        head="Befouled Crown",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Witching_Robe,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
		
	sets.idle['Death'] = {main="Lathi",sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back=Bane_back,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Refr}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},ammo="Dosis Tathlum",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Lathi",sub={name="Giuoco Grip",priority=-1},ammo="Dosis Tathlum",
        head=Hagondes_head,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}
    
    -- -- Town gear.
    -- sets.idle.Town = {main="Lathi",sub={name="Giuoco Grip",priority=-1},ammo="Dosis Tathlum",
        -- head=Hagondes_head,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
        -- body=Hagondes_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        -- back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Lathi",sub={name="Irenic Strap +1",priority=-1},
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {}
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.CP = {back="Mecistopins Mantle"}
	sets.CPBurst = {back="Mecistopins Mantle",ring1="Locus Ring"}
	sets.Locked_Main_Sub = {main="Lathi",sub={name="Niobid Strap",priority=-1}}
	sets.Locked_Main_Sub.Death = {main="Lathi",sub={name="Niobid Strap",priority=-1}}
	sets.warp = {ring2='Warp Ring'}
	sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main="Lathi",sub={name="Giuoco Grip",priority=-1},
        neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
        hands="Gazu Bracelet +1",ring1="Patricius Ring",ring2="Rajas Ring",
        back="Bleating Mantle",waist="windbuffet Belt +1",legs=Telch_legs_TP,feet="Battlecast Gaiters"}
			
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
	
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
 