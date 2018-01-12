
-- Define sets and vars used by this job file.
function init_gear_sets()

	print('Colway_SAM_Gear side_cart loaded')
	
	
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Meditate = {head="Wakido Kabuto",hands="Sakonji Kote"}
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto"}
	sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Sonia's Plectrum",
		head="Yaoyotl Helm",
		body="Otronif Harness +1",hands="Buremte Gloves",ring1="Spiral Ring",
		back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Thew Bomblet",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Phorcys Korazin",hands="Wakido Kote +1",ring1="Pyrosoul Ring",ring2="Pyrosoul Ring",
		back="Buquwik Cape",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Ejekamal Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {back="Letalis Mantle"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Breeze Gorget",waist="Prosilio Belt"})
	sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Breeze Gorget",waist="Prosilio Belt"})
	sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {waist="Light Belt"})

	sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {})

	sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
	sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
	sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Snow Belt"})

	sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})

	sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

	sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})

	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})


	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Yaoyotl Helm",
		body="Otronif Harness +1",hands="Otronif Gloves",
		legs="Sakonji Haidate",feet="Otronif Boots"}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = {ammo="Ginsen",
		head="Otronif Mask",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Usukane Haramaki +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Sakonji Haidate",feet="Usukane Sune-ate"}
	
	sets.idle.Field = {ammo="Ginsen",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Danzo Sune-ate"}

	sets.idle.Weak = {
		head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}
	
	-- Defense sets
	sets.defense.PDT = {ammo="Iron Gobbet",
		head="Otronif Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots"}

	sets.defense.Reraise = {
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots"}

	sets.defense.MDT = {ammo="Demonry Stone",
		head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Engulfer Cape",waist="Flume Belt",legs="Otronif Brais +1",feet="Whirlpool Greaves"}

	sets.Kiting = {feet="Danzo Sune-ate"}

	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
	sets.engaged = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Sakonji Domaru",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged.PDT = {ammo="Ginsen",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged.Acc.PDT = {ammo="Ginsen",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged.Reraise = {ammo="Thew Bomblet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
		back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.engaged.Acc.Reraise = {ammo="Thew Bomblet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
		
	-- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
	-- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
	sets.engaged.Adoulin = {ammo="Ginsen",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged.Adoulin.Acc = {ammo="Thew Bomblet",
		head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Unkai Domaru +2",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.PDT = {ammo="Thew Bomblet",
		head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
		back="Iximulew Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Acc.PDT = {ammo="Honed Tathlum",
		head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Reraise = {ammo="Thew Bomblet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
		back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Acc.Reraise = {ammo="Thew Bomblet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}


	sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
	sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
	sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
	
	sets.buff.Seigan = {head="Unkai Kabuto +2"}
	sets.buff['Third Eye'] = {legs="Sakonji Haidate"}
	
	sets.buff.Doomed = set_combine(sets.Reraise, {ring1="Saida Ring"})
	sets.buff.sleep = {neck="Berserker's Torque"}
	
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
 