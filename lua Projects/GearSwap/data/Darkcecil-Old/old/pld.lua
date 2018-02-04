function get_sets()

    
    send_command('input /macro book 4')
    send_command('input /macro set 1')

    DDMode          = false
    ACCMode         = false
    DTMode          = true
    SDTMode         = false
    HPMode          = false
    VITSTRMode      = false
    CRITMode        = false
    STRMode         = false
    AegisMode       = true
    OchainMode      = false
    EnmityMode      = false
    AutoRefreshMode = false
    AutoMode        = false


    Ochain   = {sub="Ochain"}
    Aegis    = {sub="Aegis"}
    Refresh  = {body="jumalik mail",neck="creed collar",waist="fucho-no-obi",ring="Apeile ring"}
    Enlight  = {head="Souveran Schaller",head="jumalik helm",body="Reverence surcoat +1",hands="eschite gauntlets",legs="Founder's Hose"}
    Fealty   = {body="Caballarius surcoat +1"}
    Chivalry = {hands="Caballarius gauntlets"}
    Invencibl= {legs="Caballarius breeches"}
    Sentinel = {feet="Caballarius leggings +1"}
    Cover    = {head="Reverence coronet +1"}

    EnmityB = {name="weard Mantle",augments={"Enmity+7"}}
    Enmity  = {head="yorium barbuta",neck="unmoving collar",body="Chevalier's cuirass +1",
               hands="yorium gauntlets",ring1="petrov ring",ring2="apeile ring",
               back=EnmityB,waist="creed baudrier",legs="Yorium cuisses",
               feet="Yorium Sabatons",ammo="Paeapua"}

    PhalaxB = {name="weard Mantle",augments={"Phalanx+5"}}
    Phalanx = {head="Souveran Schaller",hands="souveran handschuhs",feet="souveran schuhs",back=PhalaxB,legs="Founder's Hose"}

    MagicCas= {head="Souveran Schaller",legs="Founder's Hose"};

    CRIT      =  {ammo="amar cluster",head="Lustratio cap",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="Lustratio mittens",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="Lustratio leggings",back="buquwik cape"}


    STR      = {ammo="amar cluster",head="Lustratio cap",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="Lustratio mittens",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="Lustratio leggings",back="buquwik cape"}

    VITSTR  = {ammo="amar cluster",head="Souveran Schaller",neck="fotia gorget",ear2="soil pearl",
               ear1="flame pearl",body="Chevalier's cuirass +1",hands="souveran handschuhs",
               ring1="Ifrit ring",ring2="ifrit ring",waist="fotia Belt",
               legs="Souveran diechlings",feet="founder's greaves",back="buquwik cape"}

    DD      = {head="Founder's Corona",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Founder's breastplate",hands="Founder's gauntlets",
               ring1="petrov ring",ring2="Defending Ring",waist="cetl belt",
               legs="xaddi cuisses",feet="Loyalist sabatons",back="Atheling Mantle",
               Ammo="amar cluster"}

    ACCB    = {name="weard Mantle",augments={"Enmity+7"}}
    ACC     = {head="valorous mask",neck="subtlety spectacles",ear2="steelflash earring",
               ear1="zennaroi earring",body="Founder's breastplate",hands="Odyssean Gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Souveran diechlings",feet="founder's greaves",back=ACCB,
               Ammo="amar cluster"}


    SDT      = {main="brilliance",head="yorium barbuta",neck="twilight torque",ear2="thureous earring",
               ear1="zennaroi earring",body="Caballarius surcoat +1",hands="yorium gauntlets",
               ring1="petrov ring",ring2="Defending Ring",back="philidor mantle",
               waist="Nierenschutz",legs="Souveran diechlings",feet="Yorium Sabatons",
               Ammo="amar cluster"}

    DT      = {main="brilliance",head="yorium barbuta",neck="twilight torque",ear2="thureous earring",
               ear1="zennaroi earring",body="Caballarius surcoat +1",hands="souveran handschuhs",
               ring1="patricius ring",ring2="Defending Ring",back="philidor mantle",
               waist="Nierenschutz",legs="Souveran diechlings",feet="Souveran Schuhs",
               Ammo="amar cluster"}

    HPB = {name="weard Mantle",augments={"Enmity+7"}}
    HP       = {main="brilliance",head="Souveran Schaller",neck="twilight torque",body="Reverence surcoat +1",
                hands="souveran handschuhs", back=HPB,waist="Nierenschutz",
                ring1="patricius ring",ring2="Defending Ring",legs="Reverence breeches +1",
                feet="Souveran Schuhs",ear1="bloodgem earring",ear2="thureous earring",
                ammo="Egoist's Tathlum"}

    HPLow    = {head="yorium barbuta",neck="twilight torque",body="Emet Harness +1",
                hands="yorium gauntlets",back="Philidor Mantle",waist="flume belt",
                ring2="Defending Ring",ring1="patricius ring",legs="Caballarius breeches",
                feet="Yorium sabatons",ear2="steelflash earring",ear1="zennaroi earring",Ammo="amar cluster"}

    HPHigh   = {head="Souveran Schaller",neck="cuamiz collar",body="jumalik mail",
                hands="souveran handschuhs", back="aenotherus mantle +1",waist="creed baudrier",
                ring2="k'ayres ring",ring1="kunaji ring",legs="Reverence breeches +1",
                feet="Souveran Schuhs",ear1="bloodgem earring",ear2="thureous earring",ammo="Egoist's Tathlum"}
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill()

    if player.tp > 999 then
            if  Name == "Scourge" then
                if windower.ffxi.get_ability_recasts()[2] < 1 then
                    send_command('input /ja warcry <me>;')
                    cast_delay(1)
                end
                equip( VITSTR )
                add_to_chat(158,'Load VIT/STR Gear')
            elseif Name == "Torcleaver" then
                if windower.ffxi.get_ability_recasts()[2] < 1 then
                    send_command('input /ja warcry <me>;')
                    cast_delay(1)
                end
                equip (CRIT)
                add_to_chat(158,'CRIT WS Gear')
            else
                if windower.ffxi.get_ability_recasts()[2] < 1 then
                    send_command('input /ja warcry <me>;')
                    cast_delay(1)
                end
                equip(STR)
                add_to_chat(158,'STR WS Gear')
            end
    else
         cancel_spell()
    end 
