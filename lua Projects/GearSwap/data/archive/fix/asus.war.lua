function get_sets()
    file_load()
    add_to_chat(158,'Cap Rings and Cape Mode {alt = }')
    add_to_chat(158,'PDT/DD/AAC/UP/SC/UK {alt - }')
    add_to_chat(158,'Retaliation Mode { alt [ }')
    add_to_chat(158,'Get/Put Gear {alt F11 & F12}')
    send_command('input /macro book 3')
    send_command('input /macro set 1')


    send_command('bind ![ gs c RetaliationMode')
    send_command('bind != gs c CapacityMode')
    send_command('bind !- gs c MeleeMode')
    send_command('bind !f12 exec putallaway.txt')
    send_command('bind !f11 exec getwar.txt')

    DDMode          = true
    ACCMode         = false
    PDTMode         = false
    UPMode = false
    SCMode = false
    UKMode = false
    CapacityMode    = true
    RetaliationMode = true
    CastingEXP      = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    Retaliat= {hands="Pummeler's Mufflers +1",feet="Boii Calligae +1"}
    Aggressr= {Body="agoge lorica",head="Pummeler's Mask +1"}
    BloodRag= {body="Boii Lorica +1"}
    Berserk = {Body="Pummeler's lorica +1",feet="agoge calligae"}
    WarCharg= {legs="agoge Cuisses"}
    WarCry  = {head="agoge mask"}

    WS      = {head="lustratio cap",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="lustratio mittens",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="lustratio leggings",back="buquwik cape"}

    UP      = {head="Souveran Schaller",neck="fotia gorget",ear1="flame pearl",
               ear2="thureous earring",body="Founder's breastplate",hands="odyssean gauntlets",
               ring1="titan ring",ring2="titan ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="amm greaves",back="iximulew cape"}

    scor      = {head="Boii mask +1",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="souveran handschuhs",
               ring1="Ifrit ring",ring2="ifrit ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="founder's greaves",back="iximulew cape"}

    DD      = {head="Boii mask +1",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Boii lorica +1",hands="Boii Mufflers +1",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="boii cuisses +1",feet="boii calligae +1",back="mauler's Mantle"}

    ACC     = {head="valorous mask",neck="subtlety spectacles",ear2="steelflash earring",
               ear1="zennaroi earring",body="Founder's breastplate",hands="Odyssean Gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Souveran diechlings",feet="boii calligae +1",back="mauler's Mantle"}

    PDT     = {head="jumalik helm",neck="twilight torque",ear2="steelflash earring",
               ear1="zennaroi earring",body="jumalik mail",hands="founder's gauntlets",
               ring1="vocane ring",ring2="Defending Ring",back="iximulew cape",
               waist="flume belt",legs="xaddi cuisses",feet="amm greaves"}


end

-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)
   if player.tp > 999 then
    if not CastingEXP then 
          
            if  name == "Scourge" then
                equip( scor )
            elseif name =="Upheaval" then
                equip (UP)
            else
                equip(WS)
            end
        else
            ------cancel_spell()
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
function BloodRage(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip (BloodRag)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function WarcrySpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID]< 1 then
            equip(WarCry)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function BerserkSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(Berserk)
        else
            cancel_spell()
        end
    else
      ----  cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function AggressorSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(Aggressr)
        else
            cancel_spell()
        end
    else
      -----  cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function WarChargeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip (WarCharg)
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

        else
            cancel_spell()
        end
    else
       ----- cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == "Blood Rage" then
        BloodRage(Spell)
    elseif Spell.name == "Aggressor" then
        AggressorSpell(Spell)
    elseif Spell.name == "Berserk" then
        BerserkSpell(Spell)
    elseif Spell.name == "Warrior's Charge" then
        WarChargeSpell(Spell)
    elseif Spell.name == "Warcry" then
        WarcrySpell(Spell)
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
function aftercast(Spell)
    if not CastingEXP then
        SetPostEventGear()
    end  
end
------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)
    local expBuff = buffactive.Commitment

    if CapacityMode == true then
        if not expBuff and not CastingEXP then
            CastingEXP = true
        elseif Gain and Name == "Commitment" and CastingEXP then
            CastingEXP = false 
        elseif expBuff and CastingEXP then
            CastingEXP = false
        end
    end

    if CastingEXP then
        equip(EXPRing)
        CastEXPRing()
    end
    
    if RetaliationMode == true then
        local Retal         = 8  --- retaliation
        local Berserk=1
        local Aggressor =4
        local Hasso =138
        local spell_recasts = windower.ffxi.get_spell_recasts()

        if player.status == "Engaged" and not midaction() then 
            if not buffactive.retaliation and spell_recasts[Retal] < 1 then   
               send_command('input /ja retaliation <me>;')
            elseif not buffactive.berserk and spell_recasts[Berserk] < 1 then 
               send_command('input /ja berserk <me>;')
            elseif not buffactive.hasso and spell_recasts[Hasso] < 1 then 
               send_command('input /ja hasso <me>;')
            elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 then 
               send_command('input /ja aggressor <me>;')
            end
        end
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
    elseif UPMode == true then     
        equip(UP)
    elseif SCMode == true then     
        equip(scor )
    elseif UKMode == true then     
        equip(WS)
    else
        add_to_chat(158,'Gear Selection Errors')
    end
    
    if RetaliationMode == true then
        equip(Retaliat)
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
            UPMode = true  
            add_to_chat(158,'Fight Mode Change To: UPMode')
         elseif UPMode == true then            
            UPMode    = false
            SCMode = true 
            add_to_chat(158,'Fight Mode Change To: SCMode')
        elseif SCMode == true then            
            SCMode    = false
            UKMode = true 
            add_to_chat(158,'Fight Mode Change To: UKMode')
        elseif UKMode == true then  
            UKMode = false   
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        SetPostEventGear()
    elseif command == "CapacityMode" then
        if CapacityMode == true then
            CapacityMode = false
            CastingEXP      = false
            add_to_chat(158,'Capacity Mode Turn Off')
        else
            CapacityMode = true
            add_to_chat(158,'Capacity Mode Turn On')
        end
        SetPostEventGear()
    elseif command == "RetaliationMode" then
        if RetaliationMode == true then
            RetaliationMode = false
            add_to_chat(158,'RetaliationMode: Off')
        else
            RetaliationMode = true
            add_to_chat(158,'RetaliationMode: On')
        SetPostEventGear()
        end
    end
end
-------------------------------------------------------------------------------------------------------------------
function file_unload()
    send_command('unbind !=')
    send_command('unbind !-')
    send_command('unbind ![')
    send_command('unbind !f12')
    send_command('unbind !f11')
end
-------------------------------------------------------------------------------------------------------------------
function file_load()

end
