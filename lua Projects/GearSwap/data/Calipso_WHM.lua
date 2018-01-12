-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('organizer-lib.lua')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
include('organizer-lib.lua')

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
   -- Options: Override default values
	state.OffenseMode:options('None', 'prep', 'DW', 'Normal')
	
	state.CastingMode:options('Normal', 'Mana')
	state.IdleMode:options('Normal', 'Behe', 'MEva', 'DT')
	
	
	send_command('bind ^` input /ws "Realmrazer" <t>')
	send_command('bind ^= input /ws "Hexa Strike" <t>')
	send_command('bind != input /ja "Haste Samba" <me>')
	send_command('bind ^- input /ws "Mystic Boon" <t>')
	send_command('bind !- input /ma "Auspice" <me>')
	send_command('bind ^= input /ws "Hexa Strike" <t>')
	send_command('bind numpad7 input /ma "Sneak" <stpt>')
	send_command('bind numpad1 input /ma "Invisible" <stpt>')
	send_command('bind numpad0 input /ja "Spectral Jig" <me>')
	send_command('bind numpad. input /ma "Arise" <stpc>')
	
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle DefenseMode')
	send_command('bind !f9 input /lockstyleset 8')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle CastingMode')
	send_command('bind f12 gs c update user')
	send_command('bind !f12 gs c reset defense')
	
	gear.CureHands = {name="Gende. Gages +1", augments={'Phys. dmg. taken -1%','"Cure" spellcasting time -4%',}}
        
	gear.THHands = {name="Chironic Gloves", augments={'Mag. Acc.+21','CHR+2','"Treasure Hunter"+1','Accuracy+19 Attack+19',}}
        

	gear.CasterHead = {name="Chironic Hat", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Conserve MP"+4','CHR+2','Mag. Acc.+15','"Mag.Atk.Bns."+10',}}
        gear.RefreshHead = {name="Chironic Hat", augments={'DEX+3','AGI+2','"Refresh"+2','Accuracy+8 Attack+8','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}

	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
organizer_items = {
   ring="Capacity Ring"
}


    -- Precast Sets

    -- Fast cast sets for spells
	sets.precast.FC = {ammo="Impatiens",
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Dalmatica +1",hands=gear.CureHands,
		ring1="",ring2="",
		back="Perimede Cape",waist="Witful Belt",legs="Kaykaus Tights +1",feet="Regal Pumps"}
		
	sets.precast.FC.EnhancingMagic = set_combine(sets.precast.FC, {waist="Witful belt"})

	sets.precast.FC.HealingMagic = set_combine(sets.precast.FC, {})

	sets.precast.FC.StatusRemoval = sets.precast.FC.HealingMagic

	sets.precast.FC.Cure = set_combine(sets.precast.FC.HealingMagic, {main="Ababinili +1",ear1="Mendi. Earring",
	head="Kaykaus Mitra +1",body="Heka's Kalasiris",ammo="Impatiens",feet="Vanya Clogs",legs="Kaykaus Tights +1",back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {body="Piety Briault +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
    
	
	sets.midcast.FastRecast = {main=gear.RecastStaff,ammo="Impatiens",
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Dalmatica +1",hands=gear.CureHands,
		ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Kaykaus Tights +1",feet="Regal Pumps"}
	
	sets.midcast.Haste = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Storm = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}

	-- Cure sets
	gear.default.obi_waist = "Pythia Sash +1"
	gear.default.obi_back = "Mending Cape"

       -- Cure Pot 50%, Enm-45
	sets.midcast.Cure = {main="Ababinili +1",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Ebers Bliaud +1",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Kaykaus Tights +1",feet="Vanya Clogs"}

       -- Cure Pot 50%, Enm-51
	sets.midcast.Curaga = {main="Ababinili +1",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Kaykaus Tights +1",feet="Vanya Clogs"}

	

	sets.midcast.CureWithLightWeather = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Ebers Bliaud +1",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Kaykaus Tights +1",feet="Vanya Clogs"}


	sets.midcast.CuragaWithLightWeather = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Kaykaus Tights +1",feet="Vanya Clogs"}



	sets.midcast.Cure.Mana = {main="Ababinili +1",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Ebers Bliaud +1",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Ebers Pant. +1",feet="Vanya Clogs"}

	sets.midcast.Curaga.Mana = {main="Ababinili +1",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear2="Glorious Earring",ear1="Novia Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Sirona's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Ebers Pant. +1",feet="Vanya Clogs"}

	

	sets.midcast.CureWithLightWeather.Mana = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Phalaina Locket",ear2="Glorious Earring",ear1="Novia Earring",
		body="Ebers Bliaud +1",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Ebers Pant. +1",feet="Vanya Clogs"}


	sets.midcast.CuragaWithLightWeather.Mana = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",neck="Phalaina Locket",ear2="Glorious Earring",ear1="Novia Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Ebers Pant. +1",feet="Vanya Clogs"}







	sets.midcast.Cursna = {main="Yagrush",sub="Genbu's Shield",
		head="Kaykaus Mitra +1",neck="Malison Medallion",ear2="Beatific Earring",
		body="Ebers Bliaud +1",hands="Fanatic Gloves",ring1="Ephedra Ring",ring2="Haoma's Ring",
		back="Mending Cape",waist="Witful Belt",legs="Theo. Pant. +1",feet="Gendewitha Galoshes +1"}

	sets.midcast.StatusRemoval = {main="Yagrush",sub="Genbu's Shield",
		legs="Ebers Pant. +1"}


	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Genbu's Shield",ear1="Andoaa Earring",
		body="Telchine Chas.",hands="Dynasty Mitts",head="Telchine Cap",neck="Incanter's Torque",
		back="Mending Cape",waist="",legs="Telchine Braconi",feet="Orison Duckbills +2"}

	


	sets.midcast.Stoneskin = {main="Gada",sub="Genbu's Shield",
		body="Telchine Chas.",hands="Dynasty Mitts",head=gear.RefreshHead,neck="Incanter's Torque",
		back="Mending Cape",waist="",legs="Piety Pantaln. +1",feet="Orison Duckbills +2"}

	sets.midcast.Auspice = {main="Oranyan",head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.BarElement = {main="Gada",sub="Genbu's Shield",
		head="Orison Cap +2",neck="Incanter's Torque",
		body="Ebers Bliaud +1",hands="Ebers Mitts +1",
		back="Mending Cape",waist="",legs="Piety Pantaln. +1",feet="Orison Duckbills +2"}

	sets.midcast.Regen = {main="Oranyan",main="Bolelabunga",
		body="Piety Briault +1",hands="Ebers Mitts +1",head="Marduk's Tiara +1",
		legs="Theo. Pant. +1",feet="Telchine Pigaches"}

	sets.midcast.Protectra = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",
		ring1="Sheltered Ring",feet="Piety Duckbills +1"}

	sets.midcast.Protect = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",
		ring1="Sheltered Ring",feet="Telchine Pigaches"}

	sets.midcast.Shellra = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",feet="Telchine Pigaches",
		ring1="Sheltered Ring",legs="Piety Pantaloons +1",hands="Telchine Gloves"}

	sets.midcast.Shell = {main="Oranyan",ammo="Impatiens",
		head="Telchine Cap",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="",ring2="",
		back="Swith Cape +1",waist="Witful Belt",feet="Telchine Pigaches",
		ring1="Sheltered Ring",legs="Piety Pantaln. +1",hands="Telchine Gloves"}

	sets.midcast['Divine Magic'] = {main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.CasterHead,neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Levia. Ring +1",ring2="Levia. Ring +1",
		back="Refraction Cape",waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}

	sets.midcast.Holy = {main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Chironic Hat",neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Levia. Ring +1",ring2="Levia. Ring +1",
		back="Refraction Cape",waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}

		
	sets.midcast['Elemental Magic'] = {main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.CasterHead,neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="",
		back="Refraction Cape",waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}


	sets.midcast['Dark Magic'] = {main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.CasterHead,neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",
		back="Refraction Cape",waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}


	sets.midcast.Stun = {ammo="Impatiens",main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Dalmatica +1",hands="Kaykaus Cuffs +1",ring1="",ring2="",
		back="Perimede Cape",waist="Witful Belt",legs="Kaykaus Tights +1",feet="Medium's Sabots"}

	-- Custom spell classes
	
	sets.midcast.Dia = {hands=gear.THHands,waist="Chaac belt"}

	sets.midcast['Enfeebling Magic'] = {main="Oranyan", sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.CasterHead,neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs +1",ring1="Levia. Ring +1",ring2="Levia. Ring +1",
		back="Refraction Cape",waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}

   

 

   	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head=gear.RefreshHead,neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Novia earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Iaso boots"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head=gear.RefreshHead,neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Infused Earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Iaso boots"}

	sets.idle.DT = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Infused Earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-obi",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}


	sets.idle.MEva = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head=gear.RefreshHead,neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Infused Earring",
		body="Witching Robe",hands="Inyan. Dastanas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +1",feet="Inyan. Crackows +1"}


	sets.idle.Behe= {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head=gear.RefreshHead,neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Dominance Earring",
		body="Onca Suit",ring1="Dark Ring",ring2="Defending Ring",
		back="Tantalic Cape",waist="Fucho-no-obi"}


	sets.idle.Town = {main="Yagrush", sub="Genbu's Shield",ammo="Homiliary",
		head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear2="Glorious Earring",ear1="Novia earring",
		body="Councilor's Garb",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Levia. Ring +1",
		back="Solemnity Cape",waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Iaso boots"}

	sets.idle.Weak = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head=gear.RefreshHead,neck="Loricate Torque +1",ear2="Ethereal earring",ear1="Infused Earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Iaso boots"}
	
	sets.Oneiros = {main="Terra's Staff", sub="Oneiros Grip",waist="Pythia Sash +1"}

	sets.Misc = {main="Arka II"}
	
	sets.Misc2 = {main="Vayuvata II"}

	sets.Misc3 = {waist="Korin Obi"}

	-- Defense sets

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {back="Umbra Cape"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
	


	 -- Weaponskill sets

	sets.engaged.prep = {main="Izcalli", sub="Sindri"}

	sets.engaged = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +1",neck="Clotharius Torque",ear2="Bladeborn Earring",ear1="Steelflash Earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Hetairoi Ring",
		back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}
	
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +1",neck="Clotharius Torque",ear2="Dudgeon Earring",ear1="Heartseeker Earring",
		body="Witching Robe",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Hetairoi Ring",
		back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}


	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Iqabi Necklace",ear2="Bladeborn Earring",ear1="Steelflash Earring",
		body="Onca Suit",ring1="Rajas Ring",ring2="Ifrit Ring +1",
		back="Rancorous Mantle",waist="Prosilio Belt +1"}

	sets.precast.WS['Hexa Strike'] = {ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Nefarious Collar",ear2="Bladeborn Earring",ear1="Steelflash Earring",
		body="Onca Suit",ring1="Rajas Ring",ring2="Ifrit Ring +1",
		back="Rancorous Mantle",waist="Prosilio Belt +1"}

	


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
			elseif world.day_element == 'Light' then
				return 'CureWithLightWeather'

	     end
	end

	if default_spell_map == 'Curaga' then    
		if world.weather_element == 'Light' then
            	return 'CuragaWithLightWeather'
			elseif world.day_element == 'Light' then
				return 'CuragaWithLightWeather'
       		end
	end
    end
