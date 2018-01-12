function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'DD/AAC/PDT Mode {alt - }')
    send_command('input /macro book 2')
    send_command('input /macro set 1')
    send_command('bind != gs c CapacityMode')
    send_command('bind !- gs c MeleeMode')
  
    DDMode       = true
    ACCMode      = false
    PDTMode      = false
    CapacityMode = false
    CastingEXP   = false

    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    --WS      ={}

    DDHands = {name = "qaaxo mitaines", augments={"Attack+15"}}
    DDBody  = {name = "qaaxo harness",  augments={"Attack+15"}}
    DDFeet  = {name = "qaaxo leggings", augments={"Attack+15"}}
    DD      = {ammo="Honed tathlum",head="Dampening tam",neck="asperity necklace",
               ear2="steelflash earring",ear1="bladeborn earring",body=DDBody,hands=DDHands,
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="samnuha tights",feet=DDFeet,back="Atheling Mantle"}

    ACCFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    ACC     = {ammo="Honed tathlum",head="Dampening tam",neck="subtlety spectacles",
               ear1="zennaroi earring",ear2="steelflash earring",body="samnuha coat",
               hands="leyline gloves",ring1="Raumh ring",ring2="enlivened ring",
               legs="samnuha tights",feet=ACCFeet,back="kayapa cape",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="Twilight torque",body="emet harness +1",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="black belt"}
end
-------------------------------------------------------------------------------------------------------------------
function file_unload()
    send_command('unbind !=')
    send_command('unbind !-')
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        if not CastingEXP then
            add_to_chat(158,'Load WS Gear')
            equip(WS)
        else
            cancel_spell()
        end
    else
      cancel_spell()
       
    end
end
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
----------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected:')
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected:')
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type == "WhiteMagic" then
        MagicSpell(Spell)
    elseif Spell.type == "blackMagic" then
        MagicSpell(Spell)
    elseif Spell.type == 'Ninjutsu' then
        MagicSpell(Spell)
    elseif Spell.type == 'Samba' then
        JobAbility(Spell)
    elseif Spell.type == 'Waltz' then
        JobAbility(Spell)
    elseif Spell.type == 'Jig' then
        JobAbility(Spell)
    elseif Spell.type == 'Step' then
        JobAbility(Spell)
    elseif Spell.type == "Flourish1" then
        JobAbility(Spell)
    elseif Spell.type == "Flourish2" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        --noting
    else
        ID = Spell.recast_id
        add_to_chat(158,ID)
        add_to_chat(158,Spell.type)
        add_to_chat(158,"Unregistered Spell "..Spell.name.." type "..Spell.type.." now canceling")
        cancel_spell() 
    end
    if CapacityMode == true then
        equip(CapGear)
    end
    
end
------------------------------------------------------------------------------------------------
function aftercast(spell, action, spellMap, eventArgs)
    if not CastingEXP then
        SetPostEventGear()     
    end
end
------------------------------------------------------------------------------------------------
function buff_change(name,gain)
    local expBuff = buffactive.Commitment

     if CapacityMode == true then
        if not expBuff and not CastingEXP then
            CastingEXP = true
            add_to_chat(158,'Using Trizek Ring Or Capacity Ring')    
        elseif Gain and Name == "Commitment" and CastingEXP then
            CastingEXP = false 
            add_to_chat(158,'Commitment Gained')
        elseif expBuff and CastingEXP then
            CastingEXP = false
            add_to_chat(158,'Commitment Detected') 
        end
    end

    if CastingEXP then
        equip(EXPRing)
        CastEXPRing()
    end   
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if DDMode == true then 
        equip(DD)
    elseif ACCMode == true then
        equip(ACC)
    elseif  PDTMode == true then
        equip(PDT)
    else
        add_to_chat(158,'Gear Selection Errors')
    end

    if CapacityMode == true then
        equip(CapGear)
    end  
end
--------------------------------------------------------------------------------------------------
function self_command(command)
    
    if command == "MeleeMode" then
        if DDMode == true then
            add_to_chat(158,'Fight Mode Change To: ACCMode')
            DDMode  = false
            ACCMode = true
        elseif ACCMode == true then
            add_to_chat(158,'Fight Mode Change To: PDTMode')
            ACCMode = false
            PDTMode = true
        elseif PDTMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode')
            PDTMode = false
            DDMode  = true
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        SetPostEventGear()
     elseif command == "CapacityMode" then
        if CapacityMode == true then
            CapacityMode = false
            add_to_chat(158,'Capacity Mode Turn Off')
        else
            CapacityMode = true
            add_to_chat(158,'Capacity Mode Turn On')
        end
        SetPostEventGear()
    end
end
-------------------------------------------------------------------------------------------------------------------
function file_unload()
    send_command('unbind !=')
    send_command('unbind !-')
   -- send_command("put fleshcarvers satchel")

end
-------------------------------------------------------------------------------------------------------------------
function file_load()

--    send_command("get fleshcarvers satchel")

end