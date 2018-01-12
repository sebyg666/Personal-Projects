 
function init_gear_sets()
		
	print('SCH_Gear.lua sidecar loaded')  
		
    --------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Haruspex Hat",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Perception Ring",
		back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Pedagogy Loafers"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Carapacho Cuffs",waist="Siegel Sash"})
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})


	-- Midcast Sets

	sets.midcast.FastRecast = {ammo="Impatiens",
		head="	Haruspex Hat",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="",feet="Academic's Loafers"}

	sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Impatiens",
		head="Haruspex Hat",neck="Noetic Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Perception Ring",ring2="Sirona's Ring",
		back="Swith Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Pedagogy Loafers +1"}

	sets.midcast.CureWithLightWeather = {main="Coeus",sub="Achaq Grip",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Noetic Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Nares Trews",feet="Pedagogy Loafers +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {main="Coeus",head="Savant's Bonnet +2"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		hands="Hieros Mittens",ring1="Ephedra Ring",
		feet="Gendewitha Galoshes"}

	sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
		head="Savant's Bonnet +2",neck="Colossus's Torque",
		body="Manasa Chasuble",hands="Ayao's Gages",
		waist="Olympus Sash",legs="Portent Pants"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +1"})

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Coeus",sub="Mephitis Grip",ammo="Sturm's Report",
		head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Manasa Chasuble",hands="Hagondes Gages",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"}

	sets.midcast.IntEnfeebles = {main="Coeus",sub="Mephitis Grip",ammo="Sturm's Report",
		head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Manasa Chasuble",hands="Hagondes Gages",ring1="Icesoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"}

	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

	sets.midcast['Dark Magic'] = {main="Coeus",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Noetic Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Hagondes Gages",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}

	sets.midcast.Kaustra = {main="Coeus",sub="Wizzan Grip",ammo="Witchstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Hagondes Gages",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast.Drain = {main="Coeus",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Haruspex Hat",neck="Noetic Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Refraction Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Academic's Loafers"}

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Impatiens",
		head="Haruspex Hat",neck="Noetic Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Academic's Loafers"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Lehbrailg +2"})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {main="Coeus",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Hagondes Hat",neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Hagondes Gages",ring1="Locus Ring",ring2="Perception Ring",
		back="Swith Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast['Elemental Magic'].Resistant = {main="Coeus",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head="Hagondes Hat",neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Vanir Cotehardie",hands=gear.macc_hagondes,ring1="Locus Ring",ring2="Perception Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Bokwus Boots"}

	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Wizzan Grip"})

	sets.midcast.Impact = {main="Coeus",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head=empty,neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Coeus",sub="Mephitis Grip",
		head="Gendewitha Caubeen",neck="Wiglen Gorget",
		body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		waist="Witful Belt",legs="Pedagogy Pants",feet="Pedagogy Loafers +1"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Tamaxchi",sub="Sors Shield",ammo="Impatiens",
		head="Gendewitha Caubeen",neck="Wiglen Gorget",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Pedagogy Loafers +1"}

	sets.idle.Field = {main="Tamaxchi",sub="Sors Shield",ammo="Impatiens",
		head="Gendewitha Caubeen",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Pedagogy Loafers +1"}

	sets.idle.Field.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Impatiens",
		head="Gendewitha Caubeen",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Hierarch Belt",legs="Pedagogy Pants",feet="Pedagogy Loafers +1"}

	sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Swith Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Academic's Loafers +1"}

	sets.idle.Weak = {main="Tamaxchi",sub="Sors Shield",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Stoicheion Medal",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Gendewitha Gages +1",ring1="Perception Ring",ring2="Maquette Ring",
		back="Umbra Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Herald's Gaiters"}

	-- Defense sets

	sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Shadow Ring",
		back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head="Zelus Tiara",
		body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",
		waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
	sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
	sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
	sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
	sets.buff['Penury'] = {legs="Savant's Pants +2"}
	sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}

	sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Pedagogy Gown"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring"}

	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 