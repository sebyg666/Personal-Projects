 
function init_gear_sets()

	print('Reaps_THF_Gear.lua sidecar load')

	-- Options: Override default values
	options.OffenseModes = {'Normal', 'Acc'}
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.RangedModes = {'Normal', 'TH', 'Acc'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.RangedMode = 'TH'
	state.Defense.PhysicalMode = 'PDT'
	
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = "Caudata Belt"
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                            --------------------------------------------------- Start defining the sets -------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--------------------------------------
	-- Special sets
	--------------------------------------
	
	sets.TreasureHunter = {hands="Plunderer's Armlets", feet="Raider's Poulaines +2"}
	sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	sets.ExtraRegenTwo = {hands="Garden bangles"}
	sets.Kiting = {feet="Fajin Boots"}
	
	sets.buff['Sneak Attack'] = {
		ammo="Horned Tathlum",
		head="Pillager's Bonnet",neck="Asperity necklace",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Plunderer's Vest",hands="Raider's Armlets +2",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Canny Cape",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}

	sets.buff['Trick Attack'] = {
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet",neck="Houyi's Gorget",ear1="steelflash Earring",ear2="Bladeborn Earring",
		body="Plunderer's Vest",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Canny Cape",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Precast sets to enhance JA

	sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +1"}
	sets.precast.JA["Assassin's Charge"] = {feet = "Plunderer's Poulaines"}
	sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +1"}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest"}
	sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {head="Assassin's Bonnet +2",hands="Pillager's Armlets",feet="Pillager's Poulaines"}
	sets.precast.JA['Despoil'] = {legs="Raider's Culottes +1",feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets"}
	sets.precast.JA['Feint'] = {legs="Assassin's Culottes +2"}
	sets.precast.JA['Mug'] = {legs="Assassin's Bonnet +2"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		ammo="Sonia's Plectrum",
		head="Uk'uxkaj cap",
		body="Iuitl Vest",hands="Buremte Gloves",
		back="Iximulew Cape",legs="Manibozho Brais",feet="Iuitl Gaiters"}
		   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Step = set_combine(sets.precast.TreasureHunter,{
		head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Manibozho Jerkin",hands="Buremte Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Canny Cape",waist="Dynamic Belt",legs="Manibozho Brais",feet="Pillager's Poulaines"})
	sets.precast.Flourish1 = sets.precast.TreasureHunter
	sets.precast.JA.Provoke = sets.precast.TreasureHunter
	
	
	------------------------------------------------------------------------------ Fast cast sets for spells --------------------------------------------------------------------------
	
	sets.precast.FC = {
		neck="Jeweled collar",ear2="Loquacious Earring",
		hands="Thaumas Gloves",ring1="Prolix Ring",
		legs="Enif Cosciales"}
 
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads"})


	-- Ranged gaer
	sets.precast.RangedAttack = {
		head="Pillager's Bonnet",neck="Peacock Charm",
		body="Iuitl Vest",hands="Plunderer's Armlets",
		back="Terebellum Mantle",waist="Aqualine Belt",legs="Iuitl Trousers",feet="Raider's Poulaines +2"}
		
    
	--------------------------------------------------------------------------------- Weaponskill sets ----------------------------------------------------------------------------------
	
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Thew Bomblet",
		head="Pillager's Bonnet",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Dynamic Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Letalis Mantle"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {head="Pillager's Bonnet",neck="Justiciar's torque",hands="Iuitl Wristbands",ring2="Auster's Ring",feet="Iuitl Gaiters"})
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {waist="Thunder Belt"})
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget"})
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",hands="Pillager's Armlets"})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",hands="Pillager's Armlets"})

	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {head="Pillager's Bonnet",neck="Soil Gorget"})
	sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist="Soil Belt"})
	sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})
	sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})
	sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {	
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet",neck="Nefarious Collar",ear1="Thunder Pearl",ear2="Brutal Earring",
		body="Iuitl Vest",ring1="Epona's Ring",ring2="Thundersoul Ring",
		back="Rancorous Mantle",waist="Wanion Belt",feet="Iuitl Gaiters"})
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {waist="Soil Belt"})
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {hands='Iuitl Wristbands', ring1='Rajas Ring'})
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {hands='Iuitl Wristbands',})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Moepapa Medal",hands='Iuitl Wristbands',})

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {	
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet",neck="Justiciar's Torque",ear1="Thunder Pearl",ear2="Dudgeon Earring",
		body="Manibozho Jerkin",hands="Buremte Gloves",ring1="Thundersoul Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Wanion Belt",legs="Manibozho Brais",feet="Iuitl Gaiters"})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {hands="Raider's Armlets +2"})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})

	sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Thunder Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {waist="Thunder Belt"})
	sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget"})
	sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",body="Pillager's Vest"})
	sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",body="Pillager's Vest"})

	sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {neck="Light Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {waist="Light Belt"})
	sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget"})
	sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget",body="Pillager's Vest"})
	sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget",body="Pillager's Vest"})

	sets.precast.WS['Aeolian Edge'] = {
		ammo="Horned Tathlum",
		head="Thaumas Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Manibozho Jerkin",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Demon's Ring",
		back="Toro Cape",waist="Thunder Belt",legs="Iuitl Tights",feet="Iuitl Gaiters"}
		
	------------------------------------------------------------------------------------ Midcast Sets -----------------------------------------------------------------------------------
	
	sets.midcast.FastRecast = {
		head="Uk'uxkaj cap<",neck="Jeweled collar",ear2="Loquacious Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",
		back="Blithe Mantle",waist="Phasmida belt",legs="Enif cosciales",feet="Iuitl Gaiters"}
		   
	-- Specific spells
	sets.midcast.Utsusemi = {
		head="Uk'uxkaj cap<",neck="Jeweled collar",ear2="Loquacious Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",
		back="Blithe Mantle",waist="Phasmida belt",legs="Enif cosciales",feet="Iuitl Gaiters"}
		
	-- Ranged gear -- acc + TH
	sets.midcast.RA = {
		head="Pillager's Bonnet",neck="Peacock Charm",ear1="Clearview Earring",ear2="Volley Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Hajduk Ring",
		back="Libeccio Mantle",waist="Aquiline Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.midcast.RA.Acc = {
		head="Pillager's Bonnet",neck="Peacock Charm",ear1="Clearview Earring",ear2="Volley Earring",
		body="Iuitl Vest",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Hajduk Ring",
		back="Libeccio Mantle",waist="Aquiline Belt",legs="Thurandaut Tights +1",feet="Pillager's Poulaines"}
	
	--------------------------------------
	-- Idle/resting/defense sets
	--------------------------------------
	
	-- Resting sets
	 sets.resting = {
		head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes) ----------------------------------------
	sets.idle = {
		ammo="Thew Bomblet",
		head="Ocelomeh headpiece +1",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Iuitl Tights",feet="Iuitl Gaiters"}
		
	sets.idle.Town = {
		head="Ocelomeh headpiece +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Plunderer's Vest",hands="Plunderer's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Enif cosciales",feet="Raider's Poulaines +2"}

	sets.idle.Weak = {	
		ammo="Thew Bomblet",
		head="Ocelomeh headpiece +1",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Iuitl Tights",feet="Iuitl Gaiters"}
	

	------------------------------------------------------------------------------------- Defense sets -----------------------------------------------------------------------------------------

	sets.defense.Evasion = {
		head="Whirlpool Mask",neck="Torero Torque",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Dark Ring",
		back="Ik Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters"}

	sets.defense.PDT = {
		ammo="Iron Gobbet",
		head="Iuitl Headgear",neck="Twilight Torque",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Dark Ring",ring2="Dark Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Iuitl Tights",feet="Iuitl Gaiters"}

	sets.defense.MDT = {
		ammo="Demonry Stone",
		head="Ejekamal mask",neck="Twilight Torque",ear1="Merman's earring",ear2="Merman's earring",
		body="Avalon Breastplate",hands="Espial bracers",ring1="Dark Ring",ring2="Dark Ring",
		back="Engulfer Cape",waist="Twilight belt",legs="Kaabnax trousers",feet="Iuitl Gaiters"}

	sets.Kiting = {feet="Fajin Boots"}

	------------------------------------------------------------------------------------- Engaged sets ------------------------------------------------------------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		ammo="Honed Tathlum",
		head="Pillager's Bonnet",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Plunderer's Vest",hands="Plunderer's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Iuitl Tights",feet="Manibozho Boots"}
	sets.engaged.Acc = {	
		ammo="Honed Tathlum",
		head="Pillager's Bonnet",neck="Agasaya's Collar",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pillager's Vest",hands="Buremte Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Attacker's Mantle",waist="Dynamic Belt",legs="Manibozho Brais",feet="Manibozho Boots"}		
	sets.engaged.Evasion = {
		ammo="Thew Bomblet",
		head="Pillager's Bonnet",neck="Torero Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Beeline Ring",
		back="Ik Cape",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
	sets.engaged.Acc.Evasion = {
		ammo="Honed Tathlum",
		head="Pillager's Bonnet",neck="Torero Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Manibozho Jerkin",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Beeline Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
	sets.engaged.PDT = {
		ammo="Thew Bomblet",
		head="Pillager's Bonnet",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Dark Ring",
		back="Iximulew Cape",waist="Patentia Sash",legs="Iuitl Tights",feet="Iuitl Gaiters"}
	sets.engaged.Acc.PDT = {
		ammo="Honed Tathlum",
		head="Pillager's Bonnet",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Dark Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights",feet="Iuitl Gaiters"}
		
	-- Custom melee group: High Haste (~20% DW)
	sets.engaged.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}

	-- Custom melee group: Embrava Haste (7% DW)
	sets.engaged.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}

	-- Custom melee group: Max Haste (0% DW)
	sets.engaged.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Pillager's Culottes",feet="Plunderer's Poulaines"}
		
	sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doomed = {ring1="Saida Ring"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end