	
function init_gear_sets()
	
	print('Ewelina_DNC_Gear side_cart loaded')	
	
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}

    sets.precast.JA['Trance'] = {head="Horos Tiara"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Horos Tiara",ear1="Roundel Earring",ear2="Enchanter Earring +1",
        body="Maxixi Casaque",hands="Buremte Gloves",ring1="Asklepian Ring",ring2="Carbuncle Ring",
        back="Toetapper Mantle",waist="Caudata Belt",legs="Iuitl Tights",feet="Maxixi Toe Shoes"}
        
    -- Don't need any special gear for Healing Waltz.
    --sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara"}

    sets.precast.Jig = {legs="Horos Tights", feet="Maxixi Toe Shoes"}

    sets.precast.Step = {head="Maxixi Tiara", hands="Maxixi Bangles", feet="Horos Toe Shoes"}
    sets.precast.Step['Feather Step'] = set_combine(sets.precast.Step, {feet="Charis Shoes +2"})

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ear1="Gwati Earring",ear2="Enchanter Earring +1",
        body="Horos Casaque",hands="Buremte Gloves",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Toetapper Mantle",waist="Phasmida Belt",legs="Iuitl Tights"} -- magic accuracy
		
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Nefarious Collar +1",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Maxixi Casaque",hands="Horos Bangles",ring2="Oneiros Ring",
        back="Toetapper Mantle",waist="Phasmida Belt",legs="Maxixi Tights",feet="Horos Toe Shoes"} -- acc gear

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +2"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Thew Bomblet",
        head="Ejekamal Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Toetapper Mantle"})
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {neck="Houyi's Gorget",
        hands="Iuitl Wristbands",ring1="Stormsoul Ring",
        waist="Caudata Belt",legs="Nahtirah Trousers"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Toetapper Mantle"})
    sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Exenterator'], {waist=gear.ElementalBelt})

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {hands="Iuitl Wristbands"})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {hands="Iuitl Wristbands"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",head="Uk'uxkaj Cap",neck="Rancor Collar"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Toetapper Mantle"})

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Charis Feather",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Toetapper Mantle"})

    sets.precast.WS['Aeolian Edge'] = {ammo="Charis Feather",
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Chaac Belt",legs="Shneddick Tights +1",feet="Wayfarer Clogs"}
    
    sets.precast.Skillchain = {hands="Charis Bangles +2"}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Felistris Mask",ear2="Loquacious Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Felistris Mask",neck="Ej Necklace",ear2="Loquacious Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",
        back="Toetapper Mantle",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    

    -- Idle sets

    sets.idle = {ammo="Iron Gobbet",
        head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Qaaxo Tights",feet="Skadi's Jambeaux +1"}

    sets.idle.Town = {ammo="Charis Feather",
        head="Charis Tiara +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Maxixi Casaque",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Oneiros Ring",
        back="Atheling Mantle",waist="Flume Belt",legs="Horos Tights",feet="Maxixi Toe Shoes"}
    
    sets.idle.Weak = {ammo="Iron Gobbet",
        head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Skadi's Jambeaux +1"}
    
    -- Defense sets

    sets.defense.Evasion = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2=gear.DarkRing.physical,
        back="Toetapper Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Felistris Mask",neck="Twilight Torque",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Wayfarer Circlet",neck="Twilight Torque",
        body="Qaaxo Harness",hands="Wayfarer Cuffs",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Charis Feather",
        head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Thaumas Coat",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Oneiros Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs="Iuitl Tights",feet="Horos Toe Shoes"}

    sets.engaged.Fodder = {ammo="Charis Feather",
        head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Charis Casaque +2",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}
    sets.engaged.Fodder.Evasion = {ammo="Charis Feather",
        head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

    sets.engaged.Acc = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Charis Casaque +2",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Evasion = {ammo="Charis Feather",
        head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.PDT = {ammo="Charis Feather",
        head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

    -- Custom melee group: High Haste (2x March or Haste)
    sets.engaged.HighHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Manibozho Boots"}

    sets.engaged.Fodder.HighHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Charis Casaque +2",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}
    sets.engaged.Fodder.Evasion.HighHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.engaged.Acc.HighHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Evasion.HighHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.PDT.HighHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}


    -- Custom melee group: Max Haste (2x March + Haste)
    sets.engaged.MaxHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs=gear.AugQuiahuiz,feet="Manibozho Boots"}

    -- Getting Marches+Haste from Trust NPCs, doesn't cap delay.
    sets.engaged.Fodder.MaxHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Thaumas Coat",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}
    sets.engaged.Fodder.Evasion.MaxHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Manibozho Boots"}

    sets.engaged.Acc.MaxHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Evasion.MaxHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
    sets.engaged.PDT.MaxHaste = {ammo="Charis Feather",
        head="Felistris Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Windbuffet Belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Honed Tathlum",
        head="Ejekamal Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs="Horos Tights"}
    sets.buff['Climactic Flourish'] = {head="Charis Tiara +2"}
	
				
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end