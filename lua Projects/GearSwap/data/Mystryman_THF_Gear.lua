 
function init_gear_sets()

	print('Mystryman_THF_Gear.lua sidecar load')

	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	 Shijo_DW				={ name="Shijo", augments={'DEX+15','"Dual Wield"+5','"Triple Atk."+2',}}
	
	Herc_head_Acc			={ name="Herculean Helm", augments={'"Occult Acumen"+3','Accuracy+24','Accuracy+17 Attack+17',}}
	
	Herc_body_TH			={ name="Herculean Vest", augments={'Pet: "Store TP"+6','Mag. Acc.+19','"Treasure Hunter"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	Herc_hands_TH		={ name="Herculean Gloves", augments={'Rng.Atk.+21','DEX+6','"Treasure Hunter"+2','Accuracy+20 Attack+20','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	
	Herc_hands_WSD		={ name="Herculean Gloves", augments={'Weapon skill damage +4%','DEX+8','Attack+6',}}
	Herc_legs_WSD		={ name="Herculean Trousers", augments={'Accuracy+27','Weapon skill damage +3%','DEX+4',}}
	
	Herc_legs_Refresh	={ name="Herculean Trousers", augments={'Pet: Phys. dmg. taken -1%','INT+1','"Refresh"+2','Accuracy+10 Attack+10',}}
	
	Herc_head_TA			={ name="Herculean Helm", augments={'Attack+29','"Triple Atk."+3','AGI+6','Accuracy+6',}}
	Herc_body_TA			={ name="Herculean Vest", augments={'Rng.Atk.+22','"Triple Atk."+4','STR+3','Accuracy+12',}}
	Herc_hands_TA			={ name="Herculean Gloves", augments={'Accuracy+12 Attack+12','"Triple Atk."+2','AGI+7','Accuracy+12',}}
	Herc_feet_TA			={ name="Herculean Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','Accuracy+9',}}
	
	Lustratio_head		 	= {name = "Lustratio Cap"}
	Lustratio_body 			= {name = "Lustratio Cap"}
	
	Adhemar_head_Acc 		={ name="Adhemar Bonnet"}
	Adhemar_hands_Acc		={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	WSD_Cape		={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	Crit_R_Cape		={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	
	AF_head		= "Pill. Bonnet +2"
	AF_body       = "Pillager's Vest +2"
	AF_hands      = "Pill. Armlets +2"
	AF_legs         = "Pill. Culottes +2"
	AF_feet         = "Pill. Poulaines +2"
	
	Relic_head 		= ""
	Relic_Body 		= ""
	Relic_hands		={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
	Relic_legs			=	""
	Relic_feet			=	""
	
	Empy_head		=	"Raid. Bonnet +1"
	Empy_body		=	"Raider's Vest +1"
	Empy_hands		=	"Skulk. Armlets +1"
	Empy_legs		=	"Raider's Culottes +1"
	Empy_feet		=	"Skulk. Poulaines +1"
	
	CP_Cape={ name="Mecisto. Mantle", augments={'Cap. Point+35%','MP+29','"Mag.Atk.Bns."+1','DEF+11',}}
	--Moonshade_Ear	={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	                                                 
	--gear.TP_Bonus_Ear = Moonshade_Ear
	gear.TP_Bonus_Ear = {name="Mache Earring"}
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
														
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------

    sets.TreasureHunter = {head="White Rarab cap +1",body=Herc_body_TH,hands=Relic_hands,waist="Chaac Belt",feet=Empy_feet}
    sets.Kiting = {feet="Jute Boots +1"}
	
	-- these no longer need to be filled in really, as no one SA's or TA's without WS
    sets.buff['Sneak Attack'] = {
		ammo="Yetshila", 
		head=AF_head, neck="Caro Necklace", ear1="Mache Earring", ear2="Mache Earring", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Ilabrat Ring", ring2="Karieyh Ring", 
		back=Crit_R_Cape, waist="Grunfeld Rope", legs=Herc_legs_WSD, feet="Meg. Jam. +1" }

    sets.buff['Trick Attack'] = {
		ammo="Yetshila", 
		head=AF_head, neck="Caro Necklace", ear1="Mache Earring", ear2="Mache Earring", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Ilabrat Ring", ring2="Karieyh Ring", 
		back=Crit_R_Cape, waist="Grunfeld Rope", legs=Herc_legs_WSD, feet="Meg. Jam. +1", }
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
    sets.precast.JA['Flee'] = {feet=AF_feet}
    sets.precast.JA['Hide'] = {body=AF_body}
    sets.precast.JA['Conspirator'] = {}
    sets.precast.JA['Steal'] = {neck="Pentalagus Charm",hands="Thief's Kote",waist="Key Ring Belt",feet=AF_feet}
    sets.precast.JA['Despoil'] = {}
    sets.precast.JA['Perfect Dodge'] = {hands=Relic_hands}
    sets.precast.JA['Feint'] = {}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {body="Passion Jacket"}

    -- Fast cast sets for spells
	sets.precast.FC = {ammo="Impatiens",ear1="Loquacious Earring",ring1="Prolix Ring",}
	
    -- sets.precast.FC = {ammo="Impatiens",
		-- head=Herc_head_TA,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		-- body="Foppish Tunica",hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
		-- legs=Rawhide_legs,feet=Herc_feet_FC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads", body="Passion Jacket"})

    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret +1",waist="Impulse Belt",feet='Meghanada Jambeaux +1'} -- legs=Adhemar_legs,
	----------------------
    -- Weaponskill sets
	----------------------
	
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Yetshila", 
		head=AF_head, neck=gear.ElementalGorget, ear1="Mache Earring", ear2="Mache Earring", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Ilabrat Ring", ring2="Karieyh Ring", 
		back=WSD_Cape, waist=gear.ElementalBelt, legs=Herc_legs_WSD, feet="Meg. Jam. +1", }
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	sets.precast.WS.SA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.TA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.SATA 			= set_combine(sets.precast.WS, 				{})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] 						= set_combine(sets.precast.WS, {ammo="Seething Bomblet",
																					head=Adhemar_head_Acc,ear1="Brutal Earring", 
																					hands=Herc_hands_TA,
																					legs="Meg. Chausses +1",feet=Herc_feet_TA})
    sets.precast.WS['Exenterator']['Ilvl~118'] 	= set_combine(sets.precast.WS['Exenterator'], {})
	sets.precast.WS['Exenterator']['Ilvl~122'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~118'], {})
	sets.precast.WS['Exenterator']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~122'], {})
    sets.precast.WS['Exenterator'].SA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA 				= set_combine(sets.precast.WS['Exenterator'].SA , {})
    sets.precast.WS['Exenterator'].SATA 			= set_combine(sets.precast.WS['Exenterator'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Dancing Edge'] 						= set_combine(sets.precast.WS, {ammo="Seething Bomblet",
																					head=Adhemar_head_Acc,ear1="Brutal Earring", 
																					hands=Herc_hands_TA,
																					legs="Meg. Chausses +1",feet=Herc_feet_TA})
    sets.precast.WS['Dancing Edge']['Ilvl~118'] 		= set_combine(sets.precast.WS['Dancing Edge'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~122'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~118'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~122'], {})
    sets.precast.WS['Dancing Edge'].SA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].TA 					= set_combine(sets.precast.WS['Dancing Edge'].SA , {})
    sets.precast.WS['Dancing Edge'].SATA 				= set_combine(sets.precast.WS['Dancing Edge'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Evisceration'] 							= set_combine(sets.precast.WS, {head=Adhemar_head_Acc, back=Crit_R_Cape})
    sets.precast.WS['Evisceration']['Ilvl~118'] 		= set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration']['Ilvl~122'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~118'], {})
	sets.precast.WS['Evisceration']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~122'], {})
    sets.precast.WS['Evisceration'].SA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA 					= set_combine(sets.precast.WS['Evisceration'].SA , {})
    sets.precast.WS['Evisceration'].SATA 				= set_combine(sets.precast.WS['Evisceration'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {ammo="Yetshila", 
																				head=AF_head, neck="Caro Necklace", ear1="Mache Earring", ear2="Mache Earring", 
																				body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Ilabrat Ring", ring2="Karieyh Ring", 
																				back=WSD_Cape, waist="Grunfeld Rope", legs=Herc_legs_WSD, feet="Meg. Jam. +1", })
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 	= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 	= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 	= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"].SA 				= set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].TA 				= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
    sets.precast.WS["Rudra's Storm"].SATA 			= set_combine(sets.precast.WS["Rudra's Storm"].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Shark Bite"] 							= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shark Bite']['Ilvl~118'] 			= set_combine(sets.precast.WS["Shark Bite"], {})
	sets.precast.WS['Shark Bite']['Ilvl~122'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~118'], {})
	sets.precast.WS['Shark Bite']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Shark Bite']['Ilvl~122'], {})
    sets.precast.WS['Shark Bite'].SA 						= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].TA 						= set_combine(sets.precast.WS['Shark Bite'].SA , {})
    sets.precast.WS['Shark Bite'].SATA 					= set_combine(sets.precast.WS['Shark Bite'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Mandalic Stab'] 						= set_combine(sets.precast.WS, {ammo="Yetshila", 
																				head=AF_head, neck="Caro Necklace", ear1="Mache Earring", ear2="Mache Earring", 
																				body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Ilabrat Ring", ring2="Karieyh Ring", 
																				back=WSD_Cape, waist="Grunfeld Rope", legs=Herc_legs_WSD, feet="Meg. Jam. +1", })
    sets.precast.WS['Mandalic Stab']['Ilvl~118'] 		= set_combine(sets.precast.WS['Mandalic Stab'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~122'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~118'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~122'], {})
    sets.precast.WS['Mandalic Stab'].SA 					= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].TA 					= set_combine(sets.precast.WS['Mandalic Stab'].SA , {})
    sets.precast.WS['Mandalic Stab'].SATA 				= set_combine(sets.precast.WS['Mandalic Stab'].SA , {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head=Herc_head_Acc,ear1="Loquacious Earring",ring1="Prolix Ring",}

    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
		ammo="Staunch Tathlum",
		head="Turms Cap", neck="Sanctity Necklace",
		body="Turms Harness", hands="Turms Mittens", ring1="Moonbeam Ring", ring2="Defending Ring", 
		back="Moonbeam Cape", waist="Flume Belt", legs="Turms Subligar", feet="Turms Leggings" }

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		ammo="Staunch Tathlum",
		head="Turms Cap",neck="Sanctity Necklace",
		body="Turms Harness", hands="Turms Mittens",ring1="Moonbeam Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Turms Subligar", feet="Turms Leggings"}

    sets.idle.Weak = {
		ammo="Staunch Tathlum",
		head="Turms Cap",neck="Sanctity Necklace",
		body="Turms Harness", hands="Turms Mittens",ring1="Moonbeam Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Turms Subligar", feet="Turms Leggings"}

    -- Defense sets

    sets.defense.Evasion = {
        ammo="Amar Cluster", 
		head="Turms Cap", neck="Combatant's Torque", ear1="Assuage Earring", ear2="Bladeborn Earring", 
		body="Turms Harness", hands="Turms Mittens", ring1="Ilabrat Ring", ring2="Defending Ring", 
		back="Moonbeam Cape", waist="Yemaya Belt", legs="Turms Subligar", feet="Turms Leggings", }
	
    sets.defense.PDT = {
		ammo="Staunch Tathlum", 
		head="Meghanada Visor", neck="Twilight Torque", ear1="Steelflash Earring", ear2="Bladeborn Earring", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Moonbeam Ring", ring2="Defending Ring", 
		back="Moonbeam Cape", waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +1", }
	
	-- only at 31% MDT
    sets.defense.MDT = {
		ammo="Staunch Tathlum",
		neck="Twilight Torque",
		ring1="Moonbeam Ring", ring2="Defending Ring", 
		back="Moonbeam Cape",}

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
	
	sets.engaged 				= {ammo="Ginsen",
										head="Adhemar Bonnet", neck="Combatant's Torque", ear1="Mache Earring", ear2="Dedition Earring", 
										body="Meg. Cuirie +2", hands="Pill. Armlets +2", ring1="Ilabrat Ring", ring2="Epona's Ring", 
										back=Crit_R_Cape, waist="Windbuffet Belt", legs=AF_legs, feet=Herc_feet_TA}
    sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged, 			{})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'], {waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {})
	
	-- evasion sets
	sets.engaged.Evasion 				= set_combine(sets.engaged,{})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, {})
	sets.engaged['Ilvl~122'].Evasion 	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})

	---------------------------------------------------------------------------------------------------
    -- Custom melee group: low to no haste (41+% DW)
	---------------------------------------------------------------------------------------------------
	sets.engaged['DW: 37+'] 						= set_combine(sets.engaged, 										{ear1="Suppanomimi",})
	sets.engaged['Ilvl~118']['DW: 37+'] 	= set_combine(sets.engaged['DW: 37+'], 					{})
	sets.engaged['Ilvl~122']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 37+'], 	{})
	sets.engaged['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'], 	{waist="Grunfeld Rope"})
	
	-- evasion sets
	sets.engaged['DW: 37+'].Evasion 				= set_combine(sets.engaged.Evasion,											{})
	sets.engaged['Ilvl~118']['DW: 37+'].Evasion 	= set_combine(sets.engaged['DW: 37+'].Evasion, 					{})
	sets.engaged['Ilvl~122']['DW: 37+'].Evasion		= set_combine(sets.engaged['Ilvl~118']['DW: 37+'].Evasion,	{})
	sets.engaged['Ilvl~124+']['DW: 37+'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'].Evasion,	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (11% DW)              
	---------------------------------------------           
	
	sets.engaged['DW: 6-11'] 				= set_combine(sets.engaged['DW: 37+'] , 						{ammo="Ginsen",
																								head="Adhemar Bonnet", neck="Combatant's Torque", ear1="Mache Earring", ear2="Dedition Earring", 
																								body="Meg. Cuirie +2", hands="Pill. Armlets +2", ring1="Ilabrat Ring", ring2="Epona's Ring", 
																								back=Crit_R_Cape, waist="Windbuffet Belt", legs=AF_legs, feet=Herc_feet_TA})
	sets.engaged['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged['DW: 6-11'], 					{})
	sets.engaged['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'], 	{})
	sets.engaged['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'], 	{waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 6-11'].Evasion 				= set_combine(sets.engaged['DW: 37+'] .Evasion, 							{})
	sets.engaged['Ilvl~118']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['DW: 6-11'].Evasion, 						{})
	sets.engaged['Ilvl~122']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'].Evasion, 		{})
	sets.engaged['Ilvl~124+']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (-2% DW)            
	-----------------------------------------           
	
	sets.engaged['DW: 5-0'] 				= set_combine(sets.engaged['DW: 6-11'],						{hands="Mummu Wrists +2"})
	sets.engaged['Ilvl~118']['DW: 5-0'] 	= set_combine(sets.engaged['DW: 5-0'], 						{})
	sets.engaged['Ilvl~122']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'], 	{})
	sets.engaged['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'], {waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 5-0'].Evasion 					= set_combine(sets.engaged['DW: 6-11'].Evasion , 							{})
	sets.engaged['Ilvl~118']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['DW: 5-0'].Evasion, 						{})
	sets.engaged['Ilvl~122']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'].Evasion, 		{})
	sets.engaged['Ilvl~124+']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'].Evasion, 	{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	----------------------
	-- Miscealeus sets
	----------------------
	
	--sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doom = {ring1="Ephedra Ring",ring2="Ephedra Rin"}
	sets.CP = {back=CP_Cape}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
	set_macro_page(1, 3)
	
end