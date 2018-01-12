function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'DD/AAC/PDT Mode {alt - }')
    add_to_chat(158,'Get/Put Gear {F2}')
    send_command('input /macro book 2')
    send_command('input /macro set 1')
    send_command('bind != gs c CapacityMode')
    send_command('bind !- gs c MeleeMode')
  
    DDMode       = true
    ACCMode      = false
    PDTMode      = false
    CapacityMode = false
    CastingEXP   = false

    Impetus = {body="Bhikku Cyclas"}
    HF      = {legs="Hesychast's Hose"}
    Focus   = {head="Anchorite's Crown +1"}
    Dodge   = {feet="Anchorite's Gaiters +1"}
    Boost   = {hands="Anchorite's Gloves +1"}
    Chakra  = {body="Anchorite's Cyclas +1"}
    CounterS= {Feet="Hesychast's Gaiters"}
    Mantra  = {Feet="Hesychast's Gaiters"}
    Formless= {body="Hesychast's Cyclas"}

    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    WSHead  = {name = "qaaxo mask", augments={"STR+7"}}
    WSFeet  = {name = "qaaxo leggings", augments={"STR+7"}}
    WS      = {head=WSHead,neck="fotia gorget",ear1="flame pearl",ear2="flame pearl",
               body="anchorite's cyclas +1",hands="anchorite's Gloves +1",ring1="Ifrit ring",
               ring2="Ifrit ring",waist="fotia Belt",legs="samnuha tights",feet=WSFeet,
               back="Buquwik Cape"}

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
-------------------------------------------------------------------------------------------------------------------
function ImpetusSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Impetus Detected: Loading Impetus Gear')
            equip(Impetus)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function HundredFistsSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'100 Fists Detected: Loading Hundred Fists Gear')
            equip(HF)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FocusSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Focus Detected: Loading Focus Gear')
            equip(Dodge)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function DodgeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Dodge Detected: Loading Dodge Gear')
            equip(Focus)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function BoostSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Boost Detected: Loading Boost Gear')
            equip(Boost)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function ChakraSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Chakra Detected: Loading Chakra Gear')
            equip(Chakra)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function CounterstanceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Counterstance Detected: Loading Counterstance Gear')
            equip(CounterS)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function MantraSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Mantra Detected: Loading Mantra Gear')
            equip(Mantra)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FormlessStrikesSpell()
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Formless Strikes Detected: Loading Formless Strikes Gear')
            equip(Formless)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
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
    elseif Spell.name == 'Impetus' then
        ImpetusSpell(Spell)
    elseif Spell.name == 'Focus' then
        FocusSpell(Spell)
    elseif Spell.name == 'Dodge' then
        DodgeSpell(Spell)
    elseif Spell.name == 'Boost' then
        BoostSpell(Spell)
    elseif Spell.name == 'Chakra' then
        ChakraSpell(Spell)
    elseif Spell.name == 'Counterstance' then
        CounterstanceSpell(Spell)
    elseif Spell.name == 'Mantra' then
        MantraSpell(Spell)
    elseif Spell.name == 'Formless Strikes' then
        FormlessStrikesSpell(Spell)
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

end
-------------------------------------------------------------------------------------------------------------------
function file_load()


end