end
--------------------------------------------------------------------------------------------------------------------
function IninvibleSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Invincible Detected: Invincible Gear')
        equip(Enmity)
        equip(Invencibl )
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function CoverSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Cover Detected: Cover Gear')
            equip(Cover)
        else
            cancel_spell()
        end
end
--------------------------------------------------------------------------------------------------------------------
function SentinelSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Sentinel Detected: Sentinel Gear')
            equip(Enmity)
            equip(Sentinel)
        else
            cancel_spell()
        end
end
--------------------------------------------------------------------------------------------------------------------
function ChivalrySpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'ChivalryCast Detected: Chivalry Gear')
            equip(Chivalry)
        else
            cancel_spell()
        end
end
--------------------------------------------------------------------------------------------------------------------
function RampartSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Rampart Detected: Rampart Gear')
            equip(Enmity)
            equip(Rampart)
        else
            cancel_spell()
        end
end
--------------------------------------------------------------------------------------------------------------------
function EnlightSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

       if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,'Enlight II Detected: Enlight II Gear')
            equip(Enlight)
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
            equip(Phalanx)
        else
            cancel_spell()
        end
end
--------------------------------------------------------------------------------------------------------------------
function CureIVSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID]  < 1 then
            add_to_chat(158,'Cure IV Detected: Lowering Gear HP')
            equip (HPLow)
        else
            cancel_spell()
        end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: Enimty Gear')
            equip(Enmity)
        else
            cancel_spell()

            if Name == "Provoke" then
                send_command('input /ma "flash" <t>;')
            end
        end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected: Enimty Gear')
           ----equip(Enmity)
           equip(MagicCas)
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
    elseif Spell.name == "Cure IV" then
        CureIVSpell(Spell)
    elseif Spell.name == "Flash" or Spell.name== "Holy" or Spell.name=="Holy II" then
        FlashSpell(Spell)
    elseif Spell.name == "Enlight II" then
        EnlightSpell(Spell)
    elseif Spell.name == "Phalanx" then
        PhalanxSpell(Spell)
    elseif Spell.name == "Rampart" then 
        RampartSpell(Spell)
    elseif Spell.name == "Chivalry" then 
        ChivalrySpell(Spell)
    elseif Spell.name == "Sentinel" then 
        SentinelSpell(Spell)
    elseif Spell.name == "Cover" then 
        CoverSpell(Spell)
    elseif Spell.name == "Invincible" then
        IninvibleSpell(Spell) 
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
    
