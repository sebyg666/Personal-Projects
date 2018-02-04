
function init_gear_sets()
	
	print('Laubent_Blm_Gear.lua sidecar loaded')
	
	Death_Staff			={ name="Grioavolr", augments={'Magic burst dmg.+10%','MP+65','Mag. Acc.+18','"Mag.Atk.Bns."+25',}}
	
	Merl_head_Burst		={ name="Merlinic Hood", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst dmg.+10%','VIT+6','Mag. Acc.+13','"Mag.Atk.Bns."+15',}}
    Merl_legs_Burst		={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst dmg.+4%','AGI+10','Mag. Acc.+9','"Mag.Atk.Bns."+14',}}
	Merl_feet_Burst		={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+5%','INT+4',}}
	Merl_body_Burst     ={ name="Merlinic Jubbah", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Drain" and "Aspir" potency +3','INT+10','Mag. Acc.+12','"Mag.Atk.Bns."+11',}}
	
	Merl_head_FC		={ name="Merlinic Hood", augments={'"Fast Cast"+6','INT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}}
	Merl_feet_FC		={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+14','"Fast Cast"+7','INT+3',}}
	Merl_hands_FC    ={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','MND+3',}}
	
	Merl_hands_fresh    ={name="Merlinic Dastanas", augments={'Pet: INT+2','Pet: DEX+3','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
	Merl_feet_fresh     ={name="Merlinic Crackows", augments={'Accuracy+1','Pet: "Mag.Atk.Bns."+1','"Refresh"+2','Accuracy+16 Attack+16',}}
	
	Lengo_Pants			={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}

	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}

	Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    Amalric_hands		={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
	Amalric_legs		={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_feet		={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
	
	Otomi_hands			={ name="Otomi Gloves", augments={'HP+30','MP+30','MP+30',}}
	
	Bane_back			={ name="Bane Cape", augments={'Elem. magic skill +8','Dark magic skill +2','"Mag.Atk.Bns."+2','"Fast Cast"+3',}}
	Taranus_back		={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+50%','HP+20','DEF+2',}}
	Taranus_FC_back     ={ name="Taranus's Cape", augments={'"Fast Cast"+10',}} 
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
	organizer_items = {}
	
	--------------------------------------
    -- Start sets
    --------------------------------------

	gear.Staff.PDT = "Terra's Staff"
	gear.default.weaponskill_waist = "Windbuffet Belt"
	gear.default.obi_waist = "Refoccilation Stone"
	gear.default.obi_back = "Toro Cape"
	gear.default.obi_ring = "Shiva Ring"
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.FastcastStaff,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Anhur Robe",hands=Merl_hands_FC,ring1="Prolix Ring",ring2="Rahab Ring",
		back=Taranus_FC_back,waist="Witful belt",legs=Lengo_Pants,feet=Merl_feet_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole Earring"})
	
	sets.precast.FC['Death'] = set_combine(sets.precast.FC, {
		main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Psilomene",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Burst,hands=Otomi_hands,ring1="Mephitas's Ring",ring2="Mephitas's Ring +1",
        back=Bane_back,waist="Shinjutsu-no-Obi",legs=Amalric_legs,feet=Amalric_feet})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Burst,hands=Amalric_hands,ring1="Prolix Ring",ring2='Fenrir Ring',
        back="Pahtli Cape",waist="Fucho-no-obi",legs=Lengo_Pants,feet=Merl_feet_Refr}
    
	 sets.precast.WS['Myrkr'] = {
        main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Psilomene",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Burst,hands=Otomi_hands,ring1="Mephitas's Ring",ring2="Mephitas's Ring +1",
        back=Bane_back,waist="Shinjutsu-no-Obi",legs=Amalric_legs,feet=Amalric_feet}
    
	---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main="Tamaxchi",sub={name="Sors Shield",priority=-1},
        head="Nahtirah Hat",neck="Phalaina Locket",ear2="Loquacious Earring",ear2="Enchanter Earring +1",
        body="Heka's Kalasiris",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs=Lengo_Pants,feet=Vanya_feet})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main=gear.RecastStaff,sub={name='Clerisy strap',priority=-1},
			neck="Malison Medallion",ear2="Healing Earring",
			ring1="Ephedra Ring",ring2="Sirona's Ring",
			waist="Bishop's Sash",})

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub={name="Sors Shield",priority=-1}})
	
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",feet="Inspirited Boots"})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    sets.midcast['Mnd Enfeebles'] = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Weike Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Shango Robe",hands=Amalric_hands,ring1="Leviathan Ring",ring2="Leviathan Ring",
        back="Ogapepo Cape",waist="Ovate Rope",legs=Lengo_Pants,feet=Merl_feet_Burst}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {})

    sets.midcast['Int Enfeebles'] = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Weike Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Shango Robe",hands=Amalric_hands,ring1="Shiva Ring",ring2="Shiva Ring",
        back="Ogapepo Cape",waist="Ovate Rope",legs=Lengo_Pants,feet=Merl_feet_Burst}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
	sets.midcast['Dark Magic'] = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
		head=Merl_head_Burst,neck="Deceiver's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Shango Robe",hands=Amalric_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
        back=Bane_back,waist="Ovate Rope",legs=Lengo_Pants,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Deceiver's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Shango Robe",hands=Amalric_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
        back=Bane_back,waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
	
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir['Death'] = {
		main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Erra pendant",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body=Merl_body_Burst,hands=Amalric_hands,ring1="Archon Ring",ring2="Shiva Ring +1",
        back=Bane_back,waist="Fucho-no-obi",legs=Lengo_Pants,feet=Merl_feet_FC}
	
	sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Grioavolr"})
	
	sets.midcast['Elemental Magic'] = {
		main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Pemphredo Tathlum",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands=Amalric_hands,ring1="Stikini Ring",ring2="Shiva Ring +1",
        back=Taranus_back,waist=gear.ElementalObi,legs="Ea Slops",feet=Amalric_feet}
		
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{neck="Mizu. Kubikazari",ring1="Mujin Band"})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{body="Spaekona's Coat"})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{body="Spaekona's Coat"})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",body="Spaekona's Coat",ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{neck="Mizu. Kubikazari",body="Spaekona's Coat",ring1="Mujin Band"})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{neck="Mizu. Kubikazari",ring1="Mujin Band"})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{neck="Mizu. Kubikazari",ring1="Mujin Band"})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,body="Twilight Cloak"})
	
	sets.midcast['Death'] = {
		main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Psilomene",
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear2="Barkaro. Earring",ear1="Friomisi Earring",
        body="Ea Houppelande",hands=Amalric_hands,ring1="Archon Ring", ring2="Mephitas's Ring +1",
        back=Taranus_back,waist=gear.ElementalObi,legs="Ea Slops",feet=Amalric_feet}
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {legs="Assiduity Pants +1"})
    
    -- Normal refresh idle set
    sets.idle = {main=Death_Staff, sub={name="Niobid Strap",priority=-1},
        head="Befouled crown",neck="Loricate Torque +1",ear2="Moonshade Earring",ear1="Loquacious Earring",
        body="Jhakri robe +1",hands=Merl_hands_fresh,ring1="Defending Ring",ring2="Vocane Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Assiduity Pants +1",feet=Merl_feet_fresh}
		
	sets.idle['Death'] = {main=Death_Staff,sub={name="Niobid Strap",priority=-1},ammo="Psilomene",
        head="Pixie hairpin +1",neck="Voltsurge Torque",ear2="Loquacious Earring",ear1="Barkarole Earring",
        body="Ea Houppelande",hands=Otomi_hands,ring1="Mephitas's Ring",ring2="Mephitas's Ring +1",
        back=Bane_back,waist="Shinjutsu-no-Obi",legs="Ea Slops",feet=Amalric_feet}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main=Death_Staff, sub={name="Niobid Strap",priority=-1},
        head="Befouled crown",neck="Loricate Torque +1",ear2="Infused earring",ear1="Loquacious Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Vocane Ring",
        back="Solemnity Cape",waist="Witful Belt",legs=Merl_legs_Burst,feet="Battlecast Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main=Death_Staff, sub={name="Niobid Strap",priority=-1},
        head="Befouled crown",neck="Loricate Torque +1",ear2="Infused earring",ear1="Loquacious Earring",
        body=Merl_body_Burst,hands=Amalric_hands,ring1="Defending Ring",ring2="Vocane Ring",
        back="Solemnity Cape",waist="Witful Belt",legs=Merl_legs_Burst,feet="Battlecast Gaiters"}
    
    -- Town gear.
    sets.idle.Town = set_combine(sets.idle, {feet="Herald's Gaiters"})
        
    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Vertigo Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub={name="Giuoco Grip",priority=-1},
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
        body=Hagondes_body,hands=Amalric_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {}
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.CP = {back=CP_back}
	sets.Locked_Main_Sub = {main=Death_Staff,sub={name="Niobid Strap",priority=-1}}
	sets.Locked_Main_Sub.Death = {main=Death_Staff,sub={name="Niobid Strap",priority=-1}}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main=Death_Staff,sub={name="Giuoco Grip",priority=-1},
        head="Espial Cap",neck="Clotharius Torque",ear1="Ethereal Earring",ear2="Infused Earring",
        body="Espial Gambison",hands="Espial Bracers",ring1="Patricius Ring",ring2="Rajas Ring",
        back=Pet_back,waist="windbuffet Belt",legs=Telchine_legs_TP,feet="Battlecast Gaiters"}
			
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 19)

end

function file_unload()
    -- If you need any custom unload for this job/user
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
	
end