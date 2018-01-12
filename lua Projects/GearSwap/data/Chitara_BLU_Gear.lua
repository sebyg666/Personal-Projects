
function init_gear_sets()
	
	print('Ewellina_BLU_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------		
	
	Colada_one 		={ name="Colada", augments={'Crit.hit rate+3','DEX+15','Accuracy+18','Attack+20','DMG:+2',}}
    Colada_two		={ name="Colada", augments={'"Dbl.Atk."+2','DEX+9','Accuracy+19','Attack+19',}}
	Nib_Cudg_one	={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}}
    Nib_Cudg_two	={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}}
	
	Carmine_head	={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}}
	Carmine_body	={ name="Carm. Scale Mail", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_hands	={ name="Carmine Fin. Ga.", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs	={ name="Carmine Cuisses", augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_feet	={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}}
	
    Psycloth_legs	={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Amalric_head	={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}}
	Amalric_body	={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_hands	={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs	={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_feet	={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}}
	
	Adhemar_head	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
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
	
	Herc_body_TA	={ name="Herculean Vest", augments={'Accuracy+16','"Triple Atk."+4','AGI+4','Attack+12',}}
    Herc_legs_TA	={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','AGI+7','Accuracy+14',}}
    Herc_feet_STP	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
	Herc_feet_TA	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','AGI+4','Attack+2',}}
	
	Herc_legs_DW	={ name="Herculean Trousers", augments={'Accuracy+25','"Dual Wield"+4','STR+10','Attack+14',}}
	Taeon_feet_DW	={ name="Taeon Boots", augments={'Attack+10','"Dual Wield"+3','STR+3 AGI+3',}}
	
	Herc_hands_WS	={ name="Herculean Gloves", augments={'Rng.Acc.+23','Crit. hit damage +1%','AGI+15','Attack+6',}}
	Herc_legs_WS	={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Crit. hit damage +3%','STR+7','Accuracy+14',}}
	
	Herc_head_FC	={ name="Herculean Helm", augments={'"Fast Cast"+5','STR+9','Mag. Acc.+1','"Mag.Atk.Bns."+7',}}
    Herc_feet_FC	={ name="Herculean Boots", augments={'Mag. Acc.+1','DEX+7','"Fast Cast"+8',}}
	
	Herc_legs_DT	={ name="Herculean Trousers", augments={'Accuracy+19','Damage taken-3%','Attack+12',}}
	
	Herc_head_Nuke	={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','STR+14','Mag. Acc.+8','"Mag.Atk.Bns."+13',}}
	Herc_legs_Nuke	={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Crit. hit damage +3%','INT+5','Mag. Acc.+8','"Mag.Atk.Bns."+8',}}
	
	Herc_hands_Refr	={ name="Herculean Gloves", augments={'"Drain" and "Aspir" potency +6','DEX+2','"Refresh"+1','Accuracy+12 Attack+12',}}
	Herc_feet_Refr	={ name="Herculean Boots", augments={'Potency of "Cure" effect received+1%','Attack+10','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	
	Corn_back		={ name="Cornflower Cape", augments={'MP+20','DEX+3','Accuracy+3','Blue Magic skill +10',}}
	TP_back			={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	WS_back			={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	FC_back			={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	
	Relic_head		={ name="Luhlaza Keffiyeh +1", augments={'Enhances "Convergence" effect',}}
	Relic_body		={ name="Luhlaza Jubbah +1", augments={'Enhances "Enchainment" effect',}}
    Relic_hands		={ name="Luhlaza Bazubands", augments={'Enhances "Azure Lore" effect',}}
	Relic_feet		={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {main=Colada_one,sub=Colada_two,ring1="Emperor Band"}
	sets.Org.two = {main=Nib_Cudg_one,sub=Nib_Cudg_two}
	
	organizer_items = {
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring"
	}
	
	
	                                                             	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------

    sets.buff['Burst Affinity'] = {}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk",feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head=Relic_head}
    sets.buff.Diffusion = {feet=Relic_feet}
    sets.buff.Enchainment = {body=Relic_body}
    sets.buff.Efflux = {back=TP_back,legs="Hashishin Tayt +1"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands=Relic_hands}
	
	sets.precast.JA['Provoke'] = {
		neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Steelflash Earring",
		body="Emet Harness +1",ring1="Vexer Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
			head=Carmine_head,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Relic_body,hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs=Lengo_Pants,feet=Herc_feet_FC}
			
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan"})
	
	sets.precast.FC['Blue Magic'].Healing = set_combine(sets.precast.FC['Blue Magic'], {ear2="Mendicant's Earring"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Jukukik Feather",
		head=Adhemar_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=WS_back,waist="Fotia Belt",legs=Herc_legs_TA,feet=Herc_feet_TA}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']				= set_combine(sets.precast.WS, {
		ammo="Hydrocera",
		head=Carmine_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Carmine_body,hands=Carmine_hands,ring1="Epona's Ring",ring2="Apate Ring",
		back="Bleating Mantle",waist="Fotia Belt",legs=Carmine_legs,feet=Carmine_feet})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , {})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , {})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , {})

    sets.precast.WS['Sanguine Blade'] 				= set_combine(sets.precast.WS, {
	ammo="Ghastly Tathlum",
	head="Pixie Hairpin +1",neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
	body=Samnuha_Coat,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
	back=Corn_back,waist="Salire Belt",legs=Amalric_legs,feet=Amalric_feet})
	sets.precast.WS['Ilvl~118']['Sanguine Blade'] 	= set_combine(sets.precast.WS['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~122']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~118']['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~124+']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~122']['Sanguine Blade'], {})
	
	sets.precast.WS['Chant du Cygne'] 				= set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head=Adhemar_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Mache Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Begrudging Ring",
		back=WS_back,waist="Fotia Belt",legs=Herc_legs_WS,feet="Thereoid Greaves"})
	sets.precast.WS['Ilvl~118']['Chant du Cygne']	= set_combine(sets.precast.WS['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~122']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~118']['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~124+']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~122']['Chant du Cygne'], {})
	
	sets.precast.WS['Savage Blade']  				= set_combine(sets.precast.WS, {
		ammo="Cheruski Needle",
		head=Adhemar_head,neck="Caro Necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ifrit Ring",ring2="Apate Ring",
		back="Vespid Mantle",waist="Prosilio Belt +1",legs=Herc_legs_WS,feet=Herc_feet_TA})
	sets.precast.WS['Ilvl~118']['Savage Blade']  	= set_combine(sets.precast.WS['Savage Blade'] , {})
	sets.precast.WS['Ilvl~122']['Savage Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Savage Blade'] , {})
	sets.precast.WS['Ilvl~124+']['Savage Blade']  	= set_combine(sets.precast.WS['Ilvl~122']['Savage Blade'] , {})
	
	sets.precast.WS['Expiacion']  					= set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head=Adhemar_head,neck="Caro Necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ifrit Ring",ring2="Apate Ring",
		back="Vespid Mantle",waist="Prosilio Belt +1",legs=Herc_legs_WS,feet=Herc_feet_STP})
	sets.precast.WS['Ilvl~118']['Expiacion']  	= set_combine(sets.precast.WS['Expiacion'] , {})
	sets.precast.WS['Ilvl~122']['Expiacion']	= set_combine(sets.precast.WS['Ilvl~118']['Expiacion'] , {})
	sets.precast.WS['Ilvl~124+']['Expiacion']  	= set_combine(sets.precast.WS['Ilvl~122']['Expiacion'] , {})
	
	sets.precast.WS['Vorpal Blade']  				= set_combine(sets.precast.WS, {
		ammo="Cheruski Needle",
		head=Adhemar_head,neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Foppish Tunica",hands=Herc_hands_WS,ring1="Epona's Ring",ring2="Apate Ring",
		back=WS_back,waist="Fotia Belt",legs=Herc_legs_WS,feet="Thereoid Greaves"})
	sets.precast.WS['Ilvl~118']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Vorpal Blade'], {})
	sets.precast.WS['Ilvl~122']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Vorpal Blade'], {})
	sets.precast.WS['Ilvl~124+']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~122']['Vorpal Blade'], {})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
			head=Carmine_head,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
			body=Relic_body,hands=Leyline_Gloves,ring1="Veneficium Ring",ring2="Prolix Ring",
			back=FC_back,waist="Witful Belt",legs=Rawhide_legs,feet=Herc_feet_FC}
			
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {head=Carmine_head,waist="Olympus Sash",legs=Carmine_legs})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})
	
	sets.midcast["Flash"] = set_combine(sets.midcast.FastRecast, {
		neck="Warder's Charm",ear1="Friomisi Earring",ear2="Steelflash Earring",
		body="Emet Harness +1",ring1="Vexer Ring",ring2="Eihwaz Ring",
		back="Earthcry Mantle",legs="Obatala Subligar"})
        
    sets.midcast['Blue Magic'] = set_combine(sets.midcast.FastRecast, {hands="Hashishin Bazubands"})
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = set_combine(sets.midcast['Blue Magic'], {
		ammo="Cheruski Needle",
		head=Adhemar_head,neck="Caro Necklace",ear1="Brutal Earring",ear2="Ishvara Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ifrit Ring",ring2="Ifrit Ring",
		back=Corn_back,waist="Prosilio Belt +1",legs=Herc_legs_TA,feet=Herc_feet_TA})

    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {ring1="Ramuh Ring",ring2="Ramuh Ring",back=TP_back})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})


    -- Magical Spells --	
	
    sets.midcast['Blue Magic'].Magical = {ammo="Ghastly Tathlum",
        head=Herc_head_Nuke,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Jhakri Robe +1",hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Corn_back,waist="Salire Belt",legs=Amalric_legs,feet=Amalric_feet}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
		ammo="Hydrocera",
		head=Amalric_head,ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Jhakri Robe +1",hands=Rawhide_hands,
		waist="Ovate Rope",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	
	sets.midcast['Blue Magic']['Tenebral Crush'] 			= set_combine(sets.midcast['Blue Magic'].Magical, {head="Pixie Hairpin +1"})	
	sets.midcast['Blue Magic']['Tenebral Crush'].Resistant 	= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {head="Pixie Hairpin +1"})
    
    sets.midcast['Blue Magic'].MagicalMnd					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalMnd.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalChr 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalVit 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicalDex 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
	
    sets.midcast['Blue Magic'].MagicAccuracy 				= set_combine(sets.midcast['Blue Magic'].Magical, {
		ammo="Hydrocera",
		head=Amalric_head,ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Jhakri Robe +1",hands=Rawhide_hands,
		waist="Ovate Rope",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, {})

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun =  {
		ammo="Honed Tathlum",
		head=Carmine_head,neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Jhakri Robe +1",hands=Rawhide_hands,ring1="Ramuh Ring",ring2="Ramuh Ring",
		back=Corn_back,waist="Dynamic Belt +1",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
        
    sets.midcast['Blue Magic']['White Wind'] = set_combine(sets.midcast.FastRecast, {})

    sets.midcast['Blue Magic'].Healing = set_combine(sets.midcast.FastRecast, {ear2="Mendicant's Earring",neck="Phalaina Locket",back="Solemnity Cape",legs=Carmine_legs,feet=Mediums_Sabots})

    sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.midcast.FastRecast, {ammo="Mavi Tathlum",head=Relic_head,neck="Deceiver's Torque",body="Assimilator's Jubbah +1",hands=Rawhide_hands,back=Corn_back,legs="Hashishin Tayt +1",feet=Relic_feet})

    sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast.FastRecast, {hands="Hashishin Bazubands"})
	
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast.FastRecast, {head=Amalric_head,hands="Hashishin Bazubands"})
	    
    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = {ring2="Sheltered Ring"}
    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = {ring2="Sheltered Ring"}
    
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
    -- Idle sets
    sets.idle = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Carmine_legs,feet=Herc_feet_Refr}
	
	sets.idle.Refresh = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
	
	sets.idle.Town = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dawn Earring",ear2="Infused Earring",
		body="Jhakri Robe +1",hands=Herc_hands_Refr,ring1="Chirich Ring",ring2="Sheltered Ring",
		back="Kumbira Cape",waist="Flume Belt",legs=Carmine_legs,feet=Herc_feet_Refr}
	
    sets.idle.PDT = {ammo="Brigantia Pebble",
        head="Fugacity Beret +1",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_STP}
		
	sets.idle.Weak = {ammo="Brigantia Pebble",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Rawhide_legs,feet=Herc_feet_Refr}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Brigantia Pebble",
        head="Fugacity Beret +1",neck="Twilight Torque",ear1="Genmei Earring",ear2="Infused Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_Refr}

    sets.defense.MDT = {ammo="Brigantia Pebble",
        head="Fugacity Beret +1",neck="Twilight Torque",ear1="Genmei Earring",ear2="Infused Earring",
		body=Amalric_body,hands="Umuthi Gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=Herc_legs_DT,feet=Herc_feet_Refr}

    sets.Kiting = {legs=Carmine_legs}

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
										head=Adhemar_head,neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
										body=Herc_body_TA,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
										back=TP_back,waist="Windbuffet Belt +1",legs=Herc_legs_TA,feet=Herc_feet_TA}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{ammo="Honed Tathlum",neck="Lissome Necklace"})
	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope",back=TP_back})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{neck="Ej Necklace",ring1="Rajas Ring",})
	
	sets.engaged.DW 					= {ammo="Ginsen",
										head=Adhemar_head,neck="Asperity Necklace",ear1="Eabani Earring",ear2="Suppanomimi",
										body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
										back=TP_back,waist="Windbuffet Belt +1",legs=Herc_legs_DW,feet=Taeon_feet_DW}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{ammo="Honed Tathlum",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope",back=TP_back})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{neck="Ej Necklace",ring1="Rajas Ring",})
	
	------------------------------------------------------------------	

	sets.engaged.DW['DW: 37+'] 					= set_combine(sets.engaged.DW, 						{})
	sets.engaged.DW['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged.DW['DW: 37+'], 				{ammo="Honed Tathlum",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 37+'], 	{head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 37+'], 	{neck="Ej Necklace",ring1="Rajas Ring",})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~36% DW)-             
	--------------------------------------------            
	
	sets.engaged.DW['DW: 22-36'] 				= set_combine(sets.engaged.DW['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged.DW['DW: 22-36'], 			{ammo="Honed Tathlum",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 22-36'], {head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 22-36'], {neck="Ej Necklace",ring1="Rajas Ring",})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste (~21% DW)-              
	--------------------------------------------            
	
	sets.engaged.DW['DW: 12-21']				= set_combine(sets.engaged.DW['DW: 22-36'], 			{legs=Samnuha_Tights})
	sets.engaged.DW['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged.DW['DW: 12-21'], 			{ammo="Honed Tathlum",neck="Lissome Necklace"})
	sets.engaged.DW['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 12-21'], {head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~124+']['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 12-21'], {neck="Ej Necklace",ring1="Rajas Ring"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (5-11% DW)               
	---------------------------------------------           
	
	sets.engaged.DW['DW: 6-11'] 				= set_combine(sets.engaged.DW['DW: 12-21'], 			{ear1="Dedition Earring",ear2="Suppanomimi",ring1="Chirich Ring",neck="Ainia Collar",feet=Herc_feet_STP})
	sets.engaged.DW['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged.DW['DW: 6-11'], 				{head=Dampening_Tam,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 6-11'],	{neck="Sanctity Necklace",ring1="Rajas Ring"})
	sets.engaged.DW['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 6-11'], 	{ammo="Falcon Eye",neck="Ej Necklace"})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (0% DW)            
	-----------------------------------------           

	sets.engaged.DW['DW: 5-0'] 					= set_combine(sets.engaged.DW['DW: 6-11'],				{ear1="Dedition Earring",ear2="Brutal Earring",neck="Ainia Collar",body=Herc_body_TA,ring1="Rajas Ring",feet=Herc_feet_STP})
	sets.engaged.DW['Ilvl~118']['DW: 5-0'] 		= set_combine(sets.engaged.DW['DW: 5-0'], 				{head=Dampening_Tam,waist="Grunfeld Rope"})
	sets.engaged.DW['Ilvl~122']['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 5-0'], 	{neck="Sanctity Necklace",body=Adhemar_body})
	sets.engaged.DW['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 5-0'], 	{ammo="Honed Tathlum",neck="Ej Necklace"})

    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing,{waist="Gishdubar Sash"})
	
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring",waist="Gishdubar Sash"}
	sets.buff.Reive = {neck = "Ygnas's Resolve +1"}
	sets.CP = {back="Aptitude Mantle"}
	sets.Learning = {hands="Assimilator's Bazubands +1"}
	sets.warp = {ring2='Warp Ring'}
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
