 
function init_gear_sets()
	
	print('Ewelina_WHM_gear.lua side_cart loaded')
		
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
       
 
        --------------------------------------
        -- Start defining the sets
        --------------------------------------
 
        -- Fast cast sets for spells
        sets.precast.FC = {ammo="Incantor Stone",
                neck="Orison Locket",ear2="Loquac. Earring",
                body="Anhur Robe",ring1="Sirona's Ring",
                back="Swith Cape",legs="Orvail Pants +1",feet="Chelona Boots"}
               
        sets.precast.FC.EnhancingMagic = set_combine(sets.precast.FC, {waist="Siegel Sash"})
		
		sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Dynasty mitts",waist="Siegel Sash"})
 
        sets.precast.FC.HealingMagic = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})
 
		sets.precast.FC.StatusRemoval = sets.precast.FC.HealingMagic
 
		sets.precast.FC.Cure = set_combine(sets.precast.FC.HealingMagic, {
               ammo="Incantor Stone",
               body="Heka's Kalasiris",
               back="Pahtli Cape",waist="Witful Belt",feet="Cure Clogs"})
 
        sets.precast.FC.Curaga = sets.precast.FC.Cure
 
       
        -- Precast sets to enhance JAs
        sets.precast.JA.Benediction = {body="Cleric's Briault +2"}
 
        -- Waltz set (chr and vit)
        sets.precast.Waltz = {
                head="Gendewitha Caubeen +1",ear1="Roundel Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",
                back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
       
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
       
        -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Hexa Strike'] = {
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",waist="Light Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
        sets.precast.WS['Mystic Boon'] = {
                head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Tuilha Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
        sets.precast.WS['Flash Nova'] = {
                head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
                body="Bokwus Robe",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
                back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
       
       
        -- Midcast Sets       
        sets.midcast.FastRecast = {
                head="Nahtirah Hat",ear2="Loquacious Earring",
                body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Sirona's Ring",
                back="Swith Cape",waist="Goading Belt",legs="Gendewitha spats",feet="Gendewitha Galoshes"}
       
	   -- Spell skill categories
        sets.midcast.EnhancingMagic = set_combine(sets.midcast.FastRecast, {
				main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},
                body="Heka's kalasiris",hands="Dynasty Mitts",
                legs="Cleric's Pantaloons +2",feet="Orison Duckbills +2"})
 
        sets.midcast.DivineMagic = set_combine(sets.midcast.FastRecast, {main="Tamaxchi",sub="Genbu's Shield",
                head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Manasa Chasuble",hands="Yaoyotl Gloves",ring2="Mediator's Ring",
                back="Refraction Cape",waist="Demonry Sash",legs="Theophany Pantaloons",feet="Orison Duckbills +2"})
 
        sets.midcast.DarkMagic = set_combine(sets.midcast.FastRecast, {main="Tamaxchi", sub="Genbu's Shield",
                head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Manasa Chasuble",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Mediator's Ring",
                back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"})
				
        -- Cure sets
        sets.midcast.CureSolace = {
				main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Orison Earring",ear2="Loquacious Earring",
                body="Orison Bliaud +2",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Tamas Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
 
        sets.midcast.Cure = {
				main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Loquacious Earring",
                body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Tamas Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
 
        sets.midcast.Curaga = {
				main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Loquacious Earring",
                body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Tamas Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
 
        sets.midcast.CureMelee = {ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Loquacious Earring",
                body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Tamas Ring",
                back="Pahtli Cape",waist="Witful Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
 
       
        sets.midcast.Cursna = {
                head="Orison Cap +2",neck="Malison Medallion",
                hands="Hieros Mittens",ring1="Ephedra Ring",
                legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}
 
        sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingMagic,{
				main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},
                head="Nahtirah Hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2='Loquacious Earring',
                body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",
                back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Gendewitha Galoshes"})
				
        sets.midcast.Auspice = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},feet="Orison Duckbills +2"})
 
        sets.midcast.Barspell = set_combine(sets.midcast.EnhancingMagic, {
				main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},
                head="Orison Cap +2",neck="Colossus's Torque",
                body="Orison Bliaud +2",hands="Dynasty Mitts",
                waist="Cascade Belt",legs="Cleric's Pantaloons +2",feet="Orison Duckbills +2"})
 
        sets.midcast.Regen = set_combine(sets.midcast.EnhancingMagic, {
				main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},
                body="Cleric's Briault",hands="Orison Mitts +2",
                legs="Theophany Pantaloons"})
 
        sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
				main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},
                head="Orison Cap +2",legs="Orison Pantaloons +2"})
 
        sets.midcast.Protectra = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},ring1="Sheltered Ring"})
 
        sets.midcast.Shellra = set_combine(sets.midcast.EnhancingMagic, {main={name="Seveneyes",order=1},sub={name="Sors Shield",order=2},ring1="Sheltered Ring",legs="Cleric's Pantaloons +2"})
 
 
        -- Custom spell classes
        sets.midcast.MndEnfeebles = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},
                head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Manasa Chasuble",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Mediator's Ring",
                back="Refraction Cape",waist="Demonry Sash",legs="Gendewitha Spats",feet="Bokwus Boots"}
 
        sets.midcast.IntEnfeebles = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},
                head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
                body="Manasa Chasuble",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Mediator's Ring",
                back="Refraction Cape",waist="Demonry Sash",legs="Orvail Pants +1",feet="Bokwus Boots"}
 
       
        -- Sets to return to when not performing an action.
       
        -- Resting sets
        sets.resting = {main=gear.Staff.HMP,
                head="Nefer Khat +1",
                body="Heka's Kalasiris",hands="Serpentes Cuffs",
                waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
       
 
        -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)		
        sets.idle = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Psystorm Earring",
                body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
                back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Serpentes Sabots"}
 
        sets.idle.PDT = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
                body="Gendewitha Bliaut",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
                back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}
 
        sets.idle.Town = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Psystorm Earring",
                body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
                back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Serpentes Sabots"}
       
        sets.idle.Weak = {main={name="Tamaxchi",order=1},sub={name="Sors Shield",order=2},ammo="Impatiens",
                head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Psystorm Earring",
                body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
                back="Cheviot Cape",waist="Tarutaru sash",legs="Nares Trews",feet="Serpentes Sabots"}
       
        sets.Owleyes = {main="Owleyes", sub="Genbu's Shield"}
       
        -- Defense sets
        sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
                head="Gendewitha Caubeen +1",neck="Twilight Torque",
                body="Gendewitha Bliaut",hands="Gendewitha Gages +1",ring1=leftDarkRing,ring2=rightDarkRing,
                back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
        sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
                head="Theophany Cap +1",neck="Twilight Torque",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1=leftDarkRing,ring2="Shadow Ring",
                back="Engulfer Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
        sets.Kiting = {feet="Herald's Gaiters"}
 
        -- Engaged sets
 
        -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
       
        -- Basic set for if no TP weapon is defined.
        sets.engaged = {
                head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
                back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
 
        -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
        sets.buff['Divine Caress'] = {hands="Orison Mitts +2"}
		
		gear.default.obi_waist = "Goading Belt"
		
		sets.fishing = {
				range="Ebisu Fishing Rod",
				body="Fisherman's Tunica",hands="Fisherman's Gloves",ring1="Puffin Ring",ring2="Noddy Ring",
				legs="Fisherman's Hose",feet="Waders"}
			
end
 
function file_unload()
    -- If you need any custom unload for this job/user
end