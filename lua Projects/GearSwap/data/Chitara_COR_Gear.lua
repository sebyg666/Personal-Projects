

function init_gear_sets()

	
	print('Chitara_COR_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	
	Leyline_Gloves		={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}}
	Samnuha_Coat		={ name="Samnuha Coat", augments={'Mag. Acc.+1',}}
	Floral_Gauntlets	={ name="Floral Gauntlets", augments={'Rng.Acc.+14','Accuracy+13','"Triple Atk."+2','Magic dmg. taken -3%',}}
	Samnuha_Tights		={ name="Samnuha Tights", augments={'STR+4','DEX+7','"Triple Atk."+2',}}
    
	Herc_body_TP_TA		={ name="Herculean Vest", augments={'Accuracy+25','"Triple Atk."+3','Attack+12',}}
	Herc_legs_TP_Acc	={ name="Herculean Trousers", augments={'Accuracy+18 Attack+18','"Counter"+2','STR+9',}}
	Herc_legs_TP_TA		={ name="Herculean Trousers", augments={'Accuracy+8','"Triple Atk."+4',}}
    Herc_feet_TP_Acc	={ name="Herculean Boots", augments={'Accuracy+30','Crit.hit rate+3','STR+6',}}
	Herc_feet_TP_TA		={ name="Herculean Boots", augments={'Accuracy+12','"Triple Atk."+4','STR+10',}}
	
	Herc_head_MAB_WS	={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Mag. Acc.+15','"Mag.Atk.Bns."+14',}}
	Herc_body_MAB_WS	={ name="Herculean Vest", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +3%','MND+4','Mag. Acc.+13',}}
	Herc_hands_MAB_WS	={ name="Herculean Gloves", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Dbl.Atk."+1','STR+1','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}
	Herc_legs_MAB_WS	={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +1%','MND+6','Mag. Acc.+3','"Mag.Atk.Bns."+13',}}
	Herc_feet_MAB_WS	={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +5%','STR+2','Mag. Acc.+4',}}
	
	Herc_legs_WS		={ name="Herculean Trousers", augments={'Attack+28','Weapon skill damage +4%','DEX+6','Accuracy+11',}}
	
	Adhemar_head		={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body		={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands		={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_feet		={ name="Adhemar Gamashes", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}}
	
	Carmine_head		={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}}
	Carmine_hands		={ name="Carmine Fin. Ga.", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs		={ name="Carmine Cuisses", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_feet		={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}}
	
	Pursuer_body		={ name="Pursuer's Doublet", augments={'HP+50','Crit. hit rate+4%','"Snapshot"+6',}}
	
	Relic_head			={ name="Lanun Tricorne +1", augments={'Enhances "Winning Streak" effect',}}
	Relic_Body			={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}}
	Relic_hands			={ name="Lanun Gants +1", augments={'Enhances "Fold" effect',}}
	Relic_legs			={ name="Lanun Culottes +1", augments={'Enhances "Snake Eye" effect',}}
	Relic_feet			={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}}
	
	Melee_TP_back		={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	Ranged_TP_back		={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	Melee_WS_back		={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	RA_WS_back			={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	FC_back				={ name="Camulus's Mantle", augments={'"Fast Cast"+10',}}
	Gunslinger_back		={ name="Gunslinger's Cape", augments={'Enmity-3','"Mag.Atk.Bns."+3','"Phantom Roll" ability delay -3','Weapon skill damage +3%',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	
	organizer_items = {

	RAbullet = "Corsair Bullet",
    MAbullet = "Corsair Bullet",
    QDbullet = "Animikii Bullet",
	Luring = "Luzaf's Ring"
	}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	gear.default.obi_waist = "Eschan Stone"
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1",back=Melee_TP_back}
    sets.precast.JA['Snake Eye'] = {legs=Relic_legs}
    sets.precast.JA['Wild Card'] = {feet=Relic_feet}
    sets.precast.JA['Random Deal'] = {body=Relic_Body}
    
    sets.precast.CorsairRoll = {head=Relic_head,neck="Loricate Torque +1",
		body="Meghanada Cuirie +1",hands="Chasseur's Gants +1",ring1={name="Barataria Ring",priority=1},ring2="Defending Ring",
		back=Melee_TP_back,waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
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
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		back=FC_back,legs=Rawhide_legs,feet=Carmine_feet}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,body=Pursuer_body,hands=Carmine_hands,ring1="Dingir Ring",
		back="Navarch's Mantle",waist="Impulse Belt",legs=Relic_legs,feet="Meghanada Jambeaux +1"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=Adhemar_head,neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Melee_WS_back,waist=gear.ElementalBelt,legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1",neck="Caro Necklace",ear1="Moonshade Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",
		back=Melee_WS_back,waist="Grunfeld Rope"})
	
    sets.precast.WS['Requiescat']	= set_combine(sets.precast.WS, {
		head=Carmine_head,neck="Caro Necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body="Foppish Tunica",hands=Carmine_hands,ring1="Epona's Ring",ring2="Ilabrat Ring",
		back=Melee_WS_back,waist="Fotia Belt",legs=Carmine_legs,feet=Carmine_feet})
	
	sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS, {
		head=Herc_head_MAB_WS,neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body=Herc_body_MAB_WS,hands=Herc_hands_MAB_WS,ring1="Dingir Ring",ring2="Arvina Ringlet +1",
        back=RA_WS_back,waist=gear.ElementalObi,legs=Herc_legs_MAB_WS,feet=Herc_feet_MAB_WS})

    sets.precast.WS['Wildfire'].Brew = set_combine(sets.precast.WS['Wildfire'], {})
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {head="Pixie Hairpin +1",ear1="Moonshade Earring"})
	
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Garuda Ring",ring2="Ilabrat Ring",
        back=RA_WS_back,waist="Fotia Belt",legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"})
	
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Neritic Earring",ear2="Volley Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Paqichikaji Ring",ring2="Ilabrat Ring",
        back=RA_WS_back,waist="Fotia Belt",legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"})
    
	sets.precast.WS['Aeolian Edge'] = sets.precast.WS['Wildfire']
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		}

    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head=Herc_head_MAB_WS,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body=Samnuha_Coat,hands=Leyline_Gloves,ring1="Dingir Ring",ring2="Arvina Ringlet +1",
        back=Melee_TP_back,waist=gear.ElementalObi,legs=Herc_legs_MAB_WS,feet="Chasseur's Bottes +1"}

    sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {
		head="Mummu Bonnet +1",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
		body="Mummu Jacket +1",hands="Mummu Wrists +1",
		back=Gunslinger_back,legs="Mummu Kecks +1",feet="Mummu Gamashes +1"})

    sets.midcast.CorsairShot['Light Shot'] 		= set_combine(sets.midcast.CorsairShot, {})
	sets.midcast.CorsairShot['Light Shot'].Acc 	= set_combine(sets.midcast.CorsairShot.Acc, {})
    sets.midcast.CorsairShot['Dark Shot'] 		= set_combine(sets.midcast.CorsairShot, {head="Pixie Hairpin +1"})
	sets.midcast.CorsairShot['Dark Shot'].Acc	= set_combine(sets.midcast.CorsairShot.Acc, {head="Pixie Hairpin +1"})


    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Neritic Earring",ear2="Volley Earring",
		body=Pursuer_body,hands=Adhemar_hands,ring1="Dingir Ring",ring2="Ilabrat Ring",
		back=Ranged_TP_back,waist="Reiki Yotai",legs=Samnuha_Tights,feet="Meghanada Jambeaux +1"}

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",
		legs="Meghanada Chausses +1",ring1="Paqichikaji Ring",ring2="Arewe Ring",})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = sets.idle
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs,feet=Herc_feet_TP_Acc}

    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}
		
	sets.idle.Weak = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}
    
	sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs,feet=Herc_feet_TP_Acc}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}

    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}
    

    sets.Kiting = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	 sets.engaged = {ammo=gear.RAbullet,
        head=Adhemar_head,neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back=Melee_TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
	
	sets.engaged.DW = {ammo=gear.RAbullet,
        head=Adhemar_head,neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back=Melee_TP_back,waist="Reiki Yotai",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
	
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head=Adhemar_head,neck="Asperity Necklace",ear1="Brutal Earring",ear2="Mache Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back=Melee_TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
    
    sets.engaged.Acc = set_combine(sets.engaged.Melee, {head=Carmine_head,neck="Sanctity Necklace",})

    sets.engaged.DW.Melee = set_combine(sets.engaged.Melee, {ear2="Suppanomimi",hands=Floral_Gauntlets})
    
    sets.engaged.DW.Acc = set_combine(sets.engaged.DW.Melee, {head=Carmine_head,neck="Sanctity Necklace",ear1="Mache Earring",legs="Meghanada Chausses +1"})


    sets.engaged.Ranged = set_combine(sets.engaged, {})
	
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +1",back=Melee_TP_back}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Arciela's Grace +1"}
	sets.CP = {back="Mecistopins Mantle"}
	sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
	
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 19)
	
    send_command('bind @` input /ja "Bolter\'s Roll" <me>')
	
	send_command('bind F8 input /ws "Leaden Salute" <t>')
	send_command('bind ^F8 input /ws "Last Stand" <t>')
	send_command('bind @F8 input /ws "Wildfire" <t>')
	
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
	
	elseif player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "Regen II" <stal>')
		send_command('bind F9 input /ma "Erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'SCH' then	
	
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		-- send_command('bind F7 input /ma "Haste" <stal>')
		-- send_command('bind ^F7 input /ma "Refresh" <stal>')
		-- send_command('bind F9 input /ma "Phalanx" <me>')
		-- send_command('bind ^F9 input /ma "Flurry" <me>')
		send_command('bind F10 input /ma "cure II" <stal>')
		send_command('bind F11 input /ma "cure III" <stal>')
	end
end