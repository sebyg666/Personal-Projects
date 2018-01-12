
function init_gear_sets()

	print('Colway_MNK_Gear.lua sidecar loaded')
   
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
   
	-- Precast Sets
   
	-- Precast sets to enhance JAs on use

	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +1"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown"}
	sets.precast.JA['Perfect Counter'] = {head="Tantra Crown +2"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters"}
	sets.precast.JA['Footwork'] = {feet="Tantra Gaiters +2"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters"}
	
	sets.precast.JA['Chi Blast'] = {
		head="Hesychast's Crown",
		body="Otronif Harness",hands="Otronif Gloves +1",
		back="Tuilha Cape",legs="Anchorite's Hose",feet="Thurandaut Boots +1"}

	sets.precast.JA['Chakra'] = {
		head="Uk'uxkaj cap",
		body="Anchorite's Cyclas +1",hands="Hesychast's Gloves +1",ring1="Terrasoul Ring",
		back="Anchoret's Mantle",waist="Caudata Belt",legs="Kaabnax trousers",feet="Anchorite's Gaiters +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Uk'uxkaj cap",
		body="Manibozho Jerkin",hands="Otronif Gloves +1",ring1="Asklepian Ring",ring2="Kunaji Ring",
		back="Anchoret's Mantle",waist="Caudata Belt",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}
		   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Step = {waist="Chaac Belt"}
	sets.precast.Flourish1 = {waist="Chaac Belt"}
	
	
	-- Fast cast sets for spells
   
	sets.precast.FC = {ammo="Impatiens",
		head="Haruspex Hat",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Dread Jupon",hands="Thaumas Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs="Quiahuiz Leggings"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",ear1="Stealth Earring",})
   
   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Thew Bomblet",
		head="Uk'uxkaj cap",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Anchorite's Cyclas +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Manibozho Boots"}
	sets.precast.WS['Ilvl~118'] = set_combine(sets.precast.WS, {ammo="Honed Tathlum",
		head="Ejekamal Mask",
		body="Manibozho Jerkin",hands="Anchorite's Gloves +1",ring1="Epona's Ring",ring2="Mars's Ring",
		back="Atheling Mantle"})
	sets.precast.WS['Ilvl~122'] = set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] = set_combine(sets.precast.WS['Ilvl~122'], {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Victory Smite"]    	 				= set_combine(sets.precast.WS, {
		ammo="Thew Bomblet",
		head="Uk'uxkaj cap",neck="Nefarious Collar",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Anchorite's Cyclas +1",hands="Anchorite's Gloves +1",ring1="Epona's Ring",ring2="Pyrosoul Ring",
		back="Rancorous Mantle",waist="Wanion Belt",legs="Wukong's Hakama +1",feet="Qaaxo Leggings"})
	sets.precast.WS["Victory Smite"].Impetus 				= set_combine(sets.precast.WS["Victory Smite"], {})
	sets.precast.WS["Victory Smite"]['Ilvl~118'] 			= set_combine(sets.precast.WS["Victory Smite"], {ammo="Honed Tathlum", body="Qaaxo Harness"})
	sets.precast.WS["Victory Smite"]['Ilvl~118'].Impetus 	= set_combine(sets.precast.WS["Victory Smite"]['Ilvl~118'], {})
	sets.precast.WS["Victory Smite"]['Ilvl~122'] 			= set_combine(sets.precast.WS["Victory Smite"]['Ilvl~118'], {head="Whirlpool Mask", neck=gear.ElementalGorget, hands="Hesychast Gloves +1", waist=gear.ElementalBelt, back="Anchoret's Mantle"})
	sets.precast.WS["Victory Smite"]['Ilvl~122'].Impetus 	= set_combine(sets.precast.WS["Victory Smite"]['Ilvl~122'], {})
	sets.precast.WS["Victory Smite"]['Ilvl~124+'] 			= set_combine(sets.precast.WS["Victory Smite"]['Ilvl~122'], {ear1="Pixie Earring",ear2="Thunder Pearl",ring1="Ramuh Ring",ring2="Ramuh Ring"})
	sets.precast.WS["Victory Smite"]['Ilvl~124+'].Impetus 	= set_combine(sets.precast.WS["Victory Smite"]['Ilvl~124+'], {})

	sets.precast.WS['Shijin Spiral']     			= set_combine(sets.precast.WS, {ammo="Jukukik Feather",neck="Moepapa Medal",body="Espial Gambison",hands="Otronif Gloves +1",ring2="Rajas Ring",back="Atheling Mantle", waist="Wanion Belt",feet="Anchorite's Gaiters +1"})
	sets.precast.WS['Shijin Spiral']['Ilvl~118'] 	= set_combine(sets.precast.WS.Acc, {neck="Rancor Collar",ring1="Thundersoul ring",feet="Espial Socks"})
	sets.precast.WS['Shijin Spiral']['Ilvl~122'] 	= set_combine(sets.precast.WS['Shijin Spiral'], {})
	sets.precast.WS['Shijin Spiral']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Shijin Spiral'], {})

	sets.precast.WS['Asuran Fists']    				= set_combine(sets.precast.WS, {neck="Soil Gorget",ring2="Spiral Ring"})
	sets.precast.WS['Asuran Fists']['Ilvl~118'] 	= set_combine(sets.precast.WS['Asuran Fists'], {neck="Soil Gorget",ring2="Spiral Ring"})
	sets.precast.WS['Asuran Fists']['Ilvl~122'] 	= set_combine(sets.precast.WS['Asuran Fists']['Ilvl~118'], {neck="Soil Gorget",ring2="Spiral Ring"})
	sets.precast.WS['Asuran Fists']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Asuran Fists']['Ilvl~122'], {neck="Soil Gorget",ring2="Spiral Ring"})

	sets.precast.WS["Ascetic's Fury"]     			= set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~118'] 	= set_combine(sets.precast.WS["Ascetic's Fury"], {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~122'] 	= set_combine(sets.precast.WS["Ascetic's Fury"]['Ilvl~118'], {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~124+'] 	= set_combine(sets.precast.WS["Ascetic's Fury"]['Ilvl~122'], {})
	
	sets.precast.WS["Ascetic's Fury"]     			= set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~118'] 	= set_combine(sets.precast.WS["Ascetic's Fury"], {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~122'] 	= set_combine(sets.precast.WS["Ascetic's Fury"]['Ilvl~118'], {})
	sets.precast.WS["Ascetic's Fury"]['Ilvl~124+'] 	= set_combine(sets.precast.WS["Ascetic's Fury"]['Ilvl~122'], {})

	sets.precast.WS['Cataclysm'] = {
		head="Thaumas Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Manibozho Jerkin",hands="Otronif Gloves +1",ring1="Rajas Ring",ring2="Demon's Ring",
		back="Toro Cape",waist="Thunder Belt"}
   
   
	-- Midcast Sets
   
	sets.midcast.FastRecast = {
		head="Haruspex Hat",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Dread Jupon",hands="Thaumas Gloves",ring2="Prolix Ring",
		waist="Black Belt",feet="Otronif Boots"}
		   
	-- Specific spells
	sets.midcast.Utsusemi = {
		head="Haruspex Hat",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Otronif Harness",hands="Thaumas Gloves",ring2="Prolix Ring",
		back="Mujin Mantle",waist="Black Belt",legs="Hesychast's Hose +1",feet="Otronif Boots"}

   
	-- Sets to return to when not performing an action.
   
	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		body="Hesychast's Cyclas",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
   

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Vanir Battery",
		head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Hesychast's Cyclas",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Mollusca Mantle",waist="Black Belt",legs="Otronif Brais +1",feet="Otronif Boots"}

	sets.idle.Town = {ammo="Ginsen",
		head="Felistris Mask",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Tantra Cyclas +2",hands="Hesychast's Gloves +1",ring1="Epona's Ring",ring2="Defending Ring",
		back="Mollusca Mantle",waist="Black Belt",legs="Hesychast's Hose +1",feet="Usukane Sune-ate"}
   
	sets.idle.Weak = {ammo="Thew Bomblet",
		head="Uk'uxkaj cap",neck="Wiglen Gorget",ear1="Brutal Earring",ear2="Bloodgem Earring",
		body="Hesychast's Cyclas",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Meridian Ring",
		back="Anchoret's Mantle",waist="Black Belt",legs="Hesychast's Hose +1",feet="Hesychast's Gaiters"}
   
	-- Defense sets
	sets.defense.PDT = {ammo="Tantra Tathlum",
		head="Lithelimb Cap",neck="Twilight Torque",ear1="Brutal Earring",ear2="Bloodgem Earring",
		body="Qaaxo Harness",hands="Otronif Gloves +1",ring1=gear.DarkRing.dt,ring2="Defending Ring",
		back="Repulse Mantle",waist="Black Belt",legs="Otronif Brais +1",feet="Otronif Boots"}

	sets.defense.HP = {ammo="Tantra Tathlum",
		head="Hesychast's Crown",neck="Twilight Torque",ear1="Brutal Earring",ear2="Bloodgem Earring",
		body="Hesychast's Cyclas",hands="Hesychast's Gloves +1",ring1="Eihwaz Ring",ring2="Meridian Ring",
		back="Repulse Mantle",waist="Black Belt",legs="Hesychast's Hose +1",feet="Hesychast's Gaiters"}

	sets.defense.MDT = {ammo="Vanir Battery",
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Merman's Earring",ear2="Merman's Earring",
		body="Qaaxo Harness",hands="Otronif Gloves +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Resolute Belt",legs="Kaabnax trousers",feet="Otronif Boots"}

	sets.Kiting = {feet="Herald's Gaiters"}
	
	sets.ExtraRegen = {hands="Garden bangles"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
   
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Felistris Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}
	sets.engaged['Ilvl~118'] = set_combine(sets.engaged, {ammo="Honed Tathlum",body="Qaaxo Harness",hands="Hesychast's Gloves +1"})
	sets.engaged['Ilvl~122'] = set_combine(sets.engaged['Ilvl~118'], {head="Whirlpool Mask",neck="Ej Necklace", back="Anchoret's Mantle"})
	sets.engaged['Ilvl~124+'] = set_combine(sets.engaged['Ilvl~122'], { ring2="Ramuh Ring",waist="Anguinus Belt", legs="Manibozho Brais"})
	
	
			
	-- Defensive melee hybrid sets		
	sets.engaged.PDT = {ammo="Tantra Tathlum",
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Arhat's Gi +1",hands="Otronif Gloves +1",ring1=gear.DarkRing.dt,ring2="Defending Ring",
		back="Mollusca Mantle",waist="Black Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged['Ilvl~118'].PDT = {ammo="Honed Tathlum",
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness",hands="Otronif Gloves +1",ring1="Mars's Ring",ring2="Defending Ring",
		back="Anchoret's Mantle",waist="Anguinus Belt",legs="Otronif Brais +1",feet="Otronif Boots"}
	sets.engaged['Ilvl~122'].PDT = set_combine(sets.engaged['Ilvl~118'].PDT, {})
	sets.engaged['Ilvl~124+'].PDT = set_combine(sets.engaged['Ilvl~122'].PDT, {})
	
	sets.engaged.Counter = {ammo="Thew Bomblet",
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Beeline Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Anchorite's Hose",feet="Otronif Boots"}
	sets.engaged['Ilvl~118'].Counter = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Beeline Ring",
		back="Anchoret's Mantle",waist="Anguinus Belt",legs="Anchorite's Hose",feet="Otronif Boots"}
	sets.engaged['Ilvl~122'].Counter = set_combine(sets.engaged['Ilvl~118'].Counter, {})
	sets.engaged['Ilvl~124+'].Counter = set_combine(sets.engaged['Ilvl~122'].Counter, {})
	
	
	-- Hundred Fists/Impetus melee set mods
	sets.engaged.HF = set_combine(sets.engaged)
	sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~118'].HF = set_combine(sets.engaged['Ilvl~118'])
	sets.engaged['Ilvl~118'].HF.Impetus = set_combine(sets.engaged['Ilvl~118'], {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~122'].HF = set_combine(sets.engaged['Ilvl~122'])
	sets.engaged['Ilvl~122'].HF.Impetus = set_combine(sets.engaged['Ilvl~122'], {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~124+'].HF = set_combine(sets.engaged['Ilvl~124+'])
	sets.engaged['Ilvl~124+'].HF.Impetus = set_combine(sets.engaged['Ilvl~124+'], {body="Tantra Cyclas +2"})
	
	sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
	sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~118'].Counter.HF = set_combine(sets.engaged['Ilvl~118'].Counter)
	sets.engaged['Ilvl~118'].Counter.HF.Impetus = set_combine(sets.engaged['Ilvl~118'].Counter, {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~122'].Counter.HF = set_combine(sets.engaged['Ilvl~122'].Counter)
	sets.engaged['Ilvl~122'].Counter.HF.Impetus = set_combine(sets.engaged['Ilvl~122'].Counter, {body="Tantra Cyclas +2"})
	sets.engaged['Ilvl~124+'].Counter.HF = set_combine(sets.engaged['Ilvl~124+'].Counter)
	sets.engaged['Ilvl~124+'].Counter.HF.Impetus = set_combine(sets.engaged['Ilvl~124+'].Counter, {body="Tantra Cyclas +2"})

	
	-- Footwork melee group
	sets.engaged.Footwork = {ammo="Thew Bomblet",
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Anchorite's Gaiters +1"}
	sets.engaged['Ilvl~118'].Footwork = set_combine(sets.engaged.Footwork, {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Manibozho Brais",feet="Anchorite's Gaiters +1"})
	sets.engaged['Ilvl~122'].Footwork = set_combine(sets.engaged['Ilvl~118'].Footwork )
	sets.engaged['Ilvl~124+'].Footwork = set_combine(sets.engaged['Ilvl~122'].Footwork)
			
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doomed = {ring1="Saida Ring"}
	
	-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
	sets.impetus_body = {body="Tantra Cyclas +2"}
	sets.footwork_kick_feet = {feet="Anchorite's Gaiters +1"}
	
	-- Miscellaneous	
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
