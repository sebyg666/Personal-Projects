function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'DD/AAC/PDT/MAB Mode {alt - }')
    add_to_chat(158,'AutoBuff Mode {alt // }')
    add_to_chat(158,'Get/Put Gear {F11}')
    send_command('input /macro book 1')
    send_command('input /macro set 1')
    send_command('bind != gs c CapacityMode')
    send_command('bind !- gs c MeleeMode')
    send_command('bind !\\\\ gs c AutoMode')

    DDMode       = true
    ACCMode      = false
    PDTMode      = false
    MABMode      = false
    CapacityMode = false
    AutoMode     = false
    CastingEXP   = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    WSmHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    WSmFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    WSmHands = {name = "qaaxo mitaines", augments={"accuracy+15"}}
    WSmelee = {head=WSmHead,neck="fotia gorget",ear1="Flame pearl",ear2="Flame pearl",
               body="Samnuha coat",hands=WSmHands,ring1="Ifrit ring",
               ring2="Ifrit ring",waist="fotia Belt",legs="samnuha tights",
               feet=WSmFeet,back="Buquwik Cape"}

    DDHands = {name = "qaaxo mitaines", augments={"Attack+15"}}
    DDBody  = {name = "qaaxo harness",  augments={"Attack+15"}}
    DDFeet  = {name = "Taeon boots"}
    DD      = {head="Dampening tam",neck="asperity necklace",ear2="Dudgeon earring",
               ear1="heartseeker earring",body=DDBody,hands=DDHands,
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="samnuha tights",feet=DDFeet,back="atheling mantle"}

    ACCFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    DDAcc   = {head="Dampening tam",neck="subtlety spectacles",ear1="zennaroi earring",
               ear2="steelflash earring",body="samnuha coat",hands="leyline gloves",
               ring1="ramuh ring",ring2="enlivened ring",legs="samnuha tights",
               feet=ACCFeet,back="Kayapa Cape",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="Twilight torque",body="emet harness +1",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}

    MAB     = {head="Dampening tam",neck="quanpur necklace",ear1="Moldavite earring",
               ear2="hecate's earring",body="samnuha coat",hands="leyline gloves",
               ring1="acumen ring",ring2="sangoma ring",waist="eschan stone",legs="lengo pants",
               feet="Sombra Leggings",back="argochampsa mantle"}


end

------------------------------------------------------------------------------------------------
function WeaponSkill()

    if not CastingEXP then 
        if player.tp > 999 then
             -- add_to_chat(158,'Load WS Gear')
             equip(WSmelee)
         else
             cancel_spell()
         end
    else
        --- Cancel Gear Blink
    end
end
------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: MAB Gear ON')
            equip(MAB)
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
        WeaponSkill()
    elseif Spell.type == "BlueMagic" then
        MagicSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type == "WhiteMagic" then
        MagicSpell(Spell)
    elseif Spell.type == "blackMagic" then
        MagicSpell(Spell)
    elseif Spell.type == 'Ninjutsu' then
        MagicSpell(Spell)
    elseif Spell.Skill == 'Ability' then
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
function aftercast(Spell)

    if not CastingEXP then
        SetPostEventGear()
        RecastMissingBuffs(Spell.name)
    end
end  
------------------------------------------------------------------------------------------------
function buff_change(Name,gain)
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
    else
        RecastMissingBuffs(Name,Gain)
    end 
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

        if DDMode == true then 
            equip(DD)
        elseif ACCMode == true then
            equip(DDAcc)
        elseif  PDTMode == true then
            equip(PDT) 
        elseif  MABMode == true then
            equip(MAB)
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
            add_to_chat(158,'Fight Mode Change To: MABMode')
            PDTMode = false
            MABMode  = true
        elseif MABMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode' )
            MABMode = false
            DDMode  = true
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        SetPostEventGear()
    elseif command == "AutoMode" then
        if AutoMode == true then
            AutoMode = false
            add_to_chat(158,'AutoMode Buff Turn Off')
        else
            AutoMode = true
            add_to_chat(158,'AutoMode Buff Turn On')
            RecastMissingBuffs()
        end
        RecastMissingBuffs("")  
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
------------------------------------------------------------------------------------------------
function RecastMissingBuffs(SpellName)

    local BatteryCharge = 662
    local ErracticFlutter = 710
    local AnimatingWall = 661
    local NatureMediation= 700
    local Heal = 658

    local spell_recasts = windower.ffxi.get_spell_recasts()

    if player.status == "Engaged" and not midaction() then  
        if AutoMode and player.hp < 1250 then
            add_to_chat(158,'HP less then 1150 casting Plenilune Embrace')
            send_command('@wait 1;input /ma "Plenilune Embrace" <me>;')
        elseif AutoMode and not buffactive.Refresh and SpellName ~= "Battery Charge" then
            if spell_recasts[BatteryCharge] < 1 then
                add_to_chat(158,'Battery Charge Missing Recasting')
                send_command('@wait 1;input /ma "Battery Charge" <me>;')
            end
        elseif AutoMode and not buffactive.Haste and SpellName ~= "Erratic Flutter" then
            if spell_recasts[ErracticFlutter] < 1 then
                add_to_chat(158,'Erractic FlutterMissing Recasting')
                send_command('@wait 1;input /ma "Erratic Flutter" <me>;')
            end
        elseif AutoMode and not buffactive.AttackBoost and SpellName ~= "Nat. Meditation" then
            if spell_recasts[NatureMediation] < 1 then
                add_to_chat(158,'Nat. Meditation Missing Recasting')
                send_command('@wait 1;input /ma "Nat. Meditation" <me>;')
            end
        end
    end
end  
------------------------------------------------------------------------------------------------------------------
function file_unload()
    send_command('unbind !=')
    send_command('unbind !-')
    send_command('unbind !\\\\')

end
-------------------------------------------------------------------------------------------------------------------
function file_load()

end