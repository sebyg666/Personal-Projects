-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off
    
    Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
    for ranged weaponskills, but not actually meleeing.
    
    Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
--]]

include('Make-Settings.lua')
include('Organizer-lib.lua')

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    -- Whether to use Luzaf's Ring
    state.LuzafRing = M(true, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
    state.warned = M(false)
	
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false
	state.Buff.doom = buffactive.doom or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	
    define_roll_values()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Melee', 'Acc', 'Ranged')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	options.MagicalDefenseModes = {'MDT'}
	
	state.CP  						= M(false, 'CP')
	state.PhysicalDefense   	= M(false, 'PhysicalDefense')
	state.MagicalDefense    	= M(false, 'MagicalDefense')
	state.Auto_Kite  			= M(false, 'Auto_Kite')
	
    gear.RAbullet = "Corsair Bullet"
    gear.WSbullet = "Decimating Bullet"
    gear.MAbullet = "Corsair Bullet"
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15
	info = {}
	info.LastSpell = ''

    -- Additional local binds
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind !F11 gs c toggle LuzafRing')
	send_command('bind ^] gs c cycle RangedMode')
	
	send_command('gi ugs true')
	
	DW_needed = 0
	DW = false
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
    
	--send_command('gi update')
	select_default_macro_book()
	
	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	text_box:register_event('reload', initialize)
	
	initialize(text_box)

end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
	
end

-- Define sets and vars used by this job file.
function init_gear_sets()	
		
	Relic_head		={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}}
	Relic_Body		={ name="Lanun Frac", augments={'Enhances "Loaded Deck" effect',}}
	Relic_hands		={ name="Lanun Gants", augments={'Enhances "Fold" effect',}}
	Relic_legs		={ name="Lanun Culottes", augments={'Enhances "Snake Eye" effect',}}
	Relic_feet		={ name="Lanun Bottes", augments={'Enhances "Wild Card" effect',}}
	
	Cor_Cape		={ name="Gunslinger's Cape", augments={'Enmity-1','"Mag.Atk.Bns."+3','"Phantom Roll" ability delay -4',}}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs=Relic_legs}
    sets.precast.JA['Wild Card'] = {feet=Relic_feet}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    
    sets.precast.CorsairRoll = {head=Relic_head,neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands="Chasseur's Gants +1",ring1="Barataria Ring",ring2="Defending Ring",
		back="Camulus's Mantle",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP_Acc}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands=Relic_hands}
    
    sets.precast.CorsairShot = set_combine(sets.precast.RA, {})
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head=Carmine_head,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Carmine_feet}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,
        head="Aurore Beret +1",
        body=Snap_body,hands=Carmine_hands,
        back="Navarch's Mantle",waist="Impulse Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=Herc_head_WS,neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Cor_Cape,waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})

     sets.precast.WS['Requiescat']	= set_combine(sets.precast.WS, {
		head=Carmine_head,neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Carmine_body,hands=Carmine_hands,ring1="Epona's Ring",ring2="Apate Ring",
		back="Bleating Mantle",waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Carmine_feet})
	
	sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS, {
		head=Herc_head_FC,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body=Carmine_body,hands="Meghanada Gloves +1",ring1="Garuda Ring",ring2="Shiva Ring",
        back=Cor_Cape,waist="Eschan Stone",legs=Herc_legs_Nuke,feet=Herc_feet_TP_Acc})

    sets.precast.WS['Wildfire'].Brew = set_combine(sets.precast.WS['Wildfire'], {})
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {head="Pixie Hairpin +1"})
	
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
		head=Pursuer_head,neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body,hands="Meghanada Gloves +1",ring1="Petrov Ring",ring2="Apate Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})
	
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body,hands="Meghanada Gloves +1",ring1="Hajduk Ring",ring2="Paqichikaji Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head=Carmine_head,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Carmine_feet}

    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head=Carmine_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body=Samnuha_Coat,hands=Leyline_Gloves,ring1="Garuda Ring",ring2="Shiva Ring",
        back=Cor_Cape,waist="Eschan Stone",legs=Herc_legs_Nuke,feet="Chasseur's Bottes +1"}

    sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {})

    sets.midcast.CorsairShot['Light Shot'] = set_combine(sets.midcast.CorsairShot, {})

    sets.midcast.CorsairShot['Dark Shot'] = set_combine(sets.midcast.CorsairShot, {head="Pixie Hairpin +1"})


    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head=Pursuer_head,neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body,hands=Adhemar_hands,ring1="Petrov Ring",ring2="Apate Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"}

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body,hands="Meghanada Gloves +1",ring1="Hajduk Ring",ring2="Paqichikaji Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = sets.idle
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body=Samnuha_Coat,hands="Umuthi Gloves",ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_TP_Acc}

    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Fugacity Beret +1",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP_Acc}

    sets.idle.Town = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body=Samnuha_Coat,hands="Umuthi Gloves",ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs,feet=Herc_feet_TP_Acc}
		
	sets.idle.Weak = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body=Samnuha_Coat,hands="Umuthi Gloves",ring1="Sheltered Ring",ring2="Paguroidea ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_TP_Acc}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Fugacity Beret +1",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP_Acc}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Fugacity Beret +1",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Merman's Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP_Acc}
    

    sets.Kiting = {legs=Carmine_legs}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	 sets.engaged = {ammo=gear.RAbullet,
        head=Adhemar_head,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
	
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head=Adhemar_head,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
    
    sets.engaged.Acc = set_combine(sets.engaged.Melee, {neck="Sanctity Necklace",
		head=Carmine_head,ring1="Ramuh Ring",ring2="Apate Ring",
		back="Meanagh Cape +1",waist="Grunfeld Rope",feet=Herc_feet_TP_Acc})

    -- sets.engaged.Melee.DW = set_combine(sets.engaged.Melee, {})
    
    -- sets.engaged.Acc.DW = set_combine(sets.engaged.Melee, {neck="Sanctity Necklace",
		-- ring1="Ramuh Ring",ring2="Apate Ring",
		-- back="Meanagh Cape +1",waist="Grunfeld Rope",feet=Herc_feet_TP_Acc})


    sets.engaged.Ranged = set_combine(sets.engaged, {ammo=gear.RAbullet,
		head="Fugacity Beret +1",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP_Acc})
		
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if not midaction() then
		-- Check that proper ammo is available if we're using ranged attacks or similar.
		if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
			do_bullet_checks(spell, spellMap, eventArgs)
		end

		-- gear sets
		if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
			equip(sets.precast.LuzafRing)
		elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
			classes.CustomClass = 'Acc'
		elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
			if sets.precast.FoldDoubleBust then
				equip(sets.precast.FoldDoubleBust)
				eventArgs.handled = true
			end
		end
		if buffactive[spell.name] and buffactive['Double-up Chance'] and spell.name == info.LastSpell then
			eventArgs.cancel = true
			send_command('@input /ja "Double-Up" <me>')
			return
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' and state.Buff["Triple Shot"] then
		equip(sets.buff['Triple Shot'])
	end
end



-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
        display_roll_info(spell)
		info.LastSpell = spell.name
    end
	if state.Buff[spell.name] == false and not spell.interrupted then
		state.Buff[spell.name] = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
	update_combat_form()
	check_moving()
	update()
end

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
    
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	
	if state.RangedMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.RangedMode.value == 'Acc' then
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
end

function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
	-- if not midaction() then
		-- handle_equipping_gear(player.status)
	-- end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	lockouts()

    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
		if state.Auto_Kite.value == true then
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	lockouts()
	
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			meleeSet = set_combine(meleeSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
	end
    return meleeSet
end

function customize_defense_set(defenseSet)

	lockouts()
	
	if state.Buff.doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
    
    return defenseSet
end

function lockouts()

	if Tele_Ring:contains(player.equipment.ring1) and unlock_em == false then
		if Ring_slot_locked_1 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_1 = true
		disable('ring1')
	end
	if Tele_Ring:contains(player.equipment.ring2) and unlock_em == false then
		if Ring_slot_locked_2 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_2 = true
		disable('ring2')
	end
	
	if (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then
		enable('ring1')
		enable('ring2')
	elseif not (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then 
		unlock_em = false
		Ring_slot_locked_1 = false
		Ring_slot_locked_2 = false
		add_to_chat(200,('[Zoned: '):color(Notification_color) .. ('-> Un-locking Tele/Warp Rings '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring1) and Ring_slot_locked_1 and unlock_em == false then 
		Ring_slot_locked_1 = false
		enable('ring1')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring2) and Ring_slot_locked_2 and unlock_em == false then 
		Ring_slot_locked_2 = false
		enable('ring2')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot '):color(text_color) .. (']'):color(Notification_color) )
	end
	--------------------------------
	-- Ring locks for exp ring use
	
	if Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		disable('ring1')
	elseif not Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		enable('ring1')
	end
	
	if Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		disable('ring2')
	elseif not Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		enable('ring2')
	end
	
	---------------------------------
	-- earring locks
	
	if Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	elseif not Ear_lock:contains(player.equipment.ear1) then
		enable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	elseif not Ear_lock:contains(player.equipment.ear2) then
		enable('Ear2')
	end
	
end

function reset_rings()
	if Ring_slot_locked_1 or Ring_slot_locked_2 then
		unlock_em = true
	end
end

windower.raw_register_event('zone change',reset_rings)

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	handle_equipping_gear(player.status)
end

function check_moving()
	if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
		if state.Auto_Kite.value == false and moving then
			state.Auto_Kite:set(true)
		elseif state.Auto_Kite.value == true and moving == false then
			state.Auto_Kite:set(false)
		end
	end
end

function update_combat_form()
	if DW == true then
		state.CombatForm:set('DW')
	elseif DW == false then
		state.CombatForm:reset()
	end
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	
    local msg = ('   [Melee'):color(Notification_color)
    
    if state.CombatForm.has_value then
        msg = msg .. (' (' .. state.CombatForm.value .. ')'):color(text_color)
    end
    
	if #classes.CustomMeleeGroups > 0 then
        for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then
					msg = msg .. (' ('):color(Notification_color)
				end
				msg = msg .. (classes.CustomMeleeGroups[i]):color(Notification_color)
				if i < #classes.CustomMeleeGroups then
					msg = msg .. (' + '):color(Notification_color)
				end
				if i == #classes.CustomMeleeGroups then
					msg = msg .. (')'):color(Notification_color)
				end
			end
        end
    end
	
    msg = msg .. (': '):color(Notification_color)
    
   if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end
	
    if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
	
	msg = msg .. (' [Ranged: '):color(Notification_color) .. (state.RangedMode.value):color(text_color) .. ('] '):color(Notification_color)
	
    msg = msg .. (' [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. '\n'
	
	msg = msg .. (' [Roll Size: '):color(Notification_color) .. ((state.LuzafRing.value and 'Large') or 'Small'):color(text_color) .. ('] '):color(Notification_color)
	
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.CP.value == true then
        msg = msg .. ('[CP Cape'):color(Notification_color) .. ('] '):color(Notification_color)
    end    

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ('[Target PC: '):color(Notification_color)..state.PCTargetMode.value .. ('] '):color(Notification_color)
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ('[Target NPCs'):color(Notification_color).. ('] '):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n ')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)
	eventArgs.handled = true
	save_settings()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=4, unlucky=7, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies' Roll"]     = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		["Runeist's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Evasion"},
		["Naturalist's Roll"]= {lucky=3, unlucky=7, bonus="Enhancing Magic Effect Duration"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(122, spell.english:color(Notification_color) .. (' provides a bonus to '):color(text_color) .. rollinfo.bonus:color(Notification_color) .. ('.  Roll size: '):color(text_color) .. rollsize:color(Notification_color))
        add_to_chat(122, ('Lucky roll is '):color(text_color) .. (tostring(rollinfo.lucky)):color(warning_text) .. (', Unlucky roll is '):color(text_color) .. (tostring(rollinfo.unlucky)):color(warning_text) .. ('.'):color(text_color))
    end
end


-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
    local bullet_name
    local bullet_min_count = 1
    
    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if spell.element == 'None' then
                -- physical weaponskills
                bullet_name = gear.WSbullet
            else
                -- magical weaponskills
                bullet_name = gear.MAbullet
            end
        else
            -- Ignore non-ranged weaponskills
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.RAbullet
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end
    
    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    
    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, ('No Quick Draw ammo left.'):color(warning_text) .. ('  Using what\'s currently equipped '):color(text_color) .. (player.equipment.ammo):color(Notification_color)..'.')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
            add_to_chat(104, ('No weaponskill ammo left.'):color(warning_text) ..  ('Using what\'s currently equipped (standard ranged bullets: '):color(text_color) ..(player.equipment.ammo):color(Notification_color) .. (').'):color(text_color))
            return
        else
            add_to_chat(warning_text, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end
    
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
        add_to_chat(104, ('No ammo will be left for'):color(warning_text) ..  ('Quick Draw'):color(Notification_color) .. ('.  Cancelling.'):color(warning_text) )
        eventArgs.cancel = true
        return
    end
    
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and state.warned.value == false
        and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
        local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end
        
        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_bullets.count > options.ammo_warning_limit and state.warned then
        state.warned:reset()
    end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.LuzafRing then
        properties:append('${LuzafRing}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.RangedMode then
        properties:append('${RangedMode}')
    end
	if state.Kiting then
        properties:append('${Kiting}')
    end
	if state.CP then
        properties:append('${CP}')
    end
	if state.DefenseMode then
        properties:append('${DefenseMode}')
    end
	properties:append('${is_Moving}')
    text:clear()
    text:append(properties:concat(''))
	update()
end

function update()
	
	local white = '\\cs(220,220,220)'
	local blue = '\\cs(150,150,235)'
	local red = '\\cs(255,0,0)'
	local orange = '\\cs(232,138,13)'
	local yellow = '\\cs(220,220,0)'
	local green = '\\cs(0,225,0)'
	local purple = '\\cs(213,43,196)'
	
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
		text_box:hide()
		return
	end

	local inform = {}
	local msg = ' [Melee'
	
	if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
	
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg .. ')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value == 'None' then
		msg = blue .. msg .. white .. state.OffenseMode.value .. blue .. '] '
	else
		msg = msg .. state.OffenseMode.value .. '] LOCKED '
	end


	if state.DefenseMode.value ~= 'None' then 
		inform.OffenseMode = (red .. (msg)) .. '\\cr'
	else
		inform.OffenseMode = (green .. (msg)) .. '\\cr'
	end
			
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	inform.LuzafRing = (purple .. ('\n [Roll Size: '..white ..  ((state.LuzafRing.value and 'Large') or 'Small'):lpad(' ', 2) .. purple ..'] ' )) .. '\\cr'
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '.. white .. state.IdleMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
		inform.RangedMode = (blue .. ('\n [Ranged: '..white .. state.RangedMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		inform.RangedMode = (red .. ('\n [Ranged: '..state.RangedMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	end
		
	if state.DefenseMode.value == 'None' then
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (orange .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (orange .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	else
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (red .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (red .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	end		
	if state.DefenseMode.value ~= 'None' then
		inform.DefenseMode = (red .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. white ..' (' ..state[state.DefenseMode.value .. 'DefenseMode'].value ..')'..red..']' )) .. '\\cr'
	else
		inform.DefenseMode = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		if moving == true then
			inform.is_Moving = (yellow .. ('\n [Moving]' )) .. '\\cr'
		else
			inform.is_Moving = ('')
		end
	end
	
	if not table.equals(old_inform, inform) then
		text_box:update(inform)
		text_box:show()
		old_inform = inform
	end
end

windower.raw_register_event('unload', function()
	text_box:destroy()
	text_box = nil
	
	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')
	
	send_command('unbind f7')
	send_command('unbind ^f7')
	send_command('unbind !f7')
	send_command('unbind @f7')
	
	send_command('unbind f8')
	send_command('unbind ^f8')
	send_command('unbind !f8')
	send_command('unbind @f8')
	
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind @f10')
	
	send_command('unbind f11')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind @f11')
	
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')
	send_command('unbind @f12')
end)

windower.register_event('job change',function()
    send_command('gs r')
end)

function select_default_macro_book()
end