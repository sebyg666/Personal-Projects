function get_sets()
    
    -- add macro /console gs c MeleeMode 

    send_command('input /macro book 3')
    send_command('input /macro set 2')

    DDMode          = true
    PDTMode         = false
    MDTMode         = false

    Idel = {ammo="Vanir Battery",         head="Erilaz Galea + 1",    neck="Wiglen Gorget",
            ear1="Bladeborn Earring",     ear2="Steelflash Earring",  body="Erilaz Surcoat +1", 
            hands="Erilaz Gauntlets +1", ring1="Sheltered Ring",     ring2="Paguroidea Ring",
             back="Evasionist's Cape",   waist="Flume Belt",          legs="Carmine Cuisses +1", 
             feet="Erilaz Greaves +1"}

    Trust = {body="yoran unity shirt"}
      
    Enmity = {  ammo="Aqreqaq Bomblet",     head="halitus Helm",  neck="Unmoving collar +1",
                ear1="Pluto's Pearl",   ear2="Friomisi Earring",  body="Erilaz Surcoat +1",
               hands="Futhark Mitons +1",  ring1="Odium Ring",       ring2="Petrov Ring",          
                 back="Fravashi Mantle",  waist="gaoding Belt",    legs="Eri. Leg Guards +1"}
 
    Aftermath = { head="Highwing Helm",  neck="Asperity Necklace", hands="Taeon Gloves",
                 ring1="Rajas Ring",    ring2="K'ayres Ring",      waist="Windbuffet Belt +1", 
                  feet="Thereoid Greaves"}

    FastCast = { head="Rune. Bandeau +1", ear1="Loquacious Earring", body="Erilaz Surcoat +1", 
                hands="Sombra Mittens",  ring2="Prolix Ring",        legs="Orvail Pants +1", 
                 feet="Chelona Boots"}

    Enhancing = {hands="runeist mitons +1", legs="futhark trousers +1", head="erilaz galea +1"}

    Regen = {head = "Runeist Bandeau +1" }

    Vallation       = {body="Runeist coat +1", legs="Futhark trousers",  back="Ogma's cape"}
    Valiance        = {body="Runeist coat +1", legs="Futhark trousers",  back="Ogma's cape"}
    Pflug           = {feet="Runeist bottes +1"}
    Battuta         = {head="Fu. Bandeau +1"}
    Liement         = {body="Futhark Coat +1"}
    Gambit          = {hands="Runeist Mitons +1"}
    Rayke           = {feet="Futhark Bottes +1"}
    ElementalSforzo = {body="Futhark Coat 1"}
    Swordplay       = {hands="Futhark Mitons +1"}
    Embolden        = {back="Evasionist's Cape"}
    Phalanx         = {head= "Futhark bandeau +1"}

    VivaciousPulse = {head="Erilaz Galea +1", neck="Henic torque", ring1="Globidonta Ring",
                     waist="Bishop's sash",   legs="runeist trousers +1"}

    Dimidiation ={ammo="Jukukik Feather",     head="Rune. Bandeau +1", neck="Fotia Gorget",
                  ear1="Flock Earring",       ear2="Thunder Pearl",    body="Erilaz Surcoat +1", 
                 hands="Erilaz Gauntlets +1",ring1="Ramuh Ring",      ring2="Ramuh Ring",
                  back="Kayapa Cape",        waist="Fotia Belt",       legs="Sombra Tights", 
                  feet="Erilaz Greaves +1"}

    WeaponSkill={ammo="Jukukik Feather",     head="Whirlpool Mask",     neck="Fotia Gorget",
                 ear1="Bladeborn Earring",   ear2="Steelflash Earring", body="Erilaz Surcoat +1",
                hands="Erilaz Gauntlets +1",ring1="Rajas Ring",        ring2="Epona's Ring",
                 back="Buquwik Cape",       waist="Fotia Belt",         legs="Quiahuiz Trousers",
                 feet="Qaaxo Leggings"}

    DD = {ammo="Vanir Battery",         head="Erilaz Galea +1",    neck="Asperity Necklace",
          ear1="Zannario Earring",    ear2="Steelflash Earring", body="Erilaz Surcoat +1", 
         hands="Erilaz Gauntlets +1", ring1="Rajas Ring",        ring2="Epona's Ring",
          back="Atheling Mantle",     waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", 
          feet="Erilaz Greaves +1"}

    PDT = {ammo="Honed Tathlum",      head="Futhark Bandeau +1", neck="Twilight Torque",
           body="Erilaz Surcoat +1", hands="Umuthi Gloves", ear1="Zennaroi Earring", 
           ear2="Steelflash Earring",ring1="Defending Ring",ring2="Vocane Ring",
           legs="Eri. Leg Guards +1", feet="Erilaz Greaves +1"}

    MDT = {ammo="Vanir Battery",        head="Erilaz Galea +1", neck="Twilight Torque",
           ear1="Ethereal Earring",     ear2="Hearty Earring",  body="Erilaz Surcoat +1",
          hands="Erilaz Gauntlets +1", ring1="Defending Ring", ring2="Vocane Ring",
           back="Engulfer Cape +1",    waist="Flume Belt",      legs="Erilaz Leg Guards +1", 
           feet="Erilaz Greaves +1"}

