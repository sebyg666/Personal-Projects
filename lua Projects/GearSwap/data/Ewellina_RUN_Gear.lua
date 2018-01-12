
function init_gear_sets()
	
	print('Ewellina_RUN_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------		
	
	Carmine_head	={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_body	={ name="Carm. Scale Mail", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_hands	={ name="Carmine Fin. Ga.", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs	={ name="Carmine Cuisses", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_feet	={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}}
	
	Carmine_head_HQ	={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	Carmine_legs_HQ	={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_feet_HQ	={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	
	Lustratio_head	={ name="Lustratio Cap", augments={'INT+30','STR+5','DEX+5',}}
    Lustratio_legs	={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet	={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
	
    FC_body			={ name="Taeon Tabard", augments={'"Fast Cast"+4',}}
	
	Adhemar_head_Att	={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}
    Adhemar_body_Att	={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}}
	Adhemar_hands_Att	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Adhemar_head_Acc	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body_Acc	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands_Acc	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Rawhide_body	={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands	={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs	={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
	
    Lengo_Pants		={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	Dampening_Tam	={ name="Dampening Tam", augments={'DEX+5','Accuracy+8','Mag. Acc.+8',}}
	Samnuha_Coat	={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
	Samnuha_Tights	={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}}
	Leyline_Gloves	={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	
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
	
	Herc_body_TA_STR	={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','STR+8','Accuracy+2','Attack+5',}}
	Herc_feet_TA_STR	={ name="Herculean Boots", augments={'Attack+22','"Triple Atk."+2','STR+14','Accuracy+7',}}
	
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
	
	Moonshade_Ear	={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	
	AF_head 		={ name="Runeist's Bandeau +2" }
	AF_body			={ name="Runeist's Coat +2" }
	AF_hands 		={ name="Runeist's Mitons +2" }
	AF_legs 		={ name="Runiest's Trousers +2" }
	AF_feet 		={ name="Runeist Bottes +1" }
	
	Relic_head		={ name="Futhark Bandeau +1", augments={'Enhances "Battuta" effect',}}
	Relic_body		={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}}
    Relic_hands		={ name="Futhark Mitons", augments={'Enhances "Sleight of Sword" effect',}}
	Relic_legs		={ name="Futhark Trousers", augments={'Enhances "Inspire" effect',}}
	Relic_feet		={ name="Futhark Boots", augments={'Enhances "Rayke" effect',}}
	
	Empy_head 		={ name="Erilaz Galea +1" }
	Empy_body		={ name="Erilaz Surcoat +1" }
	Empy_hands		={ name="Erilaz Gauntlets +1" }
	Empy_legs 		={ name="Erilaz Leg Guards +1" }
	Empy_feet 		={ name="Erilaz Greaves +1" }
	
	Evasionist_back	={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+2','Damage taken-5%',}}
	TP_back			={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	FC_back			={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	Enmity_back		={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}}
	Reso_back		={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	--Dimi_back			={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	
	organizer_items = {
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	Aettir="Aettir",
	Refined_grip="Refined Grip +1",
	Bloodrain_grip="Bloodrain Strap",
	Mesch_grip="Mensch Strap"
	}
	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------
	gear.default.obi_waist = "Eschan Stone"
	
	gear.TP_Bonus_Ear = Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs	
	sets.precast.JA['Provoke'] = {ammo="Sapience Orb",
		head="Halitus Helm",neck="Unmoving Collar +1",ear1="Friomisi Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",waist="Kasiri Belt",legs=Empy_legs,feet="Rager Ledelsens +1"}
	
	sets.precast.JA['Valiance'] = set_combine(sets.precast.JA['Provoke'], {body=AF_body,legs=Relic_legs} )
	sets.precast.JA['Vallation'] = set_combine(sets.precast.JA['Provoke'], {body=AF_body,legs=Relic_legs} )
	sets.precast.JA['Gambit'] = set_combine(sets.precast.JA['Provoke'], {hands=AF_hands} )
	sets.precast.JA['Pflug'] = set_combine(sets.precast.JA['Provoke'], {feet=AF_feet} )
	
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.precast.JA['Provoke'],sets.midcast['Divine Magic'], {head=Empy_head} )
	
	sets.precast.JA['Battuta'] = set_combine(sets.precast.JA['Provoke'], {head=Relic_head} )
	sets.precast.JA['Liement'] = set_combine(sets.precast.JA['Provoke'], {body=Relic_body} )
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.precast.JA['Provoke'], {body=Relic_body} )
	sets.precast.JA['Swordplay'] = set_combine(sets.precast.JA['Provoke'], {hands=Relic_hands} )
	sets.precast.JA['Sleight of Sword'] = set_combine(sets.precast.JA['Provoke'], {hands=Relic_hands} )
	sets.precast.JA['Rayke'] = set_combine(sets.precast.JA['Provoke'], {feet=Relic_feet} )
	
	sets.precast.JA['Runes'] = sets.precast.JA['Provoke']
	
	sets.precast.JA['Lunge'] = {ammo='Ghastly Tathlum',
								head=Herc_head_Nuke,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
								body=Samnuha_Coat,hands=Carmine_hands,
								back=Evasionist_back, waist="Eschan Stone",legs=Herc_legs_Nuke,feet=Herc_feet_Refr}
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
			head=Carmine_head_HQ,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=FC_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,legs=Rawhide_legs,feet=Herc_feet_FC}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",legs=Relic_legs})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Seething Bomblet +1",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body_Att,hands="Meghanada Gloves +1",ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Reso_back,waist="Fotia Belt",legs=Herc_legs_TA,feet=Herc_feet_TA_STR}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Resolution']				= set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1="Brutal Earring",ear2=gear.ws_ear,
		body=Adhemar_body_Att,hands="Meghanada Gloves +1",ring1="Ifrit Ring",ring2="Epona's Ring",
		back=Reso_back,waist="Fotia Belt",legs=Samnuha_Tights,feet=Herc_feet_TA_STR})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , {})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , {})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , {})
	
	sets.precast.WS['Dimidiation']				= set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1="Mache Earring",ear2=gear.ws_ear,
		body=Herc_body_WSD,hands="Meghanada Gloves +1",ring1="Ilabrat Ring",ring2="Epona's Ring",
		back=TP_back,waist="Fotia Belt",legs=Herc_legs_WSD,feet=Lustratio_feet})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , {})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , {})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , {})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Sapience Orb",
			head=Carmine_head_HQ,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=FC_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,legs=Rawhide_legs,feet=Herc_feet_FC}
		
	sets.midcast['Divine Magic'] = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",ear1="Beatific Earring",ear2="Divine Earring",
																		back='Altruistic Cape',waist="Bishop's Sash",legs=AF_legs})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {head=Empy_head,hands=AF_hands,ear1="Andoaa Earring",
																			back='Merciful Cape',waist="Olympus Sash",legs=Relic_legs})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2='Earthcry Earring',waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head=Empy_head,waist="Gishdubar Sash"})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head=AF_head})
	
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {head=Relic_head,legs=Carmine_legs_HQ})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {head=Carmine_head_HQ,legs=Carmine_legs_HQ})
	
	sets.midcast.bar_status	= sets.midcast.BarElement
	
	sets.midcast['Temper']	= sets.midcast.BarElement
	
	sets.midcast["Flash"] = set_combine(sets.precast.JA['Provoke'], {})
        
    sets.midcast['Blue Magic'] = set_combine(sets.precast.JA['Provoke'], {})
	    
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back=Evasionist_back,waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body=Relic_body,hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back=Evasionist_back,waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_Refr}
	
	sets.idle.Refresh = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body=AF_body,hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back=Evasionist_back,waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
	
    sets.idle.PDT = {ammo="Staunch Tathlum",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
		back=Evasionist_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}
		
	sets.idle.Weak = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body=Relic_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
		back=Evasionist_back,waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
	--------------------------------------
    -- Defense sets
    --------------------------------------
	
	-- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Resist_Death 	= {ammo="Staunch Tathlum",ear1="Hearty Earring",hands=Empy_hands,ring1="Eihwaz Ring",ring2="Warden's Ring",legs=AF_legs}
	sets.Resist_Terror 	= {ammo="Staunch Tathlum",ear1="Hearty Earring",hands=Empy_hands,legs=AF_legs}
	sets.Resist_Charm 	= {ammo="Staunch Tathlum",neck="Unmoving Collar +1",ear1="Hearty Earring",hands=Empy_hands,back="Solemnity Cape",legs=AF_legs}
	
	sets.StatRes = {ammo="Staunch Tathlum",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Hearty Earring",
		body=Empy_body,hands=Empy_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back=Evasionist_back,waist="Flume Belt",legs=AF_legs,feet=Empy_feet}
		
	sets.MEva = {ammo="Vanir Battery",
        head=AF_head,neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Flashward Earring",
		body=AF_body,hands=AF_hands,ring1="Purity Ring",ring2="Vengeful Ring",
		back=Evasionist_back,waist="Carrier's Sash",legs=AF_legs,feet=Empy_feet}
	
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
		body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
		back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}

    sets.defense.MDT = {ammo="Vanir Battery",
        head=Empy_head,neck="Inq. Bead Necklace",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body=Empy_body,hands=Empy_hands,ring1="Defending Ring",ring2="Lunette Ring +1",
		back="Engulfer Cape +1",waist="Lieutenant's Sash",legs=Empy_legs,feet=Empy_feet}
	
	sets.defense.MDTNoShell = {ammo="Vanir Battery",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body=Relic_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Purity Ring",
		back="Engulfer Cape +1",waist="Lieutenant's Sash",legs=Herc_legs_DT,feet=Empy_feet}

    sets.Kiting = {legs=Carmine_legs_HQ}

    --------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- sets.engaged['SAM'][state.CombatWeapon]['Ilvl~118'].DT['H: 820']['Mythic AM3']
	-- 'Lionheart'
	
	sets.engaged 					= {ammo="Yamarang",  --main="Aettir",sub="Utu grip",
										head=Adhemar_head_Acc,neck="Anu Torque",ear1="Dedition Earring",ear2="Cessance Earring",
										body=Herc_body_TA,hands=Adhemar_hands,ring1="Petrov Ring",ring2="Epona's Ring",
										back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Carmine_feet_HQ}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})

			sets.engaged['SAM'] 				= {ammo="Yamarang",  --main="Aettir",sub="Utu grip",
													head=Adhemar_head_Acc,neck="Anu Torque",ear1="Brutal Earring",ear2="Cessance Earring",
													body=Herc_body_TA,hands=Adhemar_hands,ring1="Petrov Ring",ring2="Epona's Ring",
													back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TA}
			sets.engaged['SAM']['Ilvl~118']		= set_combine(sets.engaged['SAM'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
			sets.engaged['SAM']['Ilvl~122']		= set_combine(sets.engaged['SAM']['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
			sets.engaged['SAM']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	-- Hybrid DT set
	sets.engaged.DT 				= {ammo="Staunch Tathlum", -- main="Aettir",sub="Utu grip",
										head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Cessance Earring",
										body="Emet Harness +1",hands=Adhemar_hands,ring1="Defending Ring",ring2="Epona's Ring",
										back=TP_back,waist="Windbuffet Belt +1",legs=Empy_legs,feet=Herc_feet_TA}
	sets.engaged['Ilvl~118'].DT		= set_combine(sets.engaged.DT, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged['Ilvl~122'].DT		= set_combine(sets.engaged['Ilvl~118'].DT, 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged['Ilvl~124+'].DT 	= set_combine(sets.engaged['Ilvl~122'].DT, 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
			sets.engaged['SAM'].DT 					= {ammo="Staunch Tathlum", -- main="Aettir",sub="Utu grip",
														head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Cessance Earring",
														body="Emet Harness +1",hands=Adhemar_hands,ring1="Defending Ring",ring2="Epona's Ring",
														back=TP_back,waist="Windbuffet Belt +1",legs=Empy_legs,feet=Herc_feet_TA}
			sets.engaged['SAM']['Ilvl~118'].DT		= set_combine(sets.engaged['SAM'].DT, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
			sets.engaged['SAM']['Ilvl~122'].DT		= set_combine(sets.engaged['SAM']['Ilvl~118'].DT, 	{neck="Sanctity Necklace",ear1="Mache Earring"})
			sets.engaged['SAM']['Ilvl~124+'].DT 	= set_combine(sets.engaged['SAM']['Ilvl~122'].DT, 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
						
				
	-- Hybrid DT set
	sets.engaged.Tank 					= {main="Aettir",sub="Utu grip",ammo="Staunch Tathlum",  --main="Aettir",sub="Utu grip",
											head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
											body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
											back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}
	sets.engaged['Ilvl~118'].Tank		= set_combine(sets.engaged.Tank, 				{})
	sets.engaged['Ilvl~122'].Tank		= set_combine(sets.engaged['Ilvl~118'].Tank, 	{})
	sets.engaged['Ilvl~124+'].Tank 		= set_combine(sets.engaged['Ilvl~122'].Tank, 	{})
			
			sets.engaged['SAM'].Tank 					= {main="Aettir",sub="Utu grip",ammo="Staunch Tathlum",  --main="Aettir",sub="Utu grip",
															head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
															body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
															back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}
			sets.engaged['SAM']['Ilvl~118'].Tank		= set_combine(sets.engaged['SAM'].Tank, 				{})
			sets.engaged['SAM']['Ilvl~122'].Tank		= set_combine(sets.engaged['SAM']['Ilvl~118'].Tank, 	{})
			sets.engaged['SAM']['Ilvl~124+'].Tank 		= set_combine(sets.engaged['SAM']['Ilvl~122'].Tank, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- Lionheart Sets
	-- WS set has 17 STP
	
	
	sets.engaged['Lionheart'] 					= {ammo="Yamarang",
													head=Adhemar_head_Acc,neck="Ainia Collar",ear1="Dedition Earring",ear2="Cessance Earring",
													body=Herc_body_TA,hands=Adhemar_hands,ring1="Petrov Ring",ring2="Epona's Ring",
													back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TA}
	sets.engaged['Lionheart']['Ilvl~118']		= set_combine(sets.engaged['Lionheart'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged['Lionheart']['Ilvl~122']		= set_combine(sets.engaged['Lionheart']['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged['Lionheart']['Ilvl~124+'] 		= set_combine(sets.engaged['Lionheart']['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})

			sets.engaged['SAM']['Lionheart'] 				= set_combine(sets.engaged, {ammo="Yamarang",
																head=Adhemar_head_Acc,neck="Anu Torque",ear1="Brutal Earring",ear2="Cessance Earring",
																body=Herc_body_TA,hands=Adhemar_hands,ring1="Hetairoi Ring",ring2="Epona's Ring",
																back=Reso_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TA})
			sets.engaged['SAM']['Lionheart']['Ilvl~118']	= set_combine(sets.engaged['SAM']['Lionheart'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
			sets.engaged['SAM']['Lionheart']['Ilvl~122']	= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
			sets.engaged['SAM']['Lionheart']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	-- Hybrid DT set
	sets.engaged['Lionheart'].DT 					= {ammo="Staunch Tathlum",
														head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Cessance Earring",
														body="Emet Harness +1",hands=Adhemar_hands,ring1="Defending Ring",ring2="Epona's Ring",
														back=TP_back,waist="Windbuffet Belt +1",legs=Empy_legs,feet=Herc_feet_TA}
	sets.engaged['Lionheart']['Ilvl~118'].DT		= set_combine(sets.engaged['Lionheart'].DT, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged['Lionheart']['Ilvl~122'].DT		= set_combine(sets.engaged['Lionheart']['Ilvl~118'].DT, 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged['Lionheart']['Ilvl~124+'].DT 		= set_combine(sets.engaged['Lionheart']['Ilvl~122'].DT, 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
			sets.engaged['SAM']['Lionheart'].DT 				= {ammo="Staunch Tathlum", -- main="Aettir",sub="Utu grip",
																	head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Cessance Earring",
																	body="Emet Harness +1",hands=Adhemar_hands,ring1="Defending Ring",ring2="Epona's Ring",
																	back=TP_back,waist="Windbuffet Belt +1",legs=Empy_legs,feet=Herc_feet_TA}
			sets.engaged['SAM']['Lionheart']['Ilvl~118'].DT		= set_combine(sets.engaged['SAM']['Lionheart'].DT, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
			sets.engaged['SAM']['Lionheart']['Ilvl~122'].DT		= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~118'].DT, 	{neck="Sanctity Necklace",ear1="Mache Earring"})
			sets.engaged['SAM']['Lionheart']['Ilvl~124+'].DT 	= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~122'].DT, 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
						
				
	-- Hybrid DT set
	sets.engaged['Lionheart'].Tank 					= {main="Aettir",sub="Utu grip",ammo="Staunch Tathlum",  --main="Aettir",sub="Utu grip",
														head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
														body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
														back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}
	sets.engaged['Lionheart']['Ilvl~118'].Tank		= set_combine(sets.engaged['Lionheart'].Tank, 				{})
	sets.engaged['Lionheart']['Ilvl~122'].Tank		= set_combine(sets.engaged['Lionheart']['Ilvl~118'].Tank, 	{})
	sets.engaged['Lionheart']['Ilvl~124+'].Tank		= set_combine(sets.engaged['Lionheart']['Ilvl~122'].Tank, 	{})
			
			sets.engaged['SAM']['Lionheart'].Tank 					= {main="Aettir",sub="Utu grip",ammo="Staunch Tathlum",  --main="Aettir",sub="Utu grip",
																		head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
																		body=Empy_body,hands=Herc_hands_DT,ring1="Defending Ring",ring2="Warden's Ring",
																		back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Empy_feet}
			sets.engaged['SAM']['Lionheart']['Ilvl~118'].Tank		= set_combine(sets.engaged['SAM']['Lionheart'].Tank, 				{})
			sets.engaged['SAM']['Lionheart']['Ilvl~122'].Tank		= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~118'].Tank, 	{})
			sets.engaged['SAM']['Lionheart']['Ilvl~124+'].Tank		= set_combine(sets.engaged['SAM']['Lionheart']['Ilvl~122'].Tank, 	{})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	
	-- DW sets
	sets.engaged.DW 					= {ammo="Yamarang",
										head=Adhemar_head_Acc,neck="Anu Torque",ear1="Dedition Earring",ear2="Eabani Earring",
										body=Herc_body_TA,hands=Adhemar_hands,ring1="Petrov Ring",ring2="Epona's Ring",
										back=TP_back,waist="Reiki Yotai",legs=Samnuha_Tights,feet=Carmine_feet_HQ}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	------------------------------------------------------------------	
	
    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing,{waist="Gishdubar Sash"})
	
	sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
	sets.warp = {ring2='Warp Ring'}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

	send_command('bind !` input /ma "Stoneskin" <me>')
	send_command('bind @` input /ja "Aquaveil" <me>')
	send_command('bind ^` input /ja "Blink" <me>')
		
	send_command('bind F7 input /ma "Flash" <stnpc>')
	
	send_command('bind F8 input /ws "Resolution" <t>')
	send_command('bind ^F8 input /ws "Dimidiation" <t>')
	send_command('bind @F8 input /ws "Ground Strike" <t>')
	
	send_command('bind F9 input /ma "Phalanx" <me>')
	send_command('bind ^F9 input /ma "Crusade" <me>')
	send_command('bind @F9 input /ma "Battuta" <me>')
	send_command('bind !F9 input /ma "Refresh" <stal>')
	
	send_command('bind F10 input /ma "Foil" <me>')
	send_command('bind F11 input /ja "Vivacious Pulse" <me>')
	
	if player.sub_job:upper() == 'DNC' then
	
		send_command('bind @F7 input /ja "Box step" <stnpc>')
		send_command('bind ^F7 input /ja "Quick step" <stnpc>')
		
		send_command('bind F9 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Animated flourish" <stnpc>')
		send_command('bind @F9 input /ja "Haste Samba" <me>')
		
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		send_command('bind F10 input /ja "Healing Waltz" <me>')
		send_command('bind F11 input /ja "Curing Waltz III" <stal>')
		
		send_command('bind ^` input /ja "Spectral jig" <me>')
	
	elseif player.sub_job:upper() == 'BLU' then
		
		send_command('bind ^F7 input /ma "Blank Gaze" <stnpc>')
		send_command('bind @F7 input /ma "Geist Wall" <stnpc>')
		send_command('bind !F7 input /ma "Jettatura" <stnpc>')
		
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind @F10 input /ma "Refueling" <me>')
		
	elseif player.sub_job:upper() == 'RDM' then		

		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'WAR' then		
	
		send_command('bind @F9 input /ma "provoke" <stnpc>')
		
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	end

    -- Default macro set/book
	set_macro_page(6, 18)
   
end
