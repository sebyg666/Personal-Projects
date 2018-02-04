
function init_gear_sets()
	
	print('Theous_Blm_Gear.lua sidecar loaded')
	
	-- Variables
	
	Lathi				={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}
	Lehbrailg			={ name="Lehbrailg +2", augments={'DMG:+15','INT+5','Mag. Acc.+18',}}
	Nibiru_Cudgel		={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}}
	
	Merlinic_hands		={ name="Merlinic Dastanas", augments={'Accuracy+10','"Fast Cast"+5','CHR+3','Mag. Acc.+7',}}
	Merlinic_legs		={ name="Merlinic Shalwar", augments={'Mag. Acc.+15','Magic burst dmg.+11%','CHR+7',}}
	Merlinic_legs		={ name="Merlinic Shalwar", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Mag. Acc.+3','"Mag.Atk.Bns."+1',}}
	Merlinic_feet		={ name="Merlinic Crackows", augments={'Rng.Atk.+24','Weapon skill damage +1%','"Fast Cast"+6','Accuracy+13 Attack+13','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	
	Psycloth_body		={ name="Psycloth Vest", augments={'Elem. magic skill +20','INT+7','Enmity-6',}}
	Psycloth_hands		={ name="Psycloth Manillas", augments={'MP+50','INT+7','"Conserve MP"+6',}}
	Psycloth_legs		={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}
	
	Amalric_head		={ name="Amalric Coif", augments={'INT+10','Elem. magic skill +15','Dark magic skill +15',}}
	-- Amalric_head		={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}}
	-- Amalric_body		={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_hands		={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	Amalric_legs		={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	-- Amalric_feet		={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_body			={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_hands			={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_legs			={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}}
	
	Hagondes_legs		={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -2%','Magic burst dmg.+4%',}}
	
	Taranus_Nuke 		={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +6','"Mag.Atk.Bns."+10',}}
	-- Taranus_FC			={ name="Taranus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	-- Taranus_Death		={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Mag.Atk.Bns."+10',}}
	-- Bane_back			={ name="Bane Cape", augments={'Elem. magic skill +4','Dark magic skill +3','"Mag.Atk.Bns."+1','"Fast Cast"+3',}}
	Bane_back 			={ name="Bane Cape", augments={'Elem. magic skill +10','Dark magic skill +6','"Mag.Atk.Bns."+1',}}
	CP_back				={ name="Mecisto. Mantle", augments={'Cap. Point+50%','AGI+1','Rng.Acc.+2','DEF+10',}}
	
	AF_head 		={ name="Spae. Petasos +2" }
	AF_body			={ name="Spaekona's Coat +2" }
	AF_hands 		={ name="Spae. Gloves +3" }
	--AF_legs 		={ name="Spaekona's Tonban +2" }
	--AF_feet 		={ name="Spaekona's Sabots +2" }
	
	--Relic_head		={ name="Archmage's Petasos", 	augments={'Increases Ancient Magic II damage',}}
	--Relic_body		={ name="Archmage's Coat", 		augments={'Enhances "Manafont" effect',}}
    --Relic_hands		={ name="Archmage's Gloves", 	augments={'Reduces Ancient Magic II casting time',}}
	--Relic_legs		={ name="Archmage's Tonban", 	augments={'Increases Ancient Magic II accuracy',}}
	Relic_feet		={ name="Arch. Sabots +1", augments={'Reduces Ancient Magic II MP cost',}}
	
	--Empy_head 		={ name="Wicce Petasos" }
	--Empy_body			={ name="Wicce Coat" }
	--Empy_hands		={ name="Wicce Gloves" }
	--Empy_legs 		={ name="Wicce Chausses" }
	--Empy_feet 		={ name="Wicce Sabots" }
	
	--------------------------------------
    -- Start sets
    --------------------------------------
	
	gear.default.weaponskill_waist = "Windbuffet Belt"
	
	gear.Resist_Waste = "Eschan Stone"
	gear.Nuke_Waste = "Refoccilation Stone"
	gear.default.obi_waist = gear.Nuke_Waste
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=Taranus_Nuke} --Empy_feet

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells

    sets.precast.FC = {main="Marin Staff +1",sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Amalric_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Mallquis saio",hands=Merlinic_hands,ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Swith Cape",waist="Witful belt",legs=Psycloth_legs,feet=Merlinic_feet}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {}) --waist="Siegel Sash"
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {}) --hands="Carapacho Cuffs"

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",ear1="Barkarole Earring", legs=Amalric_legs})
	
	sets.precast.FC['Death'] = set_combine(sets.precast.FC, {
		main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head=Amalric_head,neck="Stoicheion Medal",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body="Mallquis Saio",hands=Merlinic_hands,ring1="Weatherspoon Ring",ring2="Prolix Ring",
        back=Bane_back,waist="Witful Belt",legs=Psycloth_legs,feet=Merlinic_feet})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",legs="Doyen pants", back="Pahtli Cape", ear1="Mendi. Earring"})

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
        ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main=Nibiru_Cudgel,sub={name="Sors Shield",priority=-1},
        head=Vanya_head,neck="Phalaina Locket",ear2="Loquacious Earring",
        body=Vanya_body,hands=Vanya_hands,ring1="Haoma's Ring",ring2="Haoma's Ring",
		waist=gear.ElementalObi,legs=Vanya_legs,feet=Vanya_feet})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main="Marin Staff +1",sub={name='Clerisy strap',priority=-1},
			neck="Malison Medallion",
			ring1="Haoma's Ring",ring2="Haoma's Ring",
			waist="Bishop's Sash",})

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			main="Marin Staff +1",
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


    sets.midcast['Mnd Enfeebles'] = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body=Merl_body_FC})

    sets.midcast['Int Enfeebles'] = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body=Merl_body_FC})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
	sets.midcast['Dark Magic'] = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}

	sets.midcast.Drain = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
	
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir['Death'] = {
		main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
	
	sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main=Grioavolr_Death})
	
	sets.midcast['Elemental Magic'] = {
		main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Jhakri Robe +1",hands=Amalric_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=Taranus_Nuke,waist="Refoccilation Stone",legs=Merlinic_legs,feet="Jhakri Pigaches +1"}
		
	sets.midcast['Elemental Magic'].Resistant 								= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Elemental Magic']['Magic Burst'] 							= set_combine(sets.midcast['Elemental Magic'], 							{neck="Mizu. Kubikazari",ear2="Static Earring",hands=AF_hands,ring2="Mujin Band"})
	sets.midcast['Elemental Magic']['Magic Burst'].Resistant 				= set_combine(sets.midcast['Elemental Magic']['Magic Burst'], 			{})
	sets.midcast['Elemental Magic']['Preserve MP'] 							= set_combine(sets.midcast['Elemental Magic'], 							{body=AF_body})
	sets.midcast['Elemental Magic']['Preserve MP'].Resistant				= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{body=AF_body})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'] 			= set_combine(sets.midcast['Elemental Magic']['Magic Burst'], 			{body=AF_body})
	sets.midcast['Elemental Magic']['Magic Burst']['Preserve MP'].Resistant	= set_combine(sets.midcast['Elemental Magic']['Magic Burst'].Resistant, {body=AF_body})
	sets.midcast['Luminohelix'] 											= set_combine(sets.midcast['Elemental Magic'], 							{})
	sets.midcast['Luminohelix'].Resistant 									= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{})
	sets.midcast['Luminohelix']['Magic Burst'] 								= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] , 			{})
	sets.midcast['Luminohelix']['Magic Burst'].Resistant 					= set_combine(sets.midcast['Elemental Magic']['Magic Burst'] .Resistant,{})
	sets.midcast.Impact														= set_combine(sets.midcast['Elemental Magic'], 							{head=empty,body="Twilight Cloak"})
	sets.midcast.Impact.Resistant											= set_combine(sets.midcast['Elemental Magic'].Resistant, 				{head=empty,body="Twilight Cloak"})
	
	sets.midcast['Death'] = {
		main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Ghastly Tathlum +1",
        head="Ea Hat",neck="Mizu. Kubikazari",ear1="Barkarole Earring",ear2="Static Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Shiva Ring +1",ring2="Mujin Band",
        back=Taranus_Nuke,waist=gear.ElementalObi,legs="Ea Slops",feet="Ea Pigaches"}
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.EarthNuke = {neck="Quanpur Necklace"}
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {})
    
    -- Normal refresh idle set
    sets.idle = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Staunch Tathlum",
        head="Ea Hat",neck="Bathy Choker",ear1="Infused Earring",ear2="Regal Earring",
        body="Ea Houppelande",hands=Merlinic_hands,ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Mallquis Clogs +1"}
		
	sets.idle['Death'] = {main=Lathi,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        head="Ea Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Regal Earring",
        body="Ea Houppelande",hands="Ea Cuffs",ring1="Defending Ring",ring2="Prolix Ring",
        back=Bane_back,waist="Fucho-no-obi",legs="Ea Slops",feet="Ea Pigaches"}
		
	-- sets.idle['Death'] = {main=Grioavolr_Death,sub={name="Niobid Strap",priority=-1},ammo="Strobilus",
        -- head=Amalric_head,neck="Loricate Torque +1",ear1="Barkarole Earring",ear2="Etiolation Earring",
        -- body=Amalric_body,hands=Amalric_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        -- back=Bane_back,waist="Fucho-no-obi",legs=Amalric_legs,feet=Amalric_feet}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Terra's Staff",sub={name="Niobid Strap",priority=-1},ammo="Staunch Tathlum",
        head=Amalric_head,neck="Veisa collar",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Mallquis Saio",hands=Vanya_hands,ring1="Defending Ring",ring2="Fortified ring",
        back="Moonbeam Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Mallquis clogs +1"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Terra's Staff",sub={name="Niobid Strap",priority=-1},ammo="Staunch Tathlum",
        head=Amalric_head,neck="Veisa collar",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Mallquis Saio",hands=Vanya_hands,ring1="Defending Ring",ring2="Fortified ring",
        back="Moonbeam Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Mallquis clogs +1"}
        
    -- Defense sets

    sets.defense.PDT = {main="Terra's Staff",sub={name="Niobid Strap",priority=-1},ammo="Staunch Tathlum",
        head=Amalric_head,neck="Veisa collar",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Mallquis Saio",hands=Vanya_hands,ring1="Defending Ring",ring2="Fortified ring",
        back="Moonbeam Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Mallquis clogs +1"}

    sets.defense.MDT = {main="Terra's Staff",sub={name="Niobid Strap",priority=-1},ammo="Staunch Tathlum",
        head=Amalric_head,neck="Veisa collar",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Mallquis Saio",hands=Vanya_hands,ring1="Defending Ring",ring2="Fortified ring",
        back="Moonbeam Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Mallquis clogs +1"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {} --Empy_feet
	sets.buff.Reive = {}
	sets.CP = {back=CP_back}
	sets.CPBurst = {back=CP_back,ring1="Locus Ring"}
	sets.Locked_Main_Sub = {main=Lathi,sub={name="Niobid Strap",priority=-1}}
	sets.Locked_Main_Sub.Death = {main=Lathi,sub={name="Niobid Strap",priority=-1}}
	sets.warp = {ring2='Warp Ring'}
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main=Lathi,sub={name="Niobid Strap",priority=-1},
        neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
		ring2="Rajas Ring",
        waist="windbuffet Belt +1",feet="Battlecast Gaiters"}
			
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
 