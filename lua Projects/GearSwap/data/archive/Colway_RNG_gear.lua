 
function init_gear_sets()
		
	print('Colway_RNG_Gear.lua sidecar loaded')
	
	gear.default.weaponskill_neck = "Ocachi Gorget"
	gear.default.weaponskill_waist = "Elanid Belt"
	
	DefaultAmmo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet", 
					['Phaosphaelia'] = "Marid arrow",['Ajjub Bow'] = "Marid arrow", ['Surefire Arquebus'] = "Bronze Bullet"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet", 
					['Phaosphaelia'] = "Marid arrow",['Ajjub Bow'] = "Marid arrow", ['Surefire Arquebus'] = "Bronze Bullet"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae"}


	-- Fast cast sets for spells

	sets.precast.FC = {
		head="Haruspex Hat",ear2="Loquacious Earring",
		hands="Thaumas Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Sylvan Gapette +2",
		body="Sylvan Caban +2",hands="Manibozho Gloves",
		waist="Impulse Belt",legs="Nahtirah Trousers",feet="Arcadian Socks"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Orion beret",neck=gear.ElementalGorget,ear1="Volley earring",ear2="Clearview Earring",
		body="Orion Jerkin",hands="Arcadian Bracers",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		back="Lutian Cape",waist=gear.ElementalBelt,legs="Nahtirah Trousers",feet="Orion Socks" }

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ring1="Paqichikaji Ring"})
	
	sets.precast.WS.Skillup = set_combine(sets.precast.WS, {head = "Temachtiani Headband", 
		legs ="Temachtiani Pants", feet = "Temachtiani Boots"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Orion Beret",ear1="Loquacious Earring",
		ring1="Prolix Ring",
		waist="Goading Belt",legs="Orion Braccae",feet="Orion Socks"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Orion Beret",neck="Ocachi Gorget",ear1="Volley earring",ear2="Clearview Earring",
		body="Arcadian Jerkin",hands="Manibozho Gloves",ring1="Paqichikaji Ring",ring2="Rajas Ring",
		back="Lutian Cape",waist="Aquiline Belt",legs="Nahtirah Trousers",feet="Orion Socks"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Orion Beret",neck="Iqabi necklace",hands="Manibozho Gloves",ring2="Hajduk Ring",
		back="Lutian Cape",legs="Arcadian Braccae"})
	
	sets.midcast.RA.Skillup = set_combine(sets.midcast.RA.Acc, {head = "Temachtiani Headband", 
		legs ="Temachtiani Pants", feet = "Temachtiani Boots"})

	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)
	
	sets.midcast.RA['Ajjub Bow'] = set_combine(sets.midcast.RA, {legs='Aetosaur Trousers'})

	sets.midcast.RA['Ajjub Bow'].Acc = set_combine(sets.midcast.RA.Acc, {legs='Aetosaur Trousers'})

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear2="Clearview Earring",ring2="Rajas Ring",
		back="Sylvan Chlamys"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear2="Clearview Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

	-- Idle sets
	sets.idle = {
		head="Orion Beret",neck="Iqabi Necklace",ear1="Volley earring",ear2="Clearview Earring",
		body="Arcadian Jerkin",hands="Arcadian Bracers",ring1="Defending Ring",ring2="Beeline Ring",
		back="Lutian Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Fajin Boots"}
	
	-- Defense sets
	sets.defense.PDT = {
		head="Whirlpool Mask",neck="Twilight Torque",
		body="Orion Jerkin",hands="Orion Bracers",ring1="Defending Ring",ring2="Dark Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks"}

	sets.defense.MDT = {
		head="Orion Beret",neck="Twilight Torque",
		body="Orion Jerkin",hands="Orion Bracers",ring1="Defending Ring",ring2="Dark Ring",
		back="Mollusca Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks"}

	sets.Kiting = {feet="Fajin Boots"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Whirlpool Mask",neck="Twilight Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Orion Jerkin", hands="Arcadian Bracers", ring1="Defending Ring",ring2="Rajas Ring",
		back="Mollusca Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks"}

	sets.engaged.Acc = {
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Manibozho Jerkin",hands="Iuitl Wristbands",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Letalis Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Iuitl Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers"})
	sets.buff.Camouflage = {body="Orion Jerkin"}
	
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
 