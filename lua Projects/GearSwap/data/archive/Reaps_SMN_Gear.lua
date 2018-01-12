 
function init_gear_sets()
		
		print('Reaps_SMN_Gear.lua sidecar loaded')

		-- Options: Override default values
	options.OffenseModes = {'Normal'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'

	-- Durations for wards we want to create custom timers for.
	durations = {}
	durations['Earthen Armor'] = 232
	durations['Shining Ruby'] = 340
	durations['Dream Shroud'] = 352
	durations['Noctoshield'] = 352
	durations['Inferno Howl'] = 232
	durations['Hastega'] = 352
	
	-- Icons to use for the timers (from plugins/icons directory)
	timer_icons = {}
	-- 00054 for stoneskin, or 00299 for Titan
	timer_icons['Earthen Armor'] = 'spells/00299.png'
	-- 00043 for protect, or 00296 for Carby
	timer_icons['Shining Ruby'] = 'spells/00043.png'
	-- 00304 for Diabolos
	timer_icons['Dream Shroud'] = 'spells/00304.png'
	-- 00106 for phalanx, or 00304 for Diabolos
	timer_icons['Noctoshield'] = 'spells/00106.png'
	-- 00100 for enfire, or 00298 for Ifrit
	timer_icons['Inferno Howl'] = 'spells/00298.png'
	-- 00358 for hastega, or 00301 for Garuda
	timer_icons['Hastega'] = 'spells/00358.png'
       
 
        --leftDarkRing = {name="Dark Ring",augments={"Physical Damage Taken -6%", "Magical Damage Taken -3%", "Spell Interruption Rate Down 5%"}}
        --rightDarkRing = {name="Dark Ring",augments={"Physical Damage Taken -5%", "Magical Damage Taken -3%"}}
 
        --------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Astral Flow'] = {head="Summoner's Horn +2"}
	
	sets.precast.JA['Elemental Siphon'] = {main="Kirin's Pole", sub="Vox Grip",
			head="Caller's Horn +2", neck="Caller's Pendant",
			body="Anhur Robe", hands="Glyphic Bracers", ring1="Evoker's ring", ring2="Fervor Ring",
			back="Conveyance Cape", legs="Caller's Spats +2", feet="Glyphic Pigaches"}

	sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}

	-- Pact delay reduction gear
	sets.precast.BloodPactWard = {
			ammo="Eminent Sachet",ear1="Caller's Earring",hands="Glyphic Bracers",back="Tiresias' Cape",
			legs="Glyphic Spats",feet="Glyphic Pigaches"}

	sets.precast.BloodPactRage = sets.precast.BloodPactWard

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Haruspex Hat",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Repartie Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Orvail Pants",feet="Glyphic Pigaches"}

	sets.precast.FC.EnhancingMagic = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Carapacho Cuffs",waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Pahtli Cape",legs="Nabu's Shalwar"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Pahtli Cape",waist="Cascade Belt",legs="Hagondes Pants",feet="Glyphic Pigaches"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Myrkr'] = {
		head="Nahtirah Hat",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Convoker's Doublet",hands="Caller's Bracers +2",ring1="Evoker's Ring",ring2="	",
		back="Pahtli Cape",waist="Hierarch Belt",legs="Nares Trews2",feet="Glyphic Pigaches"}

	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Haruspex Hat",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Bokwus Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Glyphic Pigaches"}
	
	sets.midcast['Dia'] = {waist="Tarutaru sash"}

	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
		head="Haruspex Hat",neck="Colossus's Torque",ear1='healing Earring',ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Tempered Cape",waist="Bishop's Sash",legs="Nabu's Shalwar",feet="Glyphic Pigaches"}

	 sets.midcast.Stoneskin = {
		head="Haruspex hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2='Loquacious Earring',
		body="Anhur Robe",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Glyphic Pigaches"}

	sets.midcast.Pet.BloodPactWard = {main="Soulscourge",sub="Vox Grip",ammo="Eminent Sachet",
		head="Convoker's Horn",neck="Caller's Pendant",ear1='Gifted Earring',
		body="Caller's Doublet +2",hands="Glyphic Bracers",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Diabolos's Rope",legs="Marduk's Shalwar +12"}
	
	sets.midcast.Pet.PhysicalBloodPactRage = {main="Soulscourge",sub="Vox Grip",ammo="Eminent Sachet",
		head="Convoker's Horn",neck="Sacrifice Torque",ear1='Gifted Earring',
		body="Convoker's Doublet",hands="Glyphic Bracers",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Moepapa Stone",legs="Caller's Spats +2",feet="Glyphic Pigaches"}

	sets.midcast.Pet.MagicalBloodPactRage = {main="Eminent Pole",sub="Vox Grip",ammo="Eminent Sachet",
		head="Bokwus Circlet",neck="Caller's Pendant",ear1='Gifted Earring',
		bbody="Convoker's Doublet",hands="Caller's Bracers +2",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Tiresias' Cape",waist="Moepapa Stone",legs="Caller's Spats +2",feet="Glyphic Pigaches"}
	
	sets.midcast.Pet.Spirit = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Glyphic Spats"})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Iridal Staff",ammo="Eminent Sachet", 
		head="Caller's Horn +2",neck="Wiglen Gorget",ear1="Antivenom Earring",ear2="Loquacious Earring",
		body="Errant Houppelande",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Vita Cape",waist="Qiqirn Sash +1",legs="Nares Trews",feet="Glyphic Pigaches"}
	
	sets.Owleyes = {main="Owleyes",sub="Genbu's Shield"}

	-- Idle sets
	sets.idle = {main="Patriarch Cane",sub="Genbu's Shield",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Bokwus Robe",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Glyphic Pigaches"}

	sets.idle.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Tarutaru sash",legs="Hagondes Pants",feet="Glyphic Pigaches"}

	sets.idle.Avatar = {main="Patriarch Cane",sub="Genbu's Shield",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Caller's Doublet +2",hands="Serpentes Cuffs",ring1="Evoker's Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Glyphic Pigaches"}

	sets.idle.Spirit = {main="Owleyes",sub="Genbu's Shield",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Evoker's Ring",ring2="Sangoma Ring",
		back="Tiresias' Cape",waist="Tarutaru sash",legs="Glyphic Spats",feet="Glyphic Pigaches"}

	sets.idle.Town = {main="Patriarch Cane",sub="Genbu's Shield",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Glyphic Pigaches"}

	sets.idle.Avatar.Favor = {head="Caller's Horn +2"}
	sets.idle.Avatar.Melee = {waist="Kuku Stone"}
		
	sets.perp = {}
	sets.perp.Day = {hands="Glyphic Bracers"}
	sets.perp.Weather = {neck="Caller's Pendant",hands="Caller's Bracers +2"}
	sets.perp.Carbuncle = {hands="Carbuncle Mitts"}
	sets.perp.Diabolos = {waist="Diabolos's Rope"}
	sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
	
	-- Defense sets
	sets.defense.PDT = {main=gear.Staff.PDT,
		head="Hagondes Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Hierarch Belt",legs="Glyphic Spats",feet="Hagondes Sabots"}

	sets.defense.MDT = {
		head="Hagondes Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Shadow Ring",
		back="Umbra Cape",waist="Hierarch Belt",legs="Glyphic Spats",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Eminent Sachet",
		head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Glyphic Spats",feet="Hagondes Sabots"}
		
	sets.buff.sleep = {neck="Sacrifice Torque"}
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 