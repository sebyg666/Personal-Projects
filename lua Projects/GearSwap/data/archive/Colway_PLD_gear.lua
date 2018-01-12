
function init_gear_sets()
	
	print('Colway_PLD_Gear side_cart loaded')	
	
	-- Cure Pot Augments
	
	Yorium_head_CP		={ name="Yorium Barbuta", augments={'"Cure" potency +2%',}}
	Yorium_body_CP		={ name="Yorium Cuirass", augments={'"Cure" potency +3%',}}
	Yorium_feet_CP		={ name="Yorium Sabatons", augments={'"Cure" potency +5%',}}
	
	-- PDT augments
	
	Yorium_head_PDT		={ name="Yorium Barbuta", augments={'Accuracy+20','"Dbl.Atk."+2','Phys. dmg. taken -3%',}}
    Yorium_hands_PDT	={ name="Yorium Gauntlets", augments={'Accuracy+14','"Dbl.Atk."+2','Phys. dmg. taken -4%',}}
	
	-- ACC augemnts
	Acro_body_ACC		={ name="Acro Surcoat", augments={'Accuracy+12','"Dbl.Atk."+2','AGI+5',}}
    Yorium_legs_ACC		={ name="Yorium Cuisses", augments={'Accuracy+18','"Dbl.Atk."+2','Weapon skill damage +1%',}}
    Acro_feet_ACC		={ name="Acro Leggings", augments={'Accuracy+12','"Dbl.Atk."+3','STR+2 AGI+2',}}
	
	sets.weapons = {main="Buramenk'ah", sub="Anahera Sword"}
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
	sets.precast.Enmity = {ammo="Paeapua",
		head="Caballarius Coronet",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Enchanter Earring +1",
		body="Chevalier's Cuirass +1",hands="Caballarius Gauntlets +1",ring1="Apeile Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",waist="Creed Baudrier",legs="Caballarius Breeches +1",feet="Chevalier's Sabatons +1"}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = 		set_combine(sets.precast.Enmity,{legs="Caballarius Breeches +1"})
    sets.precast.JA['Holy Circle'] = 		set_combine(sets.precast.Enmity,{feet="Reverence Leggings +1"})
    sets.precast.JA['Shield Bash'] = 		set_combine(sets.precast.Enmity,{ear1="Knightly Earring",hands="Caballarius Gauntlets +1"})
    sets.precast.JA['Sentinel'] = 			set_combine(sets.precast.Enmity,{feet="Caballarius Leggings"})
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
        body='Caballarius Surcoat +1',hands="Caballarius Gauntlets +1",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
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
    
    sets.precast.FC = {ammo="Incantor Stone",
		head="Chevalier's Armet +1",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs="Enif Cosciales",feet="Ejekamal Boots"}	
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.cureCheatFour = {ammo="Incantor Stone",
		head="Cizin helm",neck="Jeweled Collar",ear1="Nourishing Earring +1",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Weald Gages",ring1="Bifrost ring",ring2="Prolix Ring",
		back="Mollusca Mantle",waist="Cognizant Belt",legs="Enif Cosciales",feet="Acro Leggings"}
		
	sets.precast.FC.cureCheatThree = {ammo="Incantor Stone",
		head="Chevalier's Armet +1",neck="Jeweled Collar",ear1="Nourishing Earring +1",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Buremte Gloves",ring1="Bifrost ring",ing2="Prolix Ring",
		back="Mollusca Mantle",waist="Fluma Belt +1",legs="Enif Cosciales",feet="Acro Leggings"}
		
		
	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
	
	sets.precast.WS = {ammo="Ginsen",
		head="Otomi Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body='Caballarius Surcoat +1',hands="Medb's Gauntlets +1",ring1="Ifrit Ring",ring2="Karieyh ring",
		back="Atheling Mantle",waist="Fotia Belt",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1"}
	
	sets.precast.WS.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body='Caballarius Surcoat +1',hands="Buremte Gloves",ring1="Rajas Ring",ring2="Ifrit ring",
        back="Atheling Mantle",waist="Fotia Belt",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Atonement'] 			= set_combine(sets.precast.WS,{ammo="Paeapua",
												head="Reverence Coronet +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
												body="Chevalier's Cuirass +1",hands="Caballarius Gauntlets +1",ring1="Vexer Ring",ring2="Karieyh ring",
												back="Earthcry Mantle",legs="Caballarius Breeches +1",feet="Chevalier's Sabatons +1"})
	
	sets.precast.WS['Requiescat'] 			= set_combine(sets.precast.WS, {hands="Buremte Gloves",ring1="Aquasoul ring",ring2="Karieyh ring",feet="Ejekamal Boots"})
	sets.precast.WS['Requiescat'].Acc 		= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Chant du Cygne'] 		= set_combine(sets.precast.WS, {ammo="Jukukik Feather",neck="Rancor Collar",ring1="Ramuh Ring",feet="Acro Leggings"})
	sets.precast.WS['Chant du Cygne'].Acc 	= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Exenterator'] 			= set_combine(sets.precast.WS, {})

	sets.precast.WS['Aeolian Edge'] 		= set_combine(sets.precast.WS, {neck="Deviant Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",back="Toro Cape"})
	
	sets.precast.WS['Savage Blade']			= set_combine(sets.precast.WS, {ear1="Brutal Earring",ear2="Moonshade Earring",
																			body='Caballarius Surcoat +1',
																			back="Buquwik Cape",legs="Caballarius Breeches +1",feet="Gorney Sollerets +1"})
	
	sets.precast.WS['Sanguine Blade'] 		= {ammo="Ginsen",
												head="Reverence Coronet +1",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
												body="Reverence Surcoat +1",hands="Acro Gauntlets",ring1="Rajas ring",
												back="Toro Cape",waist="Caudata Belt",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1"}
	
		
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Incantor Stone",
		head="Chevalier's Armet +1",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Reverence Surcoat +1",hands="Buremte Gloves",ring1="Defending ring",ring2="Prolix Ring",
		back="Mollusca Mantle",waist="Dynamic Belt +1",legs="Enif Cosciales",feet="Ejekamal boots"}
        
    sets.midcast.Enmity = {ammo="Paeapua",
		head="Caballarius Coronet",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Enchanter Earring +1",
		body="Chevalier's Cuirass +1",hands="Caballarius Gauntlets +1",ring1="Apeile Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",waist="Creed Baudrier",legs="Caballarius Breeches +1",feet="Chevalier's Sabatons +1"}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {legs="Enif Cosciales"})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {head=Yorium_head_CP,neck="Atzintli Necklace",ear1="Nourishing Earring +1",ear2="Hospitaler Earring",
						body=Yorium_body_CP,hands="Macabre Gauntlets +1",ring1="Apeile Ring",ring2="Eihwaz Ring",
						back="Fierabras's Mantle",waist="Creed Baudrier",legs="Blitzer Poleyn",feet=Yorium_feet_CP}
	
	--waist="Chuq'aba Belt"
	sets.midcast.cureCheat = {ammo="Egoist's Tathlum",
		head="Chevalier's Armet +1",neck="Dualism Collar +1",ear1="Nourishing Earring +1",ear2="Hospitaler Earring",
		body="Reverence Surcoat +1",hands="Macabre Gauntlets +1",ring1="Kunaji ring",ring2="Eihwaz Ring",
		back="Fierabras's Mantle",waist="Chuq'aba Belt",legs="Chevalier's Cuisses +1",feet=Yorium_feet_CP}

    sets.midcast['Enhancing magic'] = set_combine(sets.midcast.FastRecast, {body="Shabti Cuirass",legs="Reverence Breeches +1"})
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing magic'], {back="Weard Mantle"})
	sets.midcast['Enlight'] = set_combine(sets.midcast.FastRecast, {neck="Divine Torque",ear1="Beatific Earring",ear2="Divine Earring",body="Reverence Surcoat +1", waist="Bishop's Sash"})
    sets.midcast['Diaga'] = set_combine(sets.midcast.Enmity)
	
    sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
	sets.Refresh = {head="Wivre hairpin", neck="Coatl Gorget +1", body="Ares' Cuirass", hands="Ogier's Gauntlets",legs="Ogier's Breeches", feet="Ogier's Leggings"}
	
	sets.Regen = {head="Twilight Helm", neck="Coatl Gorget +1" ,ring1="Sheltered Ring", ring2="Paguroidea Ring"}
	
	sets.Regain = {ring2="Karieyh ring"}
	
	
    sets.resting = set_combine(sets.Refresh, {
		ear1="Creed Earring",ear2="Bloodgem Earring",
		hands="Reverence Gauntlets",ring1= "Vexer ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"})
    

    -- Idle sets
   sets.idle.PDT = {ammo="Angha Gem",
		head="Chevalier's Armet +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body="Reverence Surcoat +1",hands=Yorium_hands_PDT,ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Caballarius Breeches +1",feet="Gorney Sollerets +1"}

	sets.idle.Town = {ammo="Paeapua",
		head="Chevalier's Armet +1",neck="Coatl Gorget +1",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Chevalier's Cuirass +1",hands="Chevalier's Gauntlets +1",ring1="Defending Ring",ring2="Eihwaz Ring",
		back="Weard Mantle",waist="Flume Belt +1",legs="Enif Cosciales",feet="Ejekamal Boots"}
	
	sets.idle.Weak = {ammo="Vanir Battery",
		head="Reverence Coronet +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body="Reverence Surcoat +1",hands=Yorium_hands_PDT,ring1= "Vexer ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	
	sets.idle.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	
	sets.idle.Refresh = set_combine(sets.idle.PDT, sets.Refresh)
	
	sets.idle.Regen = set_combine(sets.idle.PDT, sets.Regen)
	
	sets.idle.Regain = set_combine(sets.idle.PDT, sets.Regain)
	
    
    --sets.Kiting = {legs="Blood Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.MP = {head="Chevalier's Armet +1",ear1="Ethereal Earring",waist="Flume Belt +1"}
	sets.Resist_Death = {ring1="Shadow Ring",ring2="Eihwaz Ring"}
	sets.Shield_Skill = {head="Chevalier's Armet",ear1='Creed Earring',hands="Chevalier's Gauntlets +1",feet="Reverence Leggings +1"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {ammo="Angha Gem",
		head="Chevalier's Armet +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Reverence Surcoat +1",hands=Yorium_hands_PDT,ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Chevalier's Cuisses +1",feet="Gorney Sollerets +1"}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {ammo="Vanir Battery",
		head="Chevalier's Armet +1",neck="Warder's Charm",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Caballarius Surcoat +1",hands="Medb's Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Chevalier's Cuisses +1",feet="Chevalier's Sabatons +1"}
		
    sets.defense.HP = {ammo="Egoist's Tathlum",
		head="Chevalier's Armet +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body="Reverence Surcoat +1",hands="Caballarius Gauntlets +1",ring1="Defending Ring",ring2="Eihwaz Ring",
		back="Weard Mantle",waist="Creed Baudrier",legs="Chevalier's Cuisses +1",feet="Gorney Sollerets +1"}
		
    sets.defense.Reraise = {ammo="Vanir Battery",
		head="Twilight Helm",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Twilight Mail",hands="Reverence Gauntlets",ring1="Defending Ring",ring2="Eihwaz Ring",
		back="Engulfer Cape +1",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Chevalier's Cuirass +1",hands=Yorium_hands_PDT,ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Yorium_legs_ACC,feet="Ejekamal Boots"}

    sets.engaged.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Chevalier's Cuirass +1",hands=Yorium_hands_PDT,ring1="Mars's Ring",ring2="Rajas Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1"}
	
	sets.engaged.Enmity = {ammo="Paeapua",
		head="Caballarius Coronet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Chevalier's Cuirass +1",hands="Caballarius Gauntlets +1",ring1="Apeile Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",waist="Creed Baudrier",legs="Caballarius Breeches +1",feet="Ejekamal Boots"}

    sets.engaged.Acc.Enmity = {ammo="Paeapua",
		head="Caballarius Coronet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Chevalier's Cuirass +1",hands=Yorium_hands_PDT,ring1="Apeile Ring",ring2="Eihwaz Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs=Yorium_legs_ACC,feet="Chevalier's Sabatons +1"}

    sets.engaged.DW = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Acro_body_ACC,hands=Yorium_hands_PDT,ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Yorium_legs_ACC,feet="Ejekamal Boots"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Chevalier's Cuirass +1",hands=Yorium_hands_PDT,ring1="Mars's Ring",ring2="Beeline Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1"}

    sets.engaged.PDT = {ammo="Angha Gem",
		head=Yorium_head_PDT,neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Caballarius Surcoat +1",hands=Yorium_hands_PDT,ring1="Defending Ring",ring2="Dark Ring", 
		back="Weard Mantle",waist="Dynamic Belt +1",legs="Chevalier's Cuisses +1",feet="Ejekamal Boots" }
	
    sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT,{ammo="Ginsen",legs=Yorium_legs_ACC,feet="Gorney Sollerets +1" })
	
	sets.engaged.HP = sets.defense.HP
	sets.engaged.Acc.HP = set_combine(sets.defense.HP, {hands=Yorium_hands_PDT,
		ring1="Beeline Ring", back="Weard Mantle",waist="Dynamic Belt +1" })
		
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
	
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = set_combine(sets.Reraise, {ring1="Saida Ring",ring2="Blenmot's Ring"})
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}
	sets.buff.sleep = {neck="Berserker's Torque"}
	sets.buff.Sentinel = {feet="Caballarius Leggings"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	
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
 