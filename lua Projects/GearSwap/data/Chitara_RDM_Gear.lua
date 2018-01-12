
 
function init_gear_sets()
	
	print('Ewelina_Blm_Gear.lua sidecar loaded')
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {} --{body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {main=gear.FastcastStaff,sub={name="Vivid Strap",order=2},
        head="Nahtirah Hat",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body="Anhur Robe",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Chelona Boots"}
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main={name="Apaisante",order=1},sub={name="Genbu's Shield",order=2},body="Heka's Kalasiris",back="Pahtli Cape"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Carapacho Cuffs",waist="Siegel Sash"})
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Caudata Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
				main={name="Lehbrailg +2",order=1},sub={name="Vivid Strap",order=2},
                head="Nahtirah Hat",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
                body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",
                back="Swith Cape",waist="Phasmida Belt",legs="Artsieq Hose",feet="Battlecast Gaiters"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
                head="Gendewitha Caubeen",neck="Colossus's Torque",ear1='Healing Earring',ear2='Lifestorm Earring',
                body="Heka's Kalasiris",hands="Gendewitha Gages +1",ring1="Ephedra Ring",ring2="Sirona's Ring",
                back="Swith Cape",waist="Bishop's Sash",legs="Gendewitha Spats +1",feet="Gendewitha Galoshes"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {}
	
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
				main={name="Lehbrailg +2",order=1},sub={name='Curatio Grip',order=2},
				neck="Colossus's Torque",ear1='Healing Earring',
				ring1="Ephedra Ring",ring2="Sirona's Ring",
				waist="Bishop's Sash",feet="Gendewitha Galoshes"})
	
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
				main={name="Lehbrailg +2",order=1},sub={name="Fulcio Grip",order=2},
				neck="Colossus's Torque",
				back="Estoqueur's Cape",waist="Olympus Sash",legs="Portent Pants",feet="Estoqueur's Houseaux +2"})
				
	sets.midcast.Protect = {ring1="Sheltered Ring"}
 
	sets.midcast.Shell = {ring1="Sheltered Ring"}

    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}

    sets.midcast.Stoneskin = {main={name="Lehbrailg +2",order=1},sub={name="Fulcio Grip",order=2},
                head="Nahtirah Hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2="Enchanter Earring +1",
                body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",
                back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Gendewitha Galoshes"}
    
    sets.midcast['Enfeebling Magic'] = {main={name="Lehbrailg +2",order=1},sub={name="Mephitis Grip",order=2},ammo="Kalboron Stone",
                head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Estoqueur's Sayon +2",hands="Gendewitha Gages +1",ring1="Sangoma Ring",ring2="Perception Ring",
                back="Ogapepo Cape",waist="Ovate Rope",legs="Gendewitha Spats +1",feet="Artsieq Boots"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Estoqueur's Sayon +2",hands="Hagondes Cuffs",ring1="Sangoma Ring",ring2="Perception Ring",
        back="Ogapepo Cape",waist="Ovate Rope",legs="Gendewitha Spats +1",feet="Artsieq Boots"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Appetence Crown", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"} --hands="Atrophy Gloves +1",
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main=gear.Staff.HMP,
				neck="Eidolon Pendant",
                body="Gendewitha Bliaut +1",ring1="Angha Ring",
                legs="Nares Trews",feet="Chelona Boots"}
    

    -- Idle sets
    sets.idle = {main={name=gear.Staff.PDT,order=1},sub={name="Mephitis Grip",order=2},
		head="Wivre Hairpin",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
		body="Gendewitha Bliaut +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Cheviot Cape",waist="Flume Belt",legs="Nares Trews",feet="Serpentes Sabots"}

    sets.idle.Town = {main={name="Buramenk'ah",order=1},sub={name="Thuellaic Ecu +1",order=2},
		head="Wivre Hairpin",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
		body="Estoqueur's Sayon +2",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Cheviot Cape",waist="Flume Belt",legs="Estoqueur's Fuseau +2",feet="Chelona Boots"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Vitivation Chapeau",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}

    sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha Caubeen +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}
    
    
    -- Defense sets
    sets.defense.PDT = {main={name = gear.Staff.PDT,order=1},sub={name="Mephitis Grip",order=2},ammo="Demonry Stone",
                head="Gendewitha Caubeen",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
                body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1 = gear.DarkRing.physical, ring2 = gear.DarkRing.dt,
                back="Cheviot Cape",waist="Flume Belt",legs="Gendewitha Spats +1",feet="Battlecast Gaiters"}

    sets.defense.MDT = {main={name = gear.Staff.PDT,order=1},sub={name="Mephitis Grip",order=2},ammo="Demonry Stone",
			head="Nahtirah Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
			body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1='Sheltered Ring',ring2=gear.DarkRing.dt,
			back="Engulfer Cape +1",waist="Flume Belt",legs="Bokwus Slops",feet="Battlecast Gaiters"}

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Espial Cap",neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
		body="Bihu Justaucorps",hands="Espial Bracers",ring1="Rajas Ring",ring2=gear.DarkRing.dt,
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Espial Hose",feet="Battlecast Gaiters"}

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end
 