 
function init_gear_sets()

	print('Ewellina_NIN_Gear.lua sidecar loaded')
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	
	Ryuo_head		={ name="Ryuo Somen", augments={'STR+10','DEX+10','Accuracy+15',}}
	
	Adhemar_head_Att	={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}
    Adhemar_body_Att	={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}}
	Adhemar_hands_Att	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Adhemar_head_Acc	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body_Acc	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands_Acc	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Rawhide_body	={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands	={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs	={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
	
	FC_body			={ name="Taeon Tabard", augments={'"Fast Cast"+4',}}
	
	Lengo_Pants		={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	Dampening_Tam	={ name="Dampening Tam", augments={'DEX+5','Accuracy+8','Mag. Acc.+8',}}
	Samnuha_Coat	={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
	Samnuha_Tights	={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}}
	Leyline_Gloves	={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	Mediums_Sabots	={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	Amm_Greaves		={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}}
	Floral_Gauntlets={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}}
	
	Herc_body_TA	={ name="Herculean Vest", augments={'Accuracy+30','"Triple Atk."+4','INT+1',}}
    Herc_legs_TA	={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','AGI+7','Accuracy+14',}}
    Herc_feet_STP	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
	Herc_feet_TA	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','AGI+4','Attack+2',}}
	
	Herc_legs_DW	={ name="Herculean Trousers", augments={'Accuracy+25','"Dual Wield"+4','STR+10','Attack+14',}}
	Taeon_feet_DW	={ name="Taeon Boots", augments={'Attack+10','"Dual Wield"+3','STR+3 AGI+3',}}
	
	Herc_head_WSD	={ name="Herculean Helm", augments={'Accuracy+3 Attack+3','Weapon skill damage +4%','STR+4',}}
	Herc_body_WSD	={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','DEX+6','Attack+15',}}
	Herc_hands_WSD	={ name="Herculean Gloves", augments={'Attack+5','Weapon skill damage +5%','Accuracy+4',}}
    Herc_legs_WSD	={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','AGI+3','Accuracy+6','Attack+4',}}
    Herc_feet_WSD	={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','STR+6','Accuracy+12',}}
	
	Herc_hands_CritDmg	={ name="Herculean Gloves", augments={'Attack+29','Crit. hit damage +3%','DEX+12',}}
	Herc_legs_CritDmg	={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Crit. hit damage +3%','STR+7','Accuracy+14',}}
	Herc_feet_CritDmg	={ name="Herculean Boots", augments={'Accuracy+29','Crit. hit damage +4%','DEX+5','Attack+11',}}
	
	Herc_head_FC	={ name="Herculean Helm", augments={'"Fast Cast"+5','STR+9','Mag. Acc.+1','"Mag.Atk.Bns."+7',}}
    Herc_feet_FC	={ name="Herculean Boots", augments={'Mag. Acc.+1','DEX+7','"Fast Cast"+8',}}
	
	Herc_head_DT	={ name="Herculean Helm", augments={'Accuracy+14','Damage taken-3%','INT+2','Attack+4',}}
	Herc_hands_DT	={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','Damage taken-3%','AGI+9','Accuracy+1','Attack+10',}}
	Herc_legs_DT	={ name="Herculean Trousers", augments={'Accuracy+19','Damage taken-3%','Attack+12',}}
	Herc_feet_DT	={ name="Herculean Boots", augments={'Attack+14','Damage taken-2%','VIT+12',}}
	
	Herc_head_Nuke	={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','STR+14','Mag. Acc.+8','"Mag.Atk.Bns."+13',}}
	Herc_legs_Nuke	={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Crit. hit damage +3%','INT+5','Mag. Acc.+8','"Mag.Atk.Bns."+8',}}
	
	Herc_hands_Refr	={ name="Herculean Gloves", augments={'"Drain" and "Aspir" potency +6','DEX+2','"Refresh"+1','Accuracy+12 Attack+12',}}
	Herc_feet_Refr	={ name="Herculean Boots", augments={'Potency of "Cure" effect received+1%','Attack+10','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	
	TP_back			={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	FC_back			={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	WS_back			={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	Yokaze_back		={ name="Yokaze Mantle", augments={'STR+4','Sklchn.dmg.+2%','Weapon skill damage +3%',}}
	
	Relic_head		={ name="Mochi. Hatsuburi", augments={'Increases elem. ninjutsu III damage',}}
    Relic_body		={ name="Mochi. Chainmail", augments={'Enhances "Sange" effect',}}
    Relic_hands		={ name="Mochizuki Tekko", augments={'Enh. "Ninja Tool Expertise" effect',}}
	
	Moonshade_Ear	={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	
	sets.Org={}
	sets.Org.one = {ring1="Emperor Band"}
	
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	}
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	gear.DakanAmmo = {name="Seki Shuriken"}
	
	gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Danzo Sune-ate"
	
	gear.default.weaponskill_neck = "Caro Necklace"
    gear.default.weaponskill_waist = "Grunfeld Rope"
	gear.default.obi_waist = "Eschan Stone"
	
	gear.TP_Bonus_Ear = Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Mijin Gakure'] = {}
	sets.precast.JA['Futae'] = {hands="Hattori Tekko"}
	sets.precast.JA['Sange'] = {body=Relic_body}
	sets.precast.JA['Provoke'] = {ammo="Sapience Orb",
		neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Steelflash Earring",
		body="Emet Harness +1",hands="Macabre Gauntlets +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Obatala Subligar"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		body="Foppish Tunica",hands="Macabre Gauntlets +1",
		waist="Gishdubar Sash",feet=Herc_feet_TP_Acc}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Set for acc on steps, since Yonin drops acc a fair bit
	sets.precast.Step = {
		head=Herc_head_WS,
		body=Relic_body,hands=Adhemar_hands_Acc,
		back=Yokaze_back,waist="Dynamic Belt +1",feet=Herc_feet_TP_Acc}
		
	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Sapience Orb",
			head=Herc_head_FC,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=FC_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,legs=Rawhide_legs,feet=Herc_feet_FC}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads", body=Relic_body})
	sets.precast.FC.NinjutsuIII = set_combine(sets.precast.FC, {})
	
	-- Snapshot for ranged
	sets.precast.RA = {ammo="Happo Shuriken",head=Herc_head_WS,body=AAdhemar_body_Acc,hands=Adhemar_hands_Acc,legs=Herc_legs_TP,feet=Herc_feet_TP_Acc}
    
	------------------------------------------------------ 
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	------------------------------------------------------
	
	sets.precast.WS = {ammo="Seething Bomblet +1",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1="Mache Earring",ear2="Ishvara Earring",
		body=Herc_body_WSD,hands=Adhemar_hands_Att,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=WS_back,waist="Fotia Belt",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
	sets.precast.WS['Ilvl~118']  	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
	
	-----------------------------------------------------
	sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {})
	-----------------------------------------------------
	sets.precast.WS['Blade: Hi'] 				= set_combine(sets.precast.WS, {
		ammo="Yetshila",
		head=Herc_head_WSD,neck="Fotia Gorget",ear1=gear.ws_ear,ear2="Ishvara Earring",
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Ramuh Ring",ring2="Begrudging Ring",
		back=WS_back,waist="Windbuffet Belt +1",legs=Herc_legs_WSD,feet=Herc_feet_WSD})
	------------------------------------------------------
	sets.precast.WS['Blade: Shun'] 				= set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1=gear.ws_ear,ear2={name="Brutal Earring",priority=-1},
		body=AAdhemar_body_Att,hands=Adhemar_hands_Att,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=WS_back,waist="Fotia Belt",legs=Samnuha_Tights,feet=Herc_feet_TP_TA})
	------------------------------------------------------
	sets.precast.WS['Blade: Yu'] 				= set_combine(sets.precast.WS, {
		ammo="Ghastly Tathlum",
		head=Relic_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Locus Ring",ring2="Mujin Band",
		back=FC_back,waist="Eschan Stone",legs=Herc_legs_Nuke,feet=Herc_feet_FC})
	------------------------------------------------------
	sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
		head=Herc_head_WSD,neck="Caro Necklace",ear1=gear.ws_ear,ear2="Ishvara Earring",
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=WS_back,waist="Grunfeld Rope",legs="Hizamaru Hizayoroi +1",feet=Herc_feet_WSD})
	------------------------------------------------------
	sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
		head=Herc_head_WSD,neck="Fotia Gorget",ear1=gear.ws_ear,ear2="Ishvara Earring",
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Epona's Ring",ring2="Ifrit Ring",
		back=WS_back,waist="Fotia Belt",legs="Hizamaru Hizayoroi +1",feet=Herc_feet_WSD})
	------------------------------------------------------
	sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS['Blade: Yu'], {neck="Fotia Gorget",waist="Fotia Belt"})
	------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Blade: Yu'], {})
	-------------------------------------------------------
	sets.lugra_both_ears = {ear1="Lugra Earring",ear2="Lugra Earring +1"}
	sets.lugra_one_ear = {ear2="Lugra Earring +1"}
	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=FC_body,hands=Leyline_Gloves,ring1="Prolix Ring",
		back=FC_back,waist="Sveltesse Gouriz +1",legs=Rawhide_legs,feet=Herc_feet_FC}
		
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu ={ammo="Sapience Orb",
		head=Herc_head_FC,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=FC_body,hands=Relic_hands,ring1="Prolix Ring",
		back=FC_back,waist="Cimmerian Sash",legs=Rawhide_legs,feet=Herc_feet_FC}

	sets.midcast["Utsusemi: Ichi"] = {ammo="Sapience Orb",
		head=Herc_head_FC,neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Enchanter Earring +1",
		body="Emet Harness +1",hands=Relic_hands,ring1="Supershear Ring",ring2="Eihwaz Ring",
		back=FC_Back,waist="Cimmerian Sash",legs="Wukong's Hakama +1",feet="Hattori Kyahan"}
	
	sets.midcast["Utsusemi: Ni"] = sets.midcast["Utsusemi: Ichi"]
	
	sets.midcast["Utsusemi: San"] = sets.midcast["Utsusemi: Ichi"]

	-- any ninjutsu cast on enemies
	sets.midcast.ElementalNinjutsu = {ammo="Ghastly Tathlum",
		head=Herc_head_Nuke,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Static Earring",
		body=Samnuha_Coat,hands=Leyline_Gloves,ring1="Locus Ring",ring2="Mujin Band",
		back=FC_back,waist=gear.ElementalObi,legs=Herc_legs_Nuke,feet=Herc_feet_FC}
		
	sets.midcast.NinjutsuIII = sets.midcast.ElementalNinjutsu

	sets.midcast.ElementalNinjutsu.Resistant = {ammo="Ghastly Tathlum",
		head=Herc_head_Nuke,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Gwati Earring",
		body=Samnuha_Coat,hands=Leyline_Gloves,ring1="Locus Ring",ring2="Mujin Band",
		back=FC_back,waist=gear.ElementalObi,legs=Herc_legs_Nuke,feet=Herc_feet_FC}
	
	sets.midcast.NinjutsuIII.Resistant = sets.midcast.ElementalNinjutsu.Resistant
	
	sets.midcast.NinjutsuDebuff = {ammo="Hydrocera",
		head=Herc_head_FC,neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body=Samnuha_Coat,hands=Rawhide_hands,ring1="Shiva Ring",ring2="Shiva Ring",
		back=FC_back,waist="Eschan Stone",legs=Rawhide_legs,feet=Herc_feet_FC}

	sets.midcast.NinjutsuBuff = {ammo="Ginsen",
		head=Herc_head_FC,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=FC_body,hands=Relic_hands,ring1="Prolix Ring",
		back=Yokaze_back,waist="Cimmerian Sash",legs="Wukong's Hakama +1",feet=Herc_feet_FC}

	sets.midcast.Trust = {ammo="Sapience Orb",
		head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Apururu Unity Shirt",hands=Leyline_Gloves,ring1="Prolix Ring",
		back=FC_back,waist="Sveltesse Gouriz +1",legs=Rawhide_legs,feet=Herc_feet_FC}
	
	sets.midcast.RA = {ammo="Happo Shuriken",head=Herc_head_WS,neck="Sanctity Necklace",body="Foppish Tunica",back=Yokaze_back}
	
	sets.midcast["Flash"] = sets.precast.JA['Provoke']
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	
	-- Resting sets
	sets.resting = {neck="Lissome Necklace",ear2="Infused Earring",ring1="Sheltered Ring",ring2="Chirich Ring"}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Yetshila",
		head="Smilodon Mask +1",neck="Sanctity Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body="Hizamaru Haramaki +1",hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet="Danzo Sune-ate"}
	
	sets.idle.PDT = {ammo="Yetshila",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Amm_Greaves}
		
	sets.idle.Refresh = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_Refr,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
	
	-- sets.idle.Town = {ammo="Yetshila",
		-- head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- body="Hizamaru Haramaki +1",hands="Hizamaru Kote +1",ring1="K'ayres Ring",ring2="Petrov Ring",
		-- back=Yokaze_back,waist="Flume Belt",legs="Hizamaru Hizayoroi +1",feet="Danzo Sune-ate"}
	
	sets.idle.Weak = {ammo="Yetshila",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands="Macabre Gauntlets +1",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Amm_Greaves}
	
	-- Defense sets
	sets.defense.Evasion = {
		head="Hizamaru Somen +1",neck="Ej Necklace",ear1="Eabani Earring",
		body="Emet Harness +1",hands="Hizamaru Kote +1",ring1="Vocane Ring",ring2="Eihwaz Ring",
		back=Yokaze_back,waist="Sveltesse Gouriz +1",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-ate +1"}

	sets.defense.PDT = {
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Amm_Greaves}

	sets.defense.MDT = {
		head=Herc_head_DT,neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
		body=AAdhemar_body_Acc,hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",legs=Herc_legs_DT,feet=Amm_Greaves}


	sets.Kiting = {feet=gear.MovementFeet}


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
	sets.engaged 							= {ammo=gear.DakanAmmo,
												head=Adhemar_head_Acc,neck="Erudition Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
												body=AAdhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
												back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
	sets.engaged['Ilvl~118']				= set_combine(sets.engaged, 			{})
	sets.engaged['Ilvl~122']				= set_combine(sets.engaged['Ilvl~118'], {})
	sets.engaged['Ilvl~124+'] 				= set_combine(sets.engaged['Ilvl~122'], {})										
	
	------------------------------------------------------------------	
											
	sets.engaged['DW: 38'] 					= set_combine(sets.engaged, 							{ammo=gear.DakanAmmo,
																									head=Ryuo_head,neck="Erudition Necklace",ear1="Eabani Earring",ear2="Suppanomimi",
																									body=Herc_body_TA_TA,hands=Floral_Gauntlets,ring1="Epona's Ring",ring2="Petrov Ring",
																									back=TP_back,waist="Patentia Sash",legs=Herc_legs_DW,feet="Hizamaru Sune-ate +1"})
	sets.engaged['Ilvl~118']['DW: 38']		= set_combine(sets.engaged['DW: 38'], 					{})
	sets.engaged['Ilvl~122']['DW: 38'] 		= set_combine(sets.engaged['Ilvl~118']['DW: 38'], 		{})
	sets.engaged['Ilvl~124+']['DW: 38'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 38'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------
	-- Custom melee group: low Haste ('DW: 36-37')     
	--------------------------------------------         
	
	sets.engaged['DW: 36-37'] 				= set_combine(sets.engaged['DW: 38'], 					{body=AAdhemar_body_Acc,feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~118']['DW: 36-37'] 	= set_combine(sets.engaged['DW: 36-37'], 				{})
	sets.engaged['Ilvl~122']['DW: 36-37'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 36-37'], 	{})
	sets.engaged['Ilvl~124+']['DW: 36-37'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 36-37'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------		
	-- Custom melee group: low Haste ('DW: 34-35')-        
	--------------------------------------------           
	
	sets.engaged['DW: 34-35'] 				= set_combine(sets.engaged['DW: 36-37'], 				{waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet="Hizamaru Sune-ate +1"})
	sets.engaged['Ilvl~118']['DW: 34-35'] 	= set_combine(sets.engaged['DW: 34-35'], 				{})
	sets.engaged['Ilvl~122']['DW: 34-35'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 34-35'], 	{})
	sets.engaged['Ilvl~124+']['DW: 34-35'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 34-35'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste ('DW: 31-33')-         
	--------------------------------------------            
	
	sets.engaged['DW: 31-33'] 				= set_combine(sets.engaged['DW: 34-35'], 				{legs=Herc_legs_DW,feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~118']['DW: 31-33'] 	= set_combine(sets.engaged['DW: 31-33'], 				{})
	sets.engaged['Ilvl~122']['DW: 31-33'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 31-33'], 	{})
	sets.engaged['Ilvl~124+']['DW: 31-33'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 31-33'], 	{})
		
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste ('DW: 28-30')-         
	--------------------------------------------            
	
	sets.engaged['DW: 28-30'] 				= set_combine(sets.engaged['DW: 31-33'], 				{head=Adhemar_head,waist="Patentia Sash"})
	sets.engaged['Ilvl~118']['DW: 28-30'] 	= set_combine(sets.engaged['DW: 28-30'], 				{})
	sets.engaged['Ilvl~122']['DW: 28-30'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 28-30'], 	{})
	sets.engaged['Ilvl~124+']['DW: 28-30'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 28-30'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste ('DW: 25-27')-          
	--------------------------------------------            
	
	sets.engaged['DW: 25-27'] 				= set_combine(sets.engaged['DW: 28-30'], 				{hands=Adhemar_hands_Acc,waist="Windbuffet Belt +1",feet="Hizamaru Sune-ate +1"})
	sets.engaged['Ilvl~118']['DW: 25-27']  	= set_combine(sets.engaged['DW: 25-27'], 				{})
	sets.engaged['Ilvl~122']['DW: 25-27'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 25-27'], 	{})
	sets.engaged['Ilvl~124+']['DW: 25-27']  = set_combine(sets.engaged['Ilvl~122']['DW: 25-27'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 21-24')         
	---------------------------------------------           
	
	sets.engaged['DW: 21-24'] 				= set_combine(sets.engaged['DW: 25-27'], 				{legs=Samnuha_Tights})
	sets.engaged['Ilvl~118']['DW: 21-24'] 	= set_combine(sets.engaged['DW: 21-24'], 				{})
	sets.engaged['Ilvl~122']['DW: 21-24'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 21-24'], 	{})
	sets.engaged['Ilvl~124+']['DW: 21-24'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 21-24'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 20')            
	---------------------------------------------           
	
	sets.engaged['DW: 20'] 					= set_combine(sets.engaged['DW: 21-24'], 				{ear2="Cessance Earring",legs=Herc_legs_DW})
	sets.engaged['Ilvl~118']['DW: 20'] 		= set_combine(sets.engaged['DW: 20'], 					{})
	sets.engaged['Ilvl~122']['DW: 20'] 		= set_combine(sets.engaged['Ilvl~118']['DW: 20'], 		{})
	sets.engaged['Ilvl~124+']['DW: 20'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 20'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 19')            
	---------------------------------------------           
	
	sets.engaged['DW: 19'] 					= set_combine(sets.engaged['DW: 20'], 					{ear2="Suppanomimi",waist="Patentia Sash",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~118']['DW: 19'] 		= set_combine(sets.engaged['DW: 19'], 					{})
	sets.engaged['Ilvl~122']['DW: 19'] 		= set_combine(sets.engaged['Ilvl~118']['DW: 19'], 		{})
	sets.engaged['Ilvl~124+']['DW: 19'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 19'], 		{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 16-18')         
	---------------------------------------------           
	
	sets.engaged['DW: 16-18'] 				= set_combine(sets.engaged['DW: 19'], 					{ear2="Cessance Earring",waist="Windbuffet Belt +1",feet="Hizamaru Sune-ate +1"})
	sets.engaged['Ilvl~118']['DW: 16-18'] 	= set_combine(sets.engaged['DW: 16-18'], 				{})
	sets.engaged['Ilvl~122']['DW: 16-18'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 16-18'], 	{})
	sets.engaged['Ilvl~124+']['DW: 16-18'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 16-18'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 13-15')         
	---------------------------------------------           
	
	sets.engaged['DW: 13-15'] 				= set_combine(sets.engaged['DW: 16-18'], 				{legs=Herc_legs_DW,feet=Herc_feet_TP_TA})
	sets.engaged['Ilvl~118']['DW: 13-15'] 	= set_combine(sets.engaged['DW: 13-15'], 				{feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~122']['DW: 13-15'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 13-15'], 	{})
	sets.engaged['Ilvl~124+']['DW: 13-15'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 13-15'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste ('DW: 9-12')          
	---------------------------------------------           
	
	sets.engaged['DW: 9-12'] 				= set_combine(sets.engaged['DW: 13-15'], 				{legs=Samnuha_Tights})
	sets.engaged['Ilvl~118']['DW: 9-12'] 	= set_combine(sets.engaged['DW: 9-12'], 				{feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~122']['DW: 9-12'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 9-12'], 	{})
	sets.engaged['Ilvl~124+']['DW: 9-12'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 9-12'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste ('DW: 0-8')        
	-----------------------------------------           
	
	sets.engaged['DW: 0-8'] 				= set_combine(sets.engaged['DW: 9-12'],					{ear1="Brutal Earring",body=Herc_body_TA_TA})
	sets.engaged['Ilvl~118']['DW: 0-8'] 	= set_combine(sets.engaged['DW: 0-8'], 					{feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~122']['DW: 0-8'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 0-8'], 		{})
	sets.engaged['Ilvl~124+']['DW: 0-8'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 0-8'], 		{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------
	-- Buff Sets and Miscelanie
	---------------------------------------	
	sets.buff.Migawari = {}
	sets.buff.Futae = {hands="Hattori Tekko"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.Yonin = {}
	sets.buff.Innin = {}
	sets.buff.Sange = {ammo = "Happo Shuriken"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
			
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 5)
	
	send_command('bind ^` input /ma "utsusemi: ichi" <me>')
	send_command('bind !` input /ma "utsusemi: ni" <me>')
	send_command('bind @` input /ma "utsusemi: san" <me>')
	
	send_command('bind F7 input /ma "Kurayami: Ni" <stnpc>')
	send_command('bind ^F7 input /ma "Hojo: Ni" <stnpc>')
	send_command('bind @F7 input /ma "Jubaku: Ichi" <stnpc>')
		
	send_command('bind F8 input /ws "Blade: Hi" <t>')
	send_command('bind ^F8 input /ws "Blade: Shun" <t>')
	send_command('bind @F8 input /ws "Blade: Kamu" <t>')
	
	send_command('bind F10 input /ma "Kakka: Ichi" <me>')
	send_command('bind ^F10 input /ma "Myoshu: Ichi" <me>')
	
	send_command('bind F11 input /ma "Migawari: Ichi" <me>')
	
	if player.sub_job:upper() == 'DNC' then				
		send_command('bind F9 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		send_command('bind @F9 input /ja "Haste Samba" <me>')
	
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		
		send_command('bind ^F11 input /ja "Healing Waltz" <stal>')
		send_command('bind @F11 input /ja "Curing Waltz III" <stal>')
		
	elseif player.sub_job:upper() == 'WAR' then		
		send_command('bind F9 input /ja "provoke" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')	
		
	elseif player.sub_job:upper() == 'THF' then
		send_command('bind F9 input /ra <stnpc>')
		
	elseif player.sub_job:upper() == 'PLD' then		
		send_command('bind F9 input /ma "Flash" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		
	elseif player.sub_job:upper() == 'RUN' then		
		send_command('bind F9 input /ma "Flash" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')

	end
end
 