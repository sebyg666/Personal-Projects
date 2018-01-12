 
function init_gear_sets()

	print('Ewellina_THF_Gear.lua sidecar load')

	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	
	Adhemar_head_Att	={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}
    Adhemar_body_Att	={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}}
	Adhemar_hands_Att	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Adhemar_head_Acc	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body_Acc	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands_Acc	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Lustratio_head	={ name="Lustratio Cap", augments={'INT+30','STR+5','DEX+5',}}
    Lustratio_legs	={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet	={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
	
    Kaabnax_legs	={ name="Kaabnax Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}}
	
	Rawhide_body	={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands	={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs	={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
	
    Lengo_Pants		={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	Dampening_Tam	={ name="Dampening Tam", augments={'DEX+5','Accuracy+8','Mag. Acc.+8',}}
	Samnuha_Coat	={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
	Samnuha_Tights	={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}}
	Leyline_Gloves	={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	Mediums_Sabots	={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	
	Herc_body_TA	={ name="Herculean Vest", augments={'Accuracy+30','"Triple Atk."+4','INT+1',}}
	Herc_legs_TA	={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','AGI+7','Accuracy+14',}}
    Herc_feet_Acc	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
	Herc_feet_TA	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','AGI+4','Attack+2',}}
	
	Herc_legs_DW	={ name="Herculean Trousers", augments={'Accuracy+25','"Dual Wield"+4','STR+10','Attack+14',}}
	Taeon_feet_DW	={ name="Taeon Boots", augments={'Attack+10','"Dual Wield"+3','STR+3 AGI+3',}}
	
	Herc_head_WSD	={ name="Herculean Helm", augments={'Accuracy+3 Attack+3','Weapon skill damage +4%','STR+4',}}
	Herc_body_WSD	={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','DEX+6','Attack+15',}}
	Herc_hands_WSD	={ name="Herculean Gloves", augments={'Attack+5','Weapon skill damage +5%','Accuracy+4',}}
    Herc_legs_WSD	={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','AGI+3','Accuracy+6','Attack+4',}}
    Herc_feet_WSD	={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','STR+6','Accuracy+12',}}
	
	Herc_hands_CritDmg	={ name="Herculean Gloves", augments={'Attack+29','Crit. hit damage +3%','DEX+12',}}
	Herc_legs_CritDmg	={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Crit. hit damage +3%','STR+7','Accuracy+14',}}
	Herc_feet_CritDmg	={ name="Herculean Boots", augments={'Accuracy+29','Crit. hit damage +4%','DEX+5','Attack+11',}}
	
	Herc_head_FC	={ name="Herculean Helm", augments={'"Fast Cast"+5','STR+9','Mag. Acc.+1','"Mag.Atk.Bns."+7',}}
    Herc_feet_FC	={ name="Herculean Boots", augments={'Mag. Acc.+1','DEX+7','"Fast Cast"+8',}}
	
	Herc_head_DT	={ name="Herculean Helm", augments={'Accuracy+14','Damage taken-3%','INT+2','Attack+4',}}
	Herc_hands_DT	={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','Damage taken-3%','AGI+9','Accuracy+1','Attack+10',}}
	Herc_legs_DT	={ name="Herculean Trousers", augments={'Accuracy+19','Damage taken-3%','Attack+12',}}
	Herc_feet_DT	={ name="Herculean Boots", augments={'Attack+14','Damage taken-2%','VIT+12',}}
	
	Herc_head_Nuke	={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','STR+14','Mag. Acc.+8','"Mag.Atk.Bns."+13',}}
	Herc_legs_Nuke	={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Crit. hit damage +3%','INT+5','Mag. Acc.+8','"Mag.Atk.Bns."+8',}}
	
	Relic_hands		={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
	
	DW_back			={ name="Canny Cape", augments={'DEX+3','AGI+2','"Dual Wield"+5','Crit. hit damage +1%',}}
	TP_Back			={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
	Moonshade_Ear	={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
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
    sets.Kiting = {feet="Fajin Boots"}

    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head_Att,neck="Caro Necklace",ear1="Ishvara Earring",ear2="Brutal Earring",
		body="Meghanada Cuirie +1",hands=Adhemar_hands_Att,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=TP_Back,waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet}

    sets.buff['Trick Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head_Att,neck="Caro Necklace",ear1="Dawn Earring",ear2="Brutal Earring",
		body=Adhemar_body_Att,hands=Adhemar_hands_Att,ring1="Apate Ring",ring2="Garuda Ring",
		back=TP_Back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_Acc}

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
    sets.precast.JA['Steal'] = {}
    sets.precast.JA['Despoil'] = {}
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
		head=Adhemar_head_Att,neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Brutal Earring",
		body=Adhemar_body_Att,hands="Meghanada Gloves +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=TP_Back,waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Herc_feet_TA}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	sets.precast.WS.SA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.TA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.SATA 			= set_combine(sets.precast.WS, 				{})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] 					= set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
																					head=Adhemar_head_Att,neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Brutal Earring",
																					body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Garuda Ring",ring2="Garuda Ring",
																					back=TP_Back,waist=gear.ElementalBelt,legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"})
    sets.precast.WS['Exenterator']['Ilvl~118'] 		= set_combine(sets.precast.WS['Exenterator'], {})
	sets.precast.WS['Exenterator']['Ilvl~122'] 		= set_combine(sets.precast.WS['Exenterator']['Ilvl~118'], {})
	sets.precast.WS['Exenterator']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~122'], {})
    sets.precast.WS['Exenterator'].SA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA 				= set_combine(sets.precast.WS['Exenterator'].SA , {})
    sets.precast.WS['Exenterator'].SATA 			= set_combine(sets.precast.WS['Exenterator'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Dancing Edge'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge']['Ilvl~118'] 		= set_combine(sets.precast.WS['Dancing Edge'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~122'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~118'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~122'], {})
    sets.precast.WS['Dancing Edge'].SA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].TA 					= set_combine(sets.precast.WS['Dancing Edge'].SA , {})
    sets.precast.WS['Dancing Edge'].SATA 				= set_combine(sets.precast.WS['Dancing Edge'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Evisceration'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Evisceration']['Ilvl~118'] 		= set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration']['Ilvl~122'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~118'], {})
	sets.precast.WS['Evisceration']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~122'], {})
    sets.precast.WS['Evisceration'].SA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA 					= set_combine(sets.precast.WS['Evisceration'].SA , {})
    sets.precast.WS['Evisceration'].SATA 				= set_combine(sets.precast.WS['Evisceration'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																						body=Herc_body_WSD,ring1="Ramuh Ring",ring2="Ramuh Ring",
																						waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet})
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"].SA 				= set_combine(sets.precast.WS["Rudra's Storm"], {neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																										body="Meghanada Cuirie +1",ring1="Ramuh Ring",ring2="Ramuh Ring",
																										waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet})
    sets.precast.WS["Rudra's Storm"].TA 				= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
    sets.precast.WS["Rudra's Storm"].SATA 				= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Shark Bite"] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shark Bite']['Ilvl~118'] 			= set_combine(sets.precast.WS["Shark Bite"], {})
	sets.precast.WS['Shark Bite']['Ilvl~122'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~118'], {})
	sets.precast.WS['Shark Bite']['Ilvl~124+'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~122'], {})
    sets.precast.WS['Shark Bite'].SA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].TA 					= set_combine(sets.precast.WS['Shark Bite'].SA , {})
    sets.precast.WS['Shark Bite'].SATA 					= set_combine(sets.precast.WS['Shark Bite'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Mandalic Stab'] 					= set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
																						head=Lustratio_head,neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
																						body=Herc_body_WSD,ring1="Ramuh Ring",ring2="Ramuh Ring",
																						waist="Grunfeld Rope",legs=Lustratio_legs,feet=Lustratio_feet})
    sets.precast.WS['Mandalic Stab']['Ilvl~118'] 		= set_combine(sets.precast.WS['Mandalic Stab'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~122'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~118'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~122'], {})
    sets.precast.WS['Mandalic Stab'].SA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].TA 				= set_combine(sets.precast.WS['Mandalic Stab'].SA , {})
    sets.precast.WS['Mandalic Stab'].SATA 				= set_combine(sets.precast.WS['Mandalic Stab'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {
		head=Herc_head_Nuke,neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body=Samnuha_Coat,hands="Meghanada Gloves +1",ring1="Ramuh Ring",ring2="Petrov Ring",
		waist="Aquiline Belt",legs=Herc_legs_Nuke,feet=Herc_feet_FC}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}
		
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Smilodon Mask +1",neck="Lissome Necklace",
		ring1="Sheltered Ring",ring2="Chirich Ring"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		head="Smilodon Mask +1",neck="Lissome Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		back='Xucau Mantle',waist="Flume Belt",legs=Herc_legs_DT,feet="Fajin Boots"}

    sets.idle.Town = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back='Xucau Mantle',waist="Patentia Sash",legs=Herc_legs_DT,feet="Fajin Boots"}

    sets.idle.Weak = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		back='Xucau Mantle',waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_Acc}

    -- Defense sets

    sets.defense.Evasion = {
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		back='Xucau Mantle',waist="Sveltesse Gouriz +1",legs=Herc_legs_DT,feet=Herc_feet_TP}
	
    sets.defense.PDT = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Xucau Mantle",waist="Flume Belt",legs='Meghanada Chausses +1',feet=Herc_feet_Acc}

    sets.defense.MDT = {
		head=Dampening_Tam,neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
		body=Adhemar_body_Acc,hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_Acc}

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
								head=Adhemar_head_Acc,neck="Erudition Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
								body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
								back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_Acc}
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
																								head=Adhemar_head_Acc,neck="Erudition Necklace",ear1="Suppanomimi",ear2="Eabani Earring",
																								body=Adhemar_body_Acc,hands=Floral_Gauntlets,ring1="Epona's Ring",ring2="Petrov Ring",
																								back=DW_back,waist="Patentia Sash",legs=Herc_legs_DW,feet=Taeon_feet_DW})
	sets.engaged['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged['DW: 37+'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 37+'], 	{head=Dampening_Tam,neck="Erudition Necklace"})
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
	
	sets.engaged['DW: 6-11'] 				= set_combine(sets.engaged['DW: 37+'] , 				{ear2="Brutal Earring",
																									hands=Adhemar_hands_Acc,
																									back=TP_Back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_Acc})
	sets.engaged['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged['DW: 6-11'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
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
	
	sets.engaged['DW: 5-0'] 				= set_combine(sets.engaged['DW: 6-11'],				{body=Herc_body_TA,ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Meg. Cuirie +1"})
	sets.engaged['Ilvl~118']['DW: 5-0'] 	= set_combine(sets.engaged['DW: 5-0'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'], 	{head=Dampening_Tam,ring1="Ramuh Ring",})
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
	sets.CP = {back="Aptitude Mantle"}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

    if player.sub_job:upper() == 'DNC' then
		send_command('bind ^` input /ja "spectral jig" <me>')
		send_command('bind !` input /ja "Reverse Flourish" <me>')
		
		send_command('bind F7 input /ja "Box step" <stnpc>')
		send_command('bind ^F7 input /ja "Animated Flourish" <stnpc>')
		
		send_command('bind F8 input /ws "Rudra\'s Storm" <t>')
		send_command('bind @F8 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		
		send_command('bind F9 input /ra <stnpc>')
		send_command('bind ^F9 input /ja "Haste Samba" <me>')
		
		send_command('bind F10 input /ja "Curing Waltz III" <stal>')
		send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		
		send_command('bind F11 input /ja "Curing Waltz II" <stal>')
		
	elseif player.sub_job:upper() == 'WAR' then
		send_command("bind F8 input /ws Rudra's Storm <t>")
		send_command("bind ^F8 input /ws Aeolian Edge <t>")
		
		send_command('bind F9 input /ja "provoke" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')

	end
	
	set_macro_page(1, 3)
end