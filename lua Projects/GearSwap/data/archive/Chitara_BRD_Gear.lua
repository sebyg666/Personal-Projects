 
function init_gear_sets()
		
	print('Ewelina_BRD_Gear.lua sidecar loaded')  
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Kali_Macc			={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}
	
	Leyline_Gloves		={ name="Leyline Gloves", augments={'Accuracy+10','Mag. Acc.+7','"Fast Cast"+1',}}
	
	Gendewitha_hands	={ name="Gendewitha Gages", augments={'Phys. dmg. taken -1%','Song spellcasting time -4%',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +4',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +3',}}
	
	Telch_Feet_Macc		={ name="Telchine Pigaches", augments={'Mag. Acc.+22','"Fast Cast"+4','CHR+9',}}
	
	Telch_body_Pet		={ name="Telchine Chas.", augments={'Pet: "Regen"+2','Pet: Damage taken -1%',}}
	
    Telch_legs_TP		={ name="Telchine Braconi", augments={'Accuracy+11','"Dbl.Atk."+3','STR+7 AGI+7',}}
	
	Chironic_body		={ name="Chironic Doublet", augments={'Mag. Acc.+19','MND+3','"Mag.Atk.Bns."+15',}}
	
	Chironic_head_TP	={ name="Chironic Hat", augments={'Accuracy+20','"Dbl.Atk."+2','Attack+14',}}
	Chironic_hands_TP	={ name="Chironic Gloves", augments={'Accuracy+17','"Dbl.Atk."+1','STR+9','Attack+12',}}
	Chironic_legs_TP	={ name="Chironic Hose", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','STR+7',}}
	Chironic_feet_TP	={ name="Chironic Slippers", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','CHR+7','Accuracy+1',}}
	
	Chironic_legs_Macc	={ name="Chironic Hose", augments={'Mag. Acc.+25','"Fast Cast"+1','CHR+9','"Mag.Atk.Bns."+9',}}
	
	Chironic_hands_Refr	={ name="Chironic Gloves", augments={'Pet: Mag. Acc.+2','AGI+3','"Refresh"+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	Lustratio_head		={ name="Lustratio Cap", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}}
	Lustratio_hands		={ name="Lustratio Mittens", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}}
    Lustratio_feet		={ name="Lustratio Leggings", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}}
	
	Kaykaus_head		={ name="Kaykaus Mitra", augments={'MP+60','MND+10','Mag. Acc.+15',}}
    Kaykaus_legs		={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}}
	
	Relic_head			={ name="Bihu Roundlet +1", augments={'Enhances "Foe Sirvente" effect',}}
	Relic_body			={ name="Bihu Justaucorps +1", augments={'Enhances "Troubadour" effect',}}
	Relic_hands			={ name="Bihu Cuffs", augments={'Enh. "Adventurer\'s Dirge" effect',}}
	Relic_legs			={ name="Bihu Cannions", augments={'Enhances "Soul Voice" effect',}}
	Relic_feet			={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}}
	
	FC_back				={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {head={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +4',}},
					hands={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +3',}}
					}
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	}
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
	
    -- Precast Sets
	
	-- Precast sets to enhance JAs    	
	
    sets.precast.JA.Nightingale = {feet=Relic_feet}
    sets.precast.JA.Troubadour = {body=Relic_body}
    sets.precast.JA['Soul Voice'] = {legs=Relic_legs}

    -- Fast cast sets for spells
    sets.precast.FC = {
		main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},range='Gjallarhorn',
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Gendewitha_hands,ring1="Prolix Ring",ring2='Weatherspoon Ring',
		back=FC_back,waist="Witful belt",legs=Kaykaus_legs,feet=Telch_Feet_Macc}
		
		-- Staff = 					4% FC
		-- dagger =					7% FC		
		-- Clerisy Strap = 			2% FC
		-- Vanya Hood = 			10% FC
		-- Voltsurge Torque =		4% FC
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Inyanga Jubbah +1 = 		13% FC
		-- Gendewitha Gages = 		7% FC
		-- Prolix Ring = 			2% FC
		-- Weatherspoon Ring = 		5% FC
		-- FC_back =				10% FC
		-- Witful Belt = 			3% FC
		-- Kaykaus Tights = 		6% FC
		-- Telchine Pigaches = 		4% FC
		
		-- Total =					75~81% depending on spell element
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {range='Gjallarhorn',head="Fili Calot",ring1="Veneficium Ring",back="Ogapepo Cape"})
		
		-- Corresponding Staff = 	14% FC			-- Fili Calot 		=		-13% SScT
		-- Clerisy Strap = 			1% FC           
		-- Loquacious Earring = 	2% FC           
		-- Enchanter Earring +1 =	2% FC           -- Gendewitha Gages = 		-4% SScT augment
		-- Gendewitha Gages = 		7% FC           -- Gendewitha Spats +1 =	-5% SScT + 
													--							-4% SScT augment
		-- Witful Belt = 			3% FC           -- Telchine Pigaches =		-6% SScT
		-- Telchine Pigaches = 		5% FC           
		                                            -- Total =					-48% SScT
		-- Total =					36% FC 
		----------------------------------------------------------------------------------------
		-- Total + FC = 			84% 
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Ogapepo Cape",feet=Vanya_feet})
		
		-- Vanya Hood = 			10% FC		Apaisante			-10% CScT
		-- Loquacious Earring = 	2% FC       Genbu's Shield		-8% CScT
		-- Enchanter Earring +1 =	2% FC       Nefer Kalasiris =	-15% CScT
		-- Gendewitha Gages = 		7% FC       Kaykaus Tights = 	6% FC
		-- Prolix Ring = 			2% FC       					-5% CScT	
		-- Witful Belt = 			3% FC       Total = 				-48% CScT
		-- Telchine Pigaches = 		5% FC
		
		-- Total =					32% FC 
		---------------------------------------------------------------------------
		-- Total + FC =			80%
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ring1="Veneficium Ring",waist="Siegel Sash"})
	
		-- Siegel Sash = 		-8% EMcT
		-- Total + FC (55%) =	61~75% depending on spell element

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs",back="Ogapepo Cape"})
		
		-- else =					2% FC			Siegel Sash = 			8% EMcT
		-- Linos (fastCast) =		4% FC		    Carapacho Cuffs = 		15% SScT
		-- Clerisy Strap = 			1% FC           
		-- Vanya Hood = 			10% FC          Total = 				23% EMcT
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Inyanga Jubbah +1 = 		13% FC
		-- Prolix Ring = 			2% FC
		-- FC_back =				10% FC
		-- Kaykaus_legs = 			6% FC
		-- Telchine Pigaches = 		5% FC
		
		-- Total = 					48% FC
		-----------------------------------------------------------
		-- Total + FC =				71%

    sets.precast.FC.Daurdabla = {range=info.ExtraSongInstrument}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head=Chironic_head_TP,neck="Moepapa Medal",ear1="Ishvara Earring",ear2='Brutal Earring',
		body="Emet Harness",hands=Leyline_Gloves,ring1="Rajas Ring",ring2="Apate Ring",
		back="Bleating Mantle",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Chironic_feet_TP}
   
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = {
		head=Lustratio_head,neck="Moepapa Medal",ear1="Ishvara Earring",ear2='Brutal Earring',
		body="Emet Harness",hands=Lustratio_hands,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back="Kayapa Cape",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Lustratio_feet}

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Rudra's Storm"] = {
		head=Lustratio_head,neck="Moepapa Medal",ear1="Ishvara Earring",ear2='Brutal Earring',
		body="Emet Harness",hands=Lustratio_hands,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back="Kayapa Cape",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Lustratio_feet}

	sets.precast.WS['Mordant Rime'] = {
		head=Chironic_head_TP,neck="Nuna Gorget +1",ear1="Ishvara Earring",ear2='Brutal Earring',
		body="Emet Harness",hands=Leyline_Gloves,ring1="Carbuncle Ring",ring2="Carbuncle Ring",
		back="Bleating Mantle",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Chironic_feet_TP}
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {
		main="Grioavolr",sub={name="Clerisy Strap",priority = -1},
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Telch_hands_Enh,ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Witful Belt",legs=Kaykaus_legs,feet=Telch_Feet_Macc}
				
	sets.midcast['Enfeebling Magic'] = {
		main={name="Grioavolr",priority = 2},sub={name="Clerisy Strap",priority = 1},
		head="Inyanga Tiara +1",neck="Weike Torque",ear1="Hermetic Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands="Inyanga Dastanas +1",ring1="Vertigo Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Ovate Rope",legs=Chironic_legs_Macc,feet="Inyanga Crackows +1"}
				
	-- TH belt	
	-- sets.midcast['Dia'] = set_combine(sets.midcast['Enfeebling Magic'] ,{waist="Tarutaru sash"})
        
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
    sets.midcast['Foe Lullaby'] 		= {hands="Brioso Cuffs"}
	sets.midcast['Foe Lullaby II'] 		= {hands="Brioso Cuffs"}
	sets.midcast['Horde Lullaby'] 		= {hands="Brioso Cuffs"}
	sets.midcast['Horde Lullaby II'] 	= {hands="Brioso Cuffs"}
	sets.midcast["Sentinel's Scherzo"]	= {feet="Fili Cothurnes"}
	sets.midcast['Magic Finale'] 		= {}
	sets.midcast['Pinning Nocturne'] 	= {}
	sets.midcast.Ballad 				= {legs="Fili Rhingrave"}
	sets.midcast.Madrigal 				= {head="Fili Calot",back=FC_back}
	sets.midcast.March 					= {hands="Fili Manchettes"}
	sets.midcast.Minuet 				= {body="Fili Hongreline"}
	sets.midcast.Minne 					= {}
	sets.midcast.Elegy 					= {}
	sets.midcast.Etude 					= {legs="Inyanga Shalwar +1",feet="Brioso Slippers +1"}
	sets.midcast.Prelude 				= {back=FC_back}
	sets.midcast.Requiem 				= {}
	sets.midcast.Mambo 					= {}
	sets.midcast.Threnody 				= {}
	sets.midcast.Hymnus 				= {}
	sets.midcast.Mazurka 				= {}
	sets.midcast.Paeon					= {}
	sets.midcast.Virelai 				= {}
	sets.midcast.Carol 					= {head="Fili Calot",
											body="Fili Hongreline",hands="Fili Manchettes",
											legs="Fili Rhingrave",feet="Fili Cothurnes"}
    
     -- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffectLength = {
		main=Kali_Macc,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 1},
		head="Fili Calot",neck="Aoidos' Matinee",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +1",feet="Brioso Slippers +1"}
			
	sets.midcast.SongEffectFullAF = {
		main=Kali_Macc,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 1},
		head="Fili Calot",neck="Aoidos' Matinee",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Witful Belt",legs="Fili Rhingrave",feet="Fili Cothurnes"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		main=Kali_Macc,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 1},
		head=Relic_head,neck="Aoidos' Matinee",ear1="Hermetic Earring",ear2="Enchanter Earring +1",
		body="Fili Hongreline",hands=="Inyanga Dastanas +1",ring1="Carbuncle Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Ovate Rope",legs="Inyanga Shalwar +1",feet="Brioso Slippers +1"}
			
	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {
		main={name="Grioavolr",priority=2},sub={name="Clerisy Strap",priority=-1},range={name='Gjallarhorn',priority = 1},
		head=Relic_head,neck="Incanter's Torque",ear1="Hermetic Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands="Inyanga Dastanas +1",ring1="Carbuncle Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Ovate Rope",legs=Chironic_legs_Macc,feet="Inyanga Crackows +1"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		main="Grioavolr",sub={name="Clerisy Strap",priority=-1},range={name='Gjallarhorn',priority = 1},
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Leyline_Gloves,ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Witful Belt",legs="Fili Rhingrave",feet=Telch_Feet_Macc}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {
		main="Grioavolr",sub={name="Clerisy Strap",priority=-1},range=info.ExtraSongInstrument,
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +1",hands=Gendewitha_hands,ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back=FC_back,waist="Witful Belt",legs=Kaykaus_legs,feet=Telch_Feet_Macc}

    -- Other general spells and classes.
   sets.midcast.Cure = {
		main="Grioavolr",sub={name="Clerisy Strap",priority=-1},
		head=Kaykaus_head,neck="Henic Torque",ear1='Healing Earring',
		body=Chironic_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Solemnity Cape",waist="Bishop's Sash",legs=Kaykaus_legs,feet=Vanya_feet}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
        
    sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		main="Grioavolr",
		head=Kaykaus_head,neck="Henic Torque",ear1='Healing Earring',
		ring1="Ephedra Ring",ring2="Sirona's Ring",
		waist="Bishop's Sash"})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main="Grioavolr",sub={name="Fulcio Grip",priority=-1},
		head=Telch_head_Enh,
		body=Telch_body_Pet,hands=Telch_hands_Enh,
		waist="Olympus Sash"})
			
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})
        
    sets.midcast.Protect = {ring1="Sheltered Ring"}
 
	sets.midcast.Shell = {ring1="Sheltered Ring"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {
			main=gear.Staff.HMP,range="Oneiros Harp",
			legs="Assiduity Pants +1"})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
			main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range="Oneiros Harp",
			head="Inyanga Tiara +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Infused Earring",
			body="Inyanga Jubbah +1",hands=Chironic_hands_Refr,ring1="Sheltered Ring",ring2="Paguroidea Ring",
			back="Cheviot Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}
			
	sets.idle.PDT = {
			main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range="Gjallarhorn",
			head=Relic_head,neck="Twilight Torque",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs=Relic_legs,feet="Fili Cothurnes"}

	sets.idle.Town = {
			main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range="Gjallarhorn",
			head="Inyanga Tiara +1",neck="Weike Torque",ear1="Hermetic Earring",ear2="Enchanter Earring +1",
			body="Inyanga Jubbah +1",hands=Chironic_hands_Refr,ring1="Carbuncle Ring",ring2="Weatherspoon Ring",
			back=FC_back,waist="Ovate Rope",legs="Inyanga Shalwar +1",feet="Fili Cothurnes"}
   
	sets.idle.Weak = {
			main=gear.Staff.PDT,sub={name="Clerisy Strap",priority=-1},range="Gjallarhorn",
			head=Relic_head,neck="Twilight Torque",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}
   
   
	-- Defense sets

	sets.defense.PDT = {
			main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range="Gjallarhorn",
			head=Relic_head,neck="Twilight Torque",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs=Relic_legs,feet="Fili Cothurnes"}

	sets.defense.MDT = {
			main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range="Gjallarhorn",
			head="Inyanga Tiara +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
			body="Inyanga Jubbah +1",hands="Inyanga Dastanas +1",ring1="Sheltered Ring",ring2="Defending Ring",
			back="Solemnity Cape",waist="Flume Belt",legs="Inyanga Shalwar +1",feet="Fili Cothurnes"}

	sets.Kiting = {feet="Fili Cothurnes"}
	sets.CP = {back="Mecistopins Mantle"}
	sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
			main=Kali_Macc,sub={name="Culminus",priority=-1},
			head=Chironic_head_TP,neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
			body=Relic_body,hands=Chironic_hands_TP,ring1="Rajas Ring",ring2="Apate Ring",
			back="Bleating Mantle",waist="Sarissaphoroi Belt",legs=Telch_legs_TP,feet=Chironic_feet_TP}
			
	sets.engaged.acc = {
			main=Kali_Macc,sub={name="Culminus",priority=-1},
			head=Chironic_head_TP,neck="Clotharius Torque",ear1="Steelflash Earring",ear2='Brutal Earring',
			body=Relic_body,hands=Chironic_hands_TP,ring1="Ramuh Ring",ring2="Ramuh Ring",
			back="Kayapa Cape",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Chironic_feet_TP}
	
	sets.engaged.DW = {
			main=Kali_Macc,sub={name="Kali",priority=-1},
			head=Chironic_head_TP,neck="Asperity Necklace",ear1="Suppanomimi",ear2='Brutal Earring',
			body=Relic_body,hands=Chironic_hands_TP,ring1="Rajas Ring",ring2="Apate Ring",
			back="Bleating Mantle",waist="Sarissaphoroi Belt",legs=Telch_legs_TP,feet=Chironic_feet_TP}
			
	sets.engaged.DW.Acc = {
			main=Kali_Macc,sub={name="Kali",priority=-1},
			head=Chironic_head_TP,neck="Clotharius Torque",ear1="Steelflash Earring",ear2='Brutal Earring',
			body=Relic_body,hands=Chironic_hands_TP,ring1="Ramuh Ring",ring2="Ramuh Ring",
			back="Kayapa Cape",waist="Grunfeld Rope",legs=Chironic_legs_TP,feet=Chironic_feet_TP}
			
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.warp = {ring2='Warp Ring'}
		
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 8)
	
	send_command('bind @` input /ma "Chocobo Mazurka" <me>')
	send_command('bind F8 input /ws "Rudra\'s Storm" <t>')
	send_command('bind ^F8 input /ma "Mordant Rime" <t>')
	send_command('bind @F8 input /ma "Evisceration" <t>')
	
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind ^F10 input /ma "curaga" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind @F7 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'DNC' then		
		send_command('bind @F7 input /ja "Quick step" <stnpc>')
		send_command('bind F7 input /ja "Box step" <stnpc>')

		send_command('bind @F9 input /ja "Violent flourish" <stnpc>')
		send_command('bind F9 input /ja "Haste Samba" <me>')

		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		send_command('bind F10 input /ja "Healing Waltz" <stal>')
		send_command('bind F11 input /ja "Curing Waltz III" <stal>')
		
	end
end
 