end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()


end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill()

    if player.tp > 999 then
        if  Name == "Dimidiation" then
            equip( Dimidiation )
        else
            equip( WeaponSkill )
        end
    else
         cancel_spell()
    end 
end
--------------------------------------------------------------------------------------------------------------------
function VallationSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Vallation Detected: Vallation Gear +Enmity')
        equip(Enmity)
        equip(Vallation)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function ValianceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Valiance Detected: Valiance Gear +Enmity')
        equip(Enmity)
        equip(Valiance)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function PflugSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Pflug Detected: Pflug Gear +Enmity')
        equip(Enmity)
        equip(Pflug)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function BattutaSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Battuta Detected: Battuta Gear +Enmity')
        equip(Enmity)
        equip(Battuta)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function LiementSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Liement Detected: Liement Gear +Enmity')
        equip(Enmity)
        equip(Liement)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function GambitSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Gambit Detected: Gambit Gear +Enmity')
        equip(Enmity)
        equip(Gambit)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function RaykeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Rayke Detected: Rayke Gear +Enmity')
        equip(Enmity)
        equip(Rayke)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function ElementalSforzoSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'ElementalSforzo Detected: ElementalSforzo Gear +Enmity')
        equip(Enmity)
        equip(ElementalSforzo)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function SwordplaySpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Swordplay Detected: Swordplay Gear +Enmity')
        equip(Enmity)
        equip(Swordplay)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function EmboldenSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Embolden Detected: Embolden Gear +Enmity')
        equip(Enmity)
        equip(Embolden)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function VivaciousPulseSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'VivaciousPulse Detected: VivaciousPulse Gear +Enmity')
        equip(Enmity)
        equip(VivaciousPulse)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function PhalanxSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID]  < 1 then 
            add_to_chat(158,'Phalanx Detected: Phalanx Gear')
            equip(Enmity)
            equip(Phalanx)
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: Enmity Gear')
            equip(Enmity)
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID] < 1 then
           add_to_chat(158,Name..' Detected: Fast Cast +Enimty Gear')
           equip(Enmity)
           equip(FastCast)
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------
function FlashSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: Enimty Gear')
            equip( Enmity )
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill()      
    elseif Spell.name == "Flash" then
        FlashSpell(Spell)
    elseif Spell.name == "Enlight II" then
        EnlightSpell(Spell)
    elseif Spell.name == "Phalanx" then
        PhalanxSpell(Spell)
    elseif Spell.name == "Vallation" then
        VallationSpell(Spell)
    elseif Spell.name == "Valiance" then
        ValianceSpell(Spell)
    elseif Spell.name == "Pflug" then
        PflugSpell(Spell)
    elseif Spell.name == "Battuta" then
        BattutaSpell(Spell)
    elseif Spell.name == "Liement" then
        LiementSpell(Spell)
    elseif Spell.name == "Gambit" then
        GambitSpell(Spell)
    elseif Spell.name == "Rayke" then
        RaykeSpell(Spell)
    elseif Spell.name == "Elemental Sforzo" then
        ElementalSforzoSpell(Spell)
    elseif Spell.name == "Swordplay" then
        SwordplaySpell(Spell)
    elseif Spell.name == "Embolden" then
        EmboldenSpell(Spell)
    elseif Spell.name == "Vivacious Pulse" then
        VivaciousPulseSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type=="BlackMagic" or Spell.type=="WhiteMagic" then
        MagicSpell(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else

    end
end
------------------------------------------------------------------------------------------------
function midcast(Spell)

    if Spell.skill == "Enhancing Magic" then
        equip( Enhancing )
 
        if Spell.name == "Regen" or Spell.name == "Regen ii" or Spell.name == "Regen iii" or Spell.name == "Regen iv" then
            equip ( Regen )
        end
    end
end
------------------------------------------------------------------------------------------------
function aftercast(Spell)
    SetPostEventGear()
end
------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)

end
---------------------------------------------------------------------------------------------
function status_change(new,old)
    SetPostEventGear()
end 
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if DDMode == true then      
        equip(DD)
    elseif PDTMode == true then
        equip(PDT)
    elseif MDTMode == true then
        equip(MDT)
    else
        add_to_chat(158,'Gear Selection Errors')
    end

    if player.status ~= "Engaged" then
       equip(Idel)           
    end
end
--------------------------------------------------------------------------------------------------
function self_command(command)

    if command == "MeleeMode" then
        if PDTMode == true then            
            PDTMode = false
            MDTMode = true
            add_to_chat(158,'Fight Mode Change To: MDTMode')
        elseif MDTMode == true then            
            MDTMode = false
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
        elseif DDMode == true then            
            DDMode = false
            PDTMode = true
            add_to_chat(158,'Fight Mode Change To: PDTMode ')
        end
        SetPostEventGear()
        send_command('input /lockstyle off;')
    elseif command == "LockStyle" then
            send_command('input /lockstyleset '..LockSet..';')
    end
end  
