
 
function init_gear_sets()
	
	print('Ewelina_Blm_Gear.lua sidecar loaded')
	-- Default macro set/book
	set_macro_page(1, 10)
	
	-- Options: Override default values
	options.CastingModes = {'Normal', 'Resistant', 'Proc'}
	options.OffenseModes = {'None', 'Normal'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal', 'PDT'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'
	state.OffenseMode = 'None'
	
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	---- Precast Sets ----
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

	sets.precast.JA.Manafont = { } --body="Sorcerer's Coat +2"}
	
	-- equip to maximize HP (for Tarus) and minimize MP loss before using convert
	sets.precast.JA.Convert = {}


	-- Fast cast sets for spells

	sets.precast.FC = {
				head="Nares Cap",neck="Jeweled Collar",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
                ring1="Prolix Ring",ring2='Veneficium Ring',
                back="Swith Cape",waist="Witful belt",legs="Orvail Pants",feet="Chelona Boots"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs"})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {Head="Goetia Petasos +2"})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, sets.precast.FC['Elemental Magic'], {body="Twilight Cloak"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, { back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
		back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Vidohunir'] = {ammo="Witchstone",
		head="Hagondes Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
	
	
	---- Midcast Sets ----

	sets.midcast.FastRecast = {
		head="Natirah hat",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Bokwus Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
		head="Natirah hat",neck="Colossus's Torque",ear1="Healing Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Tempered Cape",waist="Bishop's",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {sub="Fulcio Grip", neck="Colossus's Torque",body="Anhur Robe",back="Merciful cape",waist="Olympus sash",legs="Portent Pants"}
	
	sets.midcast.Stoneskin = {main="Lehbrailg +2",
		head="Natirah hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2='Loquacious Earring',
		body="Anhur Robe",hands="Bokwus Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Hagondes Sabots"}

	sets.midcast['Enfeebling Magic'] = {main="Lehbrailg +2",
		head="Natirah hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Spaekona's Coat",hands="Quauhpilli Gloves",ring1="Mediator's Ring",ring2="Maquette Ring",
		back="Bane Cape",waist="Aswang sash",legs="Hagondes Pants",feet="Bokwus Boots"}
		
	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

	sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Caecus Grip",
		head="Natirah hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Spaekona's Coat",hands="Quauhpilli Gloves",ring1="Mediator's Ring",ring2="Maquette Ring",
		back="Merciful cape",waist="Casso sash",legs="Portent Pants",feet="Goetia sabots +2"}

	sets.midcast.Drain = {main="Bounty Sickle",sub="Caecus Grip",
		head="Appetence Crown",neck="Aesir Torque",ear1="Hirudinea Earring",ear2="Dark Earring",
		body="Spaekona's Coat",hands="Quauhpilli Gloves",ring1="Mediator's Ring",ring2="Maquette Ring",
		back="Merciful Cape",waist="Casso sash",legs="Portent Pants",feet="Goetia sabots +2"}
	
	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Lehbrailg +2",
		head="Natirah hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Anhur Robe",hands="Quauhpilli Gloves",ring1="Mediator's Ring",ring2="Maquette Ring",
		back="Bane Cape",waist="Aswang sash",legs="Hagondes Pants",feet="Bokwus Boots"}

	sets.midcast.BardSong = {main="Lehbrailg +2",
		head="Natirah hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Spaekona's Coat",hands="Quauhpilli Gloves",ring1="Mediator's Ring",ring2="Maquette Ring",
		back="Bane Cape",waist="Aswang sash",legs="Hagondes Pants",feet="Bokwus Boots"}
		
		

	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast.LowTierNuke = {main="Atinian Staff",sub="Elder's Grip +1",
		head="Hagondes Hat",neck="Atzintli Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Bokwus Robe",hands="Otomi Gloves",ring1="Mediator's Ring",ring2="Strendu Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Goetia Chausses +2",feet="Goetia Sabots +2"}
		
	sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, { })
	
	-- Idle set when doing procs.  Fast cast gear, minimal nuke gear.  Won't change out of this for nukes.
	sets.midcast.LowTierNuke.Proc = set_combine(sets.midcast.LowTierNuke, { })
		
		
	sets.midcast.ElementalMagicGA = set_combine(sets.midcast.LowTierNuke, { })

	-- Custom classes for high-tier nukes.
	sets.midcast.HighTierNuke = set_combine(sets.midcast.LowTierNuke, { })
	
	sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, { })
		
	sets.midcast.HighTierNukeImpact = {main="Lehbrailg +2",sub="Wise Strap",ammo="Witchstone",
		neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Twilight Cloak",hands="Goetia Gloves +2",ring1="Mediator's Ring",ring2="Strendu Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Chatoyant Staff",
		head="Wivre Hairpin",
		body="Hagondes Coat +1",hands="Serpentes Cuffs",
		waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}
	

	-- Idle sets
	
	-- Normal refresh idle set
	sets.idle = {main="Terra's Staff",
		head="Wivre Hairpin",neck="Twilight Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Bokwus Robe",hands="Otomi Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Repulse Mantle",legs="Nares Trews",feet="Goetia Sabots +2"}

	-- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
	sets.idle.PDT = set_combine(sets.idle, { })

	-- Idle mode scopes:
	-- Idle mode when weak.
	sets.idle.Weak = set_combine(sets.idlee, { })
	
	-- Town gear.
	sets.idle.Town = set_combine(sets.idlee, { })
		
	-- Defense sets

	sets.defense.PDT = {main="Earth Staff", sub="Wizzan Grip",ammo="Witchstone",
		head="Hagondes Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
		body="Hagondes Coat +1",hands="Quauhpilli Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.defense.MDT = {main="Earth Staff", sub="Wizzan Grip",ammo="Witchstone",
		head="Hagondes Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
		body="Hagondes Coat +1",hands="Quauhpilli Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Cheviot Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Herald's Gaiters"}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
	

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Atheling Mantle",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 