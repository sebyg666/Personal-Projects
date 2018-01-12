function get_sets()

    send_command('input /macro book 6')
    send_command('input /macro set 1')

    Protect        = {  feet="piety duckbills"}
    Shell          = {  legs="piety pantaloons +1"}
    Martyr         = { hands="piety miits"}
    Benediction    = { body = "piety briault"}
    Devotion       = { head = "piety cap"}
    Auspice        = { feet = "ebers duckbills"}
    DivineCaress   = {hands = "ebers mitts", back="mending cape"}
    AfflatusSolace = { body = "ebers brault",back="Alaunus's Cape"}

    Cure  = { head="ebers cap +1"    , neck="",                ear1="",
              ear2="glorious earring", body="vrikodara jupon", hands="",
              ring1="sirona's ring"  ,ring2="ephedra ring",    back="",
              waist="",             legs="ebers pantaloons +1",feet="" }

    Regen = { body="piety briault +1", legs ="theophany pantaloons +1",Hands="orison mitts +2"}

    Cursna = {back="alaunus's cape", legs ="theophany pantaloons", ring1="ephedra ring",
              feet="gendewitha galoshes +1"}
    
    Idel = {head="ebers cap +1",      neck="deviant neckless",  ear1="moonshade earring",
            ear2="novia earring",    body="vrikodara jupon",  hands="yaoyotl gloves",
           ring1="renaye ring",     ring2="tamas ring",        back="mending cape",
           waist="channeler's stone",legs="assiduity pants +1",feet="hygieia clogs +1"}

    FastCast = {head="",neck="voltsurge torque",ear1="loquacious earring",
              ear2="",body="zendik robe",hands="",
              ring1="",ring2="",back="Alaunus's Cape",
              waist="witful belt",legs="lengo pants",feet=""}

    CureFastCast = {hands ="chironic gloves",legs="piety pantaloons +1",ear1="mendicant's earring",ear2="nourishing earring"}

    Enfeeb = {head="",neck="imbodla necklace",ear1="lifestorm earring",
              ear2="psystorm earring",body="shango robe",hands="lurid mitts",
              ring1="perceptions ring",ring2="sangoma ring",back="alaunus's cape",
              waist="yamabuki-no-obi",legs="lengo pants",feet="medium's sabots"}

    Divine = {head="",neck="voltsurge torque",ear1="lifestorm earring",
              ear2="psystorm earring",body="shango robe",hands="lurid mitts",
              ring1="perceptions ring",ring2="sangoma ring",back="alaunus's cape",
              waist="yamabuki-no-obi",legs="lengo pants",feet="medium's sabots"}

    Enhancing = {head="",neck="",                   ear1="",
                 ear2="",body="",                   hands="chironic gloves",
                ring1="",ring2="",                  back="",
                waist="",legs="piety pantaloons +1",feet=""}

end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()

end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill()

    if player.tp > 999 then

    else
         cancel_spell()
    end 
end
--------------------------------------------------------------------------------------------------------------------
function     MartyrSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Martyr Detected: Martyr Gear')
        equip(Martyr)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function     BenedictionSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Benediction Detected: Benediction Gear')
        equip(Benediction)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function     DevotionSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Devotion Detected: Devotion Gear')
        equip(Devotion)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function     AuspiceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Auspice Detected: Auspice Gear')
        equip(Auspice)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function     DivineCaressSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'DivineCaress Detected: DivineCaress Gear')
        equip(DivineCaress)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function     AfflatusSolaceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'AfflatusSolaceS Detected: AfflatusSolaceS Gear')
        equip(AfflatusSolaceS)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then

        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID] < 1 then
           equip(FastCast)
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill()
    elseif Spell.name == "Martyr" then 
        MartyrSpell(Spell)
    elseif Spell.name == "Benediction" then
        BenedictionSpell(Spell)
    elseif Spell.name == "Devotion" then 
        DevotionSpell(Spell)
    elseif Spell.name == "Auspice" then
        AuspiceSpell(Spell)
    elseif Spell.name == "Divine Caress" then
        DivineCaressSpell(Spell)
    elseif Spell.name == "Afflatus Solace" then
        AfflatusSolaceSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)      
    elseif Spell.name == "cure" or Spell.name == "cure II" or Spell.name == "cure III" or Spell.name == "cure IV" or
       Spell.name == "cure V" or Spell.name == "cure VI" then
       equip (FastCast)
       equip (CureFastCast)
    elseif Spell.nane == "Curaga" or Spell.nane == "Curaga II" or Spell.nane == "Curaga III" or 
           Spell.nane == "Curaga IV" or Spell.nane == "Curaga V" then
       equip (FastCast)
       equip (CureFastCast)
    elseif Spell.name == "Regen" or Spell.name == "Regen II" or Spell.name == "Regen III" or 
           Spell.name == "Regen IV" then
       equip (FastCast)
    elseif Spell.skill == "Enhancing" then
       equip (FastCast)
    elseif Spell.skill == "Enfeeb" then
       equip (FastCast)
    elseif Spell.skill == "Divine" then  
       equip (FastCast)
    elseif Spell.Skill == "Dark" then
       equip (FastCast)
    elseif Spell.type == "WhiteMagic" or Spell.type == "DarkMagic"  then
        MagicSpell(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else

    end
    
end
------------------------------------------------------------------------------------------------
function midcast(Spell)

    if Spell.name == "cure" or Spell.name == "cure II" or Spell.name == "cure III" or Spell.name == "cure IV" or
       Spell.name == "cure V" or Spell.name == "cure VI" then
       equip (Cure)
    elseif Spell.nane == "Curaga" or Spell.nane == "Curaga II" or Spell.nane == "Curaga III" or 
           Spell.nane == "Curaga IV" or Spell.nane == "Curaga V" then
       equip (Cure)
    elseif Spell.name == "Regen" or Spell.name == "Regen II" or Spell.name == "Regen III" or 
           Spell.name == "Regen IV" then
       equip (Regen)
    elseif Spell.skill == "Enhancing" then
       equip(Enhancing)
    elseif Spell.skill == "Enfeeb" then
       equip(Enfeeb)
    elseif Spell.skill == "Divine" then  
       equip ( Divine )
       if Spell.name == "Cursena" then
          equip ( Cursna )
       end
    elseif Spell.Skill == "Dark" then
       equip (Dark)
    end
end
------------------------------------------------------------------------------------------------
function aftercast(Spell)
    equip(Idel)
end
------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)

end
---------------------------------------------------------------------------------------------
function status_change(new,old)

    if player.status == "resting" then
        equip ( Resting)
    else
        equip( Idel)
    end
end 
-----------------------------------------------------------------------------------------------------------
function self_command(command)

end  
