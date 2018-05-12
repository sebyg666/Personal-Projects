 
function init_gear_sets()

	print('Padrobond_DNC_Gear.lua sidecar loaded')
	
	-----------------------------------------------
	-- Section for Augments and JSE gear
	-----------------------------------------------
	
	-- method to parse correct augments.
	------------------------------------
	-- equip the desired gear in game with gearswap loaded
	-- type //gs export, or in the console just gs export
	-- go to ur windower folder -> addons -> gearswap -> data -> export
	-- open the file and copy the desire item to here
	-- eg -> legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+9%','"Mag.Atk.Bns."+15',}},
	
	-- make sure you remove the comma from the end and also give your item a new name
	-- eg -> Merl_legs_Burst ={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+9%','"Mag.Atk.Bns."+15',}}
	
	-- now you can use that item in your sets, remember this is a variable so it does not need to be surrounded by quotes
	-- eg. -> legs = Merl_legs_Burst
	-- you can rename any item in the game like this as you will see below with the addition to AF, Relic and Emperean to easily change them after upgrade
	-- all you need to do is change the item discription
	-- eg. -> from    	:   AF_body ={ name="Ignominy Cuirass" }
	-- to ->			:	AF_body	={ name="Ignominy Cuirass +3" }
	
	Adhemar_head 	= { name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body 	= { name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands 	= { name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Lustratio_legs 	= { name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
	
	Dampening_Tam 	= { name="Dampening Tam", augments={'DEX+4','Accuracy+5',}}
    Samnuha_Coat 	= { name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
    Leyline_Gloves	= { name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}
    Samnuha_Tights 	= { name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}}
    Lengo_Pants		= { name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
    Amm_Greaves		= { name="Amm Greaves", augments={'HP+25','VIT+6','Accuracy+10',}}
    Founders_Greaves = { name="Founder's Greaves", augments={'VIT+8','Accuracy+13','"Mag.Atk.Bns."+14','Mag. Evasion+14',}}
	
	HercWSHead	= { name="Herculean Helm", augments={'Weapon skill damage +4%','AGI+3','Accuracy+28','Attack+8'}}
    HercDTHead 	= { name="Herculean Helm", augments={'Accuracy+2 Attack+22','"Dual Wield"+1','MND+4','Accuracy+10','Attack+14'}}
    HercDTHands	= { name="Herculean Gloves", augments={'Attack+17','Damage taken-4%'}}
    HercDTFeet 	= { name="Herculean Boots", augments={'Accuracy+6','Damage taken-4%'}}
    HercDDFeet 	= { name="Herculean Boots", augments={'Accuracy+15 Attack+15','"Triple Atk."+3','STR+10','Accuracy+9','Attack+8'}}
    HercWSFeet 	= { name="Herculean Boots", augments={'Accuracy+11','Weapon skill damage +4%','AGI+4','Attack+15'}}
	HercDWlegs	= { name="Herculean Trousers", augments={'Accuracy+15 Attack+15','"Dual Wield"+4','CHR+1','Accuracy+15',}}
	HercDWFeet 	= { name="Herculean Boots", augments={'Dex+7', 'Attack+27','"Dual Wield"+4'}}
	HercDWHands	= { name="Herculean Gloves", augments={'Agi+6','Accuracy+14','"Dual Wield"+3'}}
	
	BackDD 			= { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',"damage taken-5"}}
    BackWS 			= { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',"damage taken-5"}}
	BackDW 			= { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10'}}
	Toetapper_back 	= { name="Toetapper Mantle", augments={'"Store TP"+4','"Dual Wield"+1','"Rev. Flourish"+28',}}
	CP_Cape			= { name="Mecisto. Mantle", augments={'Cap. Point+41%','HP+12','DEF+9',}}
	
	AF_head 		= { name="Maxixi Tiara +2"	}
	AF_body			= { name="Maxixi Casaque +2"	}
	AF_hands 		= { name="Maxixi Bangles +3"	}
	AF_legs 		= { name="Maxixi Tights +2"	}
	AF_feet 		= { name="Maxixi toeshoes +2" }
	
	Relic_head		= { }
	Relic_body		= {	name="Horos Casaque +1" }
    Relic_hands		= { }
	Relic_legs		= { }
	Relic_feet		= { }
	
	Empy_head 		= { name="Maculele Tiara +1" }
	Empy_body		= { name="Maculele Casaque +1" }
	Empy_hands		= { name="Maculele Bangles +1" }
	Empy_legs 		= { name="Maculele Tights" }
	Empy_feet 		= { name="Maculele Toeshoes" }
	
	Moonshade_Ear	= { name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	gear.default.weaponskill_neck = "Caro Necklace"
    gear.default.weaponskill_waist = "Grunfeld Rope"
	gear.default.obi_waist = "Eschan Stone"
	
	gear.TP_Bonus_Ear = Moonshade_Ear -- do not change
	gear.Max_TP_Ear = {name="Mache Earring"} -- this is the earring you want to use instead of moonshade if over 2850 tp
	gear.ws_ear = {name="Mache Earring"} -- the default WS earring to use which MUST be the same as above.
										-- when defining the WS set and you want to use this functionality use 
										-- sets.precast.WS = {ear1 = gear.ws_ear}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Provoke'] = {}

	sets.precast.JA['No Foot Rise'] = {body=Relic_body}
 
	sets.precast.JA['Trance'] = {}
	 
	 
	-- Waltz set (chr and vit)
	sets.precast.Waltz = { ammo="Yamarang",
		head= AF_head,neck="Unmoving Collar +1",left_ear="Handler's Earring +1",right_ear="Enchntr. Earring +1",
		body= AF_body,hands= AF_hands,left_ring="Carbuncle Ring +1",right_ring="Carbuncle Ring +1",
		back= Toetapper_back,waist="Aristo Belt",legs=AF_legs,feet= AF_feet}
	sets.precast.Waltz.Idle = set_combine(sets.precast.Waltz, {})
			 
	sets.precast.Waltz['Healing Waltz'] = {}
	 
	sets.precast.Samba = {head= AF_head,Body=Empy_body,Hands=Empy_hands}
	 
	sets.precast.Jig = {
		head=Adhemar_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring",
		body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
		back=Toetapper_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=AF_feet}
	 
	sets.precast.Step = {
		head=AF_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Moonshade Earring",
		body=AF_body,hands=AF_hands,left_ring="Rajas Ring",right_ring="Apate Ring",
		back=DDBack,waist="Windbuffet Belt +1",legs=AF_legs,feet=HercWSFeet}
	sets.precast.Step['Feather Step'] = {}
	 
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Animated Flourish'] = sets.precast.JA['Provoke']
	sets.precast.Flourish1['Violent Flourish'] = {} -- magic accuracy
	sets.precast.Flourish1['Desperate Flourish'] = {} -- acc gear
	 
	sets.precast.Flourish2 = {}
	sets.precast.Flourish2['Reverse Flourish'] = {hands= Empy_hands,back= Toetapper_back}

	-- Fast cast sets for spells
	
	sets.precast.FC = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	-- Snapshot for ranged
	sets.precast.RA = {}
    
	------------------------------------------------------ 
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	------------------------------------------------------
	
	sets.precast.WS = { ammo="Charis Feather",
		head=HercWSHead, neck="Caro Necklace", left_ear="Sherida Earring", right_ear= gear.ws_ear, 
		body=Adhemar_body, hands= AF_hands, left_ring="Rajas Ring", right_ring="Apate Ring",
		back= BackWS, waist="Grunfeld Rope", legs=Lustratio_legs, feet= HercWSFeet}
	
	sets.precast.WS['Ilvl~118']  	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
	sets.precast.WS['CF'] 			= set_combine(sets.precast.WS, {})
	sets.precast.WS['TF'] 			= set_combine(sets.precast.WS, {})
	sets.precast.WS['SF'] 			= set_combine(sets.precast.WS, {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {
															head=HercWSHead,neck="Caro Necklace",left_ear="Ishvara Earring",right_ear=gear.ws_ear,
															body=Adhemar_body,hands=AF_hands,left_ring="Rajas Ring",right_ring="Apate Ring",
															back=BackWS,waist="Grunfeld Rope",legs=Lustratio_legs,feet=HercWSFeet,Ammo="Charis Feather"})
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"]['CF']				= set_combine(sets.precast.WS["Rudra's Storm"], {Head=Empy_head,Body="Meghanada cuirie +2",Hands=AF_hands})
	sets.precast.WS["Rudra's Storm"]['TF']				= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['SF']				= set_combine(sets.precast.WS["Rudra's Storm"], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.WS["Pyrrhic Kleos"] 					= set_combine(sets.precast.WS, {
															head="Lustratio Cap",neck="Fotia Gorget",left_ear="Steelflash Earring",right_ear="Bladeborn Earring", 
															body=Adhemar_body,hands=AF_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
															back=BackDD,waist="Fotia Belt",legs=Samnuha_Tights,feet=HercDDFeet})
    sets.precast.WS["Pyrrhic Kleos"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Pyrrhic Kleos"], {})
	sets.precast.WS["Pyrrhic Kleos"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Pyrrhic Kleos"]['Ilvl~118'], {})
	sets.precast.WS["Pyrrhic Kleos"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Pyrrhic Kleos"]['Ilvl~122'], {})
	sets.precast.WS["Pyrrhic Kleos"]['CF']				= set_combine(sets.precast.WS["Pyrrhic Kleos"], {})
    sets.precast.WS["Pyrrhic Kleos"]['TF']				= set_combine(sets.precast.WS["Pyrrhic Kleos"], {})
	sets.precast.WS["Pyrrhic Kleos"]['SF']				= set_combine(sets.precast.WS["Pyrrhic Kleos"], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.WS["Exenterator"] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS["Exenterator"]['Ilvl~118'] 			= set_combine(sets.precast.WS["Exenterator"], {})
	sets.precast.WS["Exenterator"]['Ilvl~122'] 			= set_combine(sets.precast.WS["Exenterator"]['Ilvl~118'], {})
	sets.precast.WS["Exenterator"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Exenterator"]['Ilvl~122'], {})
	sets.precast.WS["Exenterator"]['CF']				= set_combine(sets.precast.WS["Exenterator"], {})
    sets.precast.WS["Exenterator"]['TF']				= set_combine(sets.precast.WS["Exenterator"], {})
	sets.precast.WS["Exenterator"]['SF']				= set_combine(sets.precast.WS["Exenterator"], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.WS["Evisceration"] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS["Evisceration"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Evisceration"], {})
	sets.precast.WS["Evisceration"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Evisceration"]['Ilvl~118'], {})
	sets.precast.WS["Evisceration"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Evisceration"]['Ilvl~122'], {})
	sets.precast.WS["Evisceration"]['CF']				= set_combine(sets.precast.WS["Evisceration"], {})
    sets.precast.WS["Evisceration"]['TF']				= set_combine(sets.precast.WS["Evisceration"], {})
	sets.precast.WS["Evisceration"]['SF']				= set_combine(sets.precast.WS["Evisceration"], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.WS["Aeolian Edge"] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS["Aeolian Edge"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Aeolian Edge"], {})
	sets.precast.WS["Aeolian Edge"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Aeolian Edge"]['Ilvl~118'], {})
	sets.precast.WS["Aeolian Edge"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Aeolian Edge"]['Ilvl~122'], {})
	sets.precast.WS["Aeolian Edge"]['CF']				= set_combine(sets.precast.WS["Aeolian Edge"], {})
    sets.precast.WS["Aeolian Edge"]['TF']				= set_combine(sets.precast.WS["Aeolian Edge"], {})
	sets.precast.WS["Aeolian Edge"]['SF']				= set_combine(sets.precast.WS["Aeolian Edge"], {})

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
	sets.midcast.FastRecast = {}

	sets.midcast.Trust = {}
	
	sets.midcast.RA = {}
	
	sets.midcast["Flash"] = sets.precast.JA['Provoke']
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Yamarang",head=HercDTHead,neck="Warder's Charm +1",left_ear="Sherida Earring",right_ear="Brutal Earring",
				body="Meg. Cuirie +2",hands=HercDTHands,left_ring="Vocane Ring",right_ring="Defending Ring",
				back=BackDD,waist="Flume Belt",legs="Mummu kecks +2",feet=HercDTFeet}
	
	sets.idle.PDT = {ammo="Yamarang",head=HercDTHead,neck="Warder's Charm +1",left_ear="Sherida Earring",right_ear="Brutal Earring",
					body="Meg. Cuirie +2",hands=HercDTHands,left_ring="Vocane Ring",right_ring="Defending Ring",
					back=BackDD,waist="Flume Belt",legs="Mummu kecks +2",feet=HercDTFeet}
		
	sets.idle.Refresh = {}
	
	sets.idle.Weak = {ammo="Yamarang",head=HercDTHead,neck="Warder's Charm +1",left_ear="Sherida Earring",right_ear="Brutal Earring",
					body="Meg. Cuirie +2",hands=HercDTHands,left_ring="Vocane Ring",right_ring="Defending Ring",
					back=BackDD,waist="Flume Belt",legs="Mummu kecks +2",feet=HercDTFeet}
	
	-- Defense sets
	sets.defense.PDT = {ammo="Yamarang",head=HercDTHead,neck="Warder's Charm +1",left_ear="Sherida Earring",right_ear="Brutal Earring",
						body="Meg. Cuirie +2",hands=HercDTHands,left_ring="Vocane Ring",right_ring="Defending Ring",
						back=BackDD,waist="Flume Belt",legs="Mummu kecks +2",feet=HercDTFeet}

	sets.defense.MDT = {ammo="Yamarang",head=AF_head,neck="Warder's Charm +1",left_ear="Sherida Earring",right_ear="Brutal Earring",
						body=AF_body,hands=HercDTHands,left_ring="Vocane Ring",right_ring="Defending Ring",
						back="Engulfer cape +1",waist="Flume Belt",legs="Mummu kecks +2",feet=AF_feet}

	sets.Kiting = {feet="tandava crackows"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
    -- sets.engaged['SAM'][state.CombatWeapon]['Ilvl~118'].DT['H: 820']['Mythic AM3']
	
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	----------------------------------------
	-- Base sets that GS requires to be defined in order for others to work
	-- If you do not intend to single wield then these do not need to be populated
	-- but for safety its prefered that you populated it with STP and haste
	----------------------------------------
	sets.engaged 							= {	ammo="Yamarang",
												head=Adhemar_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDD,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet}
	sets.engaged['Ilvl~118']				= set_combine(sets.engaged, 			{})
	sets.engaged['Ilvl~122']				= set_combine(sets.engaged['Ilvl~118'], {})
	sets.engaged['Ilvl~124+'] 				= set_combine(sets.engaged['Ilvl~122'], {})	
	
	sets.engaged.DW 						= {	ammo="Yamarang",
												head=Adhemar_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDD,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet}
	sets.engaged.DW['Ilvl~118']				= set_combine(sets.engaged.DW, 			{})
	sets.engaged.DW['Ilvl~122']				= set_combine(sets.engaged.DW['Ilvl~118'], {})
	sets.engaged.DW['Ilvl~124+'] 			= set_combine(sets.engaged.DW['Ilvl~122'], {})	
	
	-- DT = "Damage taken" ie. hybrid tanking sets
	sets.engaged.DT 							= {ammo="Yamarang",
												head=Adhemar_head,neck="sanctity necklace",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body="Meg. Cuirie +2",hands=Adhemar_hands,left_ring="Moonbeam Ring",right_ring="Defending Ring",
												back=BackDD,waist="Flume Belt",legs=Samnuha_Tights,feet=HercDDFeet}
	sets.engaged['Ilvl~118'].DT 				= set_combine(sets.engaged.DT , 			{})
	sets.engaged['Ilvl~122'].DT 				= set_combine(sets.engaged['Ilvl~118'].DT , {})
	sets.engaged['Ilvl~124+'].DT  				= set_combine(sets.engaged['Ilvl~122'].DT , {})	
	
	sets.engaged.DW.DT 						= {	ammo="Yamarang",
												head=Adhemar_head,neck="sanctity necklace",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body="Meg. Cuirie +2",hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Defending Ring",
												back=BackDD,waist="Flume Belt",legs=Samnuha_Tights,feet=HercDDFeet}
	sets.engaged.DW['Ilvl~118'].DT 			= set_combine(sets.engaged.DW.DT , 			{})
	sets.engaged.DW['Ilvl~122'].DT 			= set_combine(sets.engaged.DW['Ilvl~118'].DT , {})
	sets.engaged.DW['Ilvl~124+'].DT  		= set_combine(sets.engaged.DW['Ilvl~122'].DT , {})	
	
	-- SD = "Saber Dance"
	sets.engaged['SD'] 						= set_combine(sets.engaged, 					{})
	sets.engaged['Ilvl~118']['SD']			= set_combine(sets.engaged['SD'], 				{})
	sets.engaged['Ilvl~122']['SD']			= set_combine(sets.engaged['Ilvl~118']['SD'], 	{})
	sets.engaged['Ilvl~124+']['SD'] 		= set_combine(sets.engaged['Ilvl~122']['SD'], 	{})	
	
	-- AM3 = SPECIFICLY Emperean Aftermath (not relic or mythic or any other, tracked by checking which main hand weapon is equipped)
	sets.engaged['Emp AM3'] 					= set_combine(sets.engaged, 					{})
	sets.engaged['Ilvl~118']['Emp AM3']			= set_combine(sets.engaged['Emp AM3'], 				{})
	sets.engaged['Ilvl~122']['Emp AM3']			= set_combine(sets.engaged['Ilvl~118']['Emp AM3'], 	{})
	sets.engaged['Ilvl~124+']['Emp AM3'] 		= set_combine(sets.engaged['Ilvl~122']['Emp AM3'], 	{})	

	-- Mix of both saber dance and AM3 active
	sets.engaged['SD']['Emp AM3'] 						= set_combine(sets.engaged['Emp AM3'], 						{})
	sets.engaged['Ilvl~118']['SD']['Emp AM3']			= set_combine(sets.engaged['SD']['Emp AM3'], 				{})
	sets.engaged['Ilvl~122']['SD']['Emp AM3']			= set_combine(sets.engaged['Ilvl~118']['SD']['Emp AM3'], 	{})
	sets.engaged['Ilvl~124+']['SD']['Emp AM3'] 			= set_combine(sets.engaged['Ilvl~122']['SD']['Emp AM3'], 	{})	
	
	-- AM3 = SPECIFICLY Emperean Aftermath (not relic or mythic or any other, tracked by checking which main hand weapon is equipped)
	sets.engaged['Mythic AM3'] 					= set_combine(sets.engaged, 					{})
	sets.engaged['Ilvl~118']['Mythic AM3']			= set_combine(sets.engaged['Mythic AM3'], 				{})
	sets.engaged['Ilvl~122']['Mythic AM3']			= set_combine(sets.engaged['Ilvl~118']['Mythic AM3'], 	{})
	sets.engaged['Ilvl~124+']['Mythic AM3'] 		= set_combine(sets.engaged['Ilvl~122']['Mythic AM3'], 	{})	

	-- Mix of both saber dance and AM3 active
	sets.engaged['SD']['Mythic AM3'] 						= set_combine(sets.engaged['Mythic AM3'], 						{})
	sets.engaged['Ilvl~118']['SD']['Mythic AM3']			= set_combine(sets.engaged['SD']['Mythic AM3'], 				{})
	sets.engaged['Ilvl~122']['SD']['Mythic AM3']			= set_combine(sets.engaged['Ilvl~118']['SD']['Mythic AM3'], 	{})
	sets.engaged['Ilvl~124+']['SD']['Mythic AM3'] 			= set_combine(sets.engaged['Ilvl~122']['SD']['Mythic AM3'], 	{})	
	
	
	------------------------------------------------------------------
	----------------------------------------
	-- Normal melee group: No Haste (38% DW)
	----------------------------------------
											
	sets.engaged.DW['DW: 38'] 					= set_combine(sets.engaged, 							{ammo="Yamarang",
												head=AF_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=HercDWHands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=HercDWlegs,feet=HercDWFeet})
	sets.engaged.DW['Ilvl~118']['DW: 38']		= set_combine(sets.engaged.DW['DW: 38'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 38'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38'], 		{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 38'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 38'], 		{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 38'] 					= set_combine(sets.engaged.DW.DT, 								{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 38']		= set_combine(sets.engaged.DW.DT['DW: 38'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 38']		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 38'], 		{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 38']		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 38'], 		{})
	
	sets.engaged.DW['DW: 38']['SD'] 					= set_combine(sets.engaged.DW['DW: 38'], 							{Head=AF_head})
	sets.engaged.DW['Ilvl~118']['DW: 38']['SD']			= set_combine(sets.engaged.DW['DW: 38']['SD'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 38']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38']['SD'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 38']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 38']['SD'], 		{})
	
	sets.engaged.DW['DW: 38']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 38'], 							{Body="Meghanada cuirie +2"})
	sets.engaged.DW['Ilvl~118']['DW: 38']['Emp AM3']		= set_combine(sets.engaged.DW['DW: 38']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 38']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 38']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 38']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 38']['SD']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 38'], 								{Hands=AF_hands})
	sets.engaged.DW['Ilvl~118']['DW: 38']['SD']['Emp AM3']	= set_combine(sets.engaged.DW['DW: 38']['SD']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 38']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38']['SD']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 38']['SD']['Emp AM3'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 38']['SD']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 38']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 38'], 							{Body="Meghanada cuirie +2"})
	sets.engaged.DW['Ilvl~118']['DW: 38']['Mythic AM3']		= set_combine(sets.engaged.DW['DW: 38']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 38']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 38']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 38']['Mythic AM3'], 		{})
	
	sets.engaged.DW['DW: 38']['SD']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 38'], 								{Hands=AF_hands})
	sets.engaged.DW['Ilvl~118']['DW: 38']['SD']['Mythic AM3']	= set_combine(sets.engaged.DW['DW: 38']['SD']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 38']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 38']['SD']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 38']['SD']['Mythic AM3'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 38']['SD']['Mythic AM3'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------
	-- Custom melee group: low Haste ('DW: 36-37')     
	--------------------------------------------         
	
	sets.engaged.DW['DW: 36-37'] 				= set_combine(sets.engaged.DW['DW: 38'], 					{ammo="Yamarang",
												head=AF_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=HercDWHands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=HercDWlegs,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 36-37'] 	= set_combine(sets.engaged.DW['DW: 36-37'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 36-37'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 36-37'] 				= set_combine(sets.engaged.DW.DT['DW: 38'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 36-37'] 	= set_combine(sets.engaged.DW.DT['DW: 36-37'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 36-37'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 36-37'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 36-37']	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 36-37'], 	{})
	
	sets.engaged.DW['DW: 36-37']['SD'] 				= set_combine(sets.engaged.DW['DW: 36-37'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD'] 	= set_combine(sets.engaged.DW['DW: 36-37']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37']['SD'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD'], 	{})
	
	sets.engaged.DW['DW: 36-37']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 36-37'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 36-37']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 36-37']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 36-37']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 36-37']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 36-37'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 36-37']['SD']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 36-37']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 36-37'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 36-37']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 36-37']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 36-37']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 36-37']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 36-37'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 36-37']['SD']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 36-37']['SD']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 36-37']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 36-37']['SD']['Mythic AM3'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------		
	-- Custom melee group: low Haste ('DW: 34-35')-        
	--------------------------------------------           
	
	sets.engaged.DW['DW: 34-35'] 				= set_combine(sets.engaged.DW['DW: 36-37'], 				{ammo="Yamarang",
												head=AF_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDWFeet})
	sets.engaged.DW['Ilvl~118']['DW: 34-35'] 	= set_combine(sets.engaged.DW['DW: 34-35'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 34-35'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 34-35'] 				= set_combine(sets.engaged.DW.DT['DW: 36-37'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 34-35']		= set_combine(sets.engaged.DW.DT['DW: 34-35'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 34-35']		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 34-35'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 34-35']	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 34-35'], 	{})
	
	sets.engaged.DW['DW: 34-35']['SD'] 				= set_combine(sets.engaged.DW['DW: 34-35'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD'] 	= set_combine(sets.engaged.DW['DW: 34-35']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD']	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35']['SD'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD'], 	{})
	
	sets.engaged.DW['DW: 34-35']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 34-35'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 34-35']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 34-35']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 34-35']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 34-35']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 34-35'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 34-35']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 34-35']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 34-35'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 34-35']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 34-35']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 34-35']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 34-35']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 34-35'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 34-35']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 34-35']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 34-35']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 34-35']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste ('DW: 31-33')-         
	--------------------------------------------            
	
	sets.engaged.DW['DW: 31-33'] 				= set_combine(sets.engaged.DW['DW: 34-35'], 				{ammo="Yamarang",
												head=AF_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=HercDWHands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 31-33'] 	= set_combine(sets.engaged.DW['DW: 31-33'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 31-33'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 31-33'] 				= set_combine(sets.engaged.DW.DT['DW: 34-35'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 31-33'] 	= set_combine(sets.engaged.DW.DT['DW: 31-33'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 31-33'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 31-33'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 31-33']	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 31-33'], 	{})
	
	sets.engaged.DW['DW: 31-33']['SD'] 				= set_combine(sets.engaged.DW['DW: 31-33'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD'] 	= set_combine(sets.engaged.DW['DW: 31-33']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33']['SD'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD'], 	{})
	
	sets.engaged.DW['DW: 31-33']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 31-33'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 31-33']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 31-33']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 31-33']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 31-33']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 31-33'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 31-33']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 31-33']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 31-33'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 31-33']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 31-33']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 31-33']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 31-33']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 31-33'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 31-33']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 31-33']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 31-33']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 31-33']['SD']['Mythic AM3'], 	{})
		
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste ('DW: 28-30')-         
	--------------------------------------------            
	
	sets.engaged.DW['DW: 28-30'] 				= set_combine(sets.engaged.DW['DW: 31-33'], 				{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=HercDWlegs,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 28-30'] 	= set_combine(sets.engaged.DW['DW: 28-30'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 28-30'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 28-30']						= set_combine(sets.engaged.DW.DT['DW: 31-33'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 28-30'] 		= set_combine(sets.engaged.DW.DT['DW: 28-30'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 28-30'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 28-30'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 28-30'] 		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 28-30'], 	{})
	
	sets.engaged.DW['DW: 28-30']['SD']					= set_combine(sets.engaged.DW['DW: 28-30'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD'] 		= set_combine(sets.engaged.DW['DW: 28-30']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD'], 	{})
	
	sets.engaged.DW['DW: 28-30']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 28-30'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 28-30']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 28-30']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 28-30']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 28-30']['SD']['Emp AM3']					= set_combine(sets.engaged.DW['DW: 28-30'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 28-30']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 28-30']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 28-30'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 28-30']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 28-30']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 28-30']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 28-30']['SD']['Mythic AM3']					= set_combine(sets.engaged.DW['DW: 28-30'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 28-30']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 28-30']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 28-30']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 28-30']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste ('DW: 25-27')-          
	--------------------------------------------            
	
	sets.engaged.DW['DW: 25-27'] 				= set_combine(sets.engaged.DW['DW: 28-30'], 				{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Empy_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']  	= set_combine(sets.engaged.DW['DW: 25-27'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 25-27'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 25-27'] 					= set_combine(sets.engaged.DW.DT['DW: 28-30'],	 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 25-27']		  	= set_combine(sets.engaged.DW.DT['DW: 25-27'],	 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 25-27']			= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 25-27'],	 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 25-27']	  	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 25-27'],	 	{})
	
	sets.engaged.DW['DW: 25-27']['SD'] 					= set_combine(sets.engaged.DW['DW: 25-27'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD']  	= set_combine(sets.engaged.DW['DW: 25-27']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD']		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']['SD']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD'], 	{})
	
	sets.engaged.DW['DW: 25-27']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 25-27'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']['Emp AM3']  	= set_combine(sets.engaged.DW['DW: 25-27']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 25-27']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']['Emp AM3']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 25-27']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 25-27'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD']['Emp AM3']  		= set_combine(sets.engaged.DW['DW: 25-27']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']['SD']['Emp AM3']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 25-27']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 25-27'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']['Mythic AM3']  	= set_combine(sets.engaged.DW['DW: 25-27']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 25-27']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']['Mythic AM3']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 25-27']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 25-27'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD']['Mythic AM3']  		= set_combine(sets.engaged.DW['DW: 25-27']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 25-27']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 25-27']['SD']['Mythic AM3']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 25-27']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 21-24')         
	---------------------------------------------           
	
	sets.engaged.DW['DW: 21-24'] 				= set_combine(sets.engaged.DW['DW: 25-27'], 				{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Empy_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 21-24'] 	= set_combine(sets.engaged.DW['DW: 21-24'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 21-24'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 21-24'] 				= set_combine(sets.engaged.DW.DT['DW: 25-27'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 21-24'] 	= set_combine(sets.engaged.DW.DT['DW: 21-24'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 21-24']		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 21-24'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 21-24'] 	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 21-24'], 	{})
	
	sets.engaged.DW['DW: 21-24']['SD'] 					= set_combine(sets.engaged.DW['DW: 21-24'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD'] 		= set_combine(sets.engaged.DW['DW: 21-24']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD']		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD'], 	{})
	
	sets.engaged.DW['DW: 21-24']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 21-24'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 21-24']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 21-24']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 21-24']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 21-24']['SD']['Emp AM3']					= set_combine(sets.engaged.DW['DW: 21-24'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 21-24']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 21-24']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 21-24'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 21-24']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 21-24']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 21-24']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 21-24']['SD']['Mythic AM3']					= set_combine(sets.engaged.DW['DW: 21-24'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 21-24']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 21-24']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 21-24']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 21-24']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 20')            
	---------------------------------------------           
	
	sets.engaged.DW['DW: 20'] 					= set_combine(sets.engaged.DW['DW: 21-24'], 				{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Suppanomimi", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 20'] 		= set_combine(sets.engaged.DW['DW: 20'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 20'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20'], 		{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 20'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20'], 		{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 20'] 					= set_combine(sets.engaged.DW.DT['DW: 21-24'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 20'] 		= set_combine(sets.engaged.DW.DT['DW: 20'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 20'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 20'], 		{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 20'] 		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 20'], 		{})
	
	sets.engaged.DW['DW: 20']['SD'] 					= set_combine(sets.engaged.DW['DW: 20'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 20']['SD'] 		= set_combine(sets.engaged.DW['DW: 20']['SD'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 20']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20']['SD'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 20']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20']['SD'], 		{})
	
	sets.engaged.DW['DW: 20']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 20'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 20']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 20']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 20']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 20']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 20']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 20'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 20']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 20']['SD']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 20']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20']['SD']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 20']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20']['SD']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 20']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 20'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 20']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 20']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 20']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 20']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20']['Mythic AM3'], 		{})
	
	sets.engaged.DW['DW: 20']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 20'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 20']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 20']['SD']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 20']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 20']['SD']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 20']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 20']['SD']['Mythic AM3'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 19')            
	---------------------------------------------           
	
	sets.engaged.DW['DW: 19'] 					= set_combine(sets.engaged.DW['DW: 20'], 					{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDWFeet})
	sets.engaged.DW['Ilvl~118']['DW: 19'] 		= set_combine(sets.engaged.DW['DW: 19'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 19'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19'], 		{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 19'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19'], 		{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 19']	 				= set_combine(sets.engaged.DW.DT['DW: 20'],						{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 19'] 		= set_combine(sets.engaged.DW.DT['DW: 19'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 19'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 19'], 		{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 19'] 		= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 19'], 		{})
	
	sets.engaged.DW['DW: 19']['SD'] 					= set_combine(sets.engaged.DW['DW: 19'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 19']['SD'] 		= set_combine(sets.engaged.DW['DW: 19']['SD'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 19']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19']['SD'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 19']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19']['SD'], 		{})
	
	sets.engaged.DW['DW: 19']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 19'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 19']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 19']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 19']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 19']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 19']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 19'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 19']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 19']['SD']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 19']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19']['SD']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 19']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19']['SD']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 19']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 19'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 19']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 19']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 19']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 19']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19']['Mythic AM3'], 		{})
	
	sets.engaged.DW['DW: 19']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 19'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 19']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 19']['SD']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 19']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 19']['SD']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 19']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 19']['SD']['Mythic AM3'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 16-18')         
	---------------------------------------------           
	
	sets.engaged.DW['DW: 16-18'] 				= set_combine(sets.engaged.DW['DW: 19'], 					{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=HercDWHands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 16-18'] 	= set_combine(sets.engaged.DW['DW: 16-18'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 16-18'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 16-18'] 				= set_combine(sets.engaged.DW.DT['DW: 19'], 					{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 16-18'] 	= set_combine(sets.engaged.DW.DT['DW: 16-18'],	 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 16-18'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 16-18'], 		{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 16-18']	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 16-18'], 		{})
	
	sets.engaged.DW['DW: 16-18']['SD'] 				= set_combine(sets.engaged.DW['DW: 16-18'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD'] 	= set_combine(sets.engaged.DW['DW: 16-18']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18']['SD'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD'], 	{})
	
	sets.engaged.DW['DW: 16-18']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 16-18'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 16-18']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 16-18']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 16-18']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 16-18']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 16-18'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 16-18']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 16-18']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 16-18'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 16-18']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 16-18']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 16-18']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 16-18']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 16-18'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 16-18']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 16-18']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 16-18']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 16-18']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 13-15')         
	---------------------------------------------           
	
	sets.engaged.DW['DW: 13-15'] 				= set_combine(sets.engaged.DW['DW: 16-18'], 				{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDW,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 13-15'] 	= set_combine(sets.engaged.DW['DW: 13-15'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 13-15'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 13-15'] 				= set_combine(sets.engaged.DW.DT['DW: 16-18'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 13-15'] 	= set_combine(sets.engaged.DW.DT['DW: 13-15'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 13-15'] 	= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 13-15'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 13-15']	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 13-15'], 	{})
	
	sets.engaged.DW['DW: 13-15']['SD'] 				= set_combine(sets.engaged.DW['DW: 13-15'], 					{})
	sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD'] 	= set_combine(sets.engaged.DW['DW: 13-15']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15']['SD'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD'], 	{})
	
	sets.engaged.DW['DW: 13-15']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 13-15'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 13-15']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 13-15']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 13-15']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 13-15']['SD']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 13-15'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 13-15']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15']['SD']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 13-15']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 13-15'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 13-15']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 13-15']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 13-15']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 13-15']['SD']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 13-15'], 							{})
	sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 13-15']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 13-15']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 13-15']['SD']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 13-15']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 9-12')          
	---------------------------------------------           
	
	sets.engaged.DW['DW: 9-12'] 				= set_combine(sets.engaged.DW['DW: 13-15'],					{ammo="Yamarang",
												head=Adhemar_head,Neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=AF_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDD,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})	 				
	sets.engaged.DW['Ilvl~118']['DW: 9-12'] 	= set_combine(sets.engaged.DW['DW: 9-12'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 9-12'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12'], 	{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12'], 	{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 9-12'] 					= set_combine(sets.engaged.DW.DT['DW: 13-15'], 				{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 9-12'] 		= set_combine(sets.engaged.DW.DT['DW: 9-12'], 				{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 9-12'] 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 9-12'], 	{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 9-12'] 	= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 9-12'], 	{})
	
	sets.engaged.DW['DW: 9-12']['SD'] 					= set_combine(sets.engaged.DW['DW: 9-12'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD'] 		= set_combine(sets.engaged.DW['DW: 9-12']['SD'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12']['SD'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD'], 	{})
	
	sets.engaged.DW['DW: 9-12']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 9-12'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 9-12']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 9-12']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 9-12']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12']['Emp AM3'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 9-12']['SD']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 9-12'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 9-12']['SD']['Emp AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD']['Emp AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD']['Emp AM3'], 	{})
	
	sets.engaged.DW['DW: 9-12']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 9-12'], 						{})
	sets.engaged.DW['Ilvl~118']['DW: 9-12']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 9-12']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 9-12']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12']['Mythic AM3'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12']['Mythic AM3'], 	{})
	
	sets.engaged.DW['DW: 9-12']['SD']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 9-12'], 								{})
	sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 9-12']['SD']['Mythic AM3'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 9-12']['SD']['Mythic AM3'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 9-12']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 9-12']['SD']['Mythic AM3'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste ('DW: 0-8')        
	-----------------------------------------           
	
	sets.engaged.DW['DW: 0-8'] 				= set_combine(sets.engaged.DW['DW: 9-12'],					{ammo="Yamarang",
												head=Adhemar_head,neck="Anu Torque",left_ear="Sherida Earring",right_ear="Brutal Earring", 
												body=Adhemar_body,hands=Adhemar_hands,left_ring="Epona's Ring",right_ring="Moonbeam Ring",
												back=BackDD,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=HercDDFeet})
	sets.engaged.DW['Ilvl~118']['DW: 0-8'] 	= set_combine(sets.engaged.DW['DW: 0-8'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122']['DW: 0-8'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8'], 		{head=AF_head,Hands=AF_hands})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8'] = set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8'], 		{body=AF_body,Legs=AF_legs,Feet=AF_feet})
	
	sets.engaged.DW.DT['DW: 0-8']	 					= set_combine(sets.engaged.DW.DT['DW: 9-12'],					{})
	sets.engaged.DW['Ilvl~118'].DT['DW: 0-8']	 		= set_combine(sets.engaged.DW.DT['DW: 0-8'], 					{Neck="Sanctity Necklace",Right_ear="Zennaroi earring"})
	sets.engaged.DW['Ilvl~122'].DT['DW: 0-8']	 		= set_combine(sets.engaged.DW['Ilvl~118'].DT['DW: 0-8'], 		{head=AF_head,Body=AF_body})
	sets.engaged.DW['Ilvl~124+'].DT['DW: 0-8'] 			= set_combine(sets.engaged.DW['Ilvl~122'].DT['DW: 0-8'], 		{})
	
	sets.engaged.DW['DW: 0-8']['SD'] 				= set_combine(sets.engaged.DW['DW: 0-8'],							{})
	sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD'] 	= set_combine(sets.engaged.DW['DW: 0-8']['SD'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8']['SD'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD'], 		{})
	
	sets.engaged.DW['DW: 0-8']['Emp AM3'] 					= set_combine(sets.engaged.DW['DW: 0-8'],							{})
	sets.engaged.DW['Ilvl~118']['DW: 0-8']['Emp AM3'] 		= set_combine(sets.engaged.DW['DW: 0-8']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 0-8']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8']['Emp AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 0-8']['SD']['Emp AM3'] 				= set_combine(sets.engaged.DW['DW: 0-8'],								{})
	sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['DW: 0-8']['SD']['Emp AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD']['Emp AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8']['SD']['Emp AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD']['Emp AM3'], 		{})
	
	sets.engaged.DW['DW: 0-8']['Mythic AM3'] 					= set_combine(sets.engaged.DW['DW: 0-8'],							{})
	sets.engaged.DW['Ilvl~118']['DW: 0-8']['Mythic AM3'] 		= set_combine(sets.engaged.DW['DW: 0-8']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 0-8']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8']['Mythic AM3'] 		= set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8']['Mythic AM3'], 		{})
	
	sets.engaged.DW['DW: 0-8']['SD']['Mythic AM3'] 				= set_combine(sets.engaged.DW['DW: 0-8'],								{})
	sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['DW: 0-8']['SD']['Mythic AM3'], 					{})
	sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 0-8']['SD']['Mythic AM3'], 		{})
	sets.engaged.DW['Ilvl~124+']['DW: 0-8']['SD']['Mythic AM3'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 0-8']['SD']['Mythic AM3'], 		{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------
	-- Buff Sets and Miscelanie
	---------------------------------------	
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back= CP_Cape}
			
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(2,13)
	send_command('input /lockstyleset 2')
end
 