end
------------------------------------------------------------------------------------------------
function midcast(Spell)

        if Spell.name == "Cure IV" or Spell.name == "Cure III" or Spell.name == "Cure II" or Spell.name == "Cure" then
            add_to_chat(158,'Cure IV Detected: Raising Gear HP')
            equip(Enmity)
            equip (HPHigh)

        end
end
------------------------------------------------------------------------------------------------
function aftercast(Spell)
        SetPostEventGear()
        RecastMissingBuffs(Spell.name)
end
------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)
    RecastMissingBuffs(Name,Gain)
end
---------------------------------------------------------------------------------------------
function status_change(new,old)
    SetPostEventGear()

        if new == "Idle" and AutoRefreshMode == true then
            equip(Refresh)
        else
            RecastMissingBuffs(Name,Gain)
        end
end 
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if DDMode == true then      
        equip(DD)
    elseif ACCMode == true then    
        equip(ACC)
    elseif DTMode == true then
        equip(DT)
    elseif SDTMode == true then
        equip(SDT)
    elseif HPMode == true then
        equip(HP)
    elseif EnmityMode  == true then
        equip(Enmity)
    elseif VITSTRMode == true then     
        equip(VITSTR)
    elseif CRITMode == true then     
        equip(CRIT)
    elseif STRMode == true then     
        equip(STR)
    else
        add_to_chat(158,'Gear Selection Errors')
    end

    if AegisMode == true then
        equip(Aegis)
    elseif OchainMode == true then
        equip(Ochain)
    end

    if player.status ~= "Engaged" and AutoRefreshMode == true then
        equip(Refresh)    
    end

end
--------------------------------------------------------------------------------------------------
function self_command(command)

    if command == "MeleeMode" then
        if DTMode == true then            
            DTMode = false
            SDTMode = true
            add_to_chat(158,'Fight Mode Change To: SDTMode -50DT 941acc')
        elseif SDTMode == true then            
            SDTMode = false
            HPMode = true
            add_to_chat(158,'Fight Mode Change To: HPMode')
        elseif HPMode == true then            
            HPMode = false
            EnmityMode = true
            add_to_chat(158,'Fight Mode Change To: EnmityMode')
        elseif EnmityMode == true then            
            EnmityMode = false
            DDMode     = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
        elseif DDMode == true then
            DDMode  = false
            ACCMode = true
            add_to_chat(158,'Fight Mode Change To: ACCMode')
        elseif ACCMode == true then           
            ACCMode = false
            VITSTRMode = true 
            add_to_chat(158,'Fight Mode Change To: VITSTRMode')
        elseif VITSTRMode == true then            
            VITSTRMode    = false
            STRMode = true 
            add_to_chat(158,'Fight Mode Change To: STRMode')
        elseif STRMode == true then  
            STRMode = false   
            CRITMode = true
            add_to_chat(158,'Fight Mode Change To: CRITMode')
        elseif CRITMode == true then  
            CRITMode = false
            DTMode = true
            add_to_chat(158,'Fight Mode Change To: DTMode -41dt 946acc ')
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        SetPostEventGear()
        send_command('input /lockstyle off;')
    elseif command == "ShieldMode" then
        if AegisMode == true then
            OchainMode = true
            AegisMode = false
            add_to_chat(158,'Shield Mode: Ochain')
        elseif OchainMode == true then
            OchainMode = false
            AegisMode = false
            add_to_chat(158,'Shield Mode: Off')
        elseif AegisMode == false and OchainMode == false then
            AegisMode = true
            add_to_chat(158,'Shield Mode: Aegis')
        else
             add_to_chat(158,'Shield Mode Error: Undefined Mode')
        end
        SetPostEventGear()
    elseif command == "AutoRefreshMode" then
        if AutoRefreshMode == true then
            AutoRefreshMode = false
            add_to_chat(158,'Auto Refresh Mode Turn Off')
        else
            AutoRefreshMode = true
            add_to_chat(158,'Auto Refresh Mode Turn On')
        end
        equip(Refresh)
    elseif command == "AutoMode" then
        if AutoMode == true then
            AutoMode = false
            add_to_chat(158,'AutoMode Buff Turn Off')
        else
            AutoMode = true
            add_to_chat(158,'AutoMode Buff Turn On')
            RecastMissingBuffs()
        end
        SetPostEventGear()
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 89;')
    end
