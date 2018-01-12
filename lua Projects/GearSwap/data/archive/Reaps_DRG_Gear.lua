
function init_gear_sets()
	
	print('Reaps_DRG_Gear side_cart loaded')
	
	--------------------------------------
	-- Augmented Gear Defenition
	--------------------------------------
           
	physical_darkring1 = {name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -5%',}}
	physical_darkring2 = {name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -4%',}}
	physical_darkring3 = {name="Dark Ring", augments={'Breath dmg. taken -3%','Magic dmg. taken -3%','Spell interruption rate down -3%',}}
   
	--------------------------------------
    -- Precast sets
    --------------------------------------
   
	-- Precast sets to enhance JAs
	sets.precast.JA['Spirit Surge'] = {Body="Pteroslaver Mail"}
	sets.precast.JA['Call Wyvern'] = {Body="Pteroslaver Mail"}
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais"}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1", hands="Lancer vambraces +2",legs="Vishap Brais", feet="Pteroslaver greaves"}
	sets.precast.JA['Deep Breathing'] = {head="Pteroslaver Armet +1"}     
	sets.precast.JA['Angon'] = {ammo= "Angon", hands="Pteroslaver Finger Gauntlets +1"}  
	sets.precast.JA['Dragon Breaker'] = {}
	sets.precast.PetCommand = {}
	sets.precast.PetCommand['Smiting Breath'] = {head="Pteroslaver Armet +1",neck="Lancer's Torque",waist="Glassblower's Belt",legs="Pteroslaver brais"}
	sets.precast.PetCommand['Restoring Breath'] = {head="Pteroslaver Armet +1",neck="Lancer's Torque",hands="Buremte Gloves",back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap brais"}
	sets.precast.PetCommand['Steady Wing'] = {}
   
   -- Jump JA's
	sets.precast.JA['Jump'] 				= {Body="Vishap Mail +1", hands="Pteroslaver Finger Gauntlets +1", feet="Cizin Greaves"}
	sets.precast.JA['High Jump'] 			= {Body="Vishap Mail +1", legs="Pteroslaver Brais"}
	sets.precast.JA['Super Jump'] 			= {}
	sets.precast.JA['Spirit Jump'] 			= {legs="Lancer's Cuissots +2"}
	sets.precast.JA['Soul Jump'] 			= {legs="Lancer's Cuissots +2"}
	
	sets.precast.JA['Jump'].Acc 			= set_combine(sets.precast.JA['Jump'], {})
	sets.precast.JA['High Jump'].Acc 		= set_combine(sets.precast.JA['High Jump'], {})
	sets.precast.JA['Super Jump'].Acc 		= set_combine(sets.precast.JA['Super Jump'], {})
	sets.precast.JA['Spirit Jump'].Acc 		= set_combine(sets.precast.JA['Spirit Jump'], {})
	sets.precast.JA['Soul Jump'].Acc 		= set_combine(sets.precast.JA['Soul Jump'], {})
	
	sets.precast.JA['Jump'].Sam 			= set_combine(sets.precast.JA['Jump'], {})
	sets.precast.JA['High Jump'].Sam 		= set_combine(sets.precast.JA['High Jump'], {})
	sets.precast.JA['Super Jump'].Sam 		= set_combine(sets.precast.JA['Super Jump'], {})
	sets.precast.JA['Spirit Jump'].Sam 		= set_combine(sets.precast.JA['Spirit Jump'], {})
	sets.precast.JA['Soul Jump'].Sam 		= set_combine(sets.precast.JA['Soul Jump'], {})
	
	sets.precast.JA['Jump'].Sam.Acc 		= set_combine(sets.precast.JA['Jump'].Sam, {})
	sets.precast.JA['High Jump'].Sam.Acc 	= set_combine(sets.precast.JA['High Jump'].Sam, {})
	sets.precast.JA['Super Jump'].Sam.Acc 	= set_combine(sets.precast.JA['Super Jump'].Sam, {})
	sets.precast.JA['Spirit Jump'].Sam.Acc 	= set_combine(sets.precast.JA['Spirit Jump'].Sam, {})
	sets.precast.JA['Soul Jump'].Sam.Acc 	= set_combine(sets.precast.JA['Soul Jump'].Sam, {})

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ear1="Roundel Earring"}
		   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- TH for steps/flourishes
	sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}
	
	-- Fast cast sets for spells
   
	sets.precast.FC = {head="Cizin Helm",neck="Jeweled Collar",ear1="Loquacious Earring",ring1="Prolix ring",}

	sets.precast.FC.Utsusemi = {neck="Magoraga Beads"}
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {head="Pteroslaver Armet +1",hands="Buremte Gloves",ear1="Roundel Earring"})
   
   
   	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	-------------------------------------------------------------------------------------
	-- 	for a 492 delay weapon				 |	** With Ionis Save TP +10 **           |
	-------------------------------------------------------------------------------------
	-- 										 |                                         |
	-- 4 hit WS (Drakesbane / Stardiver)     |   			4 hit WS                   | 
	-- 5 hit to 1000% tp (after ws)          |    4 hit to 1000% tp (after ws)         | 
	-- STP in mellee  	//  	STP in WS    |    STP in mellee  	//  	STP in WS  | 
	-- 		27						0        |    		40						0      | 
	-- 		26						5        |    		38						5      | 
	-- 		25						10       |    		37						10     | 
	-- 		23						15       |    		35						15     | 
	------------------------------------------------------------------------------------- 
	-- 			1 hit WS                     | 	 			1 hit WS                   | 
	-- 5 hit to 1000% tp (after ws)          | 	 5 hit to 1000% tp (after ws)          | 
	-- STP in mellee  	//  	STP in WS    | 	 STP in mellee  	//  	STP in WS  | 
	-- 		31						0        | 	 		16						0      | 
	-- 		31						5        | 	 		16						5      | 
	-- 		29						10       | 	 		14						10     | 
	-- 		28						15       | 	 		13						15     | 
	-------------------------------------------------------------------------------------
	sets.precast.WS = {
		ammo="Thew Bomblet",
		head="Yaoyotl Helm",neck=gear.ElementalGorget,ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="Oneiros Ring",ring2="Rajas ring",
		back="Atheling Mantle",waist=gear.ElementalBelt,legs="Mikinaak Cuisses",feet="Ejekamal Boots"}
	sets.precast.WS.Acc 		= set_combine(sets.precast.WS, {})
	sets.precast.WS.Adoulin		= set_combine(sets.precast.WS, {})
	sets.precast.WS.Adoulin.Acc = set_combine(sets.precast.WS.Adoulin, {})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Drakesbane'] 					= set_combine(sets.precast.WS, {body="Cizin Mail +1",ring1="K'ayres Ring",legs="Xaddi Cuisses"})
	sets.precast.WS['Drakesbane'].Acc 				= set_combine(sets.precast.WS['Drakesbane'], {})
	sets.precast.WS['Drakesbane'].Adoulin 			= set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].Adoulin.Acc 		= set_combine(sets.precast.WS['Drakesbane'].Adoulin, {})	
	
	sets.precast.WS['Stardiver'] 					= set_combine(sets.precast.WS, {neck="Asperity Necklace",body="Cizin Mail +1",waist="Zoran's belt",legs="Cizin Breeches +1"})
	sets.precast.WS['Stardiver'].Acc 				= set_combine(sets.precast.WS['Stardiver'], {})
	sets.precast.WS['Stardiver'].Adoulin 			= set_combine(sets.precast.WS, {neck="Asperity Necklace",body="Cizin Mail +1",waist="Zoran's belt",legs="Cizin Breeches +1"})
	sets.precast.WS['Stardiver'].Adoulin.Acc 		= set_combine(sets.precast.WS['Stardiver'].Adoulin, {})
   
	sets.precast.WS['Sonic Thrust'] 				= set_combine(sets.precast.WS, {body="Cizin Mail +1"})
	sets.precast.WS['Sonic Thrust'].Acc 			= set_combine(sets.precast.WS['Sonic Thrust'], {})
	sets.precast.WS['Sonic Thrust'].Adoulin 		= set_combine(sets.precast.WS, {body="Cizin Mail +1"})
	sets.precast.WS['Sonic Thrust'].Adoulin.Acc 	= set_combine(sets.precast.WS['Sonic Thrust'].Adoulin, {})

	sets.precast.WS['Leg Sweep'] 					= set_combine(sets.precast.WS, {})
	sets.precast.WS['Leg Sweep'].Acc 				= set_combine(sets.precast.WS['Leg Sweep'], {})
	sets.precast.WS['Leg Sweep'].Adoulin 			= set_combine(sets.precast.WS, {})
	sets.precast.WS['Leg Sweep'].Adoulin.Acc 		= set_combine(sets.precast.WS['Leg Sweep'].Adoulin, {})
   
	sets.precast.WS['Skewer'] 						= set_combine(sets.precast.WS, {})
	sets.precast.WS['Skewer'].Acc 					= set_combine(sets.precast.WS['Skewer'], {})
	sets.precast.WS['Skewer'].Adoulin 				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Skewer'].Adoulin.Acc 			= set_combine(sets.precast.WS['Skewer'].Adoulin, {})
	-------------------------------------
	-- sub Samurai WS sets
	-------------------------------------
	
	-------------------------------
	-- Sub Samurai mellee Groups
	-------------------------------																	----------------------------------------
	-- for a 492 delay weapon	  |                                                                 --   ** with Ionis (save TP +10) **    |
	---------------------------------------------                                                   -- 		for a 492 delay weapon 		   |
	-- 4 hit WS (Drakesbane / Stardiver)        |                                                   ---------------------------------------|
	-- 4 hit to 1000% TP (after WS)             |                                                   -- 4 hit WS (Drakesbane / Stardiver)   |
	-- STP in mellee  	//  	STP in WS       |                                                   -- 4 hit to 1000% TP (after WS)        |
	-- 		39						0           |                                                   -- STP in mellee  	//  	STP in WS  |
	-- 		37						5           |                                                   -- 		20						0      |
	-- 		36						10          |                                                   -- 		19						5      |
	-- 		34						15          |                                                   -- 		17						10     |
	-----------------------------------------------------------------------------------------       -- 		16						15     |
	-- 			1 hit WS 						|				1 hit WS                   	|       ---------------------------------------|
	-- 4 hit to 1000% tp (after ws)             |    5 hit to 1000% tp (after ws)           |       -- 			1 hit WS 				   |
	-- STP in mellee  	//  	STP in WS       |    STP in mellee  	//  	STP in WS   |       -- 4 hit to 1000% tp (after ws)        |
	-- 		45						0           |    		13					0           |       -- STP in mellee  	//  	STP in WS  |
	-- 		44						5           |    		13					5           |       -- 		26						0      |
	-- 		43						10          |    		11					10          |       -- 		25						5      |
	-- 		41						15          |    		10					15          |       -- 		24						10     |
	-----------------------------------------------------------------------------------------       -- 		22						15     |
	sets.precast.WS.Sam 				= set_combine(sets.precast.WS, {})                                  ---------------------------------------|
	sets.precast.WS.Sam.Acc 			= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS.Adoulin.Sam 		= set_combine(sets.precast.WS, {})                                  ---------------------------------------|
	sets.precast.WS.Adoulin.Sam.Acc 	= set_combine(sets.precast.WS.Adoulin.Sam, {})
	
	sets.precast.WS['Drakesbane'].Sam 					= set_combine(sets.precast.WS.Sam, {body="Cizin Mail +1",ring1="K'ayres Ring",legs="Xaddi Cuisses"})
	sets.precast.WS['Drakesbane'].Sam.Acc 				= set_combine(sets.precast.WS['Drakesbane'].Sam, {})
	sets.precast.WS['Drakesbane'].Adoulin.Sam 			= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Drakesbane'].Adoulin.Sam.Acc 		= set_combine(sets.precast.WS['Drakesbane'].Adoulin.Sam, {})	
	
	sets.precast.WS['Stardiver'].Sam 					= set_combine(sets.precast.WS.Sam, {neck="Asperity Necklace",body="Cizin Mail +1",waist="Zoran's belt",legs="Cizin Breeches +1"})
	sets.precast.WS['Stardiver'].Sam.Acc 				= set_combine(sets.precast.WS['Stardiver'].Sam, {})
	sets.precast.WS['Stardiver'].Adoulin.Sam 			= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Stardiver'].Adoulin.Sam.Acc 		= set_combine(sets.precast.WS['Stardiver'].Adoulin.Sam, {})
   
	sets.precast.WS['Sonic Thrust'].Sam 				= set_combine(sets.precast.WS.Sam, {body="Cizin Mail +1"})
	sets.precast.WS['Sonic Thrust'].Sam.Acc 			= set_combine(sets.precast.WS['Sonic Thrust'].Sam, {})
	sets.precast.WS['Sonic Thrust'].Adoulin.Sam 		= set_combine(sets.precast.WS.Sam, {body="Cizin Mail +1"})
	sets.precast.WS['Sonic Thrust'].Adoulin.Sam.Acc 	= set_combine(sets.precast.WS['Sonic Thrust'].Adoulin.Sam, {})

	sets.precast.WS['Leg Sweep'].Sam 					= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Leg Sweep'].Sam.Acc 				= set_combine(sets.precast.WS['Leg Sweep'].Sam, {})
	sets.precast.WS['Leg Sweep'].Adoulin.Sam 			= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Leg Sweep'].Adoulin.Sam.Acc 		= set_combine(sets.precast.WS['Leg Sweep'].Adoulin.Sam, {})
   
	sets.precast.WS['Skewer'].Sam 						= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Skewer'].Sam.Acc 					= set_combine(sets.precast.WS['Skewer'].Sam, {})
	sets.precast.WS['Skewer'].Adoulin.Sam 				= set_combine(sets.precast.WS.Sam, {})
	sets.precast.WS['Skewer'].Adoulin.Sam.Acc 			= set_combine(sets.precast.WS['Skewer'].Adoulin.Sam, {})
   
   
   
    --------------------------------------
    -- Midcast sets
    --------------------------------------
   
	sets.midcast.FastRecast = {
		head="Cizin Helm",neck="Jeweled Collar",ear1="Loquacious Earring",
		ring1="Prolix ring",ring2=physical_darkring1}
			
	sets.precast.FC.Cure = set_combine(sets.midcast.FastRecast, {
		head="Pteroslaver Armet +1",ear1="Roundel Earring",
		hands="Buremte Gloves"})
		   
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
   
	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
   
	--------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

	sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
	sets.Refresh = {}
	
	sets.Regen = {head="Twilight Helm", ring1="Sheltered Ring", ring2="Paguroidea Ring"}
   
	sets.resting = {}
   
	sets.idle = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Cizin mufflers +1",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Cizin Breeches +1",feet="Ejekamal Boots"}

	sets.idle.Town = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Pteroslaver Finger Gauntlets +1",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Cizin Breeches +1",feet="Ejekamal Boots"}
			
	sets.idle.Weak = {}
   
	sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.idle.Refresh = set_combine(sets.idle, sets.Refresh)
	
	sets.idle.Regen = set_combine(sets.idle, sets.Regen)
	
	sets.Kiting = {legs="Blood Cuisses"}
   
	--------------------------------------
    -- Defense sets
    --------------------------------------
	
	sets.defense.PDT = {ammo="Hagneia Stone",
		head="Otomi Helm",neck="Twilight Torque",ear1="Colossus's Earring",
		body="Cizin Mail +1",hands="Cizin mufflers +1",ring1=physical_darkring1,ring2=physical_darkring2,
		back="Repulse Mantle",waist="Nierenschutz",legs="Cizin Breeches +1",feet="Cizin Greaves"}
			
	sets.defense.MDT = {ammo="Demonry Stone",
		head="Otomi Helm",neck="Twilight Torque",ear1="Merman's Earring",
		body="Cizin Mail +1",hands="Buremte Gloves",ring1= "Shadow Ring",ring2=physical_darkring2,
		waist="Nierenschutz",legs="Cizin Breeches +1",feet="Ejekamal Boots"}
			
	sets.defense.Reraise = {ammo="Iron Gobbet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Colossus's Earring",
		body="Twilight Mail",hands="Cizin mufflers +1",ring1=physical_darkring2,ring2=physical_darkring1,
		back="Shadow Mantle",waist="Nierenschutz",legs="Cizin Breeches +1",feet="Cizin Greaves"}

	--------------------------------------
    -- Engaged sets
    --------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	------------------------------------
	-- Normal melee group
	-------------------------------------------------------------------------------------
	-- 	for a 492 delay weapon				 |	** With Ionis Save TP +10 **           |
	-------------------------------------------------------------------------------------
	-- 										 |                                         |
	-- 4 hit WS (Drakesbane / Stardiver)     |   			4 hit WS                   | 
	-- 5 hit to 1000% tp (after ws)          |    4 hit to 1000% tp (after ws)         | 
	-- STP in mellee  	//  	STP in WS    |    STP in mellee  	//  	STP in WS  | 
	-- 		27						0        |    		40						0      | 
	-- 		26						5        |    		38						5      | 
	-- 		25						10       |    		37						10     | 
	-- 		23						15       |    		35						15     | 
	------------------------------------------------------------------------------------- 
	-- 			1 hit WS                     | 	 			1 hit WS                   | 
	-- 5 hit to 1000% tp (after ws)          | 	 5 hit to 1000% tp (after ws)          | 
	-- STP in mellee  	//  	STP in WS    | 	 STP in mellee  	//  	STP in WS  | 
	-- 		31						0        | 	 		16						0      | 
	-- 		31						5        | 	 		16						5      | 
	-- 		29						10       | 	 		14						10     | 
	-- 		28						15       | 	 		13						15     | 
	-------------------------------------------------------------------------------------
	sets.engaged = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Zoran's belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
   
	sets.engaged.Acc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Agasaya's Collar",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Kayapa Cape",waist="Dynamic Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}
				
	sets.engaged.Adoulin = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Zoran's belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
   
	sets.engaged.Adoulin.Acc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Agasaya's Collar",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Kayapa Cape",waist="Dynamic Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}		
	
	sets.engaged.PetPDT = {ammo="Hagneia Stone",
		head="Lancer's Mezail +2",neck="Twilight Torque",ear1="Colossus's Earring",ear2="Dragonkin Earring",
		body="Vishap Mail +1",hands="Pteroslaver Finger Gauntlets +1",ring1=physical_darkring1,ring2=physical_darkring2,
		back="Repulse Mantle",waist="Nierenschutz",legs="Pteroslaver brais",feet="Pteroslaver greaves"}
			
	sets.engaged.PetPDT.Acc	= set_combine(sets.engaged.PetPDT, {})
			
	sets.engaged.PetMDT = {ammo="Hagneia Stone",
		head="Lancer's Mezail +2",neck="Twilight Torque",ear1="Colossus's Earring",
		body="Vishap Mail +1",hands="Cizin mufflers +1",ring1=physical_darkring1,ring2=physical_darkring2,
		back="Repulse Mantle",waist="Nierenschutz",legs="Pteroslaver brais",feet="Pteroslaver greaves"}
			
	sets.engaged.PetMDT.Acc	= set_combine(sets.engaged.PetMDT, {})
	
	sets.engaged.PetREGEN = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Twilight Torque",ear1="Colossus's Earring", ear2="Dragonkin Earring",
		body="Vishap Mail +1",hands="Pteroslaver Finger Gauntlets +1",ring1=physical_darkring1,ring2=physical_darkring2,
		back="Repulse Mantle",waist="Nierenschutz",legs="Pteroslaver brais",feet="Pteroslaver greaves"}
			
	sets.engaged.PetREGEN.Acc	= set_combine(sets.engaged.PetREGEN, {})
	
	-------------------------------
	-- Sub Samurai mellee Groups
	-------------------------------
	-- for a 492 delay weapon	  |
	---------------------------------------------
	-- 4 hit WS (Drakesbane / Stardiver)        |                                         
	-- 4 hit to 1000% TP (after WS)             |                                         
	-- STP in mellee  	//  	STP in WS       |                                         
	-- 		39						0           |                                         
	-- 		37						5           |                                         
	-- 		36						10          |                                         
	-- 		34						15          |                                         
	-----------------------------------------------------------------------------------------
	-- 			1 hit WS 						|				1 hit WS                   	|
	-- 4 hit to 1000% tp (after ws)             |    5 hit to 1000% tp (after ws)           | 
	-- STP in mellee  	//  	STP in WS       |    STP in mellee  	//  	STP in WS   | 
	-- 		45						0           |    		13					0           | 
	-- 		44						5           |    		13					5           | 
	-- 		43						10          |    		11					10          | 
	-- 		41						15          |    		10					15          | 
	-----------------------------------------------------------------------------------------
			
	sets.engaged.Sam = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Zoran's belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
   
	sets.engaged.Acc.Sam = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Agasaya's Collar",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Kayapa Cape",waist="Dynamic Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}
	
	----------------------------------------
	--   ** with Ionis (save TP +10) **    |
	-- 		for a 492 delay weapon 		   |
    ---------------------------------------|
	-- 4 hit WS (Drakesbane / Stardiver)   |
	-- 4 hit to 1000% TP (after WS)        |
	-- STP in mellee  	//  	STP in WS  |
	-- 		20						0      |
	-- 		19						5      |
	-- 		17						10     |
	-- 		16						15     |
	---------------------------------------|
	-- 			1 hit WS 				   |
	-- 4 hit to 1000% tp (after ws)        |      
	-- STP in mellee  	//  	STP in WS  |      
	-- 		26						0      |      
	-- 		25						5      |      
	-- 		24						10     |      
	-- 		22						15     |      
	---------------------------------------|	
		
	sets.engaged.Adoulin.Sam = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Cizin Mail +1",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Zoran's belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
   
	sets.engaged.Adoulin.Acc.Sam = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Agasaya's Collar",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Kayapa Cape",waist="Dynamic Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}
			
	

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	
	sets.ExtraDlbAtt  = {ring1="Oneiros Ring"}
	
	sets.buff.Doom = set_combine(sets.Reraise, {ring1="Saida Ring"})
	sets.buff.Sleep = {neck="Berserker's torque",ring1="Nesanica Ring"}

			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 