end





function job_precast(spell, action, spellMap, eventArgs)
  if spellMap == 'StatusRemoval' then
  if windower.ffxi.get_ability_recasts()[32] < 1 and (spell.target.type == 'PLAYER' or spell.target.name == player.name) and not buffactive.amnesia and not buffactive.charm and spell.english ~= "Erase" then
   cancel_spell()
  send_command('@input /ja "Divine Caress" <me>; wait 1.25; input /ma "'..spell.name..'" '..spell.target.name)
  end
  end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
	 elseif newValue == 'DW' then
            disable('main','sub','range')
	
       	elseif newValue == 'None' then
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.mpp < 75 and state.IdleMode == "Normal" and state.Defense.Active == false then
		idleSet = set_combine(idleSet, sets.Oneiros)
	end
	
	return idleSet
end



-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
   display_current_caster_state()
   
       
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 4)
end

function job_setup()
	custom_timers = {}
end

function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.name == 'Haste' then
		adjust_timers(spell, spellMap)
	elseif string.find(spell.name,'Auspice') then
		adjust_timers(spell, spellMap)
	
	elseif string.find(spell.name,'storm') then
		adjust_timers(spell, spellMap)
	elseif string.find(spell.name,'Boost') then
		adjust_timers(spell, spellMap)	
	elseif string.find(spell.name,'Regen') then
		adjust_timers(spell, spellMap)	
	
	end
