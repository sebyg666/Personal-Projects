 
function init_gear_sets()

	print('Colway_NIN_Gear.lua sidecar loaded')
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	-- Fast Cast Augments
	Taeon_Chapeau_FC 	= { name="Taeon Chapeau", augments={'"Fast Cast"+4'}}
	Taeon_Tabard_FC		= { name="Taeon Tabard", augments={'"Fast Cast"+5',}}
	Taeon_Boots_FC 		= { name="Taeon Boots", augments={'"Fast Cast"+3'}}
	
	-- TP augments
	Taeon_Chapeau_TP 	= { name="Taeon Chapeau", augments={'Accuracy+22','"Triple Atk."+2','STR+2 AGI+2',}}
	Taeon_Tabard_TP		= { name="Taeon Tabard", augments={'Accuracy+13','"Triple Atk."+2','STR+3 AGI+3',}}
	Taeon_Gloves_TP		= { name="Taeon Gloves", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','STR+2 AGI+2',}}
	Taeon_Tights_TP		= { name="Taeon Tights", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','AGI+3',}}
	Taeon_Boots_TP 		= { name="Taeon Boots", augments={'Accuracy+24','"Triple Atk."+2','STR+3 AGI+3',}}
	
	-- WS augments
	Taeon_Chapeau_WS	= { name="Taeon Chapeau", augments={'Attack+11','Crit.hit rate+3','STR+2 AGI+2',}}
	Taeon_Tabard_WS		= { name="Taeon Tabard", augments={'Attack+20','Crit.hit rate+3','STR+2 DEX+2',}}
	Taeon_Gloves_WS	 	= { name="Taeon Gloves", augments={'Accuracy+12 Attack+12','Crit.hit rate+3','AGI+9',}}
	Taeon_Tights_WS		= { name="Taeon Tights", augments={'Attack+15','Crit.hit rate+3','STR+3 DEX+3',}}
	Taeon_Boots_WS 		= { name="Taeon Boots", augments={'Attack+10','Crit.hit rate+3','STR+7 DEX+7',}}
	
	sets.weapons = {main="Tancho +1", sub="Taikogane"}
	sets.Items = {main="Shihei", sub="Inoshishinofuda", ranged="Shikanofuda", ammo= "Chonofuda"}
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Caudata Belt"
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
	sets.precast.JA['Futae'] = {hands="Hattori Tekko"}
	sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"}
	sets.precast.JA['Provoke'] = {
		neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Steelflash Earring",
		body="Emet Harness +1",ring1="Vexer Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Wukong's Hakama +1",feet="Mochizuki Kyahan +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Lithelimb Cap",
		body="Foppish Tunica",hands="Buremte Gloves",
		waist="Caudata Belt",legs="Otronif Brais +1",feet=Taeon_Boots_TP}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Set for acc on steps, since Yonin drops acc a fair bit
	sets.precast.Step = {
		head=Taeon_Chapeau_TP,
		body="Mochizuki Chainmail +1",hands="Buremte Gloves",ring1="Mars's Ring",
		back="Yokaze Mantle",waist="Dynamic Belt +1",legs="Hachiya Hakama +1",feet=Taeon_Boots_TP}
		
	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
			head=Taeon_Chapeau_FC,neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Taeon_Tabard_FC,hands="Thaumas Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
			legs="Quiahuiz Trousers",feet=Taeon_Boots_FC}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads", body="Mochizuki Chainmail +1"})
	sets.precast.FC.NinjutsuIII = set_combine(sets.precast.FC, {feet="Mochizuki Kyahan +1"})
	
	-- Snapshot for ranged
	sets.precast.RA = {ammo="Hachiya Shuriken",head="Aurore Beret +1",hands="Manibozho Gloves",legs="Nahtirah Trousers"}
    
	------------------------------------------------------ 
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	------------------------------------------------------
	
	sets.precast.WS = {ammo="Yetshila",
		head="Gavialis Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body=Taeon_Tabard_TP,hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Karieyh ring",
		back="Atheling Mantle",waist="Fotia Belt",legs="Otronif Brais +1",feet="Mochizuki Kyahan +1"}
	sets.precast.WS['Ilvl~118']  	= set_combine(sets.precast.WS, {ammo="Jukukik Feather",hands="Buremte Gloves",back="Yokaze Mantle"})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
	
	-----------------------------------------------------
	sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {neck="Rancor Collar"})
	-----------------------------------------------------
	sets.precast.WS['Blade: Hi'] 				= set_combine(sets.precast.WS, {
													head=Taeon_Chapeau_WS,neck="Rancor Collar",body="Foppish Tunica",hands=Taeon_Gloves_WS,
													back="Yokaze Mantle",waist="Windbuffet Belt +1",legs=Taeon_Tights_WS,feet=Taeon_Boots_WS})
	sets.precast.WS['Blade: Hi']['Ilvl~118']	= set_combine(sets.precast.WS['Blade: Hi'], {})
	sets.precast.WS['Blade: Hi']['Ilvl~122']	= set_combine(sets.precast.WS['Blade: Hi']['Ilvl~118'], {})
	sets.precast.WS['Blade: Hi']['Ilvl~124+']	= set_combine(sets.precast.WS['Blade: Hi']['Ilvl~122'], {head=Taeon_Chapeau_TP,legs=Taeon_Tights_TP,feet=Taeon_Boots_TP})
	------------------------------------------------------
	sets.precast.WS['Blade: Shun'] 				= set_combine(sets.precast.WS, {ammo="Jukukik Feather",
														body="Foppish Tunica",hands=Taeon_Gloves_TP,
														back="Yokaze Mantle",legs="Manibozho Brais",feet=Taeon_Boots_TP})
	sets.precast.WS['Blade: Shun']['Ilvl~118']	= set_combine(sets.precast.WS['Blade: Shun'], {})
	sets.precast.WS['Blade: Shun']['Ilvl~122']	= set_combine(sets.precast.WS['Blade: Shun']['Ilvl~118'], {})
	sets.precast.WS['Blade: Shun']['Ilvl~124+']	= set_combine(sets.precast.WS['Blade: Shun']['Ilvl~122'], {ring1="Ramuh Ring",ring2="Ramuh Ring"})
	------------------------------------------------------
	sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {ammo="Jukukik Feather",
		body="Foppish Tunica",hands="Mochizuki Tekko +1",
		back="Yokaze Mantle", legs="Manibozho Brais",feet="Mochizuki Kyahan +1"})
	------------------------------------------------------
	sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Sombra Harness",hands="Mochizuki Tekko +1",ring1="Perception Ring",ring2="Fenrir Ring",
		back="Toro Cape",legs="Shneddick Tights +1",feet="Hachiya Kyahan"}
	-------------------------------------------------------
	sets.precast.MaxTP_Agi = {ear2="Drone Earring"}
	sets.precast.MaxTP_Dex = {ear2="Pixie Earring"}
	
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
	sets.midcast.FastRecast = {ammo="Impatiens",
		head=Taeon_Chapeau_FC,neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=Taeon_Tabard_FC,hands="Mochizuki Tekko +1",ring1="Prolix Ring",ring2="Beeline Ring",
		back="Mujin Mantle",waist="Sveltesse Gouriz +1",legs="Quiahuiz Trousers",feet=Taeon_Boots_FC}
		
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = set_combine(sets.midcast.FastRecast, {neck="Ninjutsu Torque",ear1="Stealth Earring",ear2="Ninjutsu Earring"})

	sets.midcast["Utsusemi: Ichi"] = set_combine(sets.midcast.SelfNinjutsu, {neck="Willpower Torque", waist="Resolute Belt",legs="Wukong's Hakama +1",feet="Hattori Kyahan"})
	
	sets.midcast["Utsusemi: Ni"] = set_combine(sets.midcast.SelfNinjutsu, {feet="Hattori Kyahan"})
	
	sets.midcast["Utsusemi: San"] = set_combine(sets.midcast.SelfNinjutsu, {feet="Hattori Kyahan"})

	-- any ninjutsu cast on enemies
	sets.midcast.ElementalNinjutsu = {ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi",neck="Deviant Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Sombra Harness",hands="Mochizuki Tekko +1",ring1="Perception Ring",ring2="Fenrir Ring",
		back="Aput Mantle",waist="Salire Belt",legs="Shneddick Tights +1",feet="Hachiya Kyahan"}
	sets.midcast.NinjutsuIII = set_combine(sets.midcast.ElementalNinjutsu, {})

	sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {ear1="Gwati Earring",ear2="Enchanter Earring +1",})
	sets.midcast.NinjutsuIII.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.midcast.NinjutsuDebuff = {
		head="Hachiya Hatsuburi",neck="Atzintli Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands="Mochizuki Tekko +1",ring1="Perception Ring",ring2="Fenrir Ring",
		back="Yokaze Mantle",waist="Ovate Rope",legs="Shneddick Tights +1",feet="Mochizuki Kyahan +1"}

	sets.midcast.NinjutsuBuff = set_combine(sets.midcast.SelfNinjutsu, {head="Hachiya Hatsuburi",waist="Resolute Belt",legs="Wukong's Hakama +1",back="Yokaze Mantle",feet="Mochizuki Kyahan +1"})

	sets.midcast.RA = {ammo="Hachiya Shuriken",head=Taeon_Chapeau_WS,body="Foppish Tunica",back="Yokaze Mantle",waist="Wanion Belt",legs="Hachiya Hakama +1",feet="Qaaxo Leggings"}
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	
	-- Resting sets
	sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Yetshila",
		head="Lithelimb Cap",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Emet Harness +1",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Karieyh ring",
		back="Mollusca Mantle",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

	sets.idle.Town = {ammo="Yetshila",
		head="Hattori Zukin",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Etiolation Earring",
		body="Mochizuki Chainmail +1",hands="Sasuke Tekko +1",ring1="Epona's Ring",ring2="Defending Ring",
		back="Bleating Mantle",waist="Patentia Sash",legs="Wukong's Hakama +1",feet="Mochizuki Kyahan +1"}
	
	sets.idle.Weak = {ammo="Yetshila",
		head="Lithelimb Cap",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Emet Harness +1",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	
	-- Defense sets
	sets.defense.Evasion = {
		head="Gavialis Helm",neck="Ej Necklace",ear1="Evader Earring",ear2="Phawaylla Earring",
		body=Taeon_Tabard_TP,hands="Sasuke Tekko +1",ring1="Epona's Ring",ring2="Beeline Ring",
		back="Yokaze Mantle",waist="Sveltesse Gouriz +1", legs="Kaabnax Trousers", feet="Mochizuki Kyahan +1"}

	sets.defense.PDT = {
		head="Lithelimb Cap",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Emet Harness +1",hands="Macabre Gaunt. +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

	sets.defense.MDT = {ammo="Vanir Battery",
		head="Lithelimb Cap",neck="Twilight Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
		body=Taeon_Tabard_TP,hands="Otronif Gloves +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Resolute Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}


	sets.Kiting = {}


	--------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	----------------------------------------
	-- Normal melee group: No Haste (38% DW)
	----------------------------------------
	sets.engaged 						= {ammo=gear.DakanAmmo,
											head="Hattori Zukin",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
											body="Mochizuki Chainmail +1",hands=Taeon_Gloves_TP,ring1="Epona's Ring",ring2="Rajas Ring",
											back="Bleating Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet=Taeon_Boots_TP}
	sets.engaged['Ilvl~118']	= set_combine(sets.engaged, 			{feet=Taeon_Boots_WS})
	sets.engaged['Ilvl~122']	= set_combine(sets.engaged['Ilvl~118'], {head=Taeon_Chapeau_TP,feet=Taeon_Boots_TP})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {feet=Taeon_Boots_WS})										
											
	sets.engaged.Evasion 				= set_combine(sets.engaged,						{neck="Ej Necklace",hands="Otronif Gloves +1",ring2="Dumakulem's Ring",
																						back="Atheling Mantle",waist="Nusku's Sash"})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, 			{})
	sets.engaged['Ilvl~122'].Evasion	= set_combine(sets.engaged['Ilvl~118'].Evasion, {head=Taeon_Chapeau_TP,hands="Sasuke Tekko +1",back="Yokaze Mantle"})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {neck="Ej Necklace", ear1="Evader Earring",ear2="Phawaylla Earring",
																						ring2="Beeline Ring",
																						waist="Sveltesse Gouriz +1", legs="Hachiya Hakama +1", feet="Mochizuki Kyahan +1"})										
	
------------------------------------------------------------------	
											
	sets.engaged.NoHaste 				= set_combine(sets.engaged, {})
	sets.engaged['Ilvl~118'].NoHaste	= set_combine(sets.engaged.NoHaste, 			{feet=Taeon_Boots_WS})
	sets.engaged['Ilvl~122'].NoHaste 	= set_combine(sets.engaged['Ilvl~118'].NoHaste, {head=Taeon_Chapeau_TP,feet=Taeon_Boots_TP})
	sets.engaged['Ilvl~124+'].NoHaste 	= set_combine(sets.engaged['Ilvl~122'].NoHaste, {feet=Taeon_Boots_WS})
	
	-- evasion sets
	sets.engaged.Evasion.NoHaste 				= set_combine(sets.engaged.Evasion,						{neck="Ej Necklace",hands="Otronif Gloves +1",ring2="Dumakulem's Ring",
																										back="Atheling Mantle",waist="Nusku's Sash"})
	sets.engaged['Ilvl~118'].Evasion.NoHaste 	= set_combine(sets.engaged.Evasion.NoHaste, 			{})
	sets.engaged['Ilvl~122'].Evasion.NoHaste	= set_combine(sets.engaged['Ilvl~118'].Evasion.NoHaste, {head=Taeon_Chapeau_TP,hands="Sasuke Tekko +1",back="Yokaze Mantle"})
	sets.engaged['Ilvl~124+'].Evasion.NoHaste 	= set_combine(sets.engaged['Ilvl~122'].Evasion.NoHaste, {neck="Ej Necklace", ear1="Evader Earring",ear2="Phawaylla Earring",
																										ring2="Beeline Ring",
																										waist="Sveltesse Gouriz +1", legs="Hachiya Hakama +1", feet="Mochizuki Kyahan +1"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			head="Hattori Zukin",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: low Haste (~36% DW)-             body="Mochizuki Chainmail +1",hands=Taeon_Gloves_TP,ring1="Epona's Ring",ring2="Rajas Ring",
	--------------------------------------------            back="Bleating Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet=Taeon_Boots_TP}
	
	sets.engaged.LowHaste 				= set_combine(sets.engaged, 						{ear1="Brutal Earring",ear2="Suppanomimi"})
	sets.engaged['Ilvl~118'].LowHaste 	= set_combine(sets.engaged.LowHaste, 				{feet=Taeon_Boots_WS})
	sets.engaged['Ilvl~122'].LowHaste 	= set_combine(sets.engaged['Ilvl~118'].LowHaste, 	{head=Taeon_Chapeau_TP,feet=Taeon_Boots_TP})
	sets.engaged['Ilvl~124+'].LowHaste 	= set_combine(sets.engaged['Ilvl~122'].LowHaste, 	{feet=Taeon_Boots_WS})
		
		----------------					head="Hattori Zukin",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body="Mochizuki Chainmail +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Nusku's Sash",legs="Mochizuki Hakama +1",feet=Taeon_Boots_TP}
		
		sets.engaged.Evasion.LowHaste				= set_combine(sets.engaged.Evasion, 						{ear1="Brutal Earring",ear2="Suppanomimi"})
		sets.engaged['Ilvl~118'].Evasion.LowHaste 	= set_combine(sets.engaged.Evasion.LowHaste, 				{})
		sets.engaged['Ilvl~122'].Evasion.LowHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.LowHaste, 	{head=Taeon_Chapeau_TP,hands="Sasuke Tekko +1",back="Yokaze Mantle"})
		sets.engaged['Ilvl~124+'].Evasion.LowHaste 	= set_combine(sets.engaged['Ilvl~122'].Evasion.LowHaste, 	{neck="Ej Necklace", ear1="Evader Earring",ear2="Phawaylla Earring",
																												ring2="Beeline Ring",
																												waist="Sveltesse Gouriz +1", legs="Hachiya Hakama +1", feet="Mochizuki Kyahan +1"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			head="Hattori Zukin",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi"
	-- Custom melee group: MidHaste (~21% DW)-              body="Mochizuki Chainmail +1",hands=Taeon_Gloves_TP,ring1="Epona's Ring",ring2="Rajas Ring",
	--------------------------------------------            back="Bleating Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet=Taeon_Boots_TP}
	
	sets.engaged.MidHaste 				= set_combine(sets.engaged.LowHaste, 				{head=Taeon_Chapeau_TP,ear1="Dudgeon Earring",ear2="Heartseeker Earring",
																							hands="Otronif Gloves +1",
																							waist="Windbuffet Belt +1",legs="Hachiya Hakama +1"})
	sets.engaged['Ilvl~118'].MidHaste  	= set_combine(sets.engaged.MidHaste, 				{hands=Taeon_Gloves_TP})
	sets.engaged['Ilvl~122'].MidHaste 	= set_combine(sets.engaged['Ilvl~118'].MidHaste, 	{neck="Ej Necklace",back="Yokaze Mantle"})
	sets.engaged['Ilvl~124+'].MidHaste  = set_combine(sets.engaged['Ilvl~122'].MidHaste, 	{head="Gavialis Helm", waist="Anguinus Belt"})
	
		----------------					head="Hattori Zukin",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi"				
		-- evasion sets                     body="Mochizuki Chainmail +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Nusku's Sash",legs="Mochizuki Hakama +1",feet=Taeon_Boots_TP}
	
		sets.engaged.Evasion.MidHaste  				= set_combine(sets.engaged.Evasion.LowHaste, 				{head=Taeon_Chapeau_TP,ear1="Dudgeon Earring",ear2="Heartseeker Earring",
																												waist="Sveltesse Gouriz +1",legs="Hachiya Hakama +1"})
		sets.engaged['Ilvl~118'].Evasion.MidHaste  	= set_combine(sets.engaged.Evasion.MidHaste, 				{})
		sets.engaged['Ilvl~122'].Evasion.MidHaste  	= set_combine(sets.engaged['Ilvl~118'].Evasion.MidHaste, 	{head="Gavialis Helm",hands="Sasuke Tekko +1",back="Yokaze Mantle"})
		sets.engaged['Ilvl~124+'].Evasion.MidHaste  = set_combine(sets.engaged['Ilvl~122'].Evasion.MidHaste, 	{neck="Ej Necklace", ear1="Evader Earring",ear2="Phawaylla Earring",
																												ring2="Beeline Ring",
																												feet="Mochizuki Kyahan +1"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			head=Taeon_Chapeau_TP,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: High Haste (7% DW)               body="Mochizuki Chainmail +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
	---------------------------------------------           back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Hachiya Hakama +1",feet=Taeon_Boots_TP}
	
	sets.engaged.HighHaste 				= set_combine(sets.engaged.MidHaste, 				{head=Taeon_Chapeau_WS,body="Thaumas Coat",legs="Otronif Brais +1",feet="Otronif Boots +1"})
	sets.engaged['Ilvl~118'].HighHaste 	= set_combine(sets.engaged.HighHaste, 				{body=Taeon_Tabard_TP,hands=Taeon_Gloves_TP})
	sets.engaged['Ilvl~122'].HighHaste 	= set_combine(sets.engaged['Ilvl~118'].HighHaste, 	{head=Taeon_Chapeau_TP,neck="Ej Necklace", body=Taeon_Tabard_TP,back="Yokaze Mantle",feet="Qaaxo Leggings"})
	sets.engaged['Ilvl~124+'].HighHaste = set_combine(sets.engaged['Ilvl~122'].HighHaste, 	{head="Gavialis Helm", 
																							body="Foppish Tunica",hands="Sasuke Tekko +1", ring2="Beeline Ring", 
																							waist="Anguinus Belt",legs=Taeon_Tights_TP, feet="Mochizuki Kyahan +1"})
	
		----------------					head=Taeon_Chapeau_TP,neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body="Mochizuki Chainmail +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Sveltesse Gouriz +1",legs="Hachiya Hakama +1",feet=Taeon_Boots_TP}
		
		sets.engaged.Evasion.HighHaste 				= set_combine(sets.engaged.Evasion.MidHaste, 				{body="Emet Harness +1"})
		sets.engaged['Ilvl~118'].Evasion.HighHaste 	= set_combine(sets.engaged.Evasion.HighHaste, 				{})
		sets.engaged['Ilvl~122'].Evasion.HighHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.HighHaste, 	{body=Taeon_Tabard_TP,back="Yokaze Mantle"})
		sets.engaged['Ilvl~124+'].Evasion.HighHaste = set_combine(sets.engaged['Ilvl~122'].Evasion.HighHaste, 	{head="Gavialis Helm",ear1="Evader Earring",ear2="Phawaylla Earring",
																												body="Emet Harness +1",ring2="Beeline Ring",
																												legs="Kaabnax Trousers",feet="Mochizuki Kyahan +1"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			head=Taeon_Chapeau_TP,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: Max Haste (0% DW)            body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
	-----------------------------------------           back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	
	sets.engaged.MaxHaste 				= set_combine(sets.engaged.HighHaste,				{head=Taeon_Chapeau_WS,ear1="Steelflash Earring",ear2="Bladeborn Earring"})
	sets.engaged['Ilvl~118'].MaxHaste 	= set_combine(sets.engaged.MaxHaste, 				{body=Taeon_Tabard_TP,hands="Otronif Gloves +1",legs="Otronif Boots +1"})
	sets.engaged['Ilvl~122'].MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].MaxHaste, 	{head=Taeon_Chapeau_TP,neck="Ej Necklace",back="Yokaze Mantle",Taeon_Tights_TP,feet="Qaaxo Leggings"})
	sets.engaged['Ilvl~124+'].MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].MaxHaste, 	{head="Gavialis Helm",ear2="Heartseeker Earring",body="Foppish Tunica",hands=Taeon_Gloves_TP,waist="Anguinus Belt",feet=Taeon_Boots_TP})
	
		----------------					head=Taeon_Chapeau_TP,neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body="Emet Harness +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Sveltesse Gouriz +1",legs="Hachiya Hakama +1",feet=Taeon_Boots_TP}
		
		sets.engaged.Evasion.MaxHaste 					= set_combine(sets.engaged.Evasion.MidHaste, 				{ear1="Bladeborn Earring",ear2="Steelflash Earring",hands="Sasuke Tekko +1",
																													legs=Taeon_Tights_TP})
		sets.engaged['Ilvl~118'].Evasion.MaxHaste 		= set_combine(sets.engaged.Evasion.MaxHaste, 				{})
		sets.engaged['Ilvl~122'].Evasion.MaxHaste 		= set_combine(sets.engaged['Ilvl~118'].Evasion.MaxHaste, 	{body=Taeon_Tabard_TP,back="Yokaze Mantle",waist="Sveltesse Gouriz +1"})
		sets.engaged['Ilvl~124+'].Evasion.MaxHaste 		= set_combine(sets.engaged['Ilvl~122'].Evasion.MaxHaste, 	{head="Gavialis Helm",ear1="Evader Earring",ear2="Phawaylla Earring",
																													body="Emet Harness +1",ring2="Beeline Ring",
																													legs="Kaabnax Trousers",feet="Mochizuki Kyahan +1"})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------
	-- Max STP for 2 Handed weapons (used in proking)
	-----------------------------------------------------
	sets.ExtraSTP = {ammo='Ginsen',
		head=Taeon_Chapeau_TP,neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Thaumas Coat",hands="Otronif Gloves +1",ring1="K'ayres Ring",ring2="Rajas Ring",
		waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet='Otronif Boots +1'}
	
	---------------------------------------
	-- Buff Sets and Miscelanie
	---------------------------------------
	sets.Rancor = {neck="Rancor Collar"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
	
	sets.buff.Migawari = {body="Hattori Ningi"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring"}
	sets.buff.Yonin = {}
	sets.buff.Innin = {}
	sets.buff.Sange = {ammo = gear.DakanAmmo, body="Mochizuki Chainmail +1"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.Gavialis = {head="Gavialis Helm"}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 