
function init_gear_sets()
	
	print('Theous_BLU_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------		
	
	Colada_one	={ name="Colada", 									augments={'Weapon skill damage +3%','DEX+4','Accuracy+25','Attack+13','DMG:+20',}}
    Colada_two	={ name="Colada", 									augments={'"Dbl.Atk."+1','STR+15','Accuracy+13','Attack+3','DMG:+16',}}
	
    Psycloth_legs	={ name="Psycloth Lappas", 				augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Amalric_head		={ name="Amalric Coif", 					augments={'INT+10','Elem. magic skill +15','Dark magic skill +15',}}
	Amalric_hands		={ name="Amalric Gages", 				augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs			={ name="Amalric Slops", 				augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	
	Adhemar_head_Acc	={ name="Adhemar Bonnet", 		augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body_Acc	={ name="Adhemar Jacket", 		augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands_Acc	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Rawhide_head	={ name="Rawhide Mask", 					augments={'HP+50','Accuracy+15','Evasion+20',}}
	Rawhide_body	={ name="Rawhide Vest", 					augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	
	Herculean_legs_WS	={ name="Herculean Trousers", 	augments={'Accuracy+25 Attack+25','Weapon skill damage +1%','DEX+10','Attack+4',}}
	Herculean_legs_TA	={ name="Herculean Trousers",	augments={'"Triple Atk."+4','DEX+9','Attack+11',}}
	Herculean_feet		={ name="Herculean Boots", 			augments={'Attack+20','"Dual Wield"+4','Accuracy+7',}}
	
	Corn_back		={ name="Cornflower Cape", 				augments={'MP+25','Accuracy+1','Blue Magic skill +9',}}
	TP_back			={ name="Rosmerta's Cape" }
	CP_back			={ name="Mecisto. Mantle", 				augments={'Cap. Point+50%','AGI+1','Rng.Acc.+2','DEF+10',}}
	
	
	AF_head 				={ name="Assimilator's Keffiyeh" }
	AF_body				={ name="Assimilator's Jubbah +1" }
	AF_hands 			={ name="Assimilator's Bazubands +1" }
	AF_legs 				={ name="Assimilator's Shalwar +1" }
	AF_feet 				={ name="Assimilator's Charuqs +2" }
		
	Relic_head			={ name="Luhlaza Keffiyeh +1", 		augments={'Enhances "Convergence" effect',}}
	Relic_body			={ name="Luhlaza Jubbah +1", 		augments={'Enhances "Enchainment" effect',}}
    Relic_hands			={ name="Luhlaza Bazubands", 		augments={'Enhances "Azure Lore" effect',}}
	Relic_legs				={ name="Luhlaza Shalwar", 			augments={'Enhances "Assimilation" effect',}}
	Relic_feet				={ name="Luhlaza Charuqs +1", 		augments={'Enhances "Diffusion" effect',}}
		
	Empy_head 			={ name="Hashishin Kavuk +1" }
	Empy_body			={ name="Hashishin Mintan" }
	Empy_hands			={ name="Hashishin Bazubands" }
	Empy_legs 			={ name="Hashishin Tayt +1" }
	Empy_feet 			={ name="Hashishin Basmak +1" }
	
	Moonshade_Ear	={ name="Moonshade Earring", 		augments={'Attack+4','TP Bonus +25',}}
	
	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------
	gear.default.obi_waist = "Eschan Stone"
	
	gear.TP_Bonus_Ear = {name="Mache Earring"} -- Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	

    sets.buff['Burst Affinity'] = {legs=AF_legs,feet=Empy_feet}
    sets.buff['Chain Affinity'] = {head=Empy_head,feet=AF_feet}
    sets.buff.Convergence = {head=Relic_head}
    sets.buff.Diffusion = {feet=Relic_feet}
    sets.buff.Enchainment = {body=Relic_body}
    sets.buff.Efflux = {back=TP_back,legs=Empy_legs}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands=Relic_hands}
	
	sets.precast.JA['Provoke'] = {ammo="Sapience Orb",
		neck="Unmoving Collar +1",ear1="Friomisi Earring",
		body="Emet Harness +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Obatala Subligar"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
								
    sets.precast.FC = {ammo="Impatiens",
			head=Amalric_head,neck="Stoicheion Medal",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body="",hands="",ring1="Kishar Ring",ring2="Weather. Ring",
			back="Swith Cape",waist="Witful Belt",legs=Psycloth_legs,feet="Chelona Boots"}
			
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=Empy_body})
	
	sets.precast.FC['Blue Magic'].Healing = set_combine(sets.precast.FC['Blue Magic'], {ear2="Mendicant's Earring"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {	
																				ammo="Jukukik feather",
																				head=Rawhide_head,neck="Kubira Beads", ear1="Ishvara Earring", ear2="Mache earring",
																				body=Rawhide_body,hands=Adhemar_hands_Acc,ring1="Apate ring",ring2="Rajas ring",
																				back="Bleating mantle",waist="Light Belt",legs=Herculean_legs_WS,feet="Thereoid greaves"}
	sets.precast.WS['Ilvl~118'] 									= set_combine(sets.precast.WS, 												{})
	sets.precast.WS['Ilvl~122'] 									= set_combine(sets.precast.WS['Ilvl~118'], 								{})
	sets.precast.WS['Ilvl~124+'] 								= set_combine(sets.precast.WS['Ilvl~122'], 								{})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']								= set_combine(sets.precast.WS, 												{})
	sets.precast.WS['Ilvl~118']['Requiescat'] 				= set_combine(sets.precast.WS['Requiescat'] , 						{})
	sets.precast.WS['Ilvl~122']['Requiescat']				= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , 		{})
	sets.precast.WS['Ilvl~124+']['Requiescat']			= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , 		{})
	
    sets.precast.WS['Sanguine Blade'] 						= set_combine(sets.precast.WS, 												{})
	sets.precast.WS['Ilvl~118']['Sanguine Blade'] 		= set_combine(sets.precast.WS['Sanguine Blade'], 					{})
	sets.precast.WS['Ilvl~122']['Sanguine Blade']		= set_combine(sets.precast.WS['Ilvl~118']['Sanguine Blade'], 	{})
	sets.precast.WS['Ilvl~124+']['Sanguine Blade']		= set_combine(sets.precast.WS['Ilvl~122']['Sanguine Blade'], 	{})
	
	sets.precast.WS['Chant du Cygne'] 						= set_combine(sets.precast.WS, {
																				ammo="Jukukik feather",
																				head=Rawhide_head,neck="Kubira Beads", ear1="Ishvara Earring", ear2="Mache earring",
																				body=Rawhide_body,hands=Adhemar_hands_Acc,ring1="Apate ring",ring2="Rajas ring",
																				back="Bleating mantle",waist="Light Belt",legs=Herculean_legs_WS,feet="Thereoid greaves"})
	sets.precast.WS['Ilvl~118']['Chant du Cygne']		= set_combine(sets.precast.WS['Chant du Cygne'], 					{})
	sets.precast.WS['Ilvl~122']['Chant du Cygne'] 		= set_combine(sets.precast.WS['Ilvl~118']['Chant du Cygne'], 	{})
	sets.precast.WS['Ilvl~124+']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~122']['Chant du Cygne'], 	{})
	
	sets.precast.WS['Savage Blade']  							= set_combine(sets.precast.WS, 												{})
	sets.precast.WS['Ilvl~118']['Savage Blade']  			= set_combine(sets.precast.WS['Savage Blade'] , 					{})
	sets.precast.WS['Ilvl~122']['Savage Blade'] 			= set_combine(sets.precast.WS['Ilvl~118']['Savage Blade'] ,		{})
	sets.precast.WS['Ilvl~124+']['Savage Blade']  		= set_combine(sets.precast.WS['Ilvl~122']['Savage Blade'] , 	{})
	
	sets.precast.WS['Expiacion']  								= set_combine(sets.precast.WS, 												{})
	sets.precast.WS['Ilvl~118']['Expiacion']  				= set_combine(sets.precast.WS['Expiacion'] , 							{})
	sets.precast.WS['Ilvl~122']['Expiacion']					= set_combine(sets.precast.WS['Ilvl~118']['Expiacion'] , 			{})
	sets.precast.WS['Ilvl~124+']['Expiacion']  			= set_combine(sets.precast.WS['Ilvl~122']['Expiacion'] , 			{})
	
	sets.precast.WS['Vorpal Blade']  							= set_combine(sets.precast.WS,			 									{})
	sets.precast.WS['Ilvl~118']['Vorpal Blade'] 			= set_combine(sets.precast.WS['Vorpal Blade'], 						{})
	sets.precast.WS['Ilvl~122']['Vorpal Blade'] 			= set_combine(sets.precast.WS['Ilvl~118']['Vorpal Blade'], 		{})
	sets.precast.WS['Ilvl~124+']['Vorpal Blade'] 			= set_combine(sets.precast.WS['Ilvl~122']['Vorpal Blade'], 		{})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Impatiens",
			head=Amalric_head,neck="Stoicheion Medal",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Kishar Ring",ring2="Weather. Ring",
			back="Swith Cape",waist="Witful Belt",legs=Psycloth_legs,feet="Chelona Boots"}
			
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {head=Carmine_head_HQ,waist="Olympus Sash",legs=Carmine_legs_HQ})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})
	
	sets.midcast["Flash"] = set_combine(sets.precast.JA['Provoke'], sets.midcast.FastRecast, {})
        
		
    sets.midcast['Blue Magic'] = {ammo="Ghastly tathlum +1",
			head="Jhakri coronal",neck="Stoicheion Medal",ear1="Regal Earring",ear2="Friomisi earring",
			body="Jhakri robe +1",hands=Amalric_hands,ring1="Jhakri ring",ring2="Shiva Ring +1",
			back=Corn_back,waist="Hachirin-no-Obi",legs=Amalric_legs,feet="Jhakri pigaches +1"}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = sets.precast.WS

    sets.midcast['Blue Magic'].PhysicalAcc = sets.precast.WS['Ilvl~124+']

    sets.midcast['Blue Magic'].PhysicalStr = sets.precast.WS['Savage Blade']

    sets.midcast['Blue Magic'].PhysicalDex = sets.precast.WS['Chant du Cygne']

    sets.midcast['Blue Magic'].PhysicalVit = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalAgi = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalInt = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalMnd = sets.precast.WS['Requiescat']

    sets.midcast['Blue Magic'].PhysicalChr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalHP = sets.midcast['Blue Magic'].Physical


    -- Magical Spells --	
	
    sets.midcast['Blue Magic'].Magical 						= set_combine(sets.midcast['Blue Magic'], 			{})
    sets.midcast['Blue Magic'].Magical.Resistant 			= set_combine(sets.midcast['Blue Magic'].Magical,	{})
	
	sets.midcast['Blue Magic']['Tenebral Crush'] 			= set_combine(sets.midcast['Blue Magic'], 			{})
	sets.midcast['Blue Magic']['Tenebral Crush'].Resistant 	= set_combine(sets.midcast['Blue Magic'].Magical, 	{})
     
    sets.midcast['Blue Magic'].MagicalMnd					= set_combine(sets.midcast['Blue Magic'].Magical,			{})
	sets.midcast['Blue Magic'].MagicalMnd.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})
	
    sets.midcast['Blue Magic'].MagicalChr 					= set_combine(sets.midcast['Blue Magic'].Magical,			{})
	sets.midcast['Blue Magic'].MagicalChr.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})
	
    sets.midcast['Blue Magic'].MagicalVit 					= set_combine(sets.midcast['Blue Magic'].Magical,			{})
	sets.midcast['Blue Magic'].MagicalVit.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})
	
    sets.midcast['Blue Magic'].MagicalDex 					= set_combine(sets.midcast['Blue Magic'].Magical,			{})
	sets.midcast['Blue Magic'].MagicalDex.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})
	
    sets.midcast['Blue Magic'].MagicAccuracy 				= set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = sets.midcast['Blue Magic'].Magical

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun 			=  set_combine(sets.midcast['Blue Magic'].Magical.Resistant,	{})

    sets.midcast['Blue Magic'].Healing 			= set_combine(sets.midcast['Blue Magic'], 						{})
		
	sets.midcast['Blue Magic']['White Wind'] 	= set_combine(sets.midcast['Blue Magic'], 						{})

    sets.midcast['Blue Magic'].SkillBasedBuff 	= set_combine(sets.midcast['Blue Magic'], 						{})

    sets.midcast['Blue Magic'].Buff 			= set_combine(sets.midcast['Blue Magic'], 						{})
	
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'], 						{})
	
	sets.midcast['Blue Magic']['Tourbillion'] 	= set_combine(sets.midcast['Blue Magic'], 						{})
	    
    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = {ring2="Sheltered Ring"}
    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = {ring2="Sheltered Ring"}
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {ammo="Ginsen",
		head=Rawhide_head,neck="Bathy Choker", ear1="Brutal earring", ear2="Infused Earring",
		body="Jhakri robe +1",hands=Adhemar_hands_Acc,ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Bleating mantle",waist="Fucho-no-obi",legs=Herculean_legs_TA,feet="Serpentes sabots"}
    
    -- Idle sets
    sets.idle = {ammo="Ginsen",
		head=Rawhide_head,neck="Bathy Choker", ear1="Brutal earring", ear2="Infused Earring",
		body="Jhakri robe +1",hands=Adhemar_hands_Acc,ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Bleating mantle",waist="Fucho-no-obi",legs=Herculean_legs_TA,feet="Serpentes sabots"}
	
	sets.idle.Refresh = {ammo="Ginsen",
		head=Rawhide_head,neck="Bathy Choker", ear1="Brutal earring", ear2="Infused Earring",
		body="Jhakri robe +1",hands=Adhemar_hands_Acc,ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Bleating mantle",waist="Fucho-no-obi",legs=Herculean_legs_TA,feet="Serpentes sabots"}
	
    sets.idle.PDT = {ammo="Staunch Tathlum",
		head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
		body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}

	sets.idle.Weak = {ammo="Staunch Tathlum",
		head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
		body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
		head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
		body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}

    sets.defense.MDT = {ammo="Staunch Tathlum",
		head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
		body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}
	
	sets.defense.MDTNoShell = {ammo="Staunch Tathlum",
		head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
		body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
		back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}

    sets.Kiting = {}

    --------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
    -- sets.engaged['SAM'][state.CombatWeapon]['Ilvl~118'].DT['H: 820']['Mythic AM3']
	
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	--------------------------------------------			
	-- standard sets that need to be created in order for future sets to work             
	--------------------------------------------
	
	sets.engaged 					= {ammo="Ginsen",
									head=Adhemar_head_Acc,neck="Subtlety Spec.", ear1="Brutal earring", ear2="Suppanomimi",
									body=Rawhide_body,hands=Adhemar_hands_Acc,ring1="Apate ring",ring2="Rajas ring",
									back="Bleating mantle",waist="Windbuffet belt +1",legs=Herculean_legs_TA,feet=Herculean_feet}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{})
	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{})
	
	sets.engaged.DT 				= {ammo="Staunch Tathlum",
									head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
									body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
									back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}
	sets.engaged['Ilvl~118'].DT		= set_combine(sets.engaged.DT, 				{})
	sets.engaged['Ilvl~122'].DT		= set_combine(sets.engaged['Ilvl~118'].DT, 	{})
	sets.engaged['Ilvl~124+'].DT 	= set_combine(sets.engaged['Ilvl~122'].DT, 	{})
	
	sets.engaged.DW 				= {ammo="Ginsen",
									head=Adhemar_head_Acc,neck="Subtlety Spec.", ear1="Brutal earring", ear2="Suppanomimi",
									body=Rawhide_body,hands=Adhemar_hands_Acc,ring1="Apate ring",ring2="Rajas ring",
									back="Bleating mantle",waist="Windbuffet belt +1",legs=Herculean_legs_TA,feet=Herculean_feet}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{})
	
	sets.engaged.DW.DT 				= {ammo="Staunch Tathlum",
									head=Rawhide_head,neck="Veisa Collar", ear1="Infused Earring", ear2="Arete del Luna",
									body="Ayanmo Corazza",hands="Ayanmo manopolas +1",ring1="Ayanmo Ring",ring2="Defending ring",
									back="Moonbeam Cape",waist="Flume belt +1",legs="Aya. Cosciales +1",feet=Herculean_feet}
	sets.engaged.DW['Ilvl~118'].DT		= set_combine(sets.engaged.DW.DT, 				{})
	sets.engaged.DW['Ilvl~122'].DT		= set_combine(sets.engaged.DW['Ilvl~118'].DT, 	{})
	sets.engaged.DW['Ilvl~124+'].DT 	= set_combine(sets.engaged.DW['Ilvl~122'].DT, 	{})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~38+% DW)-             
	--------------------------------------------	

	sets.engaged.DW['DW: 37+'] 					= set_combine(sets.engaged.DW, 							{})
	sets.engaged.DW['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged.DW['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 37+'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 37+'], 	{})
	
	sets.engaged.DW.DT['DW: 37+'] 					= set_combine(sets.engaged.DW.DT, 							{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 37+']		= set_combine(sets.engaged.DW.DT['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~122'].DT['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 37+'], 	{})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 37+'], 	{})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~36% DW)-             
	--------------------------------------------            
	
	sets.engaged.DW['DW: 22-36'] 				= set_combine(sets.engaged.DW['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged.DW['DW: 22-36'], 			{})
	sets.engaged.DW['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 22-36'], {})
	sets.engaged.DW['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 22-36'], {})
	
	sets.engaged.DW.DT['DW: 22-36'] 				= set_combine(sets.engaged.DW.DT['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 22-36'] 	= set_combine(sets.engaged.DW.DT['DW: 22-36'], 				{})
	sets.engaged.DW['Ilvl~122'].DT['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 22-36'], 	{})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 22-36'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste (~21% DW)-              
	--------------------------------------------            
	
	sets.engaged.DW['DW: 12-21']				= set_combine(sets.engaged.DW['DW: 22-36'], 			{})
	sets.engaged.DW['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged.DW['DW: 12-21'], 			{})
	sets.engaged.DW['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 12-21'], {})
	sets.engaged.DW['Ilvl~124+']['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 12-21'], {})
	
	sets.engaged.DW.DT['DW: 12-21']					= set_combine(sets.engaged.DW.DT['DW: 22-36'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 12-21']  	= set_combine(sets.engaged.DW.DT['DW: 12-21'], 				{})
	sets.engaged.DW['Ilvl~122'].DT['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 12-21'], 	{})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 12-21'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (5-11% DW)               
	---------------------------------------------           
	
	sets.engaged.DW['DW: 6-11'] 				= set_combine(sets.engaged.DW['DW: 12-21'], 			{})
	sets.engaged.DW['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged.DW['DW: 6-11'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 6-11'],	{})
	sets.engaged.DW['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 6-11'], 	{})
	
	sets.engaged.DW.DT['DW: 6-11'] 					= set_combine(sets.engaged.DW.DT['DW: 12-21'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 6-11'] 		= set_combine(sets.engaged.DW.DT['DW: 6-11'], 				{})
	sets.engaged.DW['Ilvl~122'].DT['DW: 6-11'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 6-11'],	{})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 6-11'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (0% DW)            
	-----------------------------------------           

	sets.engaged.DW['DW: 5-0'] 					= set_combine(sets.engaged.DW['DW: 6-11'],				{})
	sets.engaged.DW['Ilvl~118']['DW: 5-0'] 		= set_combine(sets.engaged.DW['DW: 5-0'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 5-0'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 5-0'], 	{})
	
	sets.engaged.DW.DT['DW: 5-0'] 					= set_combine(sets.engaged.DW.DT['DW: 6-11'],				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 5-0'] 		= set_combine(sets.engaged.DW.DT['DW: 5-0'], 				{})
	sets.engaged.DW['Ilvl~122'].DT['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 5-0'], 	{})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 5-0'], 	{})

	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing,{waist="Gishdubar Sash"})
	
	sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back=CP_back}
	sets.Learning = {hands=AF_hands}
	sets.warp = {ring2='Warp Ring'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
	-- Default macro set/book
	set_macro_page(6, 20)
	
	-- send_command('bind ^` input /ja "Chain Affinity" <me>')
    -- send_command('bind !` input /ja "Occultation" <me>')
    -- send_command('bind @` input /ja "Burst Affinity" <me>')
	
	send_command('bind F8 input /ws "Chant Du Cygne" <t>')
	send_command('bind ^F8 input /ws "Requiescat" <t>')
	send_command('bind @F8 input /ws "Savage Blade" <t>')
	
	if player.sub_job:upper() == 'DNC' then
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind @F7 input /ja "Box step" <stnpc>')
		send_command('bind ^F7 input /ja "Quick step" <stnpc>')
		
		send_command('bind F9 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Animated flourish" <stnpc>')
		send_command('bind @F9 input /ja "Haste Samba" <me>')
		
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		send_command('bind F10 input /ja "Healing Waltz" <me>')
		send_command('bind F11 input /ja "Curing Waltz III" <stal>')
		
		--send_command('bind ^` input /ja "Spectral jig" <me>')
	elseif player.sub_job:upper() == 'RDM' then		
		send_command('bind ^` input /ma "Occultation" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		send_command('bind @` input /ja "Aquaveil" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind ^F7 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'WAR' then		
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <stal>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		send_command('bind @F10 input /ma "Battery Charge" <me>')
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind F9 input /ma "provoke" <stnpc>')
		send_command('bind ^F9 input /ma "Glutinous dart" <stnpc>')
		
	elseif player.sub_job:upper() == 'BLM' then		
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <stal>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		send_command('bind @F10 input /ma "Battery Charge" <me>')
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind F9 input /ma "stun" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	elseif player.sub_job:upper() == 'RUN' then	
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F9 input /ma "Flash" <stnpc>')
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <me>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		
	end
   
end
