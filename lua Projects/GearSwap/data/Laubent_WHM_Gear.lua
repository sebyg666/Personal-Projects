 
function init_gear_sets()
	
	print('Laubent_WHM_gear.lua side_cart loaded')
		
		-- Additional local binds		
        
       
        -- Options: Override default values
        options.OffenseModes = {'None', 'Normal'}
        options.DefenseModes = {'Normal'}
        options.WeaponskillModes = {'Normal'}
        options.CastingModes = {'Normal', 'Resistant', 'Dire'}
        options.IdleModes = {'Normal', 'PDT'}
        options.RestingModes = {'Normal'}
        options.PhysicalDefenseModes = {'PDT'}
        options.MagicalDefenseModes = {'MDT'}
       
        state.Defense.PhysicalMode = 'PDT'
        state.OffenseMode = 'None'
		
		--Enhancing magic duration augment as a % for each peice
		Telchine_Head 	= 0
		Telchine_Body 	= 0.05
		Telchine_Hands	= 0
		Telchine_Legs 	= 0
        Telchine_Feet 	= 0.03
		
        --------------------------------------
        -- Start defining the sets
        --------------------------------------
 
        -- Fast cast sets for spells
        sets.precast.FC = {ammo="Impatiens",
                neck="Voltsurge Torque",ear2="Loquac. Earring",head="Nahtirah hat",ear1="Etiolation Earring",
                body="Inyanga Jubbah +1",ring1="Prolix Ring",ring2="Lebeche Ring",hands="Fanatic Gloves",waist="Witful belt",
                back="Alaunus's Cape",legs="Lengo Pants",feet="Regal Pumps"}
               
        sets.precast.FC.EnhancingMagic = set_combine(sets.precast.FC, {waist="Siegel Sash"})
		
		sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Dynasty mitts",waist="Siegel Sash",head="Umuthi Hat"})
 
        sets.precast.FC.HealingMagic = set_combine(sets.precast.FC, {legs="Ebers pantaloons +1"})
 
		sets.precast.FC.StatusRemoval = sets.precast.FC.HealingMagic
 
		sets.precast.FC.Cure = set_combine(sets.precast.FC.HealingMagic, {
               body="Heka's kalasiris",neck="Aceso's choker +1",ring2="Sirona's Ring",legs="Ebers pantaloons +1",ear1="Mendicant's Earring+1",ear2="Mendicant's Earring",
               back="Alaunus's Cape",waist="Witful Belt",feet="Hygieia Clogs"})
 
        sets.precast.FC.Curaga = sets.precast.FC.Cure
 
       
        -- Precast sets to enhance JAs
        sets.precast.JA.Benediction = {body="Cleric's Briault +2"}
 
        -- Waltz set (chr and vit)
        sets.precast.Waltz = {
                head="Gendewitha Caubeen",ear1="Roundel Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",
                back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
       
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {main={name="Nehushtan",order=1},
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",legs="Artsieq hose",feet="Gendewitha Galoshes"}
       
        -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Hexa Strike'] = {main={name="Nehushtan",order=1},
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",waist="Light Belt",legs="Artsieq hose",feet="Gendewitha Galoshes"}
 
        sets.precast.WS['Mystic Boon'] = {main={name="Nehushtan",order=1},
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",legs="Artsieq hose",feet="Gendewitha Galoshes"}
 
        sets.precast.WS['Flash Nova'] = {main={name="Nehushtan",order=1},
                head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
                back="Toro Cape",waist="Thunder Belt",legs="Artsieq hose",feet="Gendewitha Galoshes"}
       
       
        -- Midcast Sets       
        sets.midcast.FastRecast = {
                head="Nahtirah Hat",ear2="Loquacious Earring",
                body="Telchine Chasuble",hands="Gendewitha Gages",ring1="Sirona's Ring",
                back="Swith Cape",waist="Goading Belt",legs="Artsieq hose",feet="Telchine Pigaches"}
       
	   -- Spell skill categories
        sets.midcast.EnhancingMagic = set_combine(sets.midcast.FastRecast, {
                body="Anhur robe",hands="Dynasty Mitts",back="Mending cape",neck="Enhancing Torque",waist="Cascade belt",ear1="Andoaa earring",
                legs="Piety Pantaloons",head="Befouled Crown",feet="Ebers duckbills"})
 
        sets.midcast.DivineMagic = set_combine(sets.midcast.FastRecast, {main="Tamaxchi",sub="Genbu's Shield",
                head="Chironic Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Gendewitha Bliaut",hands="Fanatic Gloves",ring2="Globidonta ring",ammo="Pemphredo Tathlum",
                back="Refraction Cape",waist="Refoccilation Stone",legs="Chironic Hose",feet="Ebers Duckbills"})
 
        sets.midcast.DarkMagic = set_combine(sets.midcast.FastRecast, {main="Tamaxchi", sub="Genbu's Shield",
                head="Nahtirah Hat",neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Maquette ring",
                back="Refraction Cape",waist="Demonry Sash",legs="Artsieq hose",feet="Telchine Pigaches"})
				
        -- Cure sets
        sets.midcast.CureSolace = {
				ammo="Impatiens",
                head="Kaykaus Mitra",neck="Orison Locket",ear1="Mendicant's Earring",ear2="Glorious Earring",
                body="Theo. Briault +1",hands="Theo. mitts +1",ring1="Sirona's Ring",ring2="Ephedra Ring",
                back="Solemnity Cape",feet="Vanya Clogs",waist="Witful Belt",legs="Ebers pantaloons +1",}
 
        sets.midcast.Cure = {
				ammo="Impatiens",
                head="Kaykaus Mitra",neck="Orison Locket",ear1="Mendicant's Earring",ear2="Glorious Earring",
                body="Theo. Briault +1",hands="Theo. mitts +1",ring1="Sirona's Ring",ring2="Ephedra Ring",
                back="Pahtli Cape",feet="Vanya Clogs",waist="Witful Belt",legs="Ebers pantaloons +1",}
 
        sets.midcast.Curaga = {
				mmo="Impatiens",
                head="Kaykaus Mitra",neck="Orison Locket",ear1="Mendicant's Earring",ear2="Glorious Earring",
                body="Theo. Briault +1",hands="Theo. mitts +1",ring1="Sirona's Ring",ring2="Ephedra Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Ebers pantaloons +1",}
 
        sets.midcast.CureMelee = {ammo="Impatiens",
                head="Gendewitha Caubeen",neck="Orison Locket",ear1="Nourishing Earring",ear2="Loquacious Earring",
                body="Gendewitha Bliaut",hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Ephedra Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Ebers pantaloons +1",feet="Gendewitha Galoshes"}
 
       
        sets.midcast.Cursna = {
                head="Ebers Cap",neck="Malison Medallion",back="Alaunus's Cape",
                hands="Fanatic Gloves",ring1="Ephedra Ring",
                legs="Theophany Pantaloons",feet="Vanya Clogs"}
 
        sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingMagic,{
				main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},
                head="Nahtirah Hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2='Loquacious Earring',
                body="Telchine Chasuble",hands="Gendewitha Gages",ring1="Prolix Ring",
                back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Gendewitha Galoshes"})
				
        sets.midcast.Auspice = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},feet="Ebers Duckbills"})
 
        sets.midcast.Barspell = set_combine(sets.midcast.EnhancingMagic, {
				main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},
                head="Ebers Cap",neck="Colossus's Torque",
                body="Ebers Briault",hands="Dynasty Mitts",
                waist="Cascade Belt",legs="Piety Pantaloons",feet="Ebers Duckbills"})
 
        sets.midcast.Regen = set_combine(sets.midcast.EnhancingMagic, {
				main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},
                body="Telchine Chasuble",hands="Ebers Mitts",head="Inyanga Tiara+1",
                legs="Theophany Pantaloons", feet="Telchine Pigaches"})
 
        sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
				main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},
                head="Ebers Cap",legs="Ebers pantaloons +1"})
 
        sets.midcast.Protectra = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},ring1="Sheltered Ring"})
 
        sets.midcast.Shellra = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Genbu's Shield",order=2},ring1="Sheltered Ring",legs="Cleric's Pantaloons +2"})
 
 
        -- Custom spell classes
        sets.midcast.MndEnfeebles = {main={name="Queller Rod",order=1},sub={name="Sors Shield",order=2},
                head="Chironic hat",neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Witching Robe",hands="Chironic Gloves",ring1="Globidonta Ring",ring2="Shiva Ring",
                back="Refraction Cape",waist="Refoccilation Stone",legs="Chironic Hose",feet="Vanya Clogs"}
 
 
        sets.midcast.IntEnfeebles = {main={name="Queller Rod",order=1},sub={name="Sors Shield",order=2},
               head="Chironic hat",neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Witching Robe",hands="Chironic Gloves",ring1="Globidonta Ring",ring2="Shiva Ring",
                back="Refraction Cape",waist="Refoccilation Stone",legs="Chironic Hose",feet="Vanya Clogs"}
 
 
       
        -- Sets to return to when not performing an action.
       
        -- Resting sets
        sets.resting = {main=gear.Staff.HMP,
                head="Wivre Hairpin",
                body="Gendewitha Bliaut",hands="Serpentes Cuffs",
                waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
       
 
        -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)		
        sets.idle = {main={name="Tamaxchi",order=1},sub={name="Genbu's Shield",order=2},ammo="Homiliary",
                neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",head="Befouled Crown",
                body="Theophany Briault +1",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Vocane Ring",
                back="Kumbira Cape",waist="Fucho-no-obi",legs="Assid. pants +1",feet="Serpentes Sabots"}
 
        sets.idle.PDT = {main={name="Tamaxchi",order=1},sub={name="Genbu's Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Loquacious Earring",
                body="Gendewitha Bliaut",hands="Gendewitha Gages ",ring1="Defending Ring",ring2="Vocane Ring",
                back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Herald's Gaiters"}
 
       
       
       
        -- Defense sets
        sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
                head="Gendewitha Caubeen",neck="Loricate Torque +1",
                body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1=leftDarkRing,ring2=rightDarkRing,
                back="Umbra Cape",legs="Artsieq hose",feet="Gendewitha Galoshes"}
 
        sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
                head="Theophany Cap +1",neck="Loricate Torque +1",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1=leftDarkRing,ring2="Shadow Ring",
                back="Engulfer Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
        sets.Kiting = {feet="Herald's Gaiters"}
 
        -- Engaged sets
 
        -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
       
        -- Basic set for if no TP weapon is defined.
        sets.engaged = {main={name="Nehushtan",order=1},
                head="Chironic Hat",neck="Lissome Necklace",ear1="Dignitary's Earring",ear2="Zennaroi Earring",
                body="Witching Robe",hands="Chironic Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Umbra Cape",waist="Olseni belt",legs="Chironic Hose",feet="Vanya Clogs"}
 
 
        -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
        sets.buff['Divine Caress'] = {hands="Ebers Mitts"}
		
		gear.default.obi_waist = "Goading Belt"
		
		sets.fishing = {
				range="Ebisu Fishing Rod",
				body="Fisherman's Tunica",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
				legs="Fisherman's Hose",feet="Waders"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end