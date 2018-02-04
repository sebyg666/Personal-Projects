function init_gear_sets()

	print('Laubent_BLU_Gear side_cart loaded')	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	
	organizer_items = {}
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	
	Herc_head_TP 	={ name="Herculean Helm", augments={'Accuracy+25','"Triple Atk."+3','STR+5','Attack+4',}}
	Herc_hands_TP 	={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','"Triple Atk."+1','DEX+8','Accuracy+9',}}
	Herc_feet_TP 	={ name="Herculean Boots", augments={'Accuracy+24','"Triple Atk."+4','STR+5','Attack+5',}}
	Herc_body_TP    ={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','Accuracy+9',}}
	
	Herc_feet_fresh  ={ name="Herculean Boots", augments={'Pet: DEX+7','Magic dmg. taken -2%','"Refresh"+1','Accuracy+16 Attack+16','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
	Herc_hands_fresh ={ name="Herculean Gloves", augments={'INT+3','Accuracy+9 Attack+9','"Refresh"+1','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	
	Herc_legs_DW 	={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Dual Wield"+3','VIT+4','Attack+7',}}
	
	Herc_feet_WS 	={ name="Herculean Boots", augments={'Attack+4','DEX+15','Accuracy+12',}}
	
	Carmine_head_HQ ={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	Carmine_head_NQ ={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs_HQ ={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_legs_NQ ={ name="Carmine Cuisses", augments={'HP+60','STR+10','INT+10',}}
	Carmine_feet_HQ ={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_hands_HQ ={ name="Carmine Fin. Ga. +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	
	FC_back			={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	TP_Crit_back	={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10'}}
	Savage_back     ={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1",feet="Assimilator's Charuqs +1"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh +1"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah +1"}
    sets.buff.Efflux = {back=TP_Crit_back,legs="Hashishin Tayt +1"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands"}
	
	sets.precast.JA['Provoke'] = {ammo="Sapience Orb",
		neck="Unmoving Collar +1",ear1="Pluto's Pearl",ear2="Trux Earring",
		body="Emet Harness +1",ring1="Supershear Ring",ring2="Pernicious Ring",
		back="Earthcry Mantle",waist="Sulla Belt"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
			head=Carmine_head_HQ,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
			body="Luhlaza Jubbah +1",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs="Lengo Pants",feet=Carmine_feet_HQ}
			
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
    
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Cheruski Needle",
		head="Adhemar Bonnet +1",neck="Lissome necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body="Adhemar Jacket +1",hands=Herc_hands_TP,ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=Savage_back,waist="Grunfeld rope",legs="Samnuha Tights",feet=Herc_feet_TP}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']				= set_combine(sets.precast.WS, {head=Carmine_head_NQ,hands=Carmine_hands_HQ,
	legs=Carmine_legs_HQ,feet=Carmine_feet_HQ,})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , {})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , {})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , {})

    sets.precast.WS['Sanguine Blade'] 				= set_combine(sets.precast.WS, {head="Pixie Hairpin +1"})
	sets.precast.WS['Ilvl~118']['Sanguine Blade'] 	= set_combine(sets.precast.WS['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~122']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~118']['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~124+']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~122']['Sanguine Blade'], {})
	
	sets.precast.WS['Chant du Cygne'] 				= set_combine(sets.precast.WS, {
		ammo="Falcon Eye",
		head="Adhemar Bonnet +1",neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=TP_Crit_back,waist=gear.ElementalBelt,legs="Samnuha Tights",feet="Thereoid Greaves"})
	sets.precast.WS['Ilvl~118']['Chant du Cygne']	= set_combine(sets.precast.WS['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~122']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~118']['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~124+']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~122']['Chant du Cygne'], {})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Sapience Orb",
			head="Carmine Mask",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body="Luhlaza Jubbah +1",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves +1"}
			
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {head="Carmine Mask"})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Carmine Mask",waist="Siegel Sash"})
	
	sets.midcast["Flash"] = set_combine(sets.precast.JA['Provoke'],sets.midcast.FastRecast, {})
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = set_combine(sets.precast.WS, {})

    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})


    -- Magical Spells --	
	
    sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
        head=Herc_head_TP,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hermetic Earring",
        body="Amalric Doublet",hands="Amalric gages +1",ring1="Shiva Ring +1",ring2="Stikini Ring",
        back=FC_back,waist="Yamabuki-no-obi",legs="Amalric Slops",feet="Amalric Nails +1"}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
		head="Carmine Mask",ear1="Lifestorm Earring",ear2="Psystorm Earring",back="Cornflower Cape"})
	
	sets.midcast['Blue Magic']['Tenebral Crush'] 			= set_combine(sets.midcast['Blue Magic'].Magical, {head="Pixie Hairpin +1"})	
	sets.midcast['Blue Magic']['Tenebral Crush'].Resistant 	= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {head="Pixie Hairpin +1"})
    
    sets.midcast['Blue Magic'].MagicalMnd					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalMnd.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalChr 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalVit 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalDex 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicAccuracy 				= set_combine(sets.midcast['Blue Magic'].Magical, {back="Cornflower Cape"})

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, {})

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun =  {
		ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Samnuha Coat",hands="Rawhide Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",
		back="Cornflower Cape",waist="Olseni Belt",legs="Miasmic Pants",feet="Hashishin Basmak +1"}
        
    sets.midcast['Blue Magic']['White Wind'] = set_combine(sets.midcast.FastRecast, {})

    sets.midcast['Blue Magic'].Healing = set_combine(sets.midcast.FastRecast, {ear2="Mendicant's Earring",neck="Phalaina Locket",back="Solemnity Cape"})

    sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.midcast.FastRecast, {})

    sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast.FastRecast, {hands="Hashishin Bazubands"})
	
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast.FastRecast, {head="Amalric Coif",hands="Hashishin Bazubands"})
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Yoran Unity Shirt"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {neck="Lissome Necklace",ring1="Sheltered Ring",ring2="Paguroidea ring"}
    
    -- Idle sets
    sets.idle = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Moonshade Earring",
		body="Mekosu. Harness",hands=Herc_hands_fresh,ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Kumbira Cape",waist="Flume Belt +1",legs="Lengo Pants",feet=Herc_feet_fresh}
	
	sets.idle.Refresh = sets.idle
	
    sets.idle.PDT = {ammo="Brigantia Pebble",
        head=Herc_head_TP,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Thureous Earring",
		body="Emet Harness +1",hands=Herc_hands_TP,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt +1",legs=Herc_legs_DW,feet=Herc_feet_TP}

    -- sets.idle.Town = {ammo="Brigantia Pebble",
        -- head="Fugacity Beret +1",neck="Lissome Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- body="Luhlaza Jubbah",hands=Herc_hands_WS,ring1="Sheltered Ring",ring2="Paguroidea ring",
		-- back="Repulse Mantle",waist="Flume Belt +1",legs="Crimson Cuisses",feet=Herc_feet_TP}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Brigantia Pebble",
        head=Herc_head_TP,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Emet Harness +1",hands=Herc_hands_TP,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt +1",legs=Herc_legs_DW,feet=Herc_feet_TP}

    sets.defense.MDT = {ammo="Brigantia Pebble",
        head=Herc_head_TP,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Emet Harness +1",hands=Herc_hands_TP,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt +1",legs=Herc_legs_DW,feet=Herc_feet_TP}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    --------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	----------------------------------------
	-- Normal melee group: No Haste (38% DW)
	----------------------------------------
	sets.engaged 					= {ammo="Ginsen",
										head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Cessance Earring",
										body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Epona's Ring",ring2="Petrov Ring",
										back=TP_Crit_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=Herc_feet_TP}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{ammo="Falcon Eye",neck="Lissome Necklace"})
	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{head="Dampening Tam",neck="Sanctity Necklace",ear1="Zennaroi Earring",ear2={name="Dignitary's Earring",priority=-1},
	                                                                            ring1="Rajas Ring",waist="Olseni Belt"})
	sets.engaged.DW 					= {ammo="Ginsen",
										head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Eabani Earring",ear2="Suppanomimi",
										body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Epona's Ring",ring2="Petrov Ring",
										back=TP_Crit_back,waist='Reiki Yotai',legs=Herc_legs_DW,feet=Herc_feet_TP}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{ammo="Falcon Eye",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{head="Dampening Tam",neck="Sanctity Necklace",ear1="Zennaroi Earring",ear2={name="Dignitary's Earring",priority=-1},
	                                                                            ring1="Rajas Ring",waist="Olseni Belt"})
																				
	------------------------------------------------------------------	

	sets.engaged.DW['DW: 37+'] 					= set_combine(sets.engaged.DW, 				{waist="Reiki Yotai",ear1="Eabani Earring"})
	sets.engaged.DW['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{})
	sets.engaged.DW['Ilvl~122']['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~122'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged.DW['Ilvl~124+'], {})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~36% DW)-             
	--------------------------------------------            
	
	sets.engaged.DW['DW: 22-36'] 				= set_combine(sets.engaged.DW['DW: 37+'], 				{waist="Reiki Yotai",ear1="Eabani Earring"})
	sets.engaged.DW['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged.DW['DW: 22-36'], 			{ammo="Falcon Eye",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 22-36'], {waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 22-36'], {head=Carmine_head_HQ,legs=Carmine_legs_HQ,neck="Sanctity Necklace",ear1="Zennaroi Earring",ear2={name="Dignitary's Earring",priority=-1},
	                                                                                            ring1="Rajas Ring",waist="Olseni Belt"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste (~21% DW)-              
	--------------------------------------------            
	
	sets.engaged.DW['DW: 12-21']				= set_combine(sets.engaged.DW['DW: 22-36'], 				{waist="Reiki Yotai",ear1="Eabani Earring"})
	sets.engaged.DW['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged.DW['DW: 12-21'], 			{ammo="Falcon Eye",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 12-21'], {waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 12-21'], 	{head=Carmine_head_HQ,legs=Carmine_legs_HQ,neck="Sanctity Necklace",ear1="Zennaroi Earring",ear2={name="Dignitary's Earring",priority=-1},
	                                                                                            ring1="Rajas Ring",waist="Olseni Belt"})
																								
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (5-11% DW)               
	---------------------------------------------           
																								-- ACC @ 1168
	sets.engaged.DW['DW: 6-11'] 				= set_combine(sets.engaged.DW['DW: 12-21'], 			{ear1="Eabani Earring",ear2="Telos Earring",legs="Samnuha Tights",feet=Herc_feet_TP})
																								-- ACC @ 1186
	sets.engaged.DW['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged.DW['DW: 6-11'], 			{ammo="Falcon Eye",neck="Lissome Necklace"})
																								-- ACC @ 1221
	sets.engaged.DW['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 6-11'],{head=Herc_head_TP})
																								-- ACC @ 1256
	sets.engaged.DW['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 6-11'], {head=Carmine_head_HQ,legs=Carmine_legs_HQ,neck="Sanctity Necklace",ear2={name="Telos Earring",priority=-1},
																								ring1="Ramuh Ring +1"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (0% DW)            
	-----------------------------------------           

	sets.engaged.DW['DW: 5-0']				= set_combine(sets.engaged.DW['DW: 6-11'],				{waist="Windbuffet Belt +1",ear1="Cessance Earring"})
	sets.engaged.DW['Ilvl~118']['DW: 5-0']	= set_combine(sets.engaged.DW['DW: 5-0'], 				{ammo="Falcon Eye",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 5-0']	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 5-0'], 	{waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 5-0']	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 5-0'], 	{head=Carmine_head_HQ,legs=Carmine_legs_Hq,neck="Sanctity Necklace",ear1="Zennaroi Earring",ear2={name="Telos Earring",priority=-1},
																									ring1="Ramuh Ring +1",waist="Olseni Belt"})


    sets.self_healing = {ring1="Kunaji Ring",waist="Chuq'aba Belt"}
	
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",hands="Buremte Gloves"}
	sets.buff.Reive = {neck = "Arciela's Grace +1"}
	sets.CP = {back="Mecisto. Mantle"}
	sets.Learning = {hands="Assimilator's Bazubands +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
    -- Default macro set/book
	set_macro_page(3, 2)
   
end