
function init_gear_sets()
	
	print('Ewellina_PLD_Gear side_cart loaded')	
	
	Carmine_head		={ name="Carmine Mask", 		augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_body		={ name="Carm. Scale Mail", 	augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_hands		={ name="Carmine Fin. Ga.", 	augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs		={ name="Carmine Cuisses", 		augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_feet		={ name="Carmine Greaves", 		augments={'Accuracy+10','DEX+10','MND+15',}}
                                                        
	Carmine_head_HQ		={ name="Carmine Mask +1", 		augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	Carmine_legs_HQ		={ name="Carmine Cuisses +1", 	augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_feet_HQ		={ name="Carmine Greaves +1", 	augments={'Accuracy+12','DEX+12','MND+20',}}
                                                        
	Souveran_head		={ name="Souveran Schaller",	augments={'HP+80','VIT+10','Phys. dmg. taken -3',}}
	Souveran_body		={ name="Souveran Cuirass", 	augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
    Souveran_hands		={ name="Souv. Handschuhs", 	augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
	Souveran_legs		={ name="Souveran Diechlings", 	augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
    Souveran_feet		={ name="Souveran Schuhs", 		augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
                                                        
	Leyline_Gloves		={ name="Leyline Gloves", 		augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	Amm_Greaves			={ name="Amm Greaves", 			augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}}	
	Jumalik_Helm		={ name="Jumalik Helm", 		augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}}
    Jumalik_Mail		={ name="Jumalik Mail", 		augments={'HP+50','Attack+13','Enmity+7','"Refresh"+1',}}
                                                        
	Found_body			={ name="Found. Breastplate", 	augments={'Accuracy+5','Mag. Acc.+2','"Mag.Atk.Bns."+7',}}
    Found_hands			={ name="Founder's Gauntlets", 	augments={'STR+5','Attack+8','"Mag.Atk.Bns."+9',}}
    Found_legs			={ name="Founder's Hose", 		augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}}
    Found_feet			={ name="Founder's Greaves", 	augments={'VIT+2','Accuracy+1','"Mag.Atk.Bns."+6',}}
     
	Eschite_hands		={ name="Eschite Gauntlets", 	augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}}
	Eschite_feet		={ name="Eschite Greaves", 		augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}}
    
	Yorium_hands		={ name="Yorium Gauntlets", 	augments={'Enmity+9',}}
    
	Odyss_legs_Rfr		={ name="Odyssean Cuisses", 	augments={'Attack+16','"Subtle Blow"+1','"Refresh"+2',}}
	
    Odyss_legs_Enmity	={ name="Odyssean Cuisses", 	augments={'Accuracy+27','Enmity+5','VIT+10','Attack+8',}}
                                                        
	Odyss_body_FC		={ name="Odyss. Chestplate", 	augments={'"Fast Cast"+5',}}
	Odyss_legs_FC		={ name="Odyssean Cuisses", 	augments={'Accuracy+4','"Fast Cast"+6','Attack+12',}}
	Odyss_feet_FC		={ name="Odyssean Greaves", 	augments={'"Fast Cast"+6','Accuracy+12','Attack+14',}}
     
	Odyss_feet_PDT		={ name="Odyssean Greaves", 	augments={'Accuracy+2','Phys. dmg. taken -4%','DEX+4','Attack+7',}}
	
	Odyss_head_Phalanx	={ name="Odyssean Helm", 		augments={'"Mag.Atk.Bns."+26','Mag. Acc.+10 "Mag.Atk.Bns."+10','Phalanx +4','Accuracy+12 Attack+12',}}
    Odyss_body_Phalanx	={ name="Odyss. Chestplate", 	augments={'Pet: DEX+10','"Resist Silence"+4','Phalanx +1',}}
	
	FC_back				={ name="Rudianos's Mantle", 	augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}}
	FC_Low_HP_back		={ name="Rudianos's Mantle", 	augments={'"Fast Cast"+10',}}
	--Melee_WS_back			={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Enmity_back			={ name="Rudianos's Mantle", 	augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10',}}
	Weard_back			={ name="Weard Mantle", 		augments={'VIT+2','DEX+3','Phalanx +4',}}
                                                        
	Relic_head			={ name="Caballarius Coronet", 	augments={'Enhances "Iron Will" effect',}}
	Relic_body			={ name="Caballarius Surcoat", 	augments={'Enhances "Fealty" effect',}}
    Relic_hands			={ name="Caballarius Gauntlets",augments={'Enhances "Chivalry" effect',}}
	Relic_legs			={ name="Caballarius Breeches", augments={'Enhances "Invincible" effect',}}
	Relic_feet			={ name="Caballarius Leggings", augments={'Enhances "Guardian" effect',}}
	
	AF_head 			={ name="Reverence Coronet +1" }
	AF_body				={ name="Reverence Surcoat +3" }
	AF_hands 			={ name="Reverence Gauntlets +1" }
	AF_legs 			={ name="Reverence Breeches +1" }
	AF_feet 			={ name="Reverence Leggings +1" }
		
	Empy_head 			={ name="Chevalier's Armet" }
	Empy_body			={ name="Chevalier's Cuirass" }
	Empy_hands			={ name="Chevalier's Gauntlets +1" }
	Empy_legs 			={ name="Chevalier's Cuisses +1" }
	Empy_feet 			={ name="Chevalier's Sabatons" }
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {main={ name="Brilliance", augments={'Shield skill +5','Divine magic skill +10','Enmity+4',}}}
	sets.Org.two = {}
	
	organizer_items = {
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring"
	}
	
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
	sets.precast.Enmity = {ammo="Sapience Orb",
		head=Relic_head,neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Enchanter Earring +1",
		body=Souveran_body,hands=Yorium_hands,ring1="Apeile Ring",ring2="Apeile Ring +1",
		back=Enmity_back,waist="Creed Baudrier",legs=Odyss_legs_Enmity,feet=Eschite_feet}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = 		set_combine(sets.precast.Enmity,{legs=Relic_legs})
    sets.precast.JA['Holy Circle'] = 		set_combine(sets.precast.Enmity,{feet=AF_feet})
    sets.precast.JA['Shield Bash'] = 		set_combine(sets.precast.Enmity,{ear1="Knightly Earring",hands=Relic_hands})
    sets.precast.JA['Sentinel'] = 			set_combine(sets.precast.Enmity,{feet=Relic_feet})
    sets.precast.JA['Fealty'] = 			set_combine(sets.precast.Enmity,{body=Relic_body})
    sets.precast.JA['Divine Emblem'] = 		set_combine(sets.precast.Enmity,{feet=Empy_feet})
    sets.precast.JA['Cover'] = 				set_combine(sets.precast.Enmity,{head=AF_head, body=Relic_body})
	sets.precast.JA['Intervene'] = 			set_combine(sets.precast.Enmity,{})	
		-- sub WAR JA
	sets.precast.JA['Provoke'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Berserk'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Defender'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Warcry'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Agressor'] = 			set_combine(sets.precast.Enmity,{})

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = set_combine(sets.precast.Enmity,{
		ammo="Hydrocera",
        head=Carmine_head,neck="Phalaina Locket",ear1="Static Earring",
        body=Carmine_body,hands=Carmine_hands,ring1="Leviathan Ring",ring2="Leviathan Ring",
        legs=Carmine_legs_HQ,feet=Carmine_feet_HQ})
	-- add VIT for Rampart
	sets.precast.JA['Rampart'] = set_combine(sets.precast.Enmity,{
		ammo="Brigantia Pebble",
        head=Relic_head,neck="Unmoving Collar +1",ear1="Thureous Earring",ear2="Odnowa Earring +1",
        body=AF_body,hands=Souveran_hands,ring1="Titan Ring",ring2="Titan Ring",
        back=Enmity_back,waist="Caudata Belt",legs=Odyss_legs_Enmity,feet=Eschite_feet})	
	
    -- Fast cast sets for spells
    -- range={name='Gjallarhorn',priority = 16}
    sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", priority = 1, augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',} },
		neck={ name="Voltsurge Torque",priority = 5},
		ear1={ name="Etiolation Earring",priority = 13},
		ear2={ name="Loquacious Earring",priority = 6},
		body={ name="Odyss. Chestplate", priority = 2, augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", priority = 3, augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	,
		ring1={ name="Prolix Ring",priority = 7},
		ring2={ name="Meridian Ring",priority = 16},
		back={ name="Rudianos's Mantle",priority = 9,augments={'"Fast Cast"+10',}},
		waist={ name="Creed Baudrier",priority = 14},
		legs={ name="Odyssean Cuisses", priority = 8, augments={'Accuracy+4','"Fast Cast"+6','Attack+12',}},
		feet={ name="Odyssean Greaves", priority = 4, augments={'"Fast Cast"+6','Accuracy+12','Attack+14',}}
		}	
	sets.precast.FC.HighHP = {
		ammo="Sapience Orb",
		neck={ name="Voltsurge Torque",priority = 5},
		ear1={ name="Etiolation Earring",priority = 13},
		ear2={ name="Loquacious Earring",priority = 6},
		body=AF_body,
		hands={ name="Leyline Gloves", priority = 3, augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	,
		ring1={ name="Prolix Ring",priority = 7},
		ring2={ name="Meridian Ring",priority = 16},
		back={ name="Rudianos's Mantle", priority = 15, augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
		waist={ name="Creed Baudrier",priority = 14},
		}	
	sets.precast.FC.DT = {
		ammo="Sapience Orb",
		neck={ name="Voltsurge Torque",priority = 1},
		body=AF_body,
		ring1={ name="Prolix Ring",priority = 2},
		ring2={ name="Meridian Ring",priority = 16},
		back={ name="Rudianos's Mantle", priority = 15, augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
		}	
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body=Jumalik_Mail})

    sets.precast.FC.cureCheatFour = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", priority = 1, augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',} },
		neck={ name="Voltsurge Torque",priority = 5},
		ear1={ name="Etiolation Earring",priority = 13},
		ear2={ name="Loquacious Earring",priority = 6},
		body={ name="Odyss. Chestplate", priority = 2, augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", priority = 3, augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	,
		ring1={ name="Prolix Ring",priority = 7},
		ring2={ name="Veneficium Ring",priority = 9},
		back={ name="Rudianos's Mantle", priority = 15, augments={'"Fast Cast"+10',}},
		waist={ name="Flume Belt",priority = 10},
		legs={ name="Odyssean Cuisses", priority = 8, augments={'Accuracy+4','"Fast Cast"+6','Attack+12',}},
		feet={ name="Odyssean Greaves", priority = 4, augments={'"Fast Cast"+6','Accuracy+12','Attack+14',}}
	}
		
	sets.precast.FC.cureCheatThree = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", priority = 1, augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',} },
		neck={ name="Voltsurge Torque",priority = 5},
		ear1={ name="Etiolation Earring",priority = 13},
		ear2={ name="Loquacious Earring",priority = 6},
		body={ name="Odyss. Chestplate", priority = 2, augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", priority = 3, augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	,
		ring1={ name="Prolix Ring",priority = 7},
		ring2={ name="Meridian Ring",priority = 16},
		back={ name="Rudianos's Mantle", priority = 15, augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
		waist={ name="Creed Baudrier",priority = 14},
		legs={ name="Odyssean Cuisses", priority = 8, augments={'Accuracy+4','"Fast Cast"+6','Attack+12',}},
		feet={ name="Odyssean Greaves", priority = 4, augments={'"Fast Cast"+6','Accuracy+12','Attack+14',}}
	}
		
		
	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.MaxTP = {ear1="Brutal Earring",ear2="Ishvara Earring",}
	
	sets.precast.WS = {ammo="Ginsen",
		head=Souveran_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body=Souveran_body,hands=Souveran_hands,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Enmity_back,waist="Fotia Belt",legs=Souveran_legs,feet=Souveran_feet}
	
	sets.precast.WS.Acc = {ammo="Ginsen",
		head=Souveran_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body=Souveran_body,hands=Souveran_hands,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Enmity_back,waist="Fotia Belt",legs=Souveran_legs,feet=Souveran_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Atonement'] 			= set_combine(sets.precast.WS,{
		ammo="Sapience Orb",
		head=Relic_head,neck="Unmoving Collar +1",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body=Souveran_body,hands=Souveran_hands,ring1="Apeile Ring",ring2="Apeile Ring +1",
		back=Enmity_back,waist="Creed Baudrier",legs=Odyss_legs_Enmity,feet=Eschite_feet})
	
	sets.precast.WS['Requiescat'] 			= set_combine(sets.precast.WS, {
		ammo="Hydrocera",
		head=Carmine_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body=Carmine_body,hands=Carmine_hands,ring1="Leviathan Ring",ring2="Leviathan Ring",
		back=Enmity_back,waist="Fotia Belt",legs=Carmine_legs_HQ,feet=Carmine_feet_HQ})
	sets.precast.WS['Requiescat'].Acc 		= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Chant du Cygne'] 		= set_combine(sets.precast.WS, {ammo="Jukukik Feather",ring1="Ramuh Ring",ring2="Ramuh Ring"})
	sets.precast.WS['Chant du Cygne'].Acc 	= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Exenterator'] 			= set_combine(sets.precast.WS, {})

	sets.precast.WS['Aeolian Edge'] 		= set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Savage Blade']			= set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Sanguine Blade'] 		= {}
	
		
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
		ammo="Sapience Orb",
		head=Carmine_head,neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body=Odyss_body_FC,hands=Leyline_Gloves,ring1="Prolix Ring",ring2="Warden's Ring",
		back=FC_back,waist="Dynamic Belt +1",legs=Odyss_legs_FC,feet=Odyss_feet_FC}
	
	-- 102% spell interuption = cap
	-- current = 102%
	sets.SIRD = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="willpower Torque",ear1="Knightly Earring",ear2="Halasz Earring",
		waist="Sanctuary Obi +1",legs=Found_legs,feet=Odyss_feet_PDT}
		
	sets.midcast.FastRecast.SIRD = set_combine(sets.midcast.FastRecast, sets.SIRD)
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
        
    sets.midcast.Enmity = set_combine(sets.precast.Enmity, {})
	
	sets.midcast['Blue Magic'] 			= set_combine(sets.precast.Enmity, {})
	sets.midcast['Blue Magic'].SIRD 	= set_combine(sets.precast.Enmity, sets.SIRD)
	sets.midcast['Cocoon'] 				= sets.midcast.FastRecast.SIRD
	sets.midcast['Refueling'] 			= sets.midcast.FastRecast.SIRD

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="Phalaina Locket",ear1="Nourishing Earring +1",ear2="Oneiros Earring",
		body=Jumalik_Mail,hands="Macabre Gauntlets +1",ring1="Eihwaz Ring",ring2="Supershear Ring",
		back="Solemnity Cape",waist="Creed Baudrier",legs=Found_legs,feet=Odyss_feet_FC}
	
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, sets.SIRD)

	sets.midcast.CureSelf = {ammo="Egoist's Tathlum",
		head=Souveran_head,neck="Phalaina Locket",ear1="Nourishing Earring +1",ear2="Oneiros Earring",
		body=AF_body,hands=Souveran_hands,ring1="Eihwaz Ring",ring2="Meridian Ring",
		back="Xucau Mantle",waist="Creed Baudrier",legs=Souveran_legs,feet=Souveran_feet}
	
	sets.midcast.CureSelf.SIRD = set_combine(sets.midcast.CureSelf, sets.SIRD)

    sets.midcast['Enhancing magic'] 		= set_combine(sets.midcast.FastRecast, {head=Carmine_head,neck="Incanter's Torque",ear1='Andoaa Earring',
																					back='Merciful Cape',waist="Olympus Sash",legs=Carmine_legs_HQ})
	sets.midcast['Enhancing magic'].SIRD 	= set_combine(sets.midcast['Enhancing magic'], sets.SIRD)
	sets.midcast['Phalanx'] 				= set_combine(sets.midcast['Enhancing magic'], {
		head=Odyss_head_Phalanx,
		body=Odyss_body_Phalanx,hands=Souveran_hands,
		back=Weard_back,feet=Souveran_feet})
	sets.midcast['Phalanx'] .SIRD 			= set_combine(sets.midcast['Phalanx'], sets.SIRD)
	
	sets.midcast['Reprisal'] = set_combine(sets.midcast.FastRecast, {
		ammo="Egoist's Tathlum",
		head=Souveran_head,neck="Dualism Collar +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands,ring1="Eihwaz Ring",ring2="Meridian Ring",
		back="Reiki Cloak",waist="Creed Baudrier",legs=Souveran_legs,feet=Souveran_feet})
	sets.midcast['Reprisal'].SIRD = set_combine(sets.midcast['Reprisal'], sets.SIRD)
		
	sets.midcast['Divine magic'] = set_combine(sets.midcast.FastRecast, {
		head=Jumalik_Helm,neck="Incanter's Torque",ear1="Beatific Earring",ear2="Divine Earring",
		body=AF_body,hands=Eschite_hands,
		back='Altruistic Cape',waist="Asklepian Belt"})
	sets.midcast['Enlight'] 			= sets.midcast['Divine magic']
	sets.midcast['Enlight'].SIRD 		= set_combine(sets.midcast['Enlight'], sets.SIRD)
	sets.midcast['Enlight II'] 			= sets.midcast['Divine magic']
	sets.midcast['Enlight II'].SIRD 	= set_combine(sets.midcast['Enlight II'], sets.SIRD)
	
    sets.midcast['Diaga'] = set_combine(sets.midcast.Enmity)
	
    sets.midcast['Protect'] 		= set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
	sets.midcast['Protect'].SIRD 	= set_combine(sets.midcast['Protect'], sets.SIRD)
    sets.midcast['Shell'] 			= set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
	sets.midcast['Shell'].SIRD 		= set_combine(sets.midcast['Shell'], sets.SIRD)
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise 	= {head="Twilight Helm",body="Twilight Mail"}
	sets.Refresh 	= {head=Jumalik_Helm,neck="Coatl Gorget +1",body=Jumalik_Mail,legs=Odyss_legs_Rfr}
	sets.Kiting 	= {legs=Carmine_legs_HQ}
    sets.resting 	= set_combine(sets.Refresh, {
		ear1="Creed Earring",ear1="Dawn Earring",
		hands=AF_hands,ring1= "Supershear Ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs=AF_legs})
    

    -- Idle sets
	sets.idle = {ammo="Brigantia Pebble",
		head=Souveran_head,neck="Coatl Gorget +1",ear1="Dawn Earring",ear2="Genmei Earring",
		body=AF_body,hands=Souveran_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back="Philidor Mantle",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Souveran_feet}
		
	sets.idle.PDT = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Genmei Earring",
		body=AF_body,hands=Empy_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Souveran_feet}
	
	sets.idle.Weak = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Genmei Earring",
		body=AF_body,hands=Empy_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Souveran_feet}
    
    sets.idle.Weak.Reraise 	= set_combine(sets.idle.PDT, sets.Reraise)
	sets.idle.Reraise 		= set_combine(sets.idle.PDT, sets.Reraise)
	sets.idle.Refresh 		= set_combine(sets.idle.PDT, sets.Refresh)
    sets.latent_refresh 	= {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Resist_Death 	= {ammo="Staunch Tathlum",ear1="Hearty Earring",ring1="Eihwaz Ring",ring2="Warden's Ring"}
	sets.Resist_Terror 	= {ammo="Staunch Tathlum",ear1="Hearty Earring",feet=Found_feet}
	sets.Resist_Charm 	= {ammo="Staunch Tathlum",neck="Unmoving Collar +1",ear1="Hearty Earring",back="Solemnity Cape",legs=Souveran_legs}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield 	= {sub="Aegis"} -- Aegis
	sets.TurtleShield 	= {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head=Souveran_head,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Genmei Earring",
		body=AF_body,hands=Empy_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back=Enmity_back,waist="Flume Belt",legs=Empy_legs,feet=Souveran_feet}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {
		ammo="Vanir Battery",
		head=Souveran_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Static Earring",
		body=AF_body,hands=Souveran_hands,ring1="Lunette Ring +1",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Asklepian Belt",legs=Souveran_legs,feet=Carmine_feet_HQ}
		
	sets.defense.MDTNoShell = {
		ammo="Vanir Battery",
		head=Souveran_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands,ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Nierenschutz",legs=Souveran_legs,feet=Amm_Greaves}
	
	sets.defense.Turtle = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back="Reiki Cloak",waist="Creed Baudrier",legs=Souveran_legs,feet=Souveran_feet}
		
	sets.defense.Reraise = {ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
		body="Twilight Mail",hands=Souveran_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back="Xucau Mantle",waist="Creed Baudrier",legs=Souveran_legs,feet=Souveran_feet}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {ammo="Paeapua",
		head=Carmine_head_HQ,neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body=Found_body,hands=Souveran_hands,ring1="Petrov Ring",ring2="Hetairoi Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs=Odyss_legs_Enmity,feet=Souveran_feet}
	
	sets.engaged.Acc = set_combine(sets.engaged,{ammo="Ginsen",neck="Lissome Necklace",body=Souveran_body})
	
    sets.engaged.DW = {ammo="Paeapua",
		head=Carmine_head_HQ,neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body=Found_body,hands=Souveran_hands,ring1="Petrov Ring",ring2="Hetairoi Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs=Odyss_legs_Enmity,feet=Souveran_feet}

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{ammo="Ginsen",neck="Lissome Necklace",body=Souveran_body})

    sets.engaged.PDT = {ammo="Staunch Tathlum",
		head=Souveran_head,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Genmei Earring",
		body=Souveran_body,hands=Empy_hands,ring1="Defending Ring",ring2="Warden's Ring",
		back="Weard Mantle",waist="Flume Belt",legs=Empy_legs,feet=Souveran_feet}
	
    sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT,{})

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {})


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom 		= {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Cover 	= {body=Relic_body}
	sets.buff.sleep 	= {neck="Berserker's Torque"}
	sets.buff.Sentinel	= {feet=Relic_feet}
	sets.buff.Reive 	= {neck="Ygnas's Resolve +1"}
	sets.CP 			= {back="Aptitude Mantle"}
	sets.crafting 		= {head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
			
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
    send_command('bind ^` input /ja "sentinel" <me>')
	send_command('bind !` input /ma "Shield Bash" <t>')
	send_command('bind @` input /ma "Rampart" <me>')
	
	send_command('bind F7 input /ma "flash" <stnpc>')
	
	send_command('bind F8 input /ws "Atonement" <t>')
	send_command('bind ^F8 input /ws "Requiescat" <t>')
	send_command('bind @F8 input /ws "Savage Blade" <t>')
	
	send_command('bind F9 input /ma "Phalanx" <me>')
	send_command('bind ^F9 input /ma "Crusade" <me>')
	send_command('bind @F9 input /ma "Reprisal" <me>')
	
	send_command('bind F10 input /ma "cure 3" <stal>')
	send_command('bind F11 input /ma "cure 4" <stal>')
	
	if player.sub_job:upper() == 'WAR' then	
	
		send_command('bind ^F7 input /ja "provoke" <stnpc>')
		
	elseif player.sub_job:upper() == 'DNC' then
		
		send_command('bind F7 input /ja "Box step" <stnpc>')
		send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Haste Samba" <me>')
		send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		send_command('bind ^F11 input /ja "Divine Waltz" <me>')
		
	elseif player.sub_job:upper() == 'BLU' then
		
		send_command('bind ^F7 input /ma "Blank Gaze" <stnpc>')
		send_command('bind @F7 input /ma "Geist Wall" <stnpc>')
		send_command('bind !F7 input /ma "Jettatura" <stnpc>')
		
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind @F10 input /ma "Refueling" <me>')
	
	elseif player.sub_job:upper() == 'RDM' then
		
	end
	
	set_macro_page(6, 12)
end
