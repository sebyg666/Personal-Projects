

function init_gear_sets()

	print('Ewellina_COR_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	Compensator		={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}}
	
	
	
	Adhemar_head_Att	={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}
    Adhemar_body_Att	={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}}
	Adhemar_hands_Att	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
	Adhemar_head_Acc	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body_Acc	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands_Acc	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_legs		={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}}
	
    Herc_hands_DT	={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','Damage taken-3%','AGI+9','Accuracy+1','Attack+10',}}
    Herc_legs_DT	={ name="Kaabnax Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}}
	
	Rawhide_body	={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands	={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs	={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
	
    Lengo_Pants		={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	Dampening_Tam	={ name="Dampening Tam", augments={'DEX+5','Accuracy+8','Mag. Acc.+8',}}
	Samnuha_Coat	={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
	Samnuha_Tights	={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}}
	Leyline_Gloves	={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	Mediums_Sabots	={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	Floral_Gauntlets={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}}	
	
	Carmine_head	={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}}
	Carmine_body	={ name="Carm. Scale Mail", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_hands	={ name="Carmine Fin. Ga.", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs	={ name="Carmine Cuisses", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_feet	={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}}
	
	Carmine_head_HQ	={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	Carmine_legs_HQ	={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_feet_HQ	={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	
	Herc_body_TA	={ name="Herculean Vest", augments={'Accuracy+30','"Triple Atk."+4','INT+1',}}
	Herc_legs_TA	={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','AGI+7','Accuracy+14',}}
    Herc_feet_ACC	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
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
	
	Snap_body		={ name="Skopos Jerkin", augments={'"Snapshot"+3','Attack+1','"Store TP"+2',}}
	
	Pursuer_head	={ name="Pursuer's Beret", augments={'Rng.Atk.+15','Enmity-6','"Subtle Blow"+7',}}
    Pursuer_hands	={ name="Pursuer's Cuffs", augments={'Rng.Atk.+15','STR+7','Phys. dmg. taken -4',}}
    Pursuer_legs	={ name="Pursuer's Pants", augments={'DEX+7','AGI+9','"Recycle"+14',}}
	
	Relic_head		={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}}
	Relic_Body		={ name="Lanun Frac", augments={'Enhances "Loaded Deck" effect',}}
	Relic_hands		={ name="Lanun Gants", augments={'Enhances "Fold" effect',}}
	Relic_legs		={ name="Lanun Culottes", augments={'Enhances "Snake Eye" effect',}}
	Relic_feet		={ name="Lanun Bottes", augments={'Enhances "Wild Card" effect',}}
	
	Cor_Cape		={ name="Gunslinger's Cape", augments={'Enmity-1','"Mag.Atk.Bns."+3','"Phantom Roll" ability delay -4',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {main="Rhadamanthus",sub="Surcouf's Jambiya",ranged=Compensator,ring1="Emperor Band"}
	sets.Org.two = {main="Arasy Knife",body=Relic_Body}
	
	organizer_items = {

	RAbullet = "Corsair Bullet",
    WSbullet = "Decimating Bullet",
    MAbullet = "Corsair Bullet",
    QDbullet = "Animikii Bullet",
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	gear.default.obi_waist = "Eschan Stone"
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +1",back="Camulus's Mantle"}
    sets.precast.JA['Snake Eye'] = {legs=Relic_legs}
    sets.precast.JA['Wild Card'] = {feet=Relic_feet}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    
    sets.precast.CorsairRoll = {head=Relic_head,neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands="Chasseur's Gants +1",ring1="Barataria Ring",ring2="Defending Ring",
		back="Camulus's Mantle",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_ACC}
    
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
		head=Carmine_head_HQ,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Carmine_feet_HQ}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,
        head="Aurore Beret +1",
        body=Snap_body,hands=Carmine_hands,
        back="Navarch's Mantle",waist="Impulse Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=Herc_head_WSD,neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Cor_Cape,waist=gear.ElementalBelt,legs=Herc_legs_WSD,feet=Herc_feet_WSD}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})

     sets.precast.WS['Requiescat']	= set_combine(sets.precast.WS, {
		head=Carmine_head_HQ,neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Carmine_body,hands=Carmine_hands,ring1="Epona's Ring",ring2="Apate Ring",
		back="Bleating Mantle",waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Carmine_feet_HQ})
	
	sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS, {
		head=Herc_head_FC,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body=Carmine_body,hands="Meghanada Gloves +1",ring1="Garuda Ring",ring2="Shiva Ring",
        back=Cor_Cape,waist=gear.ElementalObi,legs=Herc_legs_Nuke,feet=Herc_feet_ACC})

    sets.precast.WS['Wildfire'].Brew = set_combine(sets.precast.WS['Wildfire'], {})
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {head="Pixie Hairpin +1"})
	
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
		head=Pursuer_head,neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body_Att,hands="Meghanada Gloves +1",ring1="Petrov Ring",ring2="Apate Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})
	
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body_Att,hands="Meghanada Gloves +1",ring1="Hajduk Ring",ring2="Paqichikaji Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head=Carmine_head_HQ,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Carmine_feet_HQ}

    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head=Carmine_head_HQ,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body=Samnuha_Coat,hands=Leyline_Gloves,ring1="Garuda Ring",ring2="Shiva Ring",
        back=Cor_Cape,waist=gear.ElementalObi,legs=Herc_legs_Nuke,feet="Chasseur's Bottes +1"}

    sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {})

    sets.midcast.CorsairShot['Light Shot'] = set_combine(sets.midcast.CorsairShot, {})

    sets.midcast.CorsairShot['Dark Shot'] = set_combine(sets.midcast.CorsairShot, {head="Pixie Hairpin +1"})


    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head=Pursuer_head,neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body=Adhemar_body_Att,hands=Adhemar_hands_Att,ring1="Petrov Ring",ring2="Apate Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"}

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +1",neck="Ej Necklace",ear1="Enervating Earring",ear2="Volley Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Hajduk Ring",ring2="Paqichikaji Ring",
        back=Cor_Cape,waist="Yemaya Belt",legs=Adhemar_legs,feet="Meghanada Jambeaux +1"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = sets.idle
    

    -- Idle sets
	 sets.idle = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_Refr,ring1="Sheltered Ring",ring2="Chirich Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_Refr}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_Refr,ring1="Sheltered Ring",ring2="Chirich Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}

    sets.idle.PDT = {ammo=gear.RAbullet,
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_ACC}

    -- sets.idle.Town = {ammo=gear.RAbullet,
        -- head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		-- body=Samnuha_Coat,hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		-- back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_ACC}
		
	sets.idle.Weak = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body=Samnuha_Coat,hands=Herc_hands_DT,ring1="Sheltered Ring",ring2="Chirich Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_ACC}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Meghanada Cuirie +1",hands=Herc_hands_DT,WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_ACC}
    

    sets.Kiting = {legs=Carmine_legs_HQ}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	 sets.engaged = {ammo=gear.RAbullet,
        head=Adhemar_head_Acc,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_ACC}
		
	sets.engaged.DW = {ammo=gear.RAbullet,
        head=Adhemar_head_Acc,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_ACC}
	
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head=Adhemar_head_Acc,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_ACC}
    
    sets.engaged.Acc = set_combine(sets.engaged.Melee, {neck="Sanctity Necklace",
		head=Carmine_head_HQ,ring1="Ramuh Ring",ring2="Apate Ring",
		back="Meanagh Cape +1",waist="Grunfeld Rope",feet=Herc_feet_ACC})

    sets.engaged.DW.Melee = set_combine(sets.engaged.Melee, {ear2="Suppanomimi",hands=Floral_Gauntlets})
    
    sets.engaged.DW.Acc = set_combine(sets.engaged.DW.Melee, {head=Carmine_head_HQ,neck="Sanctity Necklace",})


    sets.engaged.Ranged = set_combine(sets.engaged, {ammo=gear.RAbullet,
		head=Herc_head_DT,neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Genmei Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_ACC})
		
	sets.buff['Triple Shot'] = {body="Navarch's Frac +1",back="Camulus's Mantle"}	
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 19)
	
    send_command('bind @` input /ja "Bolter\'s Roll" <me>')
	
	send_command('bind F8 input /ws "Leaden Salute" <t>')
	send_command('bind ^F8 input /ws "Last Stand" <t>')
	
	if player.sub_job:upper() == 'DNC' then		
		send_command('bind ^` input /ja "spectral jig" <me>')
		send_command('bind !` input /ja "Reverse Flourish" <me>')
		
		send_command('bind @F7 input /ja "Box step" <stnpc>')
		send_command('bind ^F7 input /ja "Quick step" <stnpc>')
		
		send_command('bind F9 input /ja "Violent flourish" <stnpc>')
		send_command('bind ^F9 input /ja "Animated flourish" <stnpc>')
		send_command('bind @F9 input /ja "Haste Samba" <me>')
		
		send_command('bind @F10 input /ja "Divine Waltz" <me>')
		send_command('bind F10 input /ja "Healing Waltz" <me>')
		send_command('bind F11 input /ja "Curing Waltz III" <stal>')
		
		--send_command('bind ^` input /ja "Spectral jig" <me>')
	elseif player.sub_job:upper() == 'RDM' then		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind ^F7 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind ^F9 input /ma "Flurry" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
	end
end