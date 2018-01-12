 
function init_gear_sets()
	print('Spyderhawk_SAM_gear.lua side_cart loaded')
		
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
	sets.resting 	= {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    sets.Kiting 	= {feet="Danzo Sune-ate"}
	sets.Reraise 	= {head="Twilight Helm",body="Twilight Mail"}
	sets.Regen 		= {}
	sets.PDT = {
		head="Otomi Helm",	neck="Twilight Torque",ear1="Colossus's earring",ear2="Darkness earring",
		body="Sakonji Domaru +1",hands="Sakonji Kote +1",ring1="Dark Ring",ring2="Patricius Ring",
		back="Shadow mantle",waist="Flume Belt",legs="Acro Breeches",feet="Otronif Boots +1"}

	----------------------------------------------------------------------------------------------------------------------------------------------------
    -- Precast Sets
	----------------------------------------------------------------------------------------------------------------------------------------------------
    
	-- Precast sets to enhance JAs
    sets.precast.JA.Meditate 			= {head="Wakido Kabuto +1",hands="Sakonji Kote +1",back="Takaha Mantle"}
    sets.precast.JA['Warding Circle'] 	= {head="Wakido Kabuto +1"}
    sets.precast.JA['Blade Bash']		= {hands="Sakonji Kote +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Yaoyotl Helm",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.FC = set_combine(sets.PDT,{ammo="",
		neck="Orunmila's Torque",ear1="Loquac. Earring",
		ring1="Prolix Ring",ring2="Veneficium Ring"})
		
	-- Ranged snapshot gear
    sets.precast.RA = {}
	
	----------------------------------------------------------------------------------------------------------------------------------------------------       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	----------------------------------------------------------------------------------------------------------------------------------------------------
	
	sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
	
    sets.precast.WS = {head="Otomi Helm",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Moonshade earring",
		body="Phorcys Korazin",hands="Miki. Gauntlets",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back="Takaha Mantle",waist="Metalsinger Belt",legs="Scuff. Cosciales",feet="Sak. Sune-ate +1"}
		
    sets.precast.WS.AvgACC 	= set_combine(sets.precast.WS, 			{})
	sets.precast.WS.MidACC 	= set_combine(sets.precast.WS.AvgACC, 	{head="Yaoyotl Helm",feet="Wakido Sune-ate +1",})
	sets.precast.WS.HighACC = set_combine(sets.precast.WS.MidACC, 	{})
	sets.precast.WS.OshiACC = set_combine(sets.precast.WS.OshiACC, 	{})
	

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	----------------------------------------------------------------------------------------------------------------------------------------------------
    sets.precast.WS['Tachi: Fudo'] 			= set_combine(sets.precast.WS, 													{neck="Fotia Gorget",ear1="Vulcan's Pearl",hands="Boor Bracelets",ring1="Karieyh Ring",back="Buquwik Cape"})
    sets.precast.WS['Tachi: Fudo'].AvgACC 	= set_combine(sets.precast.WS.AvgACC, 	sets.precast.WS['Tachi: Fudo'], 		{feet="Acro Leggings"})
	sets.precast.WS['Tachi: Fudo'].MidACC 	= set_combine(sets.precast.WS.MidACC, 	sets.precast.WS['Tachi: Fudo'].AvgACC,	{body="Acro Surcoat",legs="Acro Breeches",waist="Prosilio Bekt +1"})
    sets.precast.WS['Tachi: Fudo'].HighACC 	= set_combine(sets.precast.WS.HighACC, 	sets.precast.WS['Tachi: Fudo'].MidACC, 	{head="Acro Helm"})
	sets.precast.WS['Tachi: Fudo'].OshiACC	= set_combine(sets.precast.WS.OshiACC, 	sets.precast.WS['Tachi: Fudo'].HighACC, {back="Takaha Mantle",ear1="Steelflash Earring",feet= {name="Acro Leggings", augments={'Weapon Skill Acc.+14'}}})
	----------------------------------------------------------------------------------------------------------------------------------------------------
    sets.precast.WS['Tachi: Shoha'] 		= set_combine(sets.precast.WS, 													{neck="Fotia Gorget",hands="Boor Bracelets",ring2="Karieyh Ring",back="Bleating Mantle",legs="Scuff. Cosciales",feet="Acro Leggings",waist="Windbuffet Belt +1"})
    sets.precast.WS['Tachi: Shoha'].AvgACC 	= set_combine(sets.precast.WS.AvgACC, 	sets.precast.WS['Tachi: Shoha'], 		{legs="Acro Breeches"})
	sets.precast.WS['Tachi: Shoha'].MidACC 	= set_combine(sets.precast.WS.MidACC, 	sets.precast.WS['Tachi: Shoha'].AvgACC,	{body="Acro Surcoat"})
    sets.precast.WS['Tachi: Shoha'].HighACC = set_combine(sets.precast.WS.HighACC, 	sets.precast.WS['Tachi: Shoha'].MidACC, {back="Letalis Mantle"})
	sets.precast.WS['Tachi: Shoha'].OshiACC = set_combine(sets.precast.WS.OshiACC, 	sets.precast.WS['Tachi: Shoha'].HighACC, {feet= {name="Acro Leggings", augments={'Weapon Skill Acc.+14'},head="Acro Helm"}})
	----------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Tachi: Rana'] 			= set_combine(sets.precast.WS, 													{neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Acro Surcoat",ring2="Karieyh Ring",back="Bleating Mantle",waist="Windbuffet Belt +1",feet="Acro Leggings"})
    sets.precast.WS['Tachi: Rana'].AvgACC 	= set_combine(sets.precast.WS.AvgACC, 	sets.precast.WS['Tachi: Rana'], 		{back="Takaha Mantle"})
	sets.precast.WS['Tachi: Rana'].MidACC 	= set_combine(sets.precast.WS.MidACC, 	sets.precast.WS['Tachi: Rana'].AvgACC, 	{body="Kasuga Domaru +1"})
    sets.precast.WS['Tachi: Rana'].HighACC	= set_combine(sets.precast.WS.HighACC, 	sets.precast.WS['Tachi: Rana'].MidACC, 	{head="Acro Helm",waist="Prosilio Belt +1"})
	sets.precast.WS['Tachi: Rana'].OshiACC 	= set_combine(sets.precast.WS.OshiACC, 	sets.precast.WS['Tachi: Rana'].HighACC, {ear1="Zennaroi Earring",feet= {name="Acro Leggings", augments={'Weapon Skill Acc.+14'}}})
	----------------------------------------------------------------------------------------------------------------------------------------------------
    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {head="Sakonji Kabuto +1",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Hecate's Earring",
																	back="Toro Cape",waist="Fotia Belt",legs="Wakido Haidate +1",})
	
	
	----------------------------------------------------------------------------------------------------------------------------------------------------
    -- Midcast Sets
	----------------------------------------------------------------------------------------------------------------------------------------------------
    sets.midcast.FastRecast = set_combine(sets.PDT,{
        head="Wakido Kabuto",
		body="Sakonji domaru +1",hands="Sao. Kote +2",
		waist="Olseni Belt",legs="Wakido Haidate +1",feet="Whirlpool Greaves"})
	
	-- Ranged gear
    sets.midcast.RA = {
        head="Sakonji Kabuto +1",neck="Iqabi Necklace",ear1="Flame Pearl",ear2="Flame Pearl",
		body="Kyujutsugi",hands="Buremte Gloves",ring1="Hajduk Ring",ring2="Hajduk Ring",
		back="Thall Mantle",waist="Olseni Belt",legs="Wakido Haidate +1",feet="Wakido Sune-ate +1"}
	----------------------------------------------------------------------------------------------------------------------------------------------------
    -- Sets to return to when not performing an action.
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	----------------------------------------------------------------------------------------------------------------------------------------------------
	sets.idle = {Range="Cibitshavore",
		head="Otomi Helm",neck="Twilight torque",ear1="Merman's earring",ear2="Sanare Earring",
		body="Sakonji Domaru +1",hands="Sakonji Kote +1",ring1="Dark Ring",ring2="Patricius Ring",
		back="Shadow mantle",waist="Flume belt",legs="Otronif Brais +1",feet="Danzo Sune-ate"}
		
    sets.idle.Town = {
        head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Tripudio Earring",ear2="Brutal Earring",
        body="Sakonji Domaru +1",hands="Sakonji Kote +1",ring1="Dark Ring",ring2="Shadow Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Wakido Haidate +1",feet="Danzo Sune-ate"}

    sets.idle.Weak = set_combine(sets.idle, sets.Reraise)
	sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)	
	sets.idle.Regen = set_combine(sets.idle, sets.Regen)
	----------------------------------------------------------------------------------------------------------------------------------------------------
    -- Defense sets
	----------------------------------------------------------------------------------------------------------------------------------------------------
    sets.defense.PDT = {
		head="Otomi Helm",neck="Twilight Torque",ear1="Merman's earring",ear2="Sanare Earring",
		body="Sakonji Domaru +1",hands="Sakonji Kote +1",ring1="Dark Ring",ring2="Patricius Ring",
		back="Shadow mantle",waist="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots +1"}

    sets.defense.MDT = {
        head="Otomi Helm",neck="Twilight Torque",ear1="Merman's earring",ear2="Sanare Earring",
		body="Mekira Meikogai",hands="Sakonji Kote +1",ring1="Dark Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots +1"}
		
	sets.defense.Reraise = {
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}
	----------------------------------------------------------------------------------------------------------------------------------------------------
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 	----------------------------------------------------------------------------------------------------------------------------------------------------   
	-----------------------------------------
    -- Normal melee group
	-----------------------------------------
    sets.engaged = {
        head="Acro Helm",neck="Ganesha's Mala",ear1="Tripudio earring",ear2="Brutal earring",
		body="Kasuga Domaru +1",hands="Acro Gauntlets",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Takaha Mantle",waist="Windbuffet belt +1",legs="Kasuga Haidate +1",feet="Sak. Sune-Ate +1"}
    sets.engaged.AvgACC 			= set_combine(sets.engaged, 		{feet= {name="Acro Leggings", augments={'Accuracy+20','"Store TP"+6','STR+2 AGI+2'}}})
	sets.engaged.MidACC 			= set_combine(sets.engaged.AvgACC, 	{ear2="Steelflash Earring"})
	sets.engaged.HighACC 			= set_combine(sets.engaged.MidACC, 	{head="Yaoyotl Helm",neck="Dakatsu Nodowa",waist="Dynamic Belt +1",ring1="Mars's Ring"})
	sets.engaged.OshiACC 			= set_combine(sets.engaged.HighACC, {neck="Iqabi Necklace",ear1="Heartseeker Earring",hands="Sasuke Tekko +1",
																		waist="Anguinus Belt",back="Grounded Mantle +1"})
	-- with Ionis
	sets.engaged.Ionis 				= set_combine(sets.engaged, {})
    sets.engaged.Ionis.AvgACC 		= set_combine(sets.engaged.AvgACC, {})
	sets.engaged.Ionis.MidACC 		= set_combine(sets.engaged.MidACC, {})
	sets.engaged.Ionis.HighACC 		= set_combine(sets.engaged.HighACC, {})
	sets.engaged.Ionis.OshiACC 		= set_combine(sets.engaged.OshiACC, {})
	
	-------------------------------------------
	-- Hybrid Sets
	-------------------------------------------
    sets.engaged.PDT 			= set_combine(sets.engaged, sets.PDT, 	{head="Yaoyotl Helm",neck="Dakatsu Nodowa",ear1="Tripudio Earring",ear2="Steelflash Earring",
																		body="Acro Surcoat",hands="Wakido Kote +1",ring1="Dark ring",ring2="Patricius Ring",
																		back="Tahaka Mantle",waist="Anguinus Belt",legs="Acro Brreches",feet="Acro Leggings"})
    sets.engaged.AvgACC.PDT 	= set_combine(sets.engaged.PDT, 		{ring1="Yacuruma Ring"})
	sets.engaged.MidACC.PDT 	= set_combine(sets.engaged.AvgACC.PDT, 	{})
	sets.engaged.HighACC.PDT 	= set_combine(sets.engaged.MidACC.PDT, 	{})
	sets.engaged.OshiACC.PDT 	= set_combine(sets.engaged.HighACC.PDT, {})
	
	sets.engaged.Reraise 			= set_combine(sets.engaged, sets.Reraise, {})
	sets.engaged.AvgACC.Reraise 	= set_combine(sets.engaged.Reraise, {})
	sets.engaged.MidACC.Reraise 	= set_combine(sets.engaged.AvgACC.Reraise, {})
	sets.engaged.HighACC.Reraise 	= set_combine(sets.engaged.MidACC.Reraise, {})
	sets.engaged.OshiACC.Reraise 	= set_combine(sets.engaged.HighACC.Reraise, {})
	-- with Ionis
	sets.engaged.Ionis.PDT 			= set_combine(sets.engaged.PDT , {})
    sets.engaged.Ionis.AvgACC.PDT 	= set_combine(sets.engaged.AvgACC.PDT ,{})
	sets.engaged.Ionis.MidACC.PDT 	= set_combine(sets.engaged.MidACC.PDT, {})
	sets.engaged.Ionis.HighACC.PDT 	= set_combine(sets.engaged.HighACC.PDT, {})
	sets.engaged.Ionis.OshiACC.PDT 	= set_combine(sets.engaged.OshiACC.PDT, {})
	
	sets.engaged.Ionis.Reraise 			= set_combine(sets.engaged.Reraise, {})
	sets.engaged.Ionis.AvgACC.Reraise 	= set_combine(sets.engaged.AvgACC.Reraise, {})
	sets.engaged.Ionis.MidACC.Reraise 	= set_combine(sets.engaged.MidACC.Reraise, {})
	sets.engaged.Ionis.HighACC.Reraise 	= set_combine(sets.engaged.HighACC.Reraise, {})
	sets.engaged.Ionis.OshiACC.Reraise 	= set_combine(sets.engaged.OshiACC.Reraise, {})	
	
	---------------------------------------
	-- Kogarasumaru Aftermath: Lv.3 sets
	---------------------------------------
	sets.engaged['Koga Aft Lv3'] 				= set_combine(sets.engaged, {})
    sets.engaged['Koga Aft Lv3'].AvgACC 		= set_combine(sets.engaged['Koga Aft Lv3'], 		{feet="Acro Leggings"})
	sets.engaged['Koga Aft Lv3'].MidACC 		= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC, 	{body="Acro Surcoat"})
	sets.engaged['Koga Aft Lv3'].HighACC 		= set_combine(sets.engaged['Koga Aft Lv3'].MidACC, 	{head="Yaoyotl Helm",neck="Dakatsu Nodowa",ear2="Steelflash Earring",
																									ring1="Mars's ring",
																									waist="Anguinus Belt"})
	sets.engaged['Koga Aft Lv3'].OshiACC 		= set_combine(sets.engaged['Koga Aft Lv3'].HighACC, {neck="Iqabi Necklace",ear1="Heartseeker Earring",
																									waist="Dynamic Belt +1"})
	-- with Ionis                                                                                   
	sets.engaged['Koga Aft Lv3'].Ionis 			= set_combine(sets.engaged, {})                     
    sets.engaged['Koga Aft Lv3'].Ionis.AvgACC 	= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC, {})
	sets.engaged['Koga Aft Lv3'].Ionis.MidACC  	= set_combine(sets.engaged['Koga Aft Lv3'].MidACC, {})
	sets.engaged['Koga Aft Lv3'].Ionis.HighACC 	= set_combine(sets.engaged['Koga Aft Lv3'].HighACC, {})
	sets.engaged['Koga Aft Lv3'].Ionis.OshiACC 	= set_combine(sets.engaged['Koga Aft Lv3'].OshiACC, {})
	
	-------------------------------------------
	-- Kogarasumaru Aftermath: Lv.3 Hybrid Sets
	-------------------------------------------
    sets.engaged['Koga Aft Lv3'].PDT 			= set_combine(sets.engaged.PDT, {})
    sets.engaged['Koga Aft Lv3'].AvgACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].PDT , {})
	sets.engaged['Koga Aft Lv3'].MidACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC.PDT , {})
	sets.engaged['Koga Aft Lv3'].HighACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].MidACC.PDT , {})
	sets.engaged['Koga Aft Lv3'].OshiACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].HighACC.PDT, {})
	
	sets.engaged['Koga Aft Lv3'].Reraise 			= set_combine(sets.engaged.Reraise, {})
	sets.engaged['Koga Aft Lv3'].AvgACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].Reraise, {})
	sets.engaged['Koga Aft Lv3'].MidACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC.Reraise, {})
	sets.engaged['Koga Aft Lv3'].HighACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].MidACC.Reraise, {})
	sets.engaged['Koga Aft Lv3'].OshiACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].HighACC.Reraise, {})
	-- with Ionis
	sets.engaged['Koga Aft Lv3'].Ionis.PDT 			= set_combine(sets.engaged['Koga Aft Lv3'].PDT, {})
    sets.engaged['Koga Aft Lv3'].Ionis.AvgACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC.PDT, {})
	sets.engaged['Koga Aft Lv3'].Ionis.MidACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].MidACC.PDT, {})
	sets.engaged['Koga Aft Lv3'].Ionis.HighACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].HighACC.PDT, {})
	sets.engaged['Koga Aft Lv3'].Ionis.OshiACC.PDT 	= set_combine(sets.engaged['Koga Aft Lv3'].OshiACC.PDT, {})
	
	sets.engaged['Koga Aft Lv3'].Ionis.Reraise 			= set_combine(sets.engaged['Koga Aft Lv3'].Reraise, {})
	sets.engaged['Koga Aft Lv3'].Ionis.AvgACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].AvgACC.Reraise, {})
	sets.engaged['Koga Aft Lv3'].Ionis.MidACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].MidACC.Reraise, {})
	sets.engaged['Koga Aft Lv3'].Ionis.HighACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].HighACC.Reraise, {})
	sets.engaged['Koga Aft Lv3'].Ionis.OshiACC.Reraise 	= set_combine(sets.engaged['Koga Aft Lv3'].OshiACC.Reraise, {})

	----------------------------------------------------------------------------------------------------------------------------------------------------   
    -- Misc
	----------------------------------------------------------------------------------------------------------------------------------------------------

    sets.buff.Sekkanoki 		= {hands="Unkai Kote +2"}
    sets.buff.Sengikori 		= {feet="Unkai Sune-ate +2"}
    sets.buff['Meikyo Shisui'] 	= {feet="Sakonji Sune-ate +1"}
	
	sets.buff.Doom 	= set_combine(sets.Reraise, {ring1="Saida Ring",ring2="Blenmot's Ring"})
	sets.buff.sleep = {neck="Berserker's Torque"}
	sets.buff.Reive = {neck="Ygnas's Resolve +1"}
	sets.Gavialis = {head="Gavialis Helm"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end