include('organizer-lib.lua')
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
    state.Buff.Saboteur = buffactive.saboteur or false
	
	determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'HighAcc', 'MaxAcc')
    state.WeaponskillMode:options('Normal', 'Acc', 'HighAcc', 'MaxAcc')
	state.HybridMode:options('Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	
	state.MagicBurst = M(false, 'Magic Burst')

    gear.default.obi_waist = "Yamabuki-no-Obi"

	send_command('bind !f11 gs c cycle MagicBurst')
	send_command('bind f9 gs c cycle WeaponskillMode')
	send_command('bind f9 gs c cycle OffenseMode')
	
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {ammo="Impatiens",
        head={ name="Merlinic Hood", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+12',}},neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Viti. Tabard +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','VIT+1',}}}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Levia. Ring +1",ring2="Levia. Ring +1",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Jhakri Pigaches +1"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Karieyh Ring",ring2="Archon Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.precast.WS['Knights of Round'] = {ammo="Floestone",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Vulcan's Pearl",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Karieyh Ring",ring2="Shukuyu Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
	
	sets.precast.WS['Savage Blade'] = {ammo="Floestone",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Karieyh Ring",ring2="Shukuyu Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'],{ring2="Rufescent Ring"})

	sets.precast.WS['Savage Blade'].HighAcc = set_combine(sets.precast.WS['Savage Blade'].Acc,{head="Carmine Mask +1",legs="Carmine Cuisses +1"})

	sets.precast.WS['Savage Blade'].MaxAcc = set_combine(sets.precast.WS['Savage Blade'].HighAcc,{ammo="Amar Cluster",ear1="Mache Earring +1"})
		
    sets.precast.WS['Chant du Cygne'] = {ammo="Yetshila +1",
		head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring",
		body={ name="Taeon Tabard", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},ring1="Begrudging Ring",ring2="Ramuh Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},waist="Fotia Belt",legs={ name="Taeon Tights", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},feet="Thereoid Greaves"}

    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'],{hands="Jhakri Cuffs +1",feet="Jhakri Pigaches +1"})

    sets.precast.WS['Chant du Cygne'].HighAcc = set_combine(sets.precast.WS['Chant du Cygne'].Acc,{head="Carmine Mask +1",legs="Carmine Cuisses +1"})
		
    sets.precast.WS['Chant du Cygne'].MaxAcc = set_combine(sets.precast.WS['Chant du Cygne'].HighAcc,{ammo="Amar Cluster",body="Jhakri Robe +1"})

	sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','Magic burst mdg.+11%','VIT+10',}},neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Karieyh Ring",ring2="Shiva Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
		-- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})

    sets.midcast.Cure = {
		head="Vanya Hood",neck="Incanter's Torque",ear1="Beatific Earring",ear2="Mendi. Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Haoma's Ring",ring2="Sirona's Ring",
		back="Tempered Cape +1",waist="Bishop's Sash",legs="Atrophy Tights +1",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure
	
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure,{hands="Buremte Gloves",feet="Medium's Sabots",ring1="Kunaji Ring",waist="Gishdubar Sash"})

    sets.midcast['Enhancing Magic'] = {main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','VIT+7','Mag. Acc.+6','"Mag.Atk.Bns."+2',}},
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",
		body="Telchine Chas.",hands="Atrophy Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Olympus Sash",legs="Telchine Braconi",feet="Leth. Houseaux +1"}

    sets.midcast['Refresh III'] = set_combine(sets.midcast['Enhancing Magic'],{head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash",legs="Leth. Fuseau +1"})
	
	sets.midcast['Temper II'] = {main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','VIT+7','Mag. Acc.+6','"Mag.Atk.Bns."+2',}},
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Estoqueur's Cape",waist="Olympus Sash",legs="Carmine Cuisses +1",feet="Leth. Houseaux +1"}
		
	sets.midcast.BarElement = sets.midcast['Temper II']
	
	sets.midcast.Enfire = sets.midcast['Temper II']
	
	sets.midcast.Enstone = sets.midcast['Temper II']
	
	sets.midcast.Enwater = sets.midcast['Temper II']
	
	sets.midcast.Enaero = sets.midcast['Temper II']
	
	sets.midcast.Enblizzard = sets.midcast['Temper II']
	
	sets.midcast.Enthunder = sets.midcast['Temper II']
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],{main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','VIT+7','Mag. Acc.+6','"Mag.Atk.Bns."+2',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'"Fast Cast"+5','Phalanx +3',}},feet={ name="Taeon Boots", augments={'Accuracy+15 Attack+15','"Dual Wield"+5','Phalanx +3',}},})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{neck="Stone Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Haven Hose"})
    
    sets.midcast['Enfeebling Magic'] = {main={ name="Grioavolr", augments={'Enfb.mag. skill +13','MP+96','Mag. Acc.+29','"Mag.Atk.Bns."+18',}},sub="Mephitis Grip",ammo="Pemphredo Tathlum",
		head="Viti. Chapeau +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +1",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Rumination Sash",legs="Chironic Hose",feet="Medium's Sabots"}

	sets.midcast['Enfeebling Magic'].Resistant = {main={ name="Grioavolr", augments={'Enfb.mag. skill +13','MP+96','Mag. Acc.+29','"Mag.Atk.Bns."+18',}},sub="Mephitis Grip",ammo="Pemphredo Tathlum",
		head="Viti. Chapeau +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +1",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Rumination Sash",legs="Chironic Hose",feet="Medium's Sabots"}		
		
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1",feet="Uk'uxkaj Boots"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1"})
    
    sets.midcast['Elemental Magic'] = {main={ name="Grioavolr", augments={'Magic burst mdg.+5%','INT+19','Mag. Acc.+20','"Mag.Atk.Bns."+24','Magic Damage +3',}},sub="Alber Strap",ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','Magic burst mdg.+11%','VIT+10',}},neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.magic_burst = {neck="Mizu. Kubikazari",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst mdg.+10%','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},ring1="Mujin Band",ring2="Locus Ring",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst mdg.+6%','"Mag.Atk.Bns."+10',}}}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {}

    sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {})

    sets.midcast.Drain = {{ name="Grioavolr", augments={'Magic burst mdg.+5%','INT+19','Mag. Acc.+20','"Mag.Atk.Bns."+24','Magic Damage +3',}},ammo="Strobilus",
		head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Hirudinea Earring",ear2="Digni. Earring",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Drain" and "Aspir" potency +8','INT+7','Mag. Acc.+6',}},hands={ name="Helios Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +10','INT+7 MND+7',}},ring1="Evanescence Ring",ring2="Archon Ring",
		back="Perimede Cape",waist="Fucho-no-obi",legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+26','"Drain" and "Aspir" potency +11','"Mag.Atk.Bns."+13',}},feet={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +11','INT+4','Mag. Acc.+4',}}}

    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Blaze Spikes'] = set_combine(sets.midcast['Enhancing Magic'],{legs="Viti. Tights +1"})

	sets.midcast['Ice Spikes'] = set_combine(sets.midcast['Enhancing Magic'],{legs="Viti. Tights +1"})
	
	sets.midcast['Shock Spikes'] = set_combine(sets.midcast['Enhancing Magic'],{legs="Viti. Tights +1"})	
	
    -- Sets for special buff conditions on spells.
        
    sets.buff.ComposureOther = {
	head="Leth. Chappel +1",
	body="Lethargy Sayon +1",hands="Atrophy Gloves +1",
	legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}

    sets.buff.ComposureOther.Refresh = {
	head="Amalric Coif +1",
	body="Lethargy Sayon +1",hands="Atrophy Gloves +1",
	back="Grapevine Cape",legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}	

    sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'DEX+6','AGI+15','"Refresh"+1',}},ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Carmine Cuisses +1",feet="Hippomenes Socks"}

    sets.idle.Town = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'DEX+6','AGI+15','"Refresh"+1',}},ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Carmine Cuisses +1",feet="Hippomenes Socks"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'DEX+6','AGI+15','"Refresh"+1',}},ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Carmine Cuisses +1",feet="Hippomenes Socks"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Ayanmo Corazza +1",hands="Aya. Manopolas +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}

    sets.idle.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'DEX+6','AGI+15','"Refresh"+1',}},ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Carmine Cuisses +1",feet="Hippomenes Socks"}
    
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Ayanmo Corazza +1",hands="Aya. Manopolas +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Shadow Mantle",waist="Fucho-no-obi",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape +1",waist="Slipor Sash",legs="Mes'yohi Slacks",feet="Amalric Nails +1"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Yetshila +1",
        head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},neck="Anu Torque",ear1="Suppanomimi",ear2="Eabani Earring",
        body={ name="Taeon Tabard", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},ring1="Hetairoi Ring",ring2="Petrov Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},waist="Reiki Yotai",legs={ name="Taeon Tights", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}}}
	
	sets.engaged.Acc = set_combine(sets.engaged,{
		head="Carmine Mask +1",neck="Combatant's Torque",ring2="Ramuh Ring +1"})
	
	sets.engaged.HighAcc = set_combine(sets.engaged.Acc,{
		ammo="Amar Cluster",ring1="Ramuh Ring +1",legs="Carmine Cuisses +1"})
		
	sets.engaged.MaxAcc = set_combine(sets.engaged.HighAcc,{
		ammo="Hasty Pinion +1",body="Ayanmo Corazza +1",hands="Aya. Manopolas +1",ring1="Ramuh Ring +1",waist="Reiki Yotai"})
	
	sets.engaged.HighHaste = {ammo="Yetshila +1",
        head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
        body={ name="Taeon Tabard", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}},ring1="Hetairoi Ring",ring2="Petrov Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Reiki Yotai",legs={ name="Taeon Tights", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}},feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}}}
	
	sets.engaged.Acc.HighHaste = set_combine(sets.engaged.HighHaste,{
		head="Carmine Mask +1",neck="Combatant's Torque"})
	
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.Acc.HighHaste,{
		ear1="Mache Earring +1",ring2="Ramuh Ring +1",legs="Carmine Cuisses +1"})
		
	sets.engaged.MaxAcc.HighHaste = set_combine(sets.engaged.HighAcc.HighHaste,{
		ammo="Amar Cluster",body="Ayanmo Corazza +1",hands="Aya. Manopolas +1",ring1="Ramuh Ring +1",waist="Olseni Belt",feet="Aya. Gambieras +1"})
	
	sets.org = {main="Almace",sub="Sequence",range="Excalibur",ammo="Vampirism"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        if buffactive.composure and spell.english == 'Refresh III' and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther.Refresh)
		elseif buffactive.composure and spell.target.type == 'PLAYER' then
			equip(sets.buff.ComposureOther)
		end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
	if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
		equip(sets.magic_burst)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

function job_buff_change(buff, gain)
	if S{'haste','march','mighty guard'}:contains(buff:lower()) then
		determine_haste_group()
		handle_equipping_gear(player.status)
	elseif state.Buff[buff] ~= nil then
		handle_equipping_gear(player.status)
	end
end

function job_update(cmdParams, eventArgs)
	determine_haste_group()
end

function determine_haste_group()

	classes.CustomMeleeGroups:clear()
	
	if (buffactive.haste == 2) or (buffactive.march and buffactive.haste) or (buffactive.haste and buffactive['mighty guard']) then
		classes.CustomMeleeGroups:append('HighHaste')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
        set_macro_page(1, 4)
end