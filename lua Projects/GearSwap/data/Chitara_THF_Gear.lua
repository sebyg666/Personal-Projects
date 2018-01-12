 
function init_gear_sets()

	print('Chitara_THF_Gear.lua sidecar load')

	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	
	Adhemar_head		={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body		={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands		={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
		
    Kaabnax_legs		={ name="Kaabnax Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}}
		
	Rawhide_body		={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands		={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs		={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
		
	Lustratio_head		={ name="Lustratio Cap", augments={'INT+30','STR+5','DEX+5',}}
    Lustratio_body		={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}}
    Lustratio_hands		={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_legs		={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet		={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
		
	Dampening_Tam		={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}}
	Samnuha_Coat		={ name="Samnuha Coat", augments={'Mag. Acc.+1',}}
	Leyline_Gloves		={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}}
	Floral_Gauntlets	={ name="Floral Gauntlets", augments={'Rng.Acc.+14','Accuracy+13','"Triple Atk."+2','Magic dmg. taken -3%',}}
	Samnuha_Tights		={ name="Samnuha Tights", augments={'STR+4','DEX+7','"Triple Atk."+2',}}
	Lengo_Pants			={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
    
	Herc_body_TP_TA		={ name="Herculean Vest", augments={'Accuracy+25','"Triple Atk."+3','Attack+12',}}
	Herc_legs_TP_Acc	={ name="Herculean Trousers", augments={'Accuracy+18 Attack+18','"Counter"+2','STR+9',}}
	Herc_legs_TP_TA		={ name="Herculean Trousers", augments={'Accuracy+8','"Triple Atk."+4',}}
    Herc_feet_TP_Acc	={ name="Herculean Boots", augments={'Accuracy+30','Crit.hit rate+3','STR+6',}}
	Herc_feet_TP_TA		={ name="Herculean Boots", augments={'Accuracy+12','"Triple Atk."+4','STR+10',}}
	
	Herc_legs_WS		={ name="Herculean Trousers", augments={'Attack+28','Weapon skill damage +4%','DEX+6','Accuracy+11',}}
	
	Herc_head_MAB_WS	={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Mag. Acc.+15','"Mag.Atk.Bns."+14',}}
	Herc_body_MAB_WS	={ name="Herculean Vest", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +3%','MND+4','Mag. Acc.+13',}}
	Herc_hands_MAB_WS	={ name="Herculean Gloves", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Dbl.Atk."+1','STR+1','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}
	Herc_legs_MAB_WS	={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +1%','MND+6','Mag. Acc.+3','"Mag.Atk.Bns."+13',}}
	Herc_feet_MAB_WS	={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +5%','STR+2','Mag. Acc.+4',}}
	
	Relic_hands			={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
	
	DW_back				={ name="Canny Cape", 		augments={'DEX+3','AGI+2','"Dual Wield"+5','Crit. hit damage +1%',}}
	TP_Back				={ name="Toutatis's Cape", 	augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	Rudras_back			={ name="Toutatis's Cape", 	augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	Evisceration_back	={ name="Toutatis's Cape", 	augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	
	Moonshade_Ear		={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
	sets.Org.two = {}
	
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	}
	
	gear.TP_Bonus_Ear = Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------

    sets.TreasureHunter = {hands=Relic_hands,feet="Skulker's Poulaines +1"}
    sets.Kiting = {feet="Jute Boots +1"}

    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head,neck="Caro Necklace",ear1="Ishvara Earring",ear2="Brutal Earring",
		body="Meghanada Cuirie +1",hands=Adhemar_hands,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=TP_Back,waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet}

    sets.buff['Trick Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head,neck="Caro Necklace",ear1="Mache Earring",ear2="Brutal Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Apate Ring",ring2="Garuda Ring",
		back=TP_Back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {}
	sets.precast.JA["Assassin's Charge"] = {}
    sets.precast.JA['Accomplice'] = {}
    sets.precast.JA['Flee'] = {}
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {}
    sets.precast.JA['Steal'] = {ammo="Barathrum"}
    sets.precast.JA['Despoil'] = {ammo="Barathrum"}
    sets.precast.JA['Perfect Dodge'] = {hands=Relic_hands}
    sets.precast.JA['Feint'] = {}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=Herc_head_FC,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret +1",waist="Impulse Belt",legs=Adhemar_legs,feet='Meghanada Jambeaux +1'}
	----------------------
    -- Weaponskill sets
	----------------------
	
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Yetshila",
		head=Adhemar_head,neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Brutal Earring",
		body=Adhemar_body,hands="Meghanada Gloves +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=Rudras_back,waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Herc_feet_TP_TA}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	sets.precast.WS.SA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.TA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.SATA 			= set_combine(sets.precast.WS, 				{})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] 					= set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
																					head=Adhemar_head,neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Brutal Earring",
																					body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Ilabrat Ring",ring2="Garuda Ring",
																					back=Rudras_back,waist=gear.ElementalBelt,legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"})
    sets.precast.WS['Exenterator']['Ilvl~118'] 		= set_combine(sets.precast.WS['Exenterator'], {})
	sets.precast.WS['Exenterator']['Ilvl~122'] 		= set_combine(sets.precast.WS['Exenterator']['Ilvl~118'], {})
	sets.precast.WS['Exenterator']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~122'], {})
    sets.precast.WS['Exenterator'].SA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA 				= set_combine(sets.precast.WS['Exenterator'].SA, {})
    sets.precast.WS['Exenterator'].SATA 			= set_combine(sets.precast.WS['Exenterator'].SA, {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Dancing Edge'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge']['Ilvl~118'] 		= set_combine(sets.precast.WS['Dancing Edge'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~122'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~118'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~122'], {})
    sets.precast.WS['Dancing Edge'].SA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].TA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SATA 				= set_combine(sets.precast.WS['Dancing Edge'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Evisceration'] 					= set_combine(sets.precast.WS, {back=Evisceration_back})
    sets.precast.WS['Evisceration']['Ilvl~118'] 		= set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration']['Ilvl~122'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~118'], {})
	sets.precast.WS['Evisceration']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~122'], {})
    sets.precast.WS['Evisceration'].SA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SATA 				= set_combine(sets.precast.WS['Evisceration'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																						body="Meghanada Cuirie +1",ring1="Ilabrat Ring",ring2="Ramuh Ring",
																						waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet}) -- herc hands body head with dex acc att WSD
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"].SA 				= set_combine(sets.precast.WS["Rudra's Storm"], {neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																										body="Meghanada Cuirie +1",ring1="Ilabrat Ring",ring2="Ramuh Ring",
																										waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet})
    sets.precast.WS["Rudra's Storm"].TA 				= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
    sets.precast.WS["Rudra's Storm"].SATA 				= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Shark Bite"] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shark Bite']['Ilvl~118'] 			= set_combine(sets.precast.WS["Shark Bite"], {})
	sets.precast.WS['Shark Bite']['Ilvl~122'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~118'], {})
	sets.precast.WS['Shark Bite']['Ilvl~124+'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~122'], {})
    sets.precast.WS['Shark Bite'].SA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].TA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SATA 					= set_combine(sets.precast.WS['Shark Bite'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Mandalic Stab'] 					= set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
																						head=Lustratio_head,neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																						body="Meghanada Cuirie +1",ring1="Ilabrat Ring",ring2="Ramuh Ring",
																						waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet}) -- wanion belt, moonshade (mache)
    sets.precast.WS['Mandalic Stab']['Ilvl~118'] 		= set_combine(sets.precast.WS['Mandalic Stab'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~122'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~118'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~122'], {})
    sets.precast.WS['Mandalic Stab'].SA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].TA 				= set_combine(sets.precast.WS['Mandalic Stab'].SA, {})
    sets.precast.WS['Mandalic Stab'].SATA 				= set_combine(sets.precast.WS['Mandalic Stab'].SA, {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {
		head=Herc_head_MAB_WS,neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body=Herc_body_MAB_WS,hands="Meghanada Gloves +1",ring1="Ramuh Ring",ring2="Petrov Ring",
		waist="Eschan Stone",legs=Herc_legs_MAB_WS,feet=Herc_feet_MAB_WS}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands="Buremte Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",ring1="Kishar Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}
	
	sets.midcast['Dia'] = sets.TreasureHunter
	sets.midcast['Dia II'] = sets.TreasureHunter
	sets.midcast['Diaga'] = sets.TreasureHunter
		
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Smilodon Mask +1",neck="Lissome Necklace",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back='Solemnity Cape',waist="Flume Belt",legs="Meghanada Chausses +1",feet="Jute Boots +1"}

    sets.idle.Weak = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back='Solemnity Cape',waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}

    -- Defense sets

    sets.defense.Evasion = {
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back='Solemnity Cape',waist="Sveltesse Gouriz +1",legs="Meghanada Chausses +1",feet=Herc_feet_TP}
	
    sets.defense.PDT = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs='Meghanada Chausses +1',feet=Herc_feet_TP_Acc}

    sets.defense.MDT = {
		head=Dampening_Tam,neck="Loricate Torque +1",ear1="Merman's earring",ear2="Merman's earring",
		body=Adhemar_body,hands='Kurys Gloves',ring1="Patricius Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs='Meghanada Chausses +1',feet=Herc_feet_TP_Acc}

	-------------------------------------------------------------------
    ---------- ********   Engaged sets  ********* ---------------
	-------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	-------------------------------------------------------------------
    ---------- ********   Normal melee group  ********* ---------------
	-------------------------------------------------------------------
	
	sets.engaged 				= {ammo="Yamarang",
								head=Adhemar_head,neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
								body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
								back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
    sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged, 			{neck="Lissome Necklace"})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'], {head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {neck="Ej Necklace",ring1="Rajas Ring"})
	
	-- evasion sets
	sets.engaged.Evasion 				= set_combine(sets.engaged,{})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, {})
	sets.engaged['Ilvl~122'].Evasion 	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})

	---------------------------------------------------------------------------------------------------
    -- Custom melee group: low to no haste (41+% DW)
	---------------------------------------------------------------------------------------------------
	sets.engaged['DW: 37+'] 				= set_combine(sets.engaged, 						{ammo="Yamarang",
																								head=Adhemar_head,neck="Asperity Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
																								body=Adhemar_body,hands=Floral_Gauntlets,ring1="Epona's Ring",ring2="Petrov Ring",
																								back=TP_Back,waist="Reiki Yotai",legs=Samnuha_Tights,feet=Herc_feet_TP_TA})
	sets.engaged['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged['DW: 37+'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 37+'], 	{head=Dampening_Tam,neck="Asperity Necklace"})
	sets.engaged['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'], 	{neck="Ej Necklace"})
	
	-- evasion sets
	sets.engaged['DW: 37+'].Evasion 				= set_combine(sets.engaged.Evasion,							{})
	sets.engaged['Ilvl~118']['DW: 37+'].Evasion 	= set_combine(sets.engaged['DW: 37+'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 37+'].Evasion		= set_combine(sets.engaged['Ilvl~118']['DW: 37+'].Evasion,	{})
	sets.engaged['Ilvl~124+']['DW: 37+'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'].Evasion,	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (11% DW)              
	---------------------------------------------           
	
	sets.engaged['DW: 6-11'] 				= set_combine(sets.engaged['DW: 37+'] , 				{ear1="Brutal Earring",ear2="Eabani Earring",
																									body=Herc_body_TP_TA,hands=Adhemar_hands,
																									back=TP_Back,waist="Reiki Yotai"})
	sets.engaged['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged['DW: 6-11'], 				{neck="Asperity Necklace",ring2="Ilabrat Ring"})
	sets.engaged['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'], 	{head=Dampening_Tam})
	sets.engaged['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'], 	{neck="Ej Necklace",waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 6-11'].Evasion 				= set_combine(sets.engaged['DW: 37+'] .Evasion, 				{})
	sets.engaged['Ilvl~118']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['DW: 6-11'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'].Evasion, 	{})
	sets.engaged['Ilvl~124+']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (-2% DW)            
	-----------------------------------------           
	
	sets.engaged['DW: 5-0'] 				= set_combine(sets.engaged['DW: 6-11'],				{body=Herc_body_TP_TA})
	sets.engaged['Ilvl~118']['DW: 5-0'] 	= set_combine(sets.engaged['DW: 5-0'], 				{neck="Sanctity Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'], 	{body="Meg. Cuirie +1",head=Dampening_Tam,ring1="Ramuh Ring",})
	sets.engaged['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'], 	{neck="Ej Necklace",waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 5-0'].Evasion 					= set_combine(sets.engaged['DW: 6-11'].Evasion , 			{})
	sets.engaged['Ilvl~118']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['DW: 5-0'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'].Evasion, 	{})
	sets.engaged['Ilvl~124+']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'].Evasion, 	{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	----------------------
	-- Miscealeus sets
	----------------------
	
	--sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring"}
	sets.CP = {back="Mecistopins Mantle"}
	sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

	send_command("bind F8 input /ws \"Rudra\'s Storm\" <t>")
	send_command('bind ^F8 input /ja "Mandalic Stab" <t>')
	send_command('bind @F8 input /ja "Evisceration" <t>')
		
    if player.sub_job:upper() == 'DNC' then
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
		
	elseif player.sub_job:upper() == 'WAR' then
		send_command('bind F9 input /ja "provoke" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')

	end
	
	set_macro_page(1, 3)
end