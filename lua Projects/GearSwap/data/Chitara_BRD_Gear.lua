 
function init_gear_sets()
		
	print('Ewelina_BRD_Gear.lua sidecar loaded')  
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','Mag. Acc.+20','"Mag.Atk.Bns."+9','Magic Damage +9',}}
	Kali_Macc			={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}
	Serenity			={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	TP_Linos			={ name="Linos", augments={'Accuracy+13','"Dbl.Atk."+2','Quadruple Attack +3',}}
	
	Leyline_Gloves		={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}}
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}}
	
	Gendewitha_body		={ name="Gende. Bilaut +1", augments={'Phys. dmg. taken -4%','Song recast delay -1',}}
	Gendewitha_hands	={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
    Gendewitha_legs		={ name="Gendewitha Spats", augments={'Phys. dmg. taken -1%','Song spellcasting time -4%',}}
    Gendewitha_feet		={ name="Gende. Galoshes", augments={'Phys. dmg. taken -2%','Song spellcasting time -2%',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	Telch_body_Enh		={ name="Telchine Chas.", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Acc.+3','"Fast Cast"+3','Enh. Mag. eff. dur. +8',}}
	Telch_legs_Enh		={ name="Telchine Braconi", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +9',}}
	Telch_Feet_Enh		={ name="Telchine Pigaches", augments={'Mag. Acc.+22','"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}
	
    Telch_legs_TP		={ name="Telchine Braconi", augments={'Accuracy+11','"Dbl.Atk."+3','STR+7 AGI+7',}}
	
	Chironic_head_TP	={ name="Chironic Hat", augments={'Pet: Mag. Acc.+5','"Store TP"+7','Haste+1','Accuracy+11 Attack+11','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
	Chironic_hands_TP	={ name="Chironic Gloves", augments={'Attack+4','"Dbl.Atk."+3','Accuracy+15',}}
	Chironic_legs_TP	={ name="Chironic Hose", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','STR+7',}}
	Chironic_feet_TP	={ name="Chironic Slippers", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','CHR+7','Accuracy+1',}}
	
	Chironic_body_Macc	={ name="Chironic Doublet", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Resist Silence"+9','CHR+10','Mag. Acc.+15','"Mag.Atk.Bns."+9',}}
	Chironic_legs_Macc	={ name="Chironic Hose", augments={'Mag. Acc.+25','"Fast Cast"+1','CHR+9','"Mag.Atk.Bns."+9',}}
	
	Chironic_head_Refr	={ name="Chironic Hat", augments={'Accuracy+4 Attack+4','"Refresh"+2',}}
	Chironic_hands_Refr	={ name="Chironic Gloves", augments={'Pet: Mag. Acc.+2','AGI+3','"Refresh"+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	
	Chironic_head_TH	={ name="Chironic Hat", augments={'DEX+7','Pet: AGI+5','"Treasure Hunter"+1','Accuracy+14 Attack+14',}}
	Chironic_body_TH	={ name="Chironic Doublet", augments={'"Conserve MP"+3','Pet: Mag. Acc.+2','"Treasure Hunter"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
	Chironic_hands_TH	={ name="Chironic Gloves", augments={'"Fast Cast"+2','Attack+4','"Treasure Hunter"+1',}}
	
	Chironic_feet_FC	={ name="Chironic Slippers", augments={'"Fast Cast"+6','INT+2',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	Lustratio_head		={ name="Lustratio Cap", augments={'INT+30','STR+5','DEX+5',}}
    Lustratio_body		={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}}
    Lustratio_hands		={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_legs		={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet		={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
	
	Kaykaus_head		={ name="Kaykaus Mitra", augments={'MP+60','MND+10','Mag. Acc.+15',}}
    Kaykaus_legs		={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}}
	
	AF_head 			={ name="Brioso Roundlet +2" }
	AF_body				={ name="Brioso Justaucorps +2" }
	AF_hands 			={ name="Brioso Cuffs +2" }
	AF_legs 			={ name="Brioso Cannions +2" }
	AF_feet 			={ name="Brioso Slippers +3" }
	
	Relic_head			={ name="Bihu Roundlet +1", augments={'Enhances "Foe Sirvente" effect',}}
	Relic_body			={ name="Bihu Justaucorps +1", augments={'Enhances "Troubadour" effect',}}
	Relic_hands			={ name="Bihu Cuffs", augments={'Enh. "Adventurer\'s Dirge" effect',}}
	Relic_legs			={ name="Bihu Cannions", augments={'Enhances "Soul Voice" effect',}}
	Relic_feet			={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}}
	
	Empy_head 			={ name="Fili Calot" }
	Empy_body			={ name="Fili Hongreline +1" }
	Empy_hands			={ name="Fili Manchettes" }
	Empy_legs 			={ name="Fili Rhingrave" }
	Empy_feet 			={ name="Fili Cothurnes +1" }
	
	FC_back				={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	TP_back				={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	Rudras_back			={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	Evisceration_back	={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	Mordant_back		={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
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
		main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range={name='Gjallarhorn',priority = 16},
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Leyline_Gloves,ring1="Prolix Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful belt",legs=Kaykaus_legs,feet=Chironic_feet_FC}
		
		-- dagger =					7% FC		
		-- Vanya Hood = 			10% FC
		-- Voltsurge Torque =		4% FC
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Inyanga Jubbah +2 = 		13% FC
		-- Gendewitha Gages = 		7% FC
		-- Prolix Ring = 			2% FC
		-- Kishar Ring = 			4% FC
		-- FC_back =				10% FC
		-- Witful Belt = 			3% FC
		-- Kaykaus Tights = 		6% FC
		-- Chironic Slippers = 		6% FC
		
		-- Total =					76% FC
	
	sets.precast.FC.BardSong = {
		main=Kali_Macc,sub={name="Genbu's Shield",priority=-1},range={name='Gjallarhorn',priority = 16},
		head=Empy_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Gendewitha_hands,ring1="Veneficium Ring",ring2="Kishar Ring",
		back="Perimede Cape",waist="Witful belt",legs=Gendewitha_legs,feet=Telch_Feet_Enh}
		
		-- dagger =					7% FC		|	Fili Calot 		=	-13% SScT			|
		-- Voltsurge Torque =		4% FC		|                                           |
		-- Loquacious Earring = 	2% FC       |                                           |
		-- Enchanter Earring +1 =	2% FC       |                                           |
		-- Inyanga Jubbah +2 = 		13% FC		|                                           |
		-- Gendewitha Gages = 		7% FC		|	Gendewitha Gages = 	-4% SScT augment    |
		-- Kishar Ring = 			4% FC		|											|			
		-- Veneficium Ring = 					|											|			1% QC
		-- Perimede Cape = 						|											|			4% QC
		-- Witful Belt = 			3% FC       |											|			3% QC   
		-- Gendewitha Spats +1 =				|						-5% SScT +          |
		--										|						-4% SScT augment    |
		-- Telchine Pigaches = 		4% FC augm  |   Telchine Pigaches =	-6% SScT            |
		--                                      |                                           |
		-- Total =					46% FC 		|	Total =				-32% SScT			|	Total = 8% QC
		-------------------------------------------------------------------------------------------------------
		-- Total = 78% Cast Speed + 8% Quick Cast 
	
	sets.precast.FC.BardSong['Honor March'] = set_combine(sets.precast.FC.BardSong, {range={name='Marsyas',priority = 16},})
	
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=Serenity,back="Perimede Cape",legs="Doyen Pants",feet=Vanya_feet})
		
		-- Vanya Hood = 			10% FC		Apaisante			-10% CScT
		-- Loquacious Earring = 	2% FC       Genbu's Shield		-8% CScT
		-- Enchanter Earring +1 =	2% FC       
		-- Gendewitha Gages = 		7% FC       Kaykaus Tights = 	6% FC
		-- Prolix Ring = 			2% FC       					-5% CScT	
		-- Witful Belt = 			3% FC       Total = 			-48% CScT
		-- Telchine Pigaches = 		5% FC
		
		-- Total =					32% FC 
		---------------------------------------------------------------------------
		-- Total + FC =			80%
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ring1="Veneficium Ring",waist="Siegel Sash"})
	
		-- Siegel Sash = 		-8% EMcT
		-- Total + FC (55%) =	61~75% depending on spell element

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs",back="Perimede Cape",legs="Doyen Pants"})
		
		-- else =					2% FC			Siegel Sash = 			8% EMcT
		-- Linos (fastCast) =		4% FC		    Carapacho Cuffs = 		15% SScT
		-- Clerisy Strap = 			1% FC           
		-- Vanya Hood = 			10% FC          Total = 				23% EMcT
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Inyanga Jubbah +2 = 		13% FC
		-- Prolix Ring = 			2% FC
		-- FC_back =				10% FC
		-- Kaykaus_legs = 			6% FC
		-- Telchine Pigaches = 		5% FC
		
		-- Total = 					48% FC
		-----------------------------------------------------------
		-- Total + FC =				71%

    sets.precast.FC.Daurdabla = {range={name='Daurdabla',priority = 16},}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range=TP_Linos,
		head="Ayanmo Zucchetto +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Rajas Ring",ring2="Ilabrat Ring",
		back=Rudras_back,waist="Fotia Belt",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +2"}
   
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = {
		head=Lustratio_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands=Lustratio_hands,ring1="Ilabrat Ring",ring2="Ramuh Ring",
		back=Evisceration_back,waist="Fotia Belt",legs="Ayanmo Cosciales +1",feet=Lustratio_feet}

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{
		head=Lustratio_head,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands=Lustratio_hands,ring1="Ilabrat Ring",ring2="Ramuh Ring",
		back=Rudras_back,waist="Fotia Belt",legs=Lustratio_legs,feet=Lustratio_feet})

	sets.precast.WS['Mordant Rime'] = {range={name='Gjallarhorn',priority = 16},
		head="Highwing Helm",neck="Nuna Gorget +1",ear1="Mache Earring",ear2="Brutal Earring",
		body=Relic_body,hands="Ayanmo Manopolas +2",ring1="Carbuncle Ring",ring2="Carbuncle Ring",
		back=Mordant_back,waist="Grunfeld Rope",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +2"}
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {
		main="Grioavolr",sub={name="Clerisy Strap",priority = -1},
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Telch_hands_Enh,ring1="Prolix Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful Belt",legs=Kaykaus_legs,feet=Chironic_feet_FC}
				
	sets.midcast['Enfeebling Magic'] = {
		main={name="Grioavolr",priority = 15},sub={name="Clerisy Strap",priority = -1},
		head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
		body=Chironic_body_Macc,hands="Inyanga Dastanas +1",ring1="Vertigo Ring",ring2="Kishar Ring",
		back=FC_back,waist="Porous Rope",legs=Chironic_legs_Macc,feet=Mediums_Sabots}
		
	sets.midcast['Dia'] 	= set_combine(sets.midcast['Enfeebling Magic'], {head=Chironic_head_TH,body=Chironic_body_TH,hands=Chironic_hands_TH})	
				
	sets.midcast.SongRecast = {
		main="Grioavolr",sub={name="Clerisy Strap",priority=-1},range={name='Gjallarhorn',priority = 16},
		head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Leyline_Gloves,ring1="Prolix Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Chironic_feet_FC}
	
	sets.midcast['Buff'] 								= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=Empy_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}
	sets.midcast['Buff']['Paeon']	 					= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}
	sets.midcast['Buff']['Honor March']					= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Marsyas',priority = 16},
															head=Empy_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}												
	sets.midcast['Buff']['Extra Length']				= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=Empy_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Extra Length']['Paeon']		= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Extra Length']['Honor March']	= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Marsyas',priority = 16},
															head=Empy_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Etude']						= sets.midcast['Buff']['Extra Length']
	sets.midcast['Buff']['Extra Length']['Etude']		= sets.midcast['Buff']['Extra Length']
	sets.midcast['Debuff'] 								= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands="Inyanga Dastanas +1",ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs="Inyanga Shalwar +2",feet=AF_feet}								
	sets.midcast['Debuff'].Resistant					= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body=AF_body,hands="Inyanga Dastanas +1",ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs=AF_legs,feet=AF_feet}
	sets.midcast['Debuff']['F-Lullaby']  				= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=AF_hands,ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Debuff']['F-Lullaby'] .Resistant		= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body==AF_body,hands=AF_hands,ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs=AF_legs,feet=AF_feet}
	sets.midcast['Debuff']['H-Lullaby']  				= {main="Carnwenhan",sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16}, -- range={name='Nibiru Harp',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body=Empy_body,hands=AF_hands,ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs="Inyanga Shalwar +2",feet=AF_feet}	
	sets.midcast['Debuff']['H-Lullaby'] .Resistant		= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
															body=AF_body,hands=AF_hands,ring1="Carbuncle Ring",ring2="Carbuncle Ring",
															back=FC_back,waist="Porous Rope",legs=AF_legs,feet=AF_feet}
     
    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast['Dummy'] = {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Daurdabla',priority = 16},
							head=Vanya_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
							body=Gendewitha_hands,hands=Empy_hands,ring1="Prolix Ring",ring2="Kishar Ring",
							back=FC_back,waist="Witful Belt",legs=Kaykaus_legs,feet=Chironic_feet_FC,}
    -- Other general spells and classes.
   sets.midcast.Cure = {main=Serenity,sub={name="Clerisy Strap",priority=-1},
						head=Kaykaus_head,neck="Incanter's Torque",ear1='Healing Earring',ear2="Beatific Earring",
						body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
						back="Solemnity Cape",waist="Bishop's Sash",legs=Kaykaus_legs,feet=Vanya_feet}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Cure day / weather'] = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
        
    sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,
		head=Kaykaus_head,neck="Incanter's Torque",ear1='Healing Earring',
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

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {
			main=gear.Staff.HMP,range="Oneiros Harp",
			legs="Assiduity Pants +1"})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
			main="Sangoma",sub={name="Genbu's Shield",priority=-1},range={name='Oneiros Harp',priority = 16},
			head=Chironic_head_Refr,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Gendewitha_body,hands=Chironic_hands_Refr,ring1="Sheltered Ring",ring2="Paguroidea Ring",
			back="Cheviot Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Ayanmo Gambieras +2"}
			
	sets.idle.PDT = {
			main="Carnwenhan",sub={name="Genbu's Shield",priority=-1},range="Oneiros Harp",
			head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs=Relic_legs,feet=Empy_feet}
   
	sets.idle.Weak = {
			main=gear.Staff.PDT,sub={name="Clerisy Strap",priority=-1},range="Oneiros Harp",
			head="Genmei Kabuto",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet=Empy_feet}
   
   
	-- Defense sets

	sets.defense.PDT = {
			main="Carnwenhan",sub={name="Genbu's Shield",priority=-1},range="Oneiros Harp",
			head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
			body=Relic_body,hands=Relic_hands,ring1="Patricius Ring",ring2="Defending Ring",
			back="Cheviot Cape",waist="Flume Belt",legs=Relic_legs,feet=Empy_feet}

	sets.defense.MDT = {
			main=Grioavolr_Enh,sub={name="Irenic Strap +1",priority=-1},range="Oneiros Harp",
			head="Inyanga Tiara +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
			body="Inyanga Jubbah +2",hands="Inyanga Dastanas +1",ring1="Sheltered Ring",ring2="Defending Ring",
			back="Solemnity Cape",waist="Flume Belt",legs="Inyanga Shalwar +2",feet=Empy_feet}

	sets.Kiting = {feet=Empy_feet}
	sets.CP = {back="Mecistopins Mantle"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
			main="Carnwenhan",sub={name="Culminus",priority=-1},range=TP_Linos,
			head="Highwing Helm",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
			body="Ayanmo Corazza +2",hands=Chironic_hands_TP,ring1="Ilabrat Ring",ring2="Petrov Ring",
			back=TP_back,waist="Windbuffet Belt +1",legs="Jokushu Haidate",feet="Ayanmo Gambieras +2"}
			
	sets.engaged.Acc = {
			main=Carnwenhan_Macc,sub={name="Culminus",priority=-1},range=TP_Linos,
			head="Ayanmo Zucchetto +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Mache Earring",
			body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ilabrat Ring",ring2="Ramuh Ring",
			back=TP_back,waist="Windbuffet Belt +1",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +2"}
	
	sets.engaged.DW = {
			main="Taming Sari",sub={name="Carnwenhan",priority=-1},range=TP_Linos,
			head="Highwing Helm",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
			body="Ayanmo Corazza +2",hands=Chironic_hands_TP,ring1="Ilabrat Ring",ring2="Petrov Ring",
			back=TP_back,waist="Reiki Yotai",legs="Jokushu Haidate",feet="Ayanmo Gambieras +2"}
			
	sets.engaged.DW.Acc = {
			main="Taming Sari",sub={name="Carnwenhan",priority=-1},range=TP_Linos,
			head="Ayanmo Zucchetto +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Eabani Earring",
			body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ilabrat Ring",ring2="Ramuh Ring",
			back=TP_back,waist="Reiki Yotai",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +2"}
			
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.warp = {ring2='Warp Ring'}
	
	sets.Locked_Main_Sub = {main="Carnwenhan",sub={name="Culminus",priority=-1}}
	sets.Locked_Main_Sub_DW = {main="Taming Sari",sub={name="Carnwenhan",priority=-1}}
		
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
	
	elseif player.sub_job:upper() == 'SMN' then
		
		send_command('bind F10 input /ma "Cait Sith" <me>')
		send_command('bind F11 input /ma "Mewing Lullaby" <stnpc>')
		
	elseif player.sub_job:upper() == 'DNC' then		
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
	
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	end
end
 