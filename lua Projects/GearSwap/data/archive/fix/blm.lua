function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    send_command('input /macro book 18')
    send_command('input /macro set 1')
    send_command('bind != gs c CapacityMode')
  
    CapacityMode = false
    CastingEXP   = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}
    
    Idel    = {body="witching robe","lengo pants"}
    MAB     = {head="nahtirah hat",neck="quanpur necklace",ear1="Moldavite earring",
               ear2="hecate's earring",body="witching robe",hands="yaoyotl gloves",
               ring1="acumen ring",ring2="sangoma ring",back="argochampsa mantle",
               waist="eschan stone",legs="merlinic shalwar",feet="medium's sabots"}


end

------------------------------------------------------------------------------------------------
function WeaponSkill()
    if not CastingEXP then 
        if player.tp > 999 then
             -- add_to_chat(158,'Load WS Gear')
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
        equip(Idle);
    end

    if CapacityMode == true then
        equip(CapGear)
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
    end 
end
--------------------------------------------------------------------------------------------------
function self_command(command)
    
    if command == "CapacityMode" then
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
------------------------------------------------------------------------------------------------------------------
function file_unload()

end
-------------------------------------------------------------------------------------------------------------------
function file_load()




end