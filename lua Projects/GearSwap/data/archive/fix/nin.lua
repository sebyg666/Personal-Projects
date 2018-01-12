function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'DD/AAC/PDT Mode {alt - }')
    add_to_chat(158,'AutoBuff Mode {alt // }')
    add_to_chat(158,'Get/Put Gear {F9}')
    send_command('input /macro book 7')
    send_command('input /macro set 1')
    send_command('bind != gs c CapacityMode')
    send_command('bind !- gs c MeleeMode')
    send_command('bind !\\\\ gs c AutoMode')


    DDMode       = true
    ACCMode      = false
    PDTMode      = false
    CapacityMode = false
    AutoMode     = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    MD      = {head="Mochizuki hatsuburi", body="samuha coat", hands="Hattori tekko", 
              feet="Mochizuki kyahan",ear1="moldavite earring", ear2="hecate's earring",
               ring1="acumen ring",back="yokaze mantle"}
    Migawar = {body="Hattori ningi",hands="Mochizuki tekko"}
    Utsusemi= {feet="Hattori kyahan",body="Mochizuki chainmail +1",hands="Mochizuki tekko",
               neck="magoraga beads"}

    WS      = {head="Pursuer's beret",neck="fotia gorget",ear1="moonshade earring",
               ear2="breeze pearl",body="Pursuer's doublet",hands="Floral gauntlets",
               ring1="stromsoul ring",ring2="stormsoul ring",waist="fotia Belt",
               legs="samnuha tights",feet="Pursuer's Gaiters",back="ik Cape"}

    DD      = {head="Dampening tam",neck="asperity necklace", ear2="steelflash earring",
               ear1="bladeborn earring",body="mochizuki chainmail +1",hands="Floral gauntlets",
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="samnuha tights",feet="loyalist sabatons",back="Atheling mantle"}

    ACCFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    ACC     = {head="Dampening tam",neck="subtlety spectacles", ear2="zennaroi earring",
               ear1="heartseeker earring",body="samnuha coat",hands="Floral gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",legs="samnuha tights",
               feet=ACCFeet,back="kayapa cape",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="Twilight torque",body="emet harness +1",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}
end
-------------------------------------------------------------------------------------------------------------------
function file_unload()
    send_command('unbind !=')
    send_command('unbind !-')
    send_command('unbind !\\\\')
end
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
-----------------------------------------------------------------------------------------------
function MigawarSpell (Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,'Migawari Detected: Loading Migawari Gear')
            equip(Migawar)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-----------------------------------------------------------------------------------------------
function Utsusemi(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: Shadow Boots On')
            equip(Utsusemi)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill()
    elseif Spell.name=="Utsusemi: Ichi" then
        Utsusemi(Spell)
    elseif Spell.name=="Utsusemi: Ni" then
        Utsusemi(Spell)
    elseif Spell.name=="Utsusemi: San" then
        Utsusemi(Spell)
    elseif Spell.name=="Migawari: Ichi" then      
        MigawarSpell(Spell)
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
    elseif Spell.type =="Trust" or Spell.type =="Item" then
            --noting
    else
        add_to_chat(158,"Unregistered Spell "..Spell.name.." type "..Spell.type.." now canceling")
        cancel_spell() 
    end

    if CapacityMode == true then
       equip(CapGear)
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill()
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
function aftercast(spell)

    if not CastingEXP then
        if AutoMode then
            if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
                --do nothing
            else
                if not midcast() then
                    CastShadows()
                end
            end
        end
    end
    SetPostEventGear()     
end  
-------------------------------------------------------------------------------------------------------------------
function CastShadows()
    local Ichi = 338
    local Ni   = 339
    local San  = 340
    local spell_recasts = windower.ffxi.get_spell_recasts()

    if spell_recasts[San] < 1 then
--add_to_chat(158,'San Ready')
        send_command('input /ma "Utsusemi: San" <me>;')
    elseif spell_recasts[Ni] < 1 then
--add_to_chat(158,'Ni Ready')

        send_command('input /ma "Utsusemi: Ni" <me>;')
    elseif spell_recasts[Ichi] < 1 then
--add_to_chat(158,'Ichi Ready')

        send_command('input /ma "Utsusemi: Ichi" <me>;')
    else
        if spell_recasts[San] < spell_recasts[Ni] and spell_recasts[San] < spell_recasts[Ichi] then
            wait = math.ceil(spell_recasts[San] / 100) +1
            send_command('@wait '..wait..';input /ma "Utsusemi: San" <me>;')
        elseif spell_recasts[Ni] < spell_recasts[Ichi] then
            wait = math.ceil(spell_recasts[Ni] / 100) +1
            send_command('@wait '..wait..';input /ma "Utsusemi: Ni" <me>;')
        else
            wait = math.ceil(spell_recasts[Ichi] / 100) +1
            send_command('@wait '..wait..';input /ma "Utsusemi: Ichi" <me>;')
        end
    end
end
  
-------------------------------------------------------------------------------------------------------------------
function buff_change(name,gain)
    local Ichi          = 338
    local Ni            = 339
    local San           = 340
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local expBuff       = buffactive.Commitment

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
        if player.status == "Engaged" then     
            if not midaction() then
                if AutoMode then
                    if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
                        --no nothing unless you know which overides which
                    else
                        add_to_chat(158,'Shadows Down')
                        CastShadows()
                    end
                end
            end
        end
    end     
end
-------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------
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
    elseif command == "AutoMode" then
        if AutoMode == true then
            AutoMode = false
            add_to_chat(158,'AutoMode Buff Turn Off')
        else
            AutoMode = true
            add_to_chat(158,'AutoMode Buff Turn On')
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
    send_command('unbind !\\\\')

end
-------------------------------------------------------------------------------------------------------------------
function file_load()


end