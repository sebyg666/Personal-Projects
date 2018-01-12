function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'PDT/DD/AAC {alt - }')
    add_to_chat(158,'Get/Put Gear {F11}')
    send_command('input /macro book 14')
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

    SpirtLk = {hands="Peltast's vambraces",head="Vishap armet +1"}
    CallWyve= {body="Pteroslaver mail"}
    SpiritSu= {body="Pteroslaver mail"}


    WS      = {head="lustratio cap",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="lustratio mittens",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="acro breeches",feet="lustratio leggings",back="buquwik Cape"}

    DD      = {head="Founder's Corona",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Founder's breastplate",hands="acro gauntlets",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="acro breeches",feet="loyalist sabatons",back="atheling Mantle"}

    ACC     = {head="Valorous Mask",neck="subtlety spectacles",ear2="steelflash earring",
               ear1="zennaroi earring",body="Founder's breastplate",hands="leyline gloves",
               ring1="Ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="acro breeches",feet="founder's greaves",back="Kayapa cape"}

    PDT     = {head="jumalik helm",neck="twilight torque",ear2="steelflash earring",
               ear1="zennaroi earring",body="jumalik mail",hands="founder's gauntlets",
               ring1="vocane ring",ring2="Defending Ring",back="iximulew cape",
               waist="flume belt",legs="xaddi cuisses",feet="amm greaves"}

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
------------------------------------------------------------------------------------------------
function SpiritSurgeSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Spirit Surge Detected: Loading Spirit Surge Gear')
            equip(SpiritSu)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function CallWyvernSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Call Wyvern Detected: Loading Call Wyvern Gear')
            equip(CallWyve)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function SpirtLinkSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Spirit Linkl Detected: Loading Spirit Link Gear')
            equip(SpirtLk)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------
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
    elseif Spell.name == "Spirit Surge" then
        SpiritSurgeSpell(Spell)
    elseif Spell.name == "Spirit Link" then
        SpirtLinkSpell(Spell)
    elseif Spell.name == "Call Wyvern" then
        CallWyvernSpell(Spell)
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
function aftercast(spell)
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
    elseif PDTMode == true then
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
            DDMode  = false
            ACCMode = true
            add_to_chat(158,'Fight Mode Change To: ACCMode')
        elseif ACCMode == true then           
            ACCMode = false
            PDTMode = true
            add_to_chat(158,'Fight Mode Change To: PDTMode')
        elseif PDTMode == true then            
            PDTMode    = false
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
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