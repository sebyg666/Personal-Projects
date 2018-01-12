-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.doom = buffactive.doom or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'HP', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'Reraise')
	state.IdleMode:options('Normal','Refresh','Regen','Reraise','PDT')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP','Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()
    
	state.PhysicalDefense     = M(false, 'PhysicalDefense')
	state.MagicalDefense      = M(false, 'MagicalDefense')
	
	gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Zoran's belt"
	
	-- send_command('bind ^] gs c cycle HybridMode')
    -- send_command('bind @] gs c cycle ExtraDefenseMode')
    -- send_command('bind @f12 gs c toggle EquipShield')

    select_default_macro_book()
end

function user_unload()
    -- send_command('unbind ^f11')
    -- send_command('unbind !f11')
    -- send_command('unbind @f10')
    -- send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = {legs="Caballarius Breeches"}
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
    sets.precast.JA['Shield Bash'] = {ear1="Knightly Earring",hands="Caballarius Gauntlets"}
    sets.precast.JA['Sentinel'] = {feet="Caballarius Leggings"}
    sets.precast.JA['Rampart'] = {head="Caballarius Coronet"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat"}
    sets.precast.JA['Divine Emblem'] = {feet="Chevalier's Sabatons"}
    sets.precast.JA['Cover'] = {head="Reverence Coronet +1", body="Caballarius Surcoat"}

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Aqua Sachet",
        head="Reverence Coronet +1",ear1="Lifestorm Earring",
        body="Acro Surcoat",hands="Caballarius Gauntlets",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
        back="Weard Mantle",legs="Caballarius Breeches",feet="Acro Leggings"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Quiahuiz Helm",ear2="Enchanter Earring +1",
        body="Acro Surcoat",hands="Medb's Gauntlets +1",ring1="Terrasoul Ring",
        back="Earthcry Mantle",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Acro Leggings"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Incantor Stone",
		head="Chevalier's Armet",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs="Enif Cosciales",feet="Ejekamal Boots"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})	
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.cureCheatFour = {ammo="Incantor Stone",
		head="Chevalier's Armet",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Weald Gages",ring1="Bifrost ring",ring2="Prolix Ring",
		back="Mollusca Mantle",waist="Cognizant Belt",legs="Enif Cosciales",feet="Ogier's Leggings"}
		
	sets.precast.FC.cureCheatThree = {ammo="Incantor Stone",
		head="Chevalier's Armet",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Nuevo Coselete",hands="Buremte Gloves",ring1="Bifrost ring",ing2="Prolix Ring",
		back="Mollusca Mantle",waist="Nierenschutz",legs="Enif Cosciales",feet="Ogier's Leggings"}
		
		
	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
		
	sets.precast.WS = {ammo="Ginsen",
		head="Otomi Helm",neck=gear.ElementalGorget,ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Acro Surcoat",hands="Medb's Gauntlets +1",ring1="Ifrit Ring",ring2="Ifrit ring",
		back="Atheling Mantle",waist=gear.ElementalBelt,legs="Yorium Cuisses",feet="Ejekamal Boots"}
	
	sets.precast.WS.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Acro Surcoat",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Beeline Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Mikinaak Cuisses",feet="Acro Leggings"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Atonement'] 			= set_combine(sets.precast.WS, {body="Phorcys Korazin", legs="Ogier's Breeches"})
	
	sets.precast.WS['Requiescat'] 			= set_combine(sets.precast.WS, {hands="Buremte Gloves",ring1="Aquasoul ring",ring2="Aquasoul ring",waist="Shadow belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"})
	sets.precast.WS['Requiescat'].Acc 		= set_combine(sets.precast.WS.Acc, {ring1="Aquasoul ring"})
	
	sets.precast.WS['Chant du Cygne'] 		= set_combine(sets.precast.WS, {ammo="Jukukik Feather",head="Quiahuiz Helm",neck="Rancor Collar",ring2="Thundersoul ring",legs="Hecatomb Subligar +1",feet="Acro Leggings"})
	sets.precast.WS['Chant du Cygne'].Acc 	= set_combine(sets.precast.WS.Acc, {waist="Zoran's Belt"})
	
	sets.precast.WS['Exenterator'] 			= set_combine(sets.precast.WS, {})

	sets.precast.WS['Aeolian Edge'] 		= {neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",back="Toro Cape",waist=gear.ElementalBelt}
	
	sets.precast.WS['Savage Blade']			= set_combine(sets.precast.WS, {ear1="Brutal Earring",ear2="Moonshade Earring",
																			body="Acro Surcoat",
																			back="Buquwik Cape",feet="Gorney Sollerets +1"})
	
	sets.precast.WS['Sanguine Blade'] 		= {ammo="Ginsen",
        head="Reverence Coronet +1",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Reverence Surcoat +1",hands="Acro Gauntlets",ring1="Rajas ring",ring2="K'ayres Ring",
        back="Toro Cape",waist="Caudata Belt",legs="Yorium Cuisses",feet="Acro Leggings"}
	
		
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Incantor Stone",
		head="Chevalier's Armet",neck="Jeweled Collar",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Reverence Surcoat +1",hands="Buremte Gloves",ring1="Defending ring",ring2="Prolix Ring",
		back="Mollusca Mantle",waist="Zoran's belt",legs="Enif Cosciales",feet="Ejekamal boots"}
        
    sets.midcast.Enmity = {ammo="Paeapua",
		head="Caballarius Coronet",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Enchanter Earring +1",
		body="Chevalier's Cuirass",hands="Caballarius Gauntlets",ring1="Vexer Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",waist="Creed Baudrier",legs="Caballarius Breeches",feet="Chevalier's Sabatons"}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {legs="Enif Cosciales"})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = set_combine(sets.midcast.Enmity, {ear2="Hospitaler Earring"})
	
	--waist="Chuq'aba Belt"
	sets.midcast.cureCheat = {
		ammo="Egoist's Tathlum",
		head="Caballarius Coronet",neck="Atzintli Necklace",ear1="Oneiros Earring",ear2="Hospitaler Earring",
		body="Reverence Surcoat +1",hands="Buremte Gloves",ring1="Vexer ring",ring2="Eihwaz Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Caballarius Leggings"}

    sets.midcast['Enhancing magic'] = set_combine(sets.midcast.FastRecast, {body="Shabti Cuirass",legs="Reverence Breeches +1"})
	sets.midcast['Enlight'] = set_combine(sets.midcast.FastRecast, {neck="Divine Torque",ear1="Beatific Earring",ear1="Divine Earring",body="Reverence Surcoat +1", waist="Bishop's Sash"})
    
    sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
	sets.Refresh = {head="Wivre hairpin", neck="Coatl Gorget +1", body="Ares' Cuirass", hands="Ogier's Gauntlets", feet="Ogier's Leggings"}
	
	sets.Regen = {head="Twilight Helm", neck="Coatl Gorget +1" ,ring1="Sheltered Ring", ring2="Paguroidea Ring"}
	
	sets.PDT = {ammo="Angha Gem",
		head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
		body="Reverence Surcoat +1",hands="Yorium Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}
	
    sets.resting = set_combine(sets.Refresh, {
		ear1="Creed Earring",ear2="Bloodgem Earring",
		hands="Reverence Gauntlets",ring1= "Vexer ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"})
    

    -- Idle sets
   sets.idle = {ammo="Incantor Stone",
		head="Wivre hairpin",neck="Coatl Gorget +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Ares' Cuirass",hands="Reverence Gauntlets",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Weard Mantle",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}

	sets.idle.Town = {ammo="Paeapua",
		head="Acro Helm",neck="Coatl Gorget +1",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Ares' Cuirass",hands="Ogier's Gauntlets",ring1="Defending Ring",ring2="K'ayres Ring",
		back="Weard Mantle",waist="Flume Belt +1",legs="Enif Cosciales",feet="Ejekamal Boots"}
	
	sets.idle.Weak = {ammo="Vanir Battery",
		head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
		body="Reverence Surcoat +1",hands="Yorium Gauntlets",ring1= "Vexer ring",ring2= "Meridian Ring",
		back="Fierabras's Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.PDT, sets.Reraise)
	
	sets.idle.Reraise = set_combine(sets.PDT, sets.Reraise)
	
	sets.idle.Refresh = set_combine(sets.PDT, sets.Refresh)
	
	sets.idle.Regen = set_combine(sets.PDT, sets.Regen)
	
	sets.idle.PDT = set_combine(sets.PDT)
    
    sets.Kiting = {legs="Blood Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle"}
    sets.MP = {head="Chevalier's Armet",ear1="Ethereal Earring",waist="Flume Belt +1"}
    sets.MP_Knockback = {neck="Coatl Gorget +1",waist="Flume Belt +1",back="Repulse Mantle"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {ammo="Angha Gem",
		head="Reverence Coronet +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Bloodgem Earring",
		body="Reverence Surcoat +1",hands="Yorium Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {ammo="Vanir Battery",
		head="Yorium Barbuta",neck="Warder's Charm",ear1="Ethereal Earring",ear2="Bloodgem Earring",
		body="Reverence Surcoat +1",hands="Medb's Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Acro Leggings"}
		
    sets.defense.HP = {ammo="Egoist's Tathlum",
		head="Caballarius Coronet",neck="Iqabi Necklace",ear1="Creed Earring",ear2="Bloodgem Earring",
		body="Reverence Surcoat +1",hands="Caballarius Gauntlets",ring1="K'ayres Ring",ring2="Eihwaz Ring",
		back="Weard Mantle",waist="Creed Baudrier",legs="Reverence Breeches +1",feet="Ejekamal boots"}
		
    sets.defense.Reraise = {ammo="Vanir Battery",
		head="Twilight Helm",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Bloodgem Earring",
		body="Twilight Mail",hands="Reverence Gauntlets",ring1="Defending Ring",ring2="Eihwaz Ring",
		back="Engulfer Cape +1",waist="Flume Belt +1",legs="Reverence Breeches +1",feet="Gorney Sollerets +1"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Acro Surcoat",hands="Acro Gauntlets",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Yorium Cuisses",feet="Acro Leggings"}

    sets.engaged.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Acro Surcoat",hands="Yorium Gauntlets",ring1="Mars's Ring",ring2="Beeline Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs="Yorium Cuisses",feet="Acro Leggings"}

    sets.engaged.DW = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Acro Surcoat",hands="Acro Gauntlets",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Yorium Cuisses",feet="Acro Leggings"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Acro Surcoat",hands="Yorium Gauntlets",ring1="Mars's Ring",ring2="Beeline Ring",
		back="Weard Mantle",waist="Dynamic Belt +1",legs="Yorium Cuisses",feet="Acro Leggings"}

    sets.engaged.PDT = set_combine(sets.defense.PDT, {ear1="Ethereal Earring",legs="Yorium Cuisses"})
    sets.engaged.Acc.PDT = {ammo="Jukukik feather", 
		head="Reverence Coronet +1",neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Reverence Surcoat +1",hands="Yorium Gauntlets",ring1="Defending Ring",ring2="Beeline Ring", 
		back="Weard Mantle",waist="Dynamic Belt +1",legs="Yorium Cuisses",feet="Acro Leggings" }
	
	sets.engaged.HP = sets.defense.HP
	sets.engaged.Acc.HP = set_combine(sets.defense.HP, {hands="Yorium Gauntlets",
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
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat"}
	sets.buff.sleep = {neck="Berserker's Torque"}
	sets.buff.Sentinel = {feet="Caballarius Leggings"}	
		
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and player.tp < 999 then
		add_to_chat(123,'Abort WS: not enought TP')
		eventArgs.cancel = true
		return
	end
	if spell.name == "Provoke" then
		equip(sets.midcast.Enmity)
	end
	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' and spell.target.type == 'SELF' and state.DefenseMode.current == 'None' and player.hp > 75 then
			if spell.name == 'Cure IV' then
				add_to_chat(200,'***** Curecheat: ' ..spell.name.. ' *****')
				equip(sets.precast.FC.cureCheatFour)
				eventArgs.handled = true
			elseif spell.name == 'Cure III' then
				add_to_chat(200,'***** Curecheat: ' ..spell.name.. ' *****')
				equip(sets.precast.FC.cureCheatThree)
				eventArgs.handled = true
			end
		end
	end	
end

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
	
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
		handle_equipping_gear(player.status)
		if spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.defense.HP)
			end
		end
        eventArgs.handled = true
	elseif state.DefenseMode.current == 'None' then
		handle_equipping_gear(player.status)
		if spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.cureCheat)
			end
		end
		eventArgs.handled = true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	-- if gain == true then
		-- add_to_chat(200,'***** Gained buff ' ..buff.. ' *****')
	-- end
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	
	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == 'Acc' then
		state.WeaponskillMode:set('Acc')
	end
	
	if field == "PhysicalDefense" then
		if state.PhysicalDefense.value == true then
			state.DefenseMode.current = 'Physical'
			state.DefenseMode:set('Physical')
			state.MagicalDefense = M(false)
		end
	elseif field == "MagicalDefense" then
		if state.MagicalDefense.value == true then
			state.DefenseMode.current = 'Magical'
			state.DefenseMode:set('Magical')
			state.PhysicalDefense = M(false)
		end
	end
	if field == "MagicalDefense" or field == "PhysicalDefense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
	
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
	if state.Buff.Sentinel then
		idleSet = set_combine(idleSet, sets.buff.Sentinel)
	end
	if state.Buff.Cover then
		idleSet = set_combine(idleSet, sets.buff.Cover)
	end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
    if state.Buff.Sentinel then
		meleeSet = set_combine(meleeSet, sets.buff.Sentinel)
	end
	if state.Buff.Cover then
		meleeSet = set_combine(meleeSet, sets.buff.Cover)
	end
	if state.Buff.sleep then
		meleeSet = set_combine(meleeSet, sets.buff.sleep)
		add_to_chat(200,'***** Status Sleep while Engaged || Equiping Berserkers torque *****')
		if state.Buff.Stoneskin then
			send_command('cancel 37')
			add_to_chat(200,'***** Cancelling Stoneskin to wake up *****')
		end
	end
    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
    
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
    
    if state.Buff.doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
		add_to_chat(200,'***** Doomed *****')
    end
	if state.Buff.Sentinel then
		defenseSet = set_combine(defenseSet, sets.buff.Sentinel)
	end
	if state.Buff.Cover then
		defenseSet = set_combine(defenseSet, sets.buff.Cover)
	end
    if state.Buff.sleep and player.status == "Engaged" then
		defenseSet = set_combine(defenseSet, sets.buff.sleep)
		add_to_chat(200,'***** Status Sleep while Engaged || Equiping Berserkers torque *****')
		if state.Buff.Stoneskin then
			send_command('cancel 37')
			add_to_chat(200,'***** Cancelling Stoneskin to wake up *****')
		end
	end
    return defenseSet
end


function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra: ' .. state.ExtraDefenseMode.value
    end
    
    if state.EquipShield.value == true then
        msg = msg .. ', Force Equip Shield'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and not player.equipment.sub:contains('Grip') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- send_command('bind ^` input /ja "sentinel" <me>')
	-- send_command('bind !` input /ma "flash" <stnpc>')
	
	-- send_command('bind F10 input /ma "cure 3" <stal>')
	-- send_command('bind F11 input /ma "cure 4" <stal>')
	-- send_command('bind ![ gs c cycle PhysicalDefenseMode')
	-- send_command('bind !] gs c cycle MagicalDefenseMode')
	-- send_command('bind ^f12 gs c cycle IdleMode')
	
	-- if player.sub_job:upper() == 'WAR' then		
		
		-- send_command('bind F9 input /ja "provoke" <stnpc>')
		
	-- elseif player.sub_job:upper() == 'DNC' then
		
		-- send_command('bind ^` input /ja "spectral jig" <me>')
		-- send_command('bind !` input /ma "flash" <stnpc>')
		
		-- send_command('bind F7 input /ja "Box step" <stnpc>')
		-- send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		-- send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		-- send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		-- send_command('bind ^F9 input /ja "Haste Samba" <me>')
		-- send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		-- send_command('bind ^F11 input /ja "Divine Waltz" <me>')
	-- elseif player.sub_job:upper() == 'RDM' then
	
		-- send_command('bind F8 input /ws "Atonement" <t>')
		-- send_command('bind F9 input /ma "Diaga" <stnpc>')
		-- send_command('bind F7 input /ma "Stoneskin" <me>')
		
	-- end
	
	set_macro_page(1, 12)
end
