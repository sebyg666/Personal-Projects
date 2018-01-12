 
function init_gear_sets()
	
	print('Chitara_WHM_gear.lua side_cart loaded')
		
	--------------------------------------
	-- Augmented Gear and other gear Renames
	--------------------------------------
	Arka_IV		={ name="Arka IV", augments={'"Cure" potency +24%',}}
	Tamaxchi	={ name="Tamaxchi", augments={'Mag. Acc.+30','Enmity-10',}}
	Queller_Rod	={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}

	Gende_hands	={ name="Gende. Gages +1", augments={'Phys. dmg. taken -2%','"Cure" potency +6%',}}
	Gende_feet	={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -2%','Magic dmg. taken -3%','"Cure" potency +1%',}}
	
	Vanya_head_FC	={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	
	Vanya_head_Cure	={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	Vanya_body_Cure	={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	Telch_head_Enh	={ name="Telchine Cap", augments={'Pet: "Mag.Atk.Bns."+4','Pet: "Regen"+3','Enh. Mag. eff. dur. +7',}}
	Telch_body_Enh	={ name="Telchine Chas.", augments={'Mag. Evasion+14','Pet: "Regen"+2','Enh. Mag. eff. dur. +7',}}
	Telch_legs_Enh	={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +9',}}
    Telch_feet_Enh	={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +7',}}
	
	Telch_hands_regen	={ name="Telchine Gloves", augments={'"Fast Cast"+5','"Regen" potency+2',}}
	--hands={ name="Telchine Gloves", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','"Fast Cast"+3','INT+2 MND+2',}}
	
	Chironic_hands_phalanx		={ name="Chironic Gloves", augments={'Magic dmg. taken -2%','AGI+5','Phalanx +4','Accuracy+9 Attack+9','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}
	
	Chironic_body				={ name="Chironic Doublet", augments={'Mag. Acc.+15','"Cure" potency +11%','"Mag.Atk.Bns."+14',}}
	Chironic_hands				={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+11','"Drain" and "Aspir" potency +8','Mag. Acc.+3',}}
	Chironic_legs				={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Cure" potency +3%','INT+2',}}
	Chironic_feet				={ name="Chironic Slippers", augments={'Mag. Acc.+25','Attack+4','Magic burst mdg.+15%','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	
	Kaykaus_head	={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}
	Kaykaus_hands	={ name="Kaykaus cuffs", augments={'MP+60','MND+10','Mag. Acc.+15'}}
	Kaykaus_feet	={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}
	
	DT_ring		={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Phys. dmg. taken -4%','Magic dmg. taken -3%',}}
	
	FC_back		={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Evasion+4','"Fast Cast"+10',}}
	Mending_back	={ name="Mending Cape", augments={'Healing magic skill +10','Enha.mag. skill +9','Mag. Acc.+10',}}
	
	AF_head 			={ name="Theophany Cap +1" }
	AF_body				={ name="Theophany Briault +2" }
	AF_hands 			={ name="Theophany Mitts +2" }
	AF_legs 			={ name="Theophany Pantaloons +2" }
	AF_feet 			={ name="Theophany Duckbills +2" }
	
	Relic_head			={ name="Piety Cap", 			augments={'Enhances "Devotion" effect',}}
	Relic_body			={ name="Piety Briault +1", 	augments={'Enhances "Benediction" effect',}}
    Relic_hands			={ name="Piety Mitts",			augments={'Enhances "Martyr" effect',}}
	Relic_legs			={ name="Piety Pantaloons +1", 	augments={'Enhances "Shellra V" effect',}}
	Relic_feet			={ name="Piety Duckbills +1", 	augments={'Enhances "Protectra V" effect',}}
		
	Empy_head 			={ name="Ebers Cap +1" }
	Empy_body			={ name="Ebers Bliaud +1" }
	Empy_hands			={ name="Ebers Mitts +1" }
	Empy_legs 			={ name="Ebers Pantaloons +1" }
	Empy_feet 			={ name="Ebers Duckbills" }
	
	----
	-- items to get
	---
	-- Regal pumps to +1
	-- kaykaus head path B, hands path A
	-- grioavolr (staff for FC) augmented
	-- Chironic head
	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
	-- 69% FC
    sets.precast.FC = {main="Exemplar",sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
		haed=Vanya_head_FC,neck="Orunmila's Torque",ear1="Loquacious earring",ear2="Enchntr. Earring +1",
		body="Anhur Robe",hands=Gende_hands,ring1="Prolix Ring",ring2="Kishar Ring",
		back=FC_back,waist="Witful belt",legs="Aya. Cosciales +1",feet="Regal Pumps"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",legs="Doyen Pants"})
	
	--64% FC + 13% healing cast time = 77%
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs=Empy_legs})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
	--26% cure cast time + 13% healing cast time + 49% FC = 88% FC (80% cap) + 4% quick
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main=Queller_Rod,sub={name="Sors Shield",priority=-1},
		ear1="Nourish. Earring +1",ear2="Mendi. Earring",
		ring1="Lebeche ring",
		feet=Kaykaus_feet})
		
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Benediction'] = {body=Relic_body}
	 sets.precast.JA['Devotion'] = {head=Relic_head}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    
    sets.precast.WS['Flash Nova'] = {}
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = sets.precast.FC
    
    -- Cure sets
    sets.midcast.Cure = {main=Queller_Rod,sub={name="Sors Shield",priority=-1},
		head=Vanya_head_Cure,neck="Incanter's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body=Empy_body,hands=AF_hands,ring1="Lebeche ring",ring2="Levia. Ring +1",
		back=Mending_back,waist="Witful Belt",legs=Empy_legs,feet=Kaykaus_feet}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast['Cure With Weather'] = {main="Chatoyant Staff",
		head=Vanya_head_Cure,neck="Incanter's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body=Empy_body,hands=Empy_hands,ring1="Lebeche ring",ring2="Levia. Ring +1",   ----- replace hands for kaykaus path A
		back="Twilight Cape",waist="Hachirin-no-Obi",legs=Empy_legs,feet=Kaykaus_feet}
	
	sets.midcast['Curaga With Weather'] = set_combine(sets.midcast['Cure With Weather'], {neck="Nuna Gorget +1",body=AF_body,ring2="Levia. Ring +1"})
	
    sets.midcast.Cursna = {
		head=Vanya_head_Cure,neck="Malison Medalion",ear1="Healing Earring",ear2="Beatific Earring",
		body=Empy_body,ring1="Ephedra Ring",ring1="Haoma's Ring",
		back=FC_back,waist="Witful Belt",legs=AF_legs,feet=Gende_feet}

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,{head=Empy_head,hands=Empy_hands,
		back=Mending_back,legs=Empy_legs})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main="Exemplar",
		head=Telch_head_Enh,
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		waist="Olympus Sash",legs=Telch_legs_Enh,feet=AF_feet})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",head="Inyanga Tiara +1",body=Relic_body,hands=Empy_hands,legs=AF_legs})

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",waist="Emphatikos Rope"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear1='Earthcry Earring',waist="Siegel Sash",legs="Haven Hose"})
    
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main="Beneficus",
		head=Empy_head,neck="Incanter's Torque",
		body=Empy_body,hands=Empy_hands,
		back=FC_back,legs=Relic_legs,feet=Empy_feet
		})
	
	sets.midcast.bar_status	= sets.midcast.BarElement
	
	sets.midcast['Auspice'] = set_combine(sets.midcast['Enhancing Magic'], {feet=Empy_feet})
	
	-- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring",feet=Relic_feet})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring",legs=Relic_legs})
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})


    sets.midcast['Divine Magic'] = set_combine(sets.midcast.FastRecast,{})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast,{})

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="Exemplar",sub={name="Enki Strap",priority=-1},
		head="Befouled Crown",neck="Imbodla Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body=AF_body,hands=Kaykaus_hands,ring1="Levia. Ring +1",ring2="Kishar Ring",
		back=FC_back,waist="Ovate Rope",legs=Chironic_legs,feet=AF_feet}

    sets.midcast.IntEnfeebles = set_combine( sets.midcast.MndEnfeebles, {ring1="Vertigo Ring"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

    sets.idle.PDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.idle.Town = {}
    
    sets.idle.Weak = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}
    
    -- Defense sets

    sets.defense.PDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.defense.MDT = {main=Queller_Rod,sub={name="Genbu's Shield",priority=-1},ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=Empy_body,hands="Serpentes Cuffs",ring1="Defending Ring",ring2=DT_ring,
		waist="Slipor Sash",legs="Assiduity Pants +1",feet=Gende_feet}

    sets.Kiting = {}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.CP = {back="Mecistopins Mantle"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end