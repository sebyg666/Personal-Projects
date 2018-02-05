
function init_gear_sets()
	
	print('Laubent_PLD_Gear side_cart loaded')		
	
	Carmine_head		={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	Carmine_head_NQ     ={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_hands		={ name="Carmine Finger Gauntlets +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_legs		={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_legs_NQ		={ name="Carmine Cuisses", augments={'HP+60','STR+10','INT+10',}}
	Carmine_feet		={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	
	Souveran_head	    ={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
	Souveran_head_cure  ={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
	Souveran_body_cure  ={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
	Souveran_body       ={ name="Souv. Cuirass +1", augments={'HP+65','STR+12','Accuracy+13',}}
    Souveran_hands		={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}
	Souveran_hands_cure ={ name="Souv. Handschuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
	Souveran_legs		={ name="Souv. Diechlings +1", augments={'HP+65','STR+12','Accuracy+13',}}
	Souveran_legs_cure  ={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
    Souveran_feet		={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}
	Souveran_feet_cure  ={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
	
	Leyline_Gloves		={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}	
	Jumalik_Helm		={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}}
	Jumalik_Mail		={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}}
	Amm_Greaves			={ name="Amm Greaves", augments={'HP+50','VIT+9','Accuracy+14','Damage taken-1%',}}
	
	Founder_head		={ name="Founder's Corona", augments={'DEX+5','Accuracy+8',}}
	Founder_body		={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}}
	Founder_legs		={ name="Founder's Hose", augments={'MND+3','Mag. Acc.+3','Attack+7','Breath dmg. taken -1%',}}
	Founder_feet		={ name="Founder's Greaves", augments={'VIT+8','Accuracy+13','"Mag.Atk.Bns."+14','Mag. Evasion+14',}}
	
	Eschite_hands		={ name="Eschite Gauntlets", augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}}
	
	Odyss_body			={ name="Odyss. Chestplate", augments={'Accuracy+22 Attack+22','Potency of "Cure" effect received+4%','MND+10','Accuracy+14','Attack+14',}}
	Odyss_hands			={ name="Odyssean Gauntlets", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+12',}}
	Odyss_legs			={ name="Odyssean Cuisses", augments={'"Store TP"+4','CHR+15','Accuracy+20 Attack+20','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}
	Odyss_legs_FC       ={ name="Odyssean Cuisses", augments={'"Fast Cast"+5','VIT+8','Mag. Acc.+5',}}
	
	Valor_head			={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','"Store TP"+2','Attack+3',}}
	Valor_legs			={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+5','Attack+7',}}
	Valor_feet			={ name="Valorous Greaves", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+9','Attack+4',}}
	
	--Yori no longer used
	--Yorium_head			={ name="Yorium Barbuta", augments={'Accuracy+20 Attack+20','Enmity+9','Damage taken-3%',}}
    --Yorium_hands		={ name="Yorium Gauntlets", augments={'Accuracy+18 Attack+18','Enmity+10','Damage taken-2%',}}
    --Yorium_legs			={ name="Yorium Cuisses", augments={'Accuracy+19 Attack+19','Enmity+8','Damage taken-3%',}}
    --Yorium_feet			={ name="Yorium Sabatons", augments={'Accuracy+18 Attack+18','Enmity+10','Damage taken-3%',}}
	
	FC_back				={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}
	Weard_back			={ name="Weard Mantle", augments={'VIT+3','Enmity+6','Phalanx +3',}}
	WS_back			    ={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}}
	TP_back             ={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','Enmity+10',}}
	--------------------------------------
    -- Precast sets
    --------------------------------------
	
	sets.precast.Enmity = {ammo="Sapience Orb",
		head=Souveran_head_cure,neck="Unmoving Collar +1",ear1="Cryptic Earring",ear2="Trux Earring",
		body=Souveran_body_cure,hands=Souveran_hands_cure,ring1="Eihwaz Ring",ring2="Supershear Ring",
		back=TP_back,waist="Creed Baudrier",legs=Souveran_legs_cure,feet=Souveran_feet_cure}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = 		set_combine(sets.precast.Enmity,{legs="Caballarius Breeches +1"})
    sets.precast.JA['Holy Circle'] = 		set_combine(sets.precast.Enmity,{feet="Reverence Leggings +1"})
    sets.precast.JA['Shield Bash'] = 		set_combine(sets.precast.Enmity,{ear1="Knightly Earring",hands="Caballarius Gauntlets +1"})
    sets.precast.JA['Sentinel'] = 			set_combine(sets.precast.Enmity,{feet="Caballarius Leggings +1"})
    sets.precast.JA['Rampart'] = 			set_combine(sets.precast.Enmity,{head="Caballarius Coronet"})
    sets.precast.JA['Fealty'] = 			set_combine(sets.precast.Enmity,{body="Caballarius Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = 		set_combine(sets.precast.Enmity,{feet="Chevalier's Sabatons +1"})
    sets.precast.JA['Cover'] = 				set_combine(sets.precast.Enmity,{head="Reverence Coronet +1", body="Caballarius Surcoat +1"})
	sets.precast.JA['Intervene'] = 			set_combine(sets.precast.Enmity,{})	
		-- sub WAR JA
	sets.precast.JA['Provoke'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Berserk'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Defender'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Warcry'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Agressor'] = 			set_combine(sets.precast.Enmity,{})

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = set_combine(sets.precast.Enmity,{ammo="Aqua Sachet",
        head="Reverence Coronet +1",ear1="Lifestorm Earring",
        body="Caballarius Surcoat +1",hands="Caballarius Gauntlets +1",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
        back="Tuilha Cape",legs="Caballarius Breeches +1",feet="Reverence Leggings +1"})
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Quiahuiz Helm",neck="Dualism Collar +1",ear2="Enchanter Earring +1",
        body='Caballarius Surcoat +1',hands="Medb's Gauntlets +1",ring1="Titan Ring",
        back="Earthcry Mantle",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
	
    sets.precast.FC = {ammo="Sapience Orb",
		head=Carmine_head,neck="Voltsurge Torque",ear1={name="Odnowa earring +1",priority=5},ear2={name="Etiolation Earring",priority=1},
		body="Reverence surcoat +3",hands=Leyline_Gloves,ring1={name="K'ayres Ring",priority=2},ring2={name="Meridian Ring",priority=3},
		back=FC_back,waist={name="Creed Baudrier",priority=4},legs=Odyss_legs_FC,feet=Carmine_feet}	
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body=Jumalik_Mail})

    sets.precast.FC.cureCheatFour = {ammo="Incantor Stone",
		head=Carmine_head,neck="Diemer Gorget",ear1="Nourishing Earring +1",ear2="Etiolation Earring",
		body=Jumalik_Mail,hands=Leyline_Gloves,ring1="Mephitas's Ring +1",ring2="Prolix Ring",
		back=FC_back,waist="Flume Belt +1",legs=Odyss_legs,feet=Carmine_feet}
		
	sets.precast.FC.cureCheatThree = {ammo="Incantor Stone",
		head=Carmine_head,neck="Diemer Gorget",ear1="Nourishing Earring +1",ear2="Etiolation Earring",
		body=Jumalik_Mail,hands=Leyline_Gloves,ring1="Mephitas's Ring +1",ring2="Prolix Ring",
		back=FC_back,waist="Flume Belt +1",legs=Odyss_legs,feet=Carmine_feet}
		
		
	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.MaxTP = {}
	
	sets.precast.WS = {ammo="Cheruski Needle",
		head="Flamma zucchetto +1",neck="Lissome necklace",ear1="Ishvara Earring",ear2="Flame pearl",
		body=Souveran_body,hands="Flamma manopolas +1",ring1="Regal Ring",ring2="Ifrit Ring +1",
		back=WS_back,waist="Prosilio belt +1",legs="Sulevia's Cuisses +1",feet="Sulevia's leggings +2",}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS,{})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Atonement'] 			= set_combine(sets.precast.WS,						{ammo="Sapience orb",
																								head=Souv_head_cure,neck="Unmoving collar +1",ear1="Ishvara earring",ear2="Trux Earring",
																								body="Reverence surcoat +3",hands=Odyss_hands,ring1="Pernicious Ring",ring2="Supershear ring",
																								back=WS_back,waist="Creed Baudrier",legs=Souv_legs_cure,feet="Sulevia's leggings +2"})
	sets.precast.WS['Requiescat'] 			= set_combine(sets.precast.WS, 						{ammo="Cheruski Needle",
																								head=Carmine_head_NQ,neck="Asperity Necklace",ear2="Dignitary's Earring",
																								hands=Carmine_hands,ring1="Pernicious Ring",ring2="Rajas Ring",
																								back="Grounded Mantle +1",waist="Zoran's Belt",legs=Carmine_legs,feet=Carmine_feet})
	sets.precast.WS['Requiescat'].Acc 		= set_combine(sets.precast.WS['Requiescat'], 		{})
	sets.precast.WS['Chant du Cygne'] 		= set_combine(sets.precast.WS, 						{ammo="Cheruski Needle",
																								neck="Asperity Necklace",ear2="Dignitary's Earring",
																								hands="Carmine Finger Gauntlets +1",ring1="Pernicious Ring",ring2="Rajas Ring",
																								back=WS_back,waist="Zoran's Belt",legs=Valor_legs,feet="Sulevia's leggings +2"})
	sets.precast.WS['Chant du Cygne'].Acc 	= set_combine(sets.precast.WS['Chant du Cygne'], 	{})
	sets.precast.WS['Savage Blade']			= set_combine(sets.precast.WS, 						{})
	sets.precast.WS['Savage Blade'].Acc		= set_combine(sets.precast.WS['Savage Blade'],	 	{})
	sets.precast.WS['Sanguine Blade'] 		= set_combine(sets.precast.WS, 						{})
	sets.precast.WS['Sanguine Blade'].Acc 	= set_combine(sets.precast.WS['Sanguine Blade'], 	{})
	
		
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
		
	sets.midcast.Trust 		= set_combine(sets.midcast.FastRecast, {body="Yoran-Oran Unity Shirt"})
        
    sets.midcast.Enmity 	= set_combine(sets.precast.Enmity, {})

    --sets.midcast.Flash 		= set_combine(sets.midcast.Enmity, {})
    
    sets.midcast.Stun 		= sets.midcast.Flash
    
	sets.midcast.Cure 		={head=Souveran_head_cure,neck="Diemer Gorget",ear1="Nourishing Earring +1",ear2="Mendicant's Earring",
							body=Souveran_body_cure,hands=Souveran_hands_cure,ring1="Defending Ring",ring2="Vocane Ring",
							back="Solemnity Cape",waist="Chuq'aba belt",legs=Carmine_legs,feet=Souveran_feet_cure}
	
	sets.midcast.cureCheat 	={ammo="Egoist's tathlum",
							head=Souveran_head_cure,neck="Dualism Collar",ear1="Nourishing Earring +1",ear2="Nourishing Earring",
							body=Jumalik_Mail,hands=Souveran_hands_cure,ring1="Meridian Ring",ring2="Haoma's Ring",
							back="Reiki cloak",waist="Creed Baudrier",legs=Souveran_legs_cure,feet=Souveran_feet_cure}

    sets.midcast['Enhancing magic'] 	= set_combine(sets.midcast.FastRecast, 			{})
	sets.midcast['Phalanx']				= set_combine(sets.midcast['Enhancing magic'], 	{back="Reiki cloak",hands=Souveran_hands,feet=Souveran_feet_cure})
	sets.midcast['Reprisal'] 			= set_combine(sets.midcast.FastRecast, 			{ammo="Egoist's Tathlum",
																						head=Souveran_head_cure,neck="Dualism Collar",ear1="Thureous Earring",ear2="Etiolation Earring",
																						body=Souveran_body,hands=Souveran_hands,ring1="K'ayres ring",ring2="Eihwaz Ring",
																						back="Reiki cloak",waist="Creed Baudrier",legs=Valor_legs,feet=Souveran_feet_cure})
	sets.midcast['Divine magic'] 		= set_combine(sets.midcast.FastRecast, 			{head=Jumalik_Helm,neck="Henic torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
																						body="Reverence surcoat +3",hands=Eschite_hands,ring1="Kishar Ring",ring2="Prolix Ring",
																						back=TP_back,waist="Asklepian belt",legs=Carmine_legs,feet=Souveran_feet})
    sets.midcast['Diaga'] 				= set_combine(sets.midcast.Enmity, 				{})
    sets.midcast.Protect 				= set_combine(sets.midcast.FastRecast, 			{ring1="Sheltered Ring"})
    sets.midcast.Shell 					= set_combine(sets.midcast.FastRecast, 			{ring1="Sheltered Ring"})
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
	sets.Refresh = {ammo="Homiliary",head=Jumalik_Helm, neck="Coatl Gorget +1",ear1="Moonshade Earring",
	body=Jumalik_Mail,waist="Fucho-no-obi",}
	
	sets.Regen = {head="Twilight Helm", neck="Coatl Gorget +1" ,ring1="Sheltered Ring", ring2="Paguroidea Ring"}
	
	sets.Kiting = {legs=Carmine_legs}
	
	
    sets.resting = set_combine(sets.Refresh, {
		ear2="Bloodgem Earring",
		hands="Reverence Gauntlets",ring1= "Vexer ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",legs="Reverence Breeches +1",})
    

    -- Idle sets
   sets.idle.PDT = {ammo="Staunch tathlum",
		head=Souveran_head_cure,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Reverence surcoat +3",hands=Souveran_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back=TP_back,waist="Nierenschutz",legs=Souveran_legs_cure,feet=Souveran_feet_cure}

	--sets.idle.Town = {ammo="Paeapua",
		-- head="Sulevia's Mask +1",neck="Loricate Torque +1",ear1="Dawn Earring",ear2="Merman's Earring",
		-- body=Souveran_body,hands="Sulevia's Gauntlets +1",ring1="Vocane Ring",ring2="Paguroidea Ring",
		-- back="Philidor Mantle",waist="Flume Belt +1",legs=Carmine_legs,feet="Sulevia's leggings +2"}
	
	sets.idle.Weak = {ammo="Staunch tathlum",
		head="Sulevia's Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body=Souveran_body,hands=Souveran_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Solemnity Cape",waist="Nierenschutz",legs=Souveran_legs_cure,feet="Sulevia's leggings +2"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	
	sets.idle.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	
	sets.idle.Refresh = set_combine(sets.idle.PDT, sets.Refresh)
	
	sets.idle.Regen = set_combine(sets.idle.PDT, sets.Regen)	

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.MP 			= {head="Chevalier's Armet +1",ear1="Ethereal Earring",waist="Flume Belt +1"}
	sets.Resist_Death 	= {ring1="Shadow Ring",ring2="Eihwaz Ring"}
	sets.Shield_Skill 	= {head="Chevalier's Armet",ear1='Creed Earring',hands="Chevalier's Gauntlets +1",feet="Reverence Leggings +1"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {ammo="Staunch tathlum",
		head=Souveran_head_cure,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Ethereal Earring",
		body="Reverence surcoat +3",hands=Souveran_hands,ring1="Defending Ring",ring2="Vocane Ring",
		back=TP_back,waist="Nierenschutz",legs=Souveran_legs,feet=Souveran_feet_cure,}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {ammo="Staunch tathlum",
		head=Souveran_head_cure,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Ethereal Earring",
		body="Reverence surcoat +3",hands=Souveran_hands,ring1="Defending Ring",ring2="Vocane Ring",
		back=WS_back,waist="Nierenschutz",legs=Souveran_legs,feet=Souveran_feet_cure,}
		
    sets.defense.HP = {ammo="Egoist's Tathlum",
		head="Sulevia's Mask +1",neck="Dualism Collar +1",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body=Souveran_body,hands="Sulevia's Gauntlets +1",ring1="Vocane Ring",ring2="Eihwaz Ring",
		back="Philidor Mantle",waist="Flume Belt +1",legs=Souveran_legs,feet=Souveran_feet_cure,}
		
    sets.defense.Reraise = {ammo="Staunch tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Twilight Mail",hands="Reverence Gauntlets",ring1="Vocane Ring",ring2="Eihwaz Ring",
		back="Engulfer Cape +1",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    --DD set
    sets.engaged = {ammo="Ginsen",
		head="Sulevia's Mask +1",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Dignitary's Earring",
		body="Sulevia's Platemail +1",hands="Sulevia's Gauntlets +1",ring1="Pernicious Ring",ring2="Petrov Ring",
		back=TP_back,waist="Tempus Fugit",legs="Sulevia's Cuisses +1",feet="Sulevia's leggings +2"}
	
	sets.engaged.Acc = set_combine(sets.engaged,{ammo="Hasty Pinion +1",ear1="Zennaroi Earring",
	ring1="Begrudging Ring",})

    sets.engaged.DW = {ammo="Paeapua",
		head=Carmine_head,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Founder's Breastplate",hands="Sulevia's Gauntlets +1",ring1="Apate Ring",ring2="Rajas Ring",
		back=TP_back,waist="Dynamic Belt +1",legs=Odyss_legs,feet="Sulevia's leggings +2"}

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{ammo="Ginsen",neck="Lissome Necklace",body=Souveran_body})
	
	sets.engaged.Turtle = {ammo="Staunch tathlum",
		head=Souveran_head_cure,neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Ethereal Earring",
		body="Reverence surcoat +3",hands=Souveran_hands,ring1="Defending Ring",ring2="Vocane Ring",
		back=TP_back,waist="Nierenschutz",legs=Souveran_legs,feet=Souveran_feet_cure,}
		
	sets.engaged.Acc.Turtle = set_combine(sets.engaged.Turtle, {ammo="Hasty Pinion +1",
	head="Sulevia's Mask +1",body=Souveran_body,ear1="Dignitary's Earring",waist="Zoran's belt",feet="Sulevia's leggings +2" })

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +3",neck="Loricate Torque +1",ring1="Vocane Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +3",neck="Loricate Torque +1",ring1="Vocane Ring"})
	
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom 		= set_combine(sets.Reraise, {ring1="Saida Ring",ring2="Blenmot's Ring"})
    sets.buff.Cover 	= {}
	sets.buff.sleep 	= {neck="Berserker's Torque"}
	sets.buff.Sentinel	= {}
	sets.buff.Reive 	= {neck = "Arciela's grace +1"}
	sets.CP 			= {back="Mecistopins Mantle"}
	
	-- sets.fishing = {
		-- range="Ebisu Fishing Rod",
		-- body="Fisherman's Smock",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
		-- legs="Fisherman's Hose",feet="Waders"}
	-- sets.ww = {body = "Carpenter's Smock", hands = "Carpenter's Gloves", ring1 = "Craftmaster's Ring", ring2 = "Artificer's Ring"}
	-- sets.synergy = {body = "Carpenter's Smock", hands = "Carpenter's Cuffs"}
			
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

	send_command('input /lockstyleset 4')
	
    send_command('bind ^` input /ja "sentinel" <me>')
	send_command('bind !` input /ma "flash" <stnpc>')
	
	send_command('bind F10 input /ma "cure 3" <stal>')
	send_command('bind F11 input /ma "cure 4" <stal>')
	
	if player.sub_job:upper() == 'WAR' then		
		send_command('bind F8 input /ws "Atonement" <t>')
		send_command('bind F9 input /ja "provoke" <stnpc>')
		
	elseif player.sub_job:upper() == 'DNC' then
		
		send_command('bind ^` input /ja "spectral jig" <me>')
		send_command('bind !` input /ma "flash" <stnpc>')
		
		send_command('bind F7 input /ja "Box step" <stnpc>')
		send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Haste Samba" <me>')
		send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		send_command('bind ^F11 input /ja "Divine Waltz" <me>')
	elseif player.sub_job:upper() == 'RDM' then
	
		send_command('bind F8 input /ws "Atonement" <t>')
		send_command('bind F9 input /ma "Diaga" <stnpc>')
		send_command('bind F7 input /ma "Stoneskin" <me>')
		
	end
	
	set_macro_page(1, 4)
end

 