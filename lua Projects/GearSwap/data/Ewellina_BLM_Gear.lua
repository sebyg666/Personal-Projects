
function init_gear_sets()
	
	print('Ewellina_Blm_Gear.lua sidecar loaded')
	
	-- Variables
	
	Lathi				={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}
	Grioavolr_Death     ={ name="Grioavolr", augments={'Magic burst dmg.+3%','MP+67','Mag. Acc.+26','"Mag.Atk.Bns."+29',}}
	
	Mediums_Sabots		={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	Otomi_Gloves		={ name="Otomi Gloves", augments={'HP+30','MP+30','"Fast Cast"+3',}}
	
	Merl_head_Burst		={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','MND+9','Mag. Acc.+14',}}
	Merl_body_Burst		={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+2','INT+10','Mag. Acc.+6','"Mag.Atk.Bns."+13',}}
    Merl_legs_Burst		={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+7%','INT+7','"Mag.Atk.Bns."+10',}}
	Merl_feet_Burst		={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','INT+10',}}
	
	Merl_hands_Asp		={ name="Merlinic Dastanas", augments={'Mag. Acc.+6','"Drain" and "Aspir" potency +4','INT+10','"Mag.Atk.Bns."+14',}}
	--Merl_legs_Asp		={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','"Drain" and "Aspir" potency +8','Mag. Acc.+8',}}
    Merl_feet_Asp		={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +6','CHR+5','Mag. Acc.+15',}}
	
	Merl_head_FC		={ name="Merlinic Hood", augments={'Mag. Acc.+5 "Mag.Atk.Bns."+5','"Fast Cast"+6','INT+9',}}
	Merl_body_FC		={ name="Merlinic Jubbah", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+6','CHR+8','Mag. Acc.+6','"Mag.Atk.Bns."+12',}}
	Merl_hands_FC		={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','INT+6','Mag. Acc.+5',}}
	Merl_feet_FC		={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','CHR+2','Mag. Acc.+4',}}
	
	--"Battlecast Gaiters"		={ name="Merlinic Crackows", augments={'AGI+9','Crit.hit rate+3','"Refresh"+1','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}

	Amalric_head	={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}}
	Amalric_body	={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_hands	={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs	={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_feet	={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}}
	
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	Taranus_Nuke 		={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	Taranus_FC			={ name="Taranus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	Taranus_Death		={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Mag.Atk.Bns."+10',}}
	Bane_back			={ name="Bane Cape", augments={'Elem. magic skill +4','Dark magic skill +3','"Mag.Atk.Bns."+1','"Fast Cast"+3',}}
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+31%','Rng.Acc.+1','DEF+1',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	Nuke_waist = "Refoccilation Stone"
	}
	
	--------------------------------------
    -- Start sets
    --------------------------------------
	
	gear.default.weaponskill_waist = "Windbuffet Belt"
	
	gear.Resist_Waste = "Eschan Stone"
	gear.Nuke_Waste = "Refoccilation Stone"
	gear.default.obi_waist = gear.Nuke_Waste
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells

    sets.precast.FC = {main=Grioavolr_Death,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Zendik Robe",hands=Merl_hands_FC,ring1="Prolix Ring",ring2="Kishar Ring",
		back=Taranus_FC,waist="Witful belt",legs=Psycloth_legs,feet=Merl_feet_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole Earring"})
	
	sets.precast.FC['Death'] = set_combine(sets.precast.FC, {
		main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands=Otomi_Gloves,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back=Bane_back,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_FC})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Hydrocera",
        head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Barkarole Earring",
        body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Ifrit Ring",ring2='Ifrit Ring',
        back=Bane_back,waist="Eschan Stone",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
		
	sets.precast.WS['Myrkr'] = {
        ammo="Strobilus",
        head="Pixie hairpin +1",neck="Dualism Collar +1",ear1="Etiolation Earring",ear2="Moonshade Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back=Bane_back,waist="Fucho-no-obi",legs=Amalric_legs,feet=Amalric_feet}
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main="Tamaxchi",sub={name="Sors Shield",priority=-1},
        neck="Phalaina Locket",ear2="Loquacious Earring",
        body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs=Psycloth_legs})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Death,sub={name='Clerisy strap',priority=-1},
			neck="Malison Medallion",
			ring1="Ephedra Ring",ring2="Sirona's Ring",
			waist="Bishop's Sash",})

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			main=Grioavolr_Death,
			neck="Incanter's Torque",ear1='Andoaa Earring',
			back='Merciful Cape',waist="Olympus Sash"})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1}})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {head=Amalric_head,waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})

    -- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {head=Amalric_head})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell


    sets.midcast['Mnd Enfeebles'] = {main=Lathi,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
        body=Vanya_body,hands="Lurid Mitts",ring1="Leviathan Ring",ring2="Leviathan Ring",
        back=Taranus_FC,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body=Merl_body_FC})

    sets.midcast['Int Enfeebles'] = {main=Lathi,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
        body=Vanya_body,hands="Lurid Mitts",ring1="Shiva Ring",ring2="Shiva Ring",
        back=Taranus_Nuke,waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body=Merl_body_FC})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
	sets.midcast['Dark Magic'] = {main=Lathi,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
		head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body=Merl_body_FC,hands=Amalric_hands,ring1="Perception Ring",ring2='Shiva Ring',
        back=Taranus_Nuke,waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Burst}

	sets.midcast.Drain = {main=Lathi,sub={name="Enki Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body=Merl_body_FC,hands=Merl_hands_Asp,ring1="Evanescence Ring",ring2='Shiva Ring',
        back=Taranus_Nuke,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Asp}
	
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir['Death'] = {
		main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_FC,hands=Amalric_hands,ring1="Prolix Ring",ring2="Mephitas's Ring",
        back=Taranus_Death,waist="Fucho-no-obi",legs=Psycloth_legs,feet=Merl_feet_Asp}
	
	sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main=Grioavolr_Death})
	
	sets.midcast['Elemental Magic'] = {
		main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum",
        head=Merl_head_Burst,neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=Merl_body_Burst,hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs=Amalric_legs,feet=Merl_feet_Burst}
		
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{main=Grioavolr_Death,neck="Sanctity Necklace",legs=Merl_legs_Burst,feet=Merl_feet_Asp})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ear2="Static Earring",ring2="Mujin Band",legs=Merl_legs_Burst})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic']['Magic Burst'], 			{main=Grioavolr_Death,feet=Merl_feet_Asp})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{body="Spaekona's Coat +1"})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{body="Spaekona's Coat +1",feet=Merl_feet_Asp})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic']['Magic Burst'], 			{body="Spaekona's Coat +1"})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic']['Magic Burst'].Resistant, {body="Spaekona's Coat +1"})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,body="Twilight Cloak"})
	
	sets.midcast['Death'] = {
		main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear1="Barkarole Earring",ear2="Static Earring",
        body=Merl_body_Burst,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2="Mujin Band",
        back=Taranus_Death,waist=gear.ElementalObi,legs=Amalric_legs,feet=Merl_feet_Burst}
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {main="Bolelabunga",sub={name="Genbu's Shield",priority=-1},legs="Assiduity Pants +1",feet="Battlecast Gaiters"})
    
    -- Normal refresh idle set
    sets.idle = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum",
        head=Amalric_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
        body="Jhakri Robe +1",hands=Amalric_hands,ring1="Sheltered Ring",ring2="Chirich Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
		
	sets.idle['Death'] = {main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head=Amalric_head,neck="Loricate Torque +1",ear1="Barkarole Earring",ear2="Etiolation Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back=Bane_back,waist="Fucho-no-obi",legs=Amalric_legs,feet=Amalric_feet}
	
	-- sets.idle['Death'] = {main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        -- head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Loquacious Earring",ear2="Etiolation Earring",
        -- body=Amalric_body,hands=Otomi_Gloves,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        -- back=Bane_back,waist="Fucho-no-obi",legs=Amalric_legs,feet=Mediums_Sabots}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Earth Staff",sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum",
        head=Amalric_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Vocane Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs=Amalric_legs,feet="Battlecast Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum",
        head=Amalric_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Vocane Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs=Amalric_legs,feet="Battlecast Gaiters"}
    
    -- Town gear.
    -- sets.idle.Town = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum",
        -- head=Amalric_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
        -- body=Amalric_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Chirich Ring",
        -- back="Cheviot Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main="Earth Staff",sub={name="Niobid Strap",priority=-1},
        head=Amalric_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Vocane Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs=Amalric_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Earth Staff",sub={name="Niobid Strap",priority=-1},
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Chirich Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs=Amalric_legs,feet="Battlecast Gaiters"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {}
	sets.buff.Reive = {}
	sets.CP = {back="Aptitude Mantle"}
	sets.CPBurst = {main=Grioavolr_Death,back="Aptitude Mantle",ring1="Locus Ring"}
	sets.Locked_Main_Sub = {main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1}}
	sets.Locked_Main_Sub.Death = {main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1}}
	sets.warp = {ring2='Warp Ring'}
	sets.crafting = {sub="Ossifier's Ecu",head="Protective Specs.",body="Boneworker's Apn.",neck="Boneworker's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main=Lathi,sub={name="Niobid Strap",priority=-1},
        neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
        ring1="Vocane Ring",ring2="Rajas Ring",
        back="Bleating Mantle",waist="windbuffet Belt +1",feet="Battlecast Gaiters"}
			
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
	
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind @` input /ma "Aquaveil" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind @` input /ma "Aquaveil" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind F8 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind ^F9 input /ma "Dispel" <stnpc>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
	elseif player.sub_job:upper() == 'SCH' then
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind @` input /ma "Sublimation" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Thunderstorm" <stal>')
		send_command('bind ^F9 input /ma "Dispel" <stnpc>')
		send_command('bind F10 input /ma "cure II" <stal>')
		send_command('bind F11 input /ma "cure III" <stal>')
	end
end
 