 
function init_gear_sets()

	print('Colway_THF_Gear.lua sidecar load')

	--------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {hands="Plunderer's Armlets +1", feet="Raider's Poulaines +2"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	sets.ExtraRegenTwo = {hands="Garden bangles"}
    sets.Kiting = {feet="Fajin Boots"}

    sets.buff['Sneak Attack'] = {
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet +1",neck="Moepapa Medal",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Pillager's Vest +1",hands="Raider's Armlets +2",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Wanion Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    sets.buff['Trick Attack'] = {
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet +1",neck="Moepapa Medal",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Dumakulem's Ring",ring2="Stormsoul Ring",
		back="Ik Cape",waist="Windbuffet Belt +1",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
	sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines +1"}
    sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
    sets.precast.JA['Steal'] = {head="Assassin's Bonnet +2",neck="Pentalagus Charm",hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines"}
    sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {legs="Plunderer's Culottes"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Uk'uxkaj cap",
		body="Iuitl Vest",hands="Buremte Gloves",
		back="Iximulew Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head="Haruspex Hat",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Dread Jupon",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs="Enif Cosciales"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret +1",hands="Iuitl Wristbands +1",waist="Impulse Belt",legs="Nahtirah Trousers"}
	----------------------
    -- Weaponskill sets
	----------------------
	
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Yetshila",
		head="Pillager's Bonnet +1",neck=gear.ElementalGorget,ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist=gear.ElementalBelt,legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, {ammo="Honed Tathlum"})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
	sets.precast.WS.SA 	 			= set_combine(sets.precast.WS, {})
	sets.precast.WS.TA 	 			= set_combine(sets.precast.WS, {})
	sets.precast.WS.SATA 			= set_combine(sets.precast.WS, {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] 					= set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",neck="Justiciar's torque",hands="Iuitl Wristbands +1",ring2="Stormsoul Ring",feet="Iuitl Gaiters"})
    sets.precast.WS['Exenterator']['Ilvl~118'] 		= set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Exenterator']['Ilvl~122'] 		= set_combine(sets.precast.WS['Exenterator']['Ilvl~118'], {})
	sets.precast.WS['Exenterator']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~122'], {})
    sets.precast.WS['Exenterator'].SA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA 				= set_combine(sets.precast.WS['Exenterator'], {hands="Pillager's Armlets +1"})
    sets.precast.WS['Exenterator'].SATA 			= set_combine(sets.precast.WS['Exenterator'], {hands="Pillager's Armlets +1"})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Dancing Edge'] 					= set_combine(sets.precast.WS, {head="Pillager's Bonnet +1"})
    sets.precast.WS['Dancing Edge']['Ilvl~118'] 		= set_combine(sets.precast.WS['Dancing Edge'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Dancing Edge']['Ilvl~122'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~118'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~122'], {})
    sets.precast.WS['Dancing Edge'].SA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].TA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SATA 				= set_combine(sets.precast.WS['Dancing Edge'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Evisceration'] 					= set_combine(sets.precast.WS, {
															ammo="Yetshila",
															head="uk'uxkaj Cap",neck="Nefarious Collar",ear1="Pixie Earring",ear2="Brutal Earring",
															body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
															back="Rancorous Mantle",waist="Wanion Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"})
    sets.precast.WS['Evisceration']['Ilvl~118'] 		= set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration']['Ilvl~122'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~118'], {})
	sets.precast.WS['Evisceration']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~122'], {})
    sets.precast.WS['Evisceration'].SA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SATA 				= set_combine(sets.precast.WS['Evisceration'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {
															ammo="Yetshila",
															head="Pillager's Bonnet +1",neck=gear.ElementalGorget,ear1="Moonshade Earring",ear2="Pixie Earring",
															body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Ramuh Ring",
															back="Cavaros Mantle",waist="Artful Belt +1",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"})
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Rudra's Storm"], {back="Kayapa Cape"})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"].SA 				= set_combine(sets.precast.WS["Rudra's Storm"], {neck=gear.ElementalGorget,ear2="Thunder Pearl",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Kayapa Cape",waist="Artful Belt +1"})
    sets.precast.WS["Rudra's Storm"].TA 				= set_combine(sets.precast.WS["Rudra's Storm"], {neck=gear.ElementalGorget,ear1="Bladeborn Earring",body="Plunderer's Vest",back="Cavaros Mantle",waist=gear.ElementalBelt})
    sets.precast.WS["Rudra's Storm"].SATA 				= set_combine(sets.precast.WS["Rudra's Storm"], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Shark Bite"] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shark Bite']['Ilvl~118'] 			= set_combine(sets.precast.WS["Shark Bite"], {})
	sets.precast.WS['Shark Bite']['Ilvl~122'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~118'], {})
	sets.precast.WS['Shark Bite']['Ilvl~124+'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~122'], {})
    sets.precast.WS['Shark Bite'].SA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].TA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SATA 					= set_combine(sets.precast.WS['Shark Bite'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Mandalic Stab'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Mandalic Stab']['Ilvl~118'] 		= set_combine(sets.precast.WS['Mandalic Stab'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~122'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~118'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~122'], {})
    sets.precast.WS['Mandalic Stab'].SA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].TA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].SATA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {
		head="Wayfarer Circlet",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Wayfarer Robe",hands="Buremte Gloves",ring1="Ramuh Ring",ring2="Rajas Ring",
		back="Toro Cape",waist="Aquiline Belt",legs="Shneddick Tights +1",feet="Qaaxo Leggings"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Felistris Mask",neck="Jeweled collar",eear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Dread Jupon",hands="Buremte Gloves",
		back="Canny Cape",waist="Dynamic Belt +1",legs="Enif cosciales",feet="Qaaxo Leggings"}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Felistris Mask",neck="Jeweled collar",ear2="Loquacious Earring",
		body="Dread Jupon",hands="Iuitl Wristbands +1",
		back="Canny Cape",waist="Dynamic Belt +1",legs="Enif cosciales",feet="Qaaxo Leggings"}

    -- Ranged gear
    sets.midcast.RA = {
        head="Pillager's Bonnet +1",neck="Ocachi Gorget",ear1="Clearview Earring",ear2="Volley Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands +1",ring1="Paqichikaji Ring",ring2="Hajduk Ring",
		back="Libeccio Mantle",waist="Aquiline Belt",legs="Aetosaur Trousers",feet="Scopuli Nails +1"}

    sets.midcast.RA.Acc = {
        head="Pillager's Bonnet +1",neck="Iqabi Necklace",ear1="Clearview Earring",ear2="Volley Earring",
		body="Iuitl Vest",hands="Buremte Gloves",ring1="Paqichikaji Ring",ring2="Hajduk Ring",
		back="Libeccio Mantle",waist="Aquiline Belt",legs="Nahtirah Trousers",feet="Scopuli Nails +1"}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Thew Bomblet",
		head="Ocelomeh headpiece +1",neck="Wiglen Gorget",ear1="Ethereal Earring",ear2="Phawaylla Earring",
		body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Flume Belt +1",legs="Iuitl Tights",feet="Qaaxo Leggings"}

    sets.idle.Town = {
		head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Enif cosciales",feet="Scopuli Nails +1"}

    sets.idle.Weak = {ammo="Thew Bomblet",
		head="Ocelomeh headpiece +1",neck="Wiglen Gorget",ear1="Ethereal Earring",ear2="Phawaylla Earring",
		body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Flume Belt +1",legs="Iuitl Tights",feet="Qaaxo Leggings"}

    -- Defense sets

    sets.defense.Evasion = {
        head="Felistris Mask",neck="Torero Torque",ear1="Phawaylla Earring",ear2="Evader Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Beeline Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Phasmida Belt",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
	
    sets.defense.PDT = {ammo="Iron Gobbet",
		head="Lithelimb Cap",neck="Twilight Torque",
		body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Iuitl Tights",feet="Qaaxo Leggings"}

    sets.defense.MDT = {ammo="Vanir Battery",
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Merman's earring",ear2="Merman's earring",
		body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}

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
	
	sets.engaged 				= {	ammo="Honed Tathlum",
									head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
									body="Thaumas Coat",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
									back="Bleating Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
    sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged, {body="Qaaxo Harness"})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'], {neck="Ej Necklace",back="Canny Cape"})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {head="Whirlpool Mask",neck="Ej Necklace",body="Qaaxo Harness",ring2="Beeline Ring",back="Canny Cape",waist="Anguinus Belt",feet="Qaaxo Leggings"})
	
	sets.engaged.Evasion 				= {	ammo="Thew Bomblet",
											head="Felistris Mask",neck="Torero Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
											body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
											back="Canny Cape",waist="Phasmida Belt",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, {head="Whirlpool Mask",feet="Iuitl Gaiters"})
	sets.engaged['Ilvl~122'].Evasion 	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})
	
	sets.engaged.PDT 				= {	ammo="Thew Bomblet",
										head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
										body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Epona's Ring",ring2="Defending Ring",
										back="Mollusca Mantle",waist="Patentia Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}
	sets.engaged['Ilvl~118'].PDT 	= set_combine(sets.engaged.PDT, {waist="Dynamic Belt +1"})
	sets.engaged['Ilvl~122'].PDT 	= set_combine(sets.engaged['Ilvl~118'].PDT, {})
	sets.engaged['Ilvl~124+'].PDT 	= set_combine(sets.engaged['Ilvl~122'].PDT, {})

	---------------------------------------------------------------------------------------------------
    ---------- ********   Custom melee group: High Haste (2x March or Haste)  ********* ---------------
	---------------------------------------------------------------------------------------------------
	sets.engaged.HighHaste					= {	ammo="Honed Tathlum",
												head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
												body="Thaumas Coat",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
												back="Bleating Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
    sets.engaged['Ilvl~118'].HighHaste 		= set_combine(sets.engaged.HighHaste, {legs="Manibozho Brais"})
	sets.engaged['Ilvl~122'].HighHaste 		= set_combine(sets.engaged['Ilvl~118'].HighHaste, {})
	sets.engaged['Ilvl~124+'].HighHaste 	= set_combine(sets.engaged['Ilvl~122'].HighHaste, {head="Whirlpool Mask",neck="Ej Necklace",body="Qaaxo Harness",ring2="Beeline Ring",back="Canny Cape",waist="Anguinus Belt",feet="Qaaxo Leggings"})
	
	sets.engaged.Evasion.HighHaste 				= {	ammo="Thew Bomblet",
													head="Felistris Mask",neck="Torero Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
													body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
													back="Canny Cape",waist="Phasmida Belt",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
	sets.engaged['Ilvl~118'].Evasion.HighHaste 	= set_combine(sets.engaged.Evasion.HighHaste, {head="Whirlpool Mask",feet="Iuitl Gaiters"})
	sets.engaged['Ilvl~122'].Evasion.HighHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.HighHaste, {})
	sets.engaged['Ilvl~124+'].Evasion.HighHaste = set_combine(sets.engaged['Ilvl~122'].Evasion.HighHaste, {})
	
	sets.engaged.PDT.HighHaste 				= {	ammo="Thew Bomblet",
												head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
												body="Qaaxo Harness",hands="Iuitl Wristbands +1",ring1="Epona's Ring",ring2="Defending Ring",
												back="Mollusca Mantle",waist="Patentia Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}
	sets.engaged['Ilvl~118'].PDT.HighHaste 	= set_combine(sets.engaged.PDT.HighHaste, {waist="Dynamic Belt +1"})
	sets.engaged['Ilvl~122'].PDT.HighHaste 	= set_combine(sets.engaged['Ilvl~118'].PDT.HighHaste, {})
	sets.engaged['Ilvl~124+'].PDT.HighHaste = set_combine(sets.engaged['Ilvl~122'].PDT.HighHaste, {})

	---------------------------------------------------------------------------------------------------
    ---------- ********   Custom melee group: Max Haste (2x March + Haste)    ********* ---------------
	---------------------------------------------------------------------------------------------------
	
	sets.engaged.MaxHaste 				= {	ammo="Honed Tathlum",
											head="Felistris Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
											body="Thaumas Coat",hands="Pillager's Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
											back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
    sets.engaged['Ilvl~118'].MaxHaste 	= set_combine(sets.engaged.MaxHaste, {legs="Manibozho Brais"})
	sets.engaged['Ilvl~122'].MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].MaxHaste, {})
	sets.engaged['Ilvl~124+'].MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].MaxHaste, {head="Whirlpool Mask",neck="Ej Necklace",body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring2="Beeline Ring",back="Canny Cape",waist="Anguinus Belt",feet="Qaaxo Leggings"})
	
	sets.engaged.Evasion.MaxHaste 				= {	ammo="Thew Bomblet",
													head="Felistris Mask",neck="Torero Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
													body="Iuitl Vest",hands="Iuitl Wristbands +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
													back="Canny Cape",waist="Nusku's Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
	sets.engaged['Ilvl~118'].Evasion.MaxHaste 	= set_combine(sets.engaged.Evasion.MaxHaste, {head="Whirlpool Mask",feet="Iuitl Gaiters"})
	sets.engaged['Ilvl~122'].Evasion.MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.MaxHaste, {})
	sets.engaged['Ilvl~124+'].Evasion.MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].Evasion.MaxHaste, {})
	
	sets.engaged.PDT.MaxHaste 				= {	ammo="Thew Bomblet",
												head="Ejekamal Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
												body="Iuitl Vest",hands="Iuitl Wristbands +1",ring1="Epona's Ring",ring2="Defending Ring",
												back="Iximulew Cape",waist="Windbuffet Belt +1",legs="Iuitl Tights",feet="Iuitl Gaiters"}
	sets.engaged['Ilvl~118'].PDT.MaxHaste 	= set_combine(sets.engaged.PDT.MaxHaste, {waist="Dynamic Belt +1"})
	sets.engaged['Ilvl~122'].PDT.MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].PDT.MaxHaste, {})
	sets.engaged['Ilvl~124+'].PDT.MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].PDT.MaxHaste, {})
	
	----------------------
	-- Miscealeus sets
	----------------------
	
	sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
	
	sets.fishing = {
		range="Ebisu Fishing Rod",
		body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		legs="Fisherman's Hose",feet="Waders"}
	sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end