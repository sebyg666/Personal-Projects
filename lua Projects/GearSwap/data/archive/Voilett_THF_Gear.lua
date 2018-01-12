 
function init_gear_sets()

	print('Colway_THF_Gear.lua sidecar load')

	-- Options: Override default values
	options.OffenseModes = {'Normal', 'Acc'}
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.RangedModes = {'Normal', 'Acc'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.RangedMode = 'Normal'
	state.Defense.PhysicalMode = 'PDT'
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                            --------------------------------------------------- Start defining the sets -------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	physical_darkring1 = {name="Dark Ring",augments={"Spell Interruption Rate Down 3%", "Magic Damage Taken -5%", "Physical Damage Taken -5%"}}
	physical_darkring2 = {name="Dark Ring",augments={"Magic damage taken -3%", "Physical damage taken -5%"}}
	
	
	sets.TreasureHunter = {
			hands="Plunderer's Armlets +1", 
			feet="Raider's Poulaines +2"}
	-- Precast sets to enhance JA

	sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
	sets.precast.JA["Assassin's Charge"] = {feet = "Plunderer's Poulaines"}
	sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest"}
	sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {head="Assassin's Bonnet +2",neck="Pentalagus Charm",hands="Pillager's Armlets",legs="Pillager's Culottes",feet="Pillager's Poulaines"}
	sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets"}
	sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

	sets.precast.JA['Sneak Attack'] = {
			ammo="Qirmiz Tathlum",
			head="Pillager's Bonnet",neck="Justiciar's Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
			body="Pillager's Vest",hands="Raider's Armlets +2",ring1="Epona's Ring",ring2="Pyrosoul Ring",
			back="Canny Cape",waist="Prosilio Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}

	sets.precast.JA['Trick Attack'] = {
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet",neck="Justiciar's Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Pillager's Vest",hands="Pillager's Armlets",ring1="Dumakulem's Ring",ring2="Stormsoul Ring",
		back="Canny Cape",waist="Prosilio Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		ammo="Sonia's Plectrum",
		head="Uk'uxkaj cap",
		body="Iuitl Vest",hands="Buremte Gloves",
		back="Iximulew Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
		   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Step = {
		head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Manibozho Jerkin",hands="Buremte Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Canny Cape",waist="Dynamic Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	
	
	------------------------------------------------------------------------------ Fast cast sets for spells --------------------------------------------------------------------------
	
	sets.precast.FC = {
		neck="Jeweled collar",ear2="Loquacious Earring",
		hands="Thaumas Gloves",ring1="Prolix Ring",
		legs="Enif Cosciales"}
 
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads"})


	-- Ranged gaer
	sets.precast.RangedAttack = {
		head="Whirlpool Mask",neck="Peacock Charm",
		body="Iuitl Vest",hands="Assassin's Armlets +2",
		back="Canny Cape",waist="Aqualine Belt",legs="Nahtirah Trousers",feet="Raider's Poulaines +2"}
		
    
	--------------------------------------------------------------------------------- Weaponskill sets ----------------------------------------------------------------------------------
	
	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = "Caudata Belt"
	sets.precast.WS = {
		ammo="Thew Bomblet",
		head="Pillager's Bonnet",neck="Justiciar Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Spiral Ring",ring2="Pyrosoul Ring",
		back="Buquwik Cape",waist="Prosilio Belt",legs="Pillager's Culottes +1",feet="Plundere's Poulains"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Letalis Mantle"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {head="Pillager's Bonnet",neck="Justiciar's torque",hands="Iuitl Wristbands",ring2="Stormsoul Ring",feet="Iuitl Gaiters"})
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {waist="Thunder Belt"})
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget"})
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",hands="Pillager's Armlets"})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",hands="Pillager's Armlets"})

	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {head="Pillager's Bonnet",neck="Soil Gorget"})
	sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist="Soil Belt"})
	sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})
	sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})
	sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",neck="Moepapa Medal"})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {	
		ammo="Qirmiz Tathlum",
		head="uk'uxkaj Cap",neck="Nefarious Collar",ear1="Pixie Earring",ear2="Brutal Earring",
		body="Plunderer's Vest +1",hands="Buremte Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Rancorous Mantle",waist="Wanion Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"})
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {})

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {	
		ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet",neck="Asperity Neckalce",ear1="Pixie Earring",ear2="Brutal Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ear1="Bladeborn Earring"})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {})

	sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Thunder Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {waist="Thunder Belt"})
	sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget"})
	sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",body="Plunderer's Vest +1"})
	sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",neck="Thunder Gorget",body="Plunderer's Vest +1"})

	sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {neck="Light Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Honed Tathlum", back="Canny Cape"})
	sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {waist="Light Belt"})
	sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget"})
	sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget",body="Plunderer's Vest +1"})
	sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",neck="Light Gorget",body="Plunderer's Vest +1"})

	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {	
		ammo="Thew Bomblet",
		head="Pillager's Bonnet",neck="Justiciar Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Spiral Ring",ring2="Pyrosoul Ring",
		back="Buquwik Cape",waist="Prosilio Belt",legs="Pillager's Culottes +1",feet="Plundere's Poulains"})
	sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'], {})
	sets.precast.WS['Mercy Stroke'].Mod = set_combine(sets.precast.WS['Mercy Stroke'], {})
	sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {})
	sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {})
	sets.precast.WS['Mercy Stroke'].SATA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {})
	
	sets.precast.WS['Aeolian Edge'] = {
		ammo="Jukukik Feather",
		head="Thaumas Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Demon's Ring",
		back="Toro Cape",waist="Thunder Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulains"}
		
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
		back="Canny Cape",waist="Aquiline Belt",legs="Kaabnax Trousers",feet="Pillager's Poulaines"}

	sets.midcast.RA.Acc = {
		head="Pillager's Bonnet",neck="Peacock Charm",ear1="Clearview Earring",ear2="Volley Earring",
		body="Iuitl Vest",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Hajduk Ring",
		back="Canny Cape",waist="Aquiline Belt",legs="Kaabnax Trousers",feet="Pillager's Poulaines"}
	
	sets.midcast.RA.TH = set_combine(sets.midcast.RA, sets.TreasureHunter)

	sets.midcast.RA.TH.Acc = set_combine(sets.midcast.RA.Acc, sets.TreasureHunter)
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	 sets.resting = {
		head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	
	------------------------------------ Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes) ----------------------------------------
	sets.idle = {
		ammo="Thew Bomblet",
		head="Uk'uxkaj Cap",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="bladeborn Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Twilight Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
		
	sets.idle.Town = {
		head="Uk'uxkaj Cap",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="bladeborn Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Twilight Belt",legs="Enif cosciales",feet="Plunderer's Poulaines"}

	sets.idle.Weak = {	
		ammo="Thew Bomblet",
		head="Ocelomeh headpiece +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	
	sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	sets.ExtraRegenTwo = {hands="Garden bangles"}

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
		head="Uk'uxkaj Cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Twilight Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Tk = {
		ammo="Honed Tathlum",
		head="Qaaxo Harness",neck="Asperity Necklace",ear1="Pixie Earring",ear2="Bladeborn Earring",
		body="Plunderer's Vest+1",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Prosilio Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters"}
	sets.engaged.Acc = {	
		ammo="Honed Tathlum",
		head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Plunderer's Vest+1",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Patentia Sash",legs="Manibozho Brais",feet="Manibozho Boots"}	
	sets.engaged.Evasion = {
		ammo="Thew Bomblet",
		head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Nusku's Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
	sets.engaged.Acc.Evasion = {
		ammo="Honed Tathlum",
		head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Plunderer's Vest +1",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}	
	sets.engaged.PDT = {
		ammo="Thew Bomblet",
		head="Iuitl Headgear",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2=physical_darkring1,
		back="Iximulew Cape",waist="Patentia Sash",legs="Iuitl Tights",feet="Iuitl Gaiters"}
	sets.engaged.Acc.PDT = {
		ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Epona's Ring",ring2=physical_darkring1,
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights",feet="Iuitl Gaiters"}
	
	-- Custom melee group: High Haste (~20% DW)
	sets.engaged.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Qaaxo Harness",hands="Plunderer's Armlets +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Qaaxo Harness",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Qaaxo Harness",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.HighHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}

	-- Custom melee group: Embrava Haste (7% DW)
	sets.engaged.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}

	-- Custom melee group: Max Haste (0% DW)
	sets.engaged.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
	sets.engaged.Acc.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
		head="Iuitl Headgear",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Pillager's Armlets",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		back="Canny Cape",waist="Windbuffet Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines"}
		
	sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doomed = {ring1="Saida Ring"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
	
	sets.fishing = {
		range="Ebisu Fishing Rod",
		body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		legs="Fisherman's Hose",feet="Fisherman's Boots"}
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end