end

function adjust_timers(spell, spellMap)
    local current_time = os.time()
    local temp_timer_list = {}
    local dur = calculate_duration(spell, spellName, spellMap)
         custom_timers[spell.name] = nil
         send_command('timers delete "'..spell.name..' ['..spell.target.name..']"')
         custom_timers[spell.name] = current_time + dur
         send_command('@wait 1;timers create "'..spell.name..' ['..spell.target.name..']" '..dur..' down')
end

function calculate_duration(spell, spellName, spellMap)

    local mult = 1.00
	if player.equipment.Head == 'Telchine Cap' then mult = mult + 0.1 end
	if player.equipment.Body == 'Telchine Chas.' then mult = mult + 0.1 end
	if player.equipment.Hands == 'Telchine Gloves' then mult = mult + 0.1 end
	if player.equipment.Legs == 'Telchine Braconi' then mult = mult + 0.1 end
	if player.equipment.Feet == 'Telchine Pigaches' then mult = mult + 0.1 end

	if player.equipment.Hands == 'Dynasty Mitts' then mult = mult + 0.05 end
	if player.equipment.Main == 'Oranyan' then mult = mult + 0.1 end
	if player.equipment.Main == 'Gada' then mult = mult + 0.05 end
	
	if player.equipment.Feet == 'Estq. Houseaux +2' then mult = mult + 0.20 end
	if player.equipment.Legs == 'Futhark Trousers' then mult = mult + 0.10 end
	if player.equipment.Legs == 'Futhark Trousers +1' then mult = mult + 0.20 end
	if player.equipment.Hands == 'Atrophy Gloves' then mult = mult + 0.15 end
	if player.equipment.Hands == 'Atrophy Gloves +1' then mult = mult + 0.16 end
	if player.equipment.Back == 'Estoqueur\'s Cape' then mult = mult + 0.10 end
	if player.equipment.Hands == 'Dynasty Mitts' then mult = mult + 0.05 end
	if player.equipment.Body == 'Shabti Cuirass' then mult = mult + 0.09 end
	if player.equipment.Body == 'Shabti Cuirass +1' then mult = mult + 0.10 end
	if player.equipment.Feet == 'Leth. Houseaux' then mult = mult + 0.25 end
	if player.equipment.Feet == 'Leth. Houseaux +1' then mult = mult + 0.30 end
	local base = 0

	if spell.name == 'Haste' then base = base + 180 end
	if spell.name == 'Stoneskin' then base = base + 300 end
	if spell.name:startswith("Bar") then base = base + 480 end
	if spell.name == 'Blink' then base = base + 300 end
	if spell.name == 'Aquaveil' then base = base + 600 end
	if string.find(spell.english,'storm') then base = base + 180 end
	if spell.name == 'Auspice' then base = base + 180 end
	if spell.name:startswith("Boost") then base = base + 300 end
	if spell.name == 'Phalanx' then base = base + 180 end
	if spell.name:startswith("Protect") then base = base + 1800 end
	if spell.name:startswith("Shell") then base = base + 1800 end
	if spell.name:startswith("Refresh") then base = base + 150 end
	if spell.name:startswith("Regen") then 
		base = base + 60
		if buffactive['Light arts'] and player.main_job == 'SCH' then
			base = base*2+60
		-----the *2 here is the additional 60sec from Light Arts job points maxed
		-----+48 is from light arts, +12 more from telchine chas.
		elseif player.main_job == 'WHM' then
			base = base + 60
			if player.equipment.Hands == 'Ebers Mitts' then 
				base = base +  20
			elseif player.equipment.Hands == 'Ebers Mitts +1' then 
				base = base + 22
			end
			if player.equipment.Legs == 'Theo. Pantaloons' or player.equipment.Legs == 'Theo. Pant. +1' then
				base = base + 18
			end
		end
	end
	if spell.name == 'Adloquium' then base = base + 180 end
	if spell.name:startswith("Animus") then base = base + 180 end
	if spell.name == 'Crusade' then base = base + 300 end
	if spell.name == 'Embrava' then base = base + 90 end
	if spell.name:startswith("En") then base = base + 180 end
	if spell.name:startswith("Flurry") then base = base + 180 end
	if spell.name == 'Foil' then base = base + 30 end
	if spell.name:startswith("Gain") then base = base + 180 end
	if spell.name == 'Reprisal' then base = base + 60 end
	if spell.name:startswith("Temper") then base = base + 180 end
	if string.find(spell.english,'Spikes') then base = base + 180 end

	if buffactive['Perpetuance'] then
		if player.equipment.Hands == 'Arbatel Bracers' then
			mult = mult*2.5
		elseif player.equipment.Hands == 'Arbatel Bracers +1' then
			mult = mult*2.55
		else
			mult = mult*2
		end
	end
	if buffactive['Composure'] then
		if spell.target.type == 'SELF' then
			mult = mult*3
		else
			mult = mult
		end
	end
			
    local totalDuration = math.floor(mult*base)

	---print(totalDuration)

    return totalDuration
end

function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end