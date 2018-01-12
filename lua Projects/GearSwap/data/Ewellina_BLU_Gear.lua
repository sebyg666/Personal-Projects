
function init_gear_sets()
	
	print('Ewellina_BLU_Gear side_cart loaded')	
	
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
	
    Psycloth_legs	={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Amalric_head	={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}}
	Amalric_body	={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_hands	={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs	={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_feet	={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}}
	
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
	Mediums_Sabots	={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	
	Herc_body_TA	={ name="Herculean Vest", augments={'Accuracy+30','"Triple Atk."+4','INT+1',}}
    Herc_legs_TA	={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','AGI+7','Accuracy+14',}}
    Herc_feet_STP	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
	Herc_feet_TA	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','AGI+4','Attack+2',}}
	
	Herc_legs_DW	={ name="Herculean Trousers", augments={'Accuracy+25','"Dual Wield"+4','STR+10','Attack+14',}}
	Taeon_feet_DW	={ name="Taeon Boots", augments={'Attack+10','"Dual Wield"+3','STR+3 AGI+3',}}
	
	Herc_head_WSD		={ name="Herculean Helm", augments={'Accuracy+3 Attack+3','Weapon skill damage +4%','STR+4',}}
	Herc_body_WSD_Dex	={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','DEX+6','Attack+15',}}
	Herc_body_WSD		={ name="Herculean Vest", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Attack+14',}}
	Herc_hands_WSD		={ name="Herculean Gloves", augments={'Attack+5','Weapon skill damage +5%','Accuracy+4',}}
    Herc_legs_WSD		={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','AGI+3','Accuracy+6','Attack+4',}}
    Herc_feet_WSD		={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','STR+6','Accuracy+12',}}
	
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
	
	Corn_back		={ name="Cornflower Cape", augments={'MP+20','DEX+3','Accuracy+3','Blue Magic skill +10',}}
	TP_back			={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	WS_back			={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	WSD_back		={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	Nuke_back		={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
    Requiescat_back	={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	FC_back			={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	
	AF_head 		={ name="Assimilator's Keffiyeh" }
	AF_body			={ name="Assimilator's Jubbah +1" }
	AF_hands 		={ name="Assimilator's Bazubands +1" }
	AF_legs 		={ name="Assimilator's Shalwar +1" }
	AF_feet 		={ name="Assimilator's Charuqs +2" }
	
	Relic_head		={ name="Luhlaza Keffiyeh +1", 	augments={'Enhances "Convergence" effect',}}
	Relic_body		={ name="Luhlaza Jubbah +1", 	augments={'Enhances "Enchainment" effect',}}
    Relic_hands		={ name="Luhlaza Bazubands", 	augments={'Enhances "Azure Lore" effect',}}
	Relic_legs		={ name="Luhlaza Shalwar", 		augments={'Enhances "Assimilation" effect',}}
	Relic_feet		={ name="Luhlaza Charuqs +1", 	augments={'Enhances "Diffusion" effect',}}
	
	Empy_head 		={ name="Hashishin Kavuk +1" }
	Empy_body		={ name="Hashishin Mintan" }
	Empy_hands		={ name="Hashishin Bazubands" }
	Empy_legs 		={ name="Hashishin Tayt +1" }
	Empy_feet 		={ name="Hashishin Basmak +1" }
	
	Moonshade_Ear	={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	
	organizer_items = {
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring"
	}
	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------
	gear.default.obi_waist = "Eschan Stone"
	
	gear.TP_Bonus_Ear = Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	

    sets.buff['Burst Affinity'] = {legs=AF_legs,feet=Empy_feet}
    sets.buff['Chain Affinity'] = {head=Empy_head,feet=AF_feet}
    sets.buff.Convergence = {head=Relic_head}
    sets.buff.Diffusion = {feet=Relic_feet}
    sets.buff.Enchainment = {body=Relic_body}
    sets.buff.Efflux = {back=TP_back,legs=Empy_legs}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands=Relic_hands}
	
	sets.precast.JA['Provoke'] = {ammo="Sapience Orb",
		neck="Unmoving Collar +1",ear1="Friomisi Earring",
		body="Emet Harness +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Obatala Subligar"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
			head=Carmine_head_HQ,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Relic_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs=Psycloth_legs,feet=Carmine_feet_HQ}
			
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=Empy_body})
	
	sets.precast.FC['Blue Magic'].Healing = set_combine(sets.precast.FC['Blue Magic'], {ear2="Mendicant's Earring"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Jukukik Feather",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Brutal Earring",
		body=Adhemar_body_Att,hands=Amalric_hands,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=WSD_back,waist="Fotia Belt",legs=Herc_legs_TA,feet=Herc_feet_TA}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']				= set_combine(sets.precast.WS, {
		ammo="Hydrocera",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Brutal Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Epona's Ring",ring2="Rufescent Ring",
		back=Requiescat_back,waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})

    sets.precast.WS['Sanguine Blade'] 				= set_combine(sets.precast.WS, {
	ammo="Ghastly Tathlum",
	head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
	body=Samnuha_Coat,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
	back=Nuke_back,waist="Eschan Stone",legs=Amalric_legs,feet=Amalric_feet})
	sets.precast.WS['Ilvl~118']['Sanguine Blade'] 	= set_combine(sets.precast.WS['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~122']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~118']['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~124+']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~122']['Sanguine Blade'], {})
	
	sets.precast.WS['Chant du Cygne'] 				= set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1=gear.ws_ear,ear2="Brutal Earring",
		body="Abnoba Kaftan",hands=Herc_hands_CritDmg,ring1="Epona's Ring",ring2="Begrudging Ring",
		back=WS_back,waist="Fotia Belt",legs=Herc_legs_CritDmg,feet=Herc_feet_CritDmg})
	sets.precast.WS['Ilvl~118']['Chant du Cygne']	= set_combine(sets.precast.WS['Chant du Cygne'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~118']['Chant du Cygne'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~122']['Chant du Cygne'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	sets.precast.WS['Savage Blade']  				= set_combine(sets.precast.WS, {
		ammo="Cheruski Needle",
		head=Herc_head_WSD,neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=WSD_back,waist="Prosilio Belt +1",legs=Herc_legs_WSD,feet=Herc_feet_WSD})
	sets.precast.WS['Ilvl~118']['Savage Blade']  	= set_combine(sets.precast.WS['Savage Blade'] , 			{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122']['Savage Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Savage Blade'] , {neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+']['Savage Blade']  	= set_combine(sets.precast.WS['Ilvl~122']['Savage Blade'] , {ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	sets.precast.WS['Expiacion']  					= set_combine(sets.precast.WS, {
		ammo="Cheruski Needle",
		head=Herc_head_WSD,neck="Caro Necklace",ear1="Ishvara Earring",ear2=gear.ws_ear,
		body=Herc_body_WSD,hands=Herc_hands_WSD,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=WSD_back,waist="Prosilio Belt +1",legs=Herc_legs_WSD,feet=Herc_feet_WSD})
	sets.precast.WS['Ilvl~118']['Expiacion']  	= set_combine(sets.precast.WS['Expiacion'] , 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122']['Expiacion']	= set_combine(sets.precast.WS['Ilvl~118']['Expiacion'] , 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+']['Expiacion']  	= set_combine(sets.precast.WS['Ilvl~122']['Expiacion'] , 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	sets.precast.WS['Vorpal Blade']  				= set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head=Adhemar_head_Att,neck="Fotia Gorget",ear1=gear.ws_ear,ear2="Brutal Earring",
		body="Abnoba Kaftan",hands=Herc_hands_CritDmg,ring1="Epona's Ring",ring2="Begrudging Ring",
		back=WS_back,waist="Fotia Belt",legs=Herc_legs_CritDmg,feet=Herc_feet_CritDmg})
	sets.precast.WS['Ilvl~118']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Vorpal Blade'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.precast.WS['Ilvl~122']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Vorpal Blade'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.precast.WS['Ilvl~124+']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~122']['Vorpal Blade'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Sapience Orb",
			head=Carmine_head_HQ,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Relic_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs=Rawhide_legs,feet=Carmine_feet_HQ}
			
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {head=Carmine_head_HQ,waist="Olympus Sash",legs=Carmine_legs_HQ})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})
	
	sets.midcast["Flash"] = set_combine(sets.midcast.FastRecast, {
		neck="Warder's Charm +1",ear1="Friomisi Earring",
		body="Emet Harness +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Obatala Subligar"})
        
    sets.midcast['Blue Magic'] = {ammo="Mavi Tathlum",
			head=Carmine_head_HQ,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Relic_body,hands=Empy_hands,ring1="Kishar Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs=Rawhide_legs,feet=Carmine_feet_HQ}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {ammo="Cheruski Needle",
		head=Adhemar_head_Att,neck="Caro Necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body_Att,hands=Adhemar_hands_Att,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Corn_back,waist="Prosilio Belt +1",legs=Herc_legs_TA,feet=Herc_feet_TA}

    sets.midcast['Blue Magic'].PhysicalAcc = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalStr = sets.precast.WS['Savage Blade']

    sets.midcast['Blue Magic'].PhysicalDex = {ammo="Cheruski Needle",
		head=Carmine_head_HQ,neck="Caro Necklace",ear1="Dawn Earring",ear2="Mache Earring",
		body=Adhemar_body_Att,hands=Herc_hands_CritDmg,ring1="Ifrit Ring",ring2="Ramuh Ring",
		back=WS_back,waist="Grunfeld Rope",legs=Carmine_legs_HQ,feet=Herc_feet_TA}

    sets.midcast['Blue Magic'].PhysicalVit = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalAgi = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalInt = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalMnd = sets.precast.WS['Requiescat']

    sets.midcast['Blue Magic'].PhysicalChr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalHP = sets.midcast['Blue Magic'].Physical


    -- Magical Spells --	
	
    sets.midcast['Blue Magic'].Magical = {ammo="Ghastly Tathlum",
        head=Herc_head_Nuke,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Jhakri Robe +1",hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist=gear.ElementalObi,legs=Amalric_legs,feet=Amalric_feet}

    sets.midcast['Blue Magic'].Magical.Resistant = {ammo="Hydrocera",
        head=Amalric_head,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
        body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist=gear.ElementalObi,legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
	
	sets.midcast['Blue Magic']['Tenebral Crush'] 			= {ammo="Ghastly Tathlum",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Jhakri Robe +1",hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist=gear.ElementalObi,legs=Amalric_legs,feet=Amalric_feet}
	sets.midcast['Blue Magic']['Tenebral Crush'].Resistant 	= {ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
        body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Nuke_back,waist=gear.ElementalObi,legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
     
    sets.midcast['Blue Magic'].MagicalMnd					= sets.midcast['Blue Magic'].Magical
	sets.midcast['Blue Magic'].MagicalMnd.Resistant 		= sets.midcast['Blue Magic'].Magical.Resistant
	
    sets.midcast['Blue Magic'].MagicalChr 					= sets.midcast['Blue Magic'].Magical
	sets.midcast['Blue Magic'].MagicalChr.Resistant 		= sets.midcast['Blue Magic'].Magical.Resistant
	
    sets.midcast['Blue Magic'].MagicalVit 					= sets.midcast['Blue Magic'].Magical
	sets.midcast['Blue Magic'].MagicalVit.Resistant 		= sets.midcast['Blue Magic'].Magical.Resistant
	
    sets.midcast['Blue Magic'].MagicalDex 					= sets.midcast['Blue Magic'].Magical
	sets.midcast['Blue Magic'].MagicalDex.Resistant 		= sets.midcast['Blue Magic'].Magical.Resistant
	
    sets.midcast['Blue Magic'].MagicAccuracy 				= {ammo="Hydrocera",
        head=Amalric_head,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
        body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Corn_back,waist=gear.ElementalObi,legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = sets.midcast['Blue Magic'].Magical

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun =  {
		ammo="Falcon Eye",
		head=Carmine_head_HQ,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=Corn_back,waist=gear.ElementalObi,legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    sets.midcast['Blue Magic'].Healing = {
		ammo="Mavi Tathlum",
		head=Carmine_head_HQ,neck="Phalaina Locket",ear1="Loquacious Earring",ear2="Mendicant's Earring",
		body=Relic_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		back="Solemnity Cape",waist="Witful Belt",legs=Carmine_legs_HQ,feet=Mediums_Sabots}
		
	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Mavi Tathlum",
		head=Carmine_head_HQ,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=Relic_body,hands=Leyline_Gloves,ring1="Kishar Ring",ring2="Prolix Ring",
		back=FC_back,waist="Witful Belt",legs=Rawhide_legs,feet=Carmine_feet_HQ}

    sets.midcast['Blue Magic'].SkillBasedBuff = {
		ammo="Mavi Tathlum",
		head=Relic_head,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=AF_body,hands=Rawhide_hands,ring1="Kishar Ring",ring2="Prolix Ring",
		back=Corn_back,waist="Witful Belt",legs=Empy_legs,feet=Relic_feet}

    sets.midcast['Blue Magic'].Buff = {
		ammo="Mavi Tathlum",
		head=Carmine_head_HQ,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=Relic_body,hands=Empy_hands,ring1="Kishar Ring",ring2="Prolix Ring",
		back=Corn_back,waist="Witful Belt",legs=Rawhide_legs,feet=Carmine_feet_HQ}
	
	sets.midcast['Blue Magic']['Battery Charge'] = {
		ammo="Mavi Tathlum",
		head=Amalric_head,neck="Incanter's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body=Relic_body,hands=Empy_hands,ring1="Kishar Ring",ring2="Prolix Ring",
		back=FC_back,waist="Witful Belt",legs=Rawhide_legs,feet=Carmine_feet_HQ}
	
	sets.midcast['Blue Magic']['Tourbillion'] = {
		ammo="Hydrocera",
        head=Carmine_head_HQ,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchanter Earring +1",
        body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Corn_back,waist=gear.ElementalObi,legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
	    
    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = {ring2="Sheltered Ring"}
    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = {ring2="Sheltered Ring"}
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_Refr}
	
	sets.idle.Refresh = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
	
	-- sets.idle.Town = {ammo="Staunch Tathlum",
        -- head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		-- body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		-- back="Kumbira Cape",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_Refr}
	
    sets.idle.PDT = {ammo="Staunch Tathlum",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vertigo Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Carmine_legs_HQ,feet=Herc_feet_TA}
		
	sets.idle.Weak = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,ring1="Vertigo Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands=Herc_hands_DT,WS,ring1="Warden's Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_DT}

    sets.defense.MDT = {ammo="Vanir Battery",
        head=Amalric_head,neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body=Amalric_body,hands=Amalric_hands,ring1="Purity Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Lieutenant's Sash",legs=Amalric_legs,feet=Amalric_feet}
	
	sets.defense.MDTNoShell = {ammo="Vanir Battery",
        head=Herc_head_DT,neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body=Amalric_body,hands=Herc_hands_DT,ring1="Purity Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Lieutenant's Sash",legs=Herc_legs_DT,feet=Herc_feet_DT}

    sets.Kiting = {legs=Carmine_legs_HQ}

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
	sets.engaged 					= {ammo="Ginsen",
										head=Adhemar_head_Acc,neck="Asperity Necklace",ear1="Dedition Earring",ear2="Cessance Earring",
										body=Herc_body_TA,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Petrov Ring",
										back=TP_back,waist="Windbuffet Belt +1",legs=Herc_legs_TA,feet=Herc_feet_TA}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	sets.engaged.DW 					= {ammo="Ginsen",
										head=Adhemar_head_Acc,neck="Asperity Necklace",ear1="Eabani Earring",ear2="Suppanomimi",
										body=Adhemar_body_Acc,hands=Adhemar_hands_Acc,ring1="Epona's Ring",ring2="Hetairoi Ring",
										back=TP_back,waist="Reiki Yotai",legs=Herc_legs_DW,feet=Taeon_feet_DW}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	------------------------------------------------------------------	

	sets.engaged.DW['DW: 37+'] 					= set_combine(sets.engaged.DW, 							{})
	sets.engaged.DW['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged.DW['DW: 37+'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 37+'], 	{neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged.DW['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 37+'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~36% DW)-             
	--------------------------------------------            
	
	sets.engaged.DW['DW: 22-36'] 				= set_combine(sets.engaged.DW['DW: 37+'], 				{neck="Ainia Collar",ear1="Dedition Earring",})
	sets.engaged.DW['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged.DW['DW: 22-36'], 			{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 22-36'], {neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged.DW['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 22-36'], {ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste (~21% DW)-              
	--------------------------------------------            
	
	sets.engaged.DW['DW: 12-21']				= set_combine(sets.engaged.DW['DW: 22-36'], 			{neck="Asperity Necklace",legs=Samnuha_Tights,feet=Herc_feet_TA})
	sets.engaged.DW['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged.DW['DW: 12-21'], 			{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 12-21'], {neck="Sanctity Necklace",ear1="Mache Earring"})
	sets.engaged.DW['Ilvl~124+']['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 12-21'], {ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (5-11% DW)               
	---------------------------------------------           
	
	sets.engaged.DW['DW: 6-11'] 				= set_combine(sets.engaged.DW['DW: 12-21'], 			{ear2="Eabani Earring",neck="Ainia Collar",body=Herc_body_TA})
	sets.engaged.DW['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged.DW['DW: 6-11'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 6-11'],	{neck="Sanctity Necklace",ear1="Mache Earring",ring1="Chirich Ring",ring2="Petrov Ring"})
	sets.engaged.DW['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 6-11'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",ring1="Ramuh Ring",ring2="Ramuh Ring",legs=Carmine_legs_HQ})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (0% DW)            
	-----------------------------------------           

	sets.engaged.DW['DW: 5-0'] 					= set_combine(sets.engaged.DW['DW: 6-11'],				{ear1="Dedition Earring",ear2="Cessance Earring",waist="Windbuffet Belt +1"})
	sets.engaged.DW['Ilvl~118']['DW: 5-0'] 		= set_combine(sets.engaged.DW['DW: 5-0'], 				{head=Carmine_head_HQ,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 5-0'], 	{neck="Sanctity Necklace",ear1="Mache Earring",body=Adhemar_body_Acc})
	sets.engaged.DW['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 5-0'], 	{ammo="Falcon Eye",neck="Ej Necklace",ear2="Cessance Earring",legs=Carmine_legs_HQ})

    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing,{waist="Gishdubar Sash"})
	
	sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
	sets.Learning = {hands=AF_hands}
	sets.warp = {ring2='Warp Ring'}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
	-- send_command('bind ^` input /ja "Chain Affinity" <me>')
    -- send_command('bind !` input /ja "Occultation" <me>')
    -- send_command('bind @` input /ja "Burst Affinity" <me>')
	
	send_command('bind F8 input /ws "Chant Du Cygne" <t>')
	send_command('bind ^F8 input /ws "Requiescat" <t>')
	send_command('bind @F8 input /ws "Savage Blade" <t>')
	
	if player.sub_job:upper() == 'DNC' then
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
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
		send_command('bind ^` input /ma "Occultation" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		send_command('bind @` input /ja "Aquaveil" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind ^F7 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	elseif player.sub_job:upper() == 'WAR' then		
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <stal>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		send_command('bind @F10 input /ma "Battery Charge" <me>')
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind F9 input /ma "provoke" <stnpc>')
		send_command('bind ^F9 input /ma "Glutinous dart" <stnpc>')
		
	elseif player.sub_job:upper() == 'BLM' then		
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <stal>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		send_command('bind @F10 input /ma "Battery Charge" <me>')
		send_command('bind ^F10 input /ma "Cocoon" <me>')
		send_command('bind F9 input /ma "stun" <stnpc>')
		send_command('bind ^F9 input /ra <stnpc>')
		
	elseif player.sub_job:upper() == 'NIN' then	
		send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	elseif player.sub_job:upper() == 'RUN' then	
		send_command('bind !` input /ma "Occultation" <me>')
		send_command('bind ^` input /ma "Barrier Tusk" <me>')
		send_command('bind @` input /ma "Erratic Flutter" <me>')
		
		send_command('bind F9 input /ma "Flash" <stnpc>')
		send_command('bind F7 input /ma "Sudden Lunge" <t>')
		send_command('bind F11 input /ma "Magic Fruit" <me>')
		send_command('bind F10 input /ma "Nat. Meditation" <me>')
		
	end

    -- Default macro set/book
	set_macro_page(6, 20)
   
end