end  
------------------------------------------------------------------------------------------------
function RecastMissingBuffs(SpellName)
   
    local PhalanxCast   = 106
    local Crusade       = 476
    local Reprisal      = 97
    local EnlightII     = 855
    local Protect       = 47 --- Protect V
    local Shell         = 51  --- Shell IV
    local Berserk=1
    local Aggressor =4
    local spell_recasts = windower.ffxi.get_spell_recasts()

    if player.status == "Engaged" then   
        if AutoMode and player.hp < 1480 then
            add_to_chat(158,'HP less then 1480 casting Cure IV')
            send_command('@wait 1;input /ma "cure IV" <me>;')
        elseif AutoMode and not buffactive.Protect and SpellName ~= "Protect V" and spell_recasts[Protect] < 1 and not DDMode and not ACCMode then
                add_to_chat(158,'Protect Missing Recasting')
                send_command('@wait 1;input /ma "Protect V" <me>;')
        elseif AutoMode and not buffactive.Shell and SpellName ~= "Shell IV" and spell_recasts[Shell] < 1 and not DDMode and not ACCMode  then
                add_to_chat(158,'Shell Missing Recasting')
                send_command('@wait 1;input /ma "Shell IV" <me>;')
        elseif AutoMode and not buffactive.Phalanx and SpellName ~= "Phalanx" and spell_recasts[PhalanxCast] < 1 and not DDMode and not ACCMode then
                add_to_chat(158,'Phalanx Missing Recasting')
                send_command('@wait 1;input /ma phalanx <me>;')
        elseif AutoMode and not buffactive.Reprisal  and SpellName ~= "Reprisal" and spell_recasts[Reprisal] < 1 and not DDMode and not ACCMode then
                add_to_chat(158,'Reprisal Missing Recasting')
                send_command('@wait 1;input /ma Reprisal <me>;')
        elseif AutoMode and not buffactive['Enmity Boost'] and SpellName ~= "Crusade" and spell_recasts[Crusade] < 1 and not DDMode and not ACCMode then
                add_to_chat(158,'Crusade Missing Recasting')
                send_command('@wait 1;input /ma Crusade <me>;')
        elseif AutoMode and not buffactive.Enlight  and SpellName ~= "Enlight II" and spell_recasts[EnlightII] < 1 and not DDMode   then
                add_to_chat(158,'EnlightII Missing Recasting')
                send_command('@wait 1;input /ma "Enlight II" <me>;')
        elseif AutoMode and not buffactive.berserk and spell_recasts[Berserk] < 1 and spell_recasts[Aggressor] < 1 then
                if DDMode or DDACCMode or ACCMode then
                    send_command('input /ja berserk <me>;')
                end
        elseif AutoMode and not buffactive.aggressor and spell_recasts[Aggressor] < 1 and  buffactive.berserk  then
                if DDMode or DDACCMode or ACCMode then               
                    send_command('input /ja aggressor <me>;')
                end
      
        end
    end
end
