function get_sets()

    if windower.ffxi.get_info().mog_house then 
        send_command('wait 5;exec pldget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 4')
    send_command('input /macro set 1')

    send_command('bind !1 gs c Provoke ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c Cure')
    send_command('bind !4 gs c ChantDuCygne')
    send_command('bind !5 gs c Requiescat')
    send_command('bind !6 gs c SavageBlade')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c palisade')
    send_command('bind !9 gs c Sentinel')
    send_command('bind !0 gs c AttackBuff')


    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^5 gs c ShieldMode')
    send_command('bind ^6 gs c EnlightII')
    send_command('bind ^7 gs c LockStyle')
    send_command('bind ^8 gs c Rampart')
    send_command('bind ^9 gs c Crusade')
    send_command('bind ^0 gs c Phalanx')

    DDMode          = false
    ACCMode         = false
    DTMode          = true
    SDTMode         = false
    HPMode          = false
    VITSTRMode      = false
    VITMode        = false
    STRMode         = false
    DEXMode         = false
    MIDMode         = false
    AegisMode       = true
    OchainMode      = false
    EnmityMode      = false
    AutoRefreshMode = false
    AutoMode        = false


    Ochain   = {sub="Ochain"}
    Aegis    = {sub="Aegis"}
    Refresh  = {body="jumalik mail",neck="creed collar",waist="fucho-no-obi",ring="Apeile ring"}
    Enlight  = {head="jumalik helm",body="Reverence surcoat +1",hands="eschite gauntlets",waist="Asklepian Belt"}
    Fealty   = {body="Caballarius surcoat +1"}
    Chivalry = {hands="Caballarius gauntlets"}
    Invencibl= {legs="Caballarius breeches"}
    Sentinel = {feet="Caballarius leggings +1"}
    Cover    = {head="Reverence coronet +1"}
    Main     = {main="brilliance",sub="Aegis"}
    Trust    = {body="yoran unity shirt"}
  
    EnmityB = {name="weard Mantle",augments={"Enmity+7"}}
    ESTATS  = " Enimty = 100"
    Enmity  = {head="loess barbuta +1",neck="unmoving collar",body="souveran cuirass",
               hands="yorium gauntlets",ring1="petrov ring",ring2="apeile ring",
               back=EnmityB,waist="creed baudrier",legs="Yorium cuisses",
               feet="Yorium Sabatons",ammo="Paeapua"}

    PhalaxB = {name="weard Mantle",augments={"Phalanx+5"}}
    Phalanx = {head="Souveran Schaller",hands="souveran handschuhs",feet="souveran schuhs",back=PhalaxB,legs="Founder's Hose"}

    MagicCas= {head="Souveran Schaller",legs="Founder's Hose"};

    maskDD ={ name="Valorous Mask", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Regen"+1','Pet: STR+8','Pet: Attack+13 Pet: Rng.Atk.+13'}}
    maskTP ={ name="Valorous Mask", augments={'Accuracy+18 Attack+18','"Store TP"+5','VIT+3','Accuracy+12','Attack+11'}}
    legsDD ={ name="Valor. Hose", augments={'Accuracy+21','"Dbl.Atk."+3','DEX+10'}}
    legsTP ={ name="Valor. Hose",      augments={'Accuracy+15 Attack+15','"Store TP"+4','VIT+3','Accuracy+15'}}

    VIT      =  {ammo="ginsen",head="sulevia's Mask +1",neck="fotia gorget",ear2="brutal earring",
               ear1="moonshade earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="Titan ring",ring2="Titan ring",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back="iximulew cape"}

    DEX       ={ammo="ginsen",head="lustratio cap",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="lustratio harness",hands="lustratio mittens",
               ring1="ramuh ring",ring2="ramuh ring",waist="fotia Belt",
               legs="lustratio subligar",feet="lustratio leggings",back="kayapa cape"}

    MID      ={ammo="ginsen",head="Carmine mask",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="sulevia's platemail +1",hands="Carmine finger gauntlets",
               ring1="leviathan ring",ring2="leviathan ring",waist="fotia Belt",
               legs="carmine cuisses",feet="carmine greaves",back="tuilha cape"}

    STR      = {ammo="ginsen",head="sulevia's Mask +1",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back="buquwik cape"}

    VITSTR  = {ammo="ginsen",head="sulevia's Mask +1",neck="fotia gorget",ear2="brutal earring",
               ear1="moonshade earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back="iximulew cape"}

    DD       = {ammo="ginsen",head=maskDD,neck="loricate torque +1",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="odyssean gauntlets",
              ring1="vocane ring",ring2="Defending Ring",waist="tempus fugit",
               legs="valorous house",feet="odyssean greaves",back= "grounded mantle +1" }

    ACC      = {ammo="ginsen",head=maskTP ,neck="subtlety spectacles",ear2="thunder pearl",
               ear1="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Odyssean cuisses",feet="valorous greaves",back=backDD}

                SDTSTATS = 'acc 998 EnlightAcc 1119 haste 27% attack 971 defense 1093 enmity 54 DT 50%'
    SDTB       = {name="weard Mantle",augments={"Enmity+7"}}
    SDT      = {head="yorium barbuta",neck="loricate torque +1",ear2="thureous earring",
               ear1="zennaroi earring",body="souveran cuirass",hands="yorium gauntlets",
               ring1="vocane ring",ring2="Defending Ring",back=SDTB,
               waist="dynamic belt +1",legs="sulevia's cuisses +1",feet="Yorium Sabatons",
               Ammo="ginsen"}

              DTSTATS = 'acc 1013 EnlightAcc 1145 haste 27% attack 1081 defense 1117 enmity 17 DT 50%'
    DTB     = {name="weard Mantle",augments={"Enmity+7"}}
    DT      = {head="sulevia's Mask +1",neck="loricate torque +1",ear2="thureous earring",
               ear1="zennaroi earring",body="souveran cuirass",hands="sulevia's gauntlets +1",
               ring1="vocane ring",ring2="Defending Ring",back=DTB,
               waist="tempus fugit", ammo="ginsen", legs="sulevia's cuisses +1", feet="sulevia's leggings +1"}
               
    HPB = {name="weard Mantle",augments={"Enmity+7"}}
    HP       = {head="Souveran Schaller",neck="loricate torque +1",body="Reverence surcoat +1",
                hands="souveran handschuhs", back=HPB,waist="dynamic belt +1",
                ring1="vocane ring",ring2="Defending Ring",legs="Reverence breeches +1",
                feet="Souveran Schuhs",ear1="bloodgem earring",ear2="thureous earring",
                ammo="Egoist's Tathlum"}

    HPLow    = {head="yorium barbuta",neck="loricate torque +1",body="Emet Harness +1",
                hands="yorium gauntlets",back="kayapa Cape",waist="flume belt",
                ring2="Defending Ring",ring1="vocane ring",legs="Caballarius breeches",
                feet="Yorium sabatons",ear2="steelflash earring",ear1="zennaroi earring",Ammo="amar cluster"}

    HPHigh   = {head="Souveran Schaller",neck="cuamiz collar",body="jumalik mail",
                hands="souveran handschuhs", back="aenotherus mantle +1",waist="creed baudrier",
                ring2="k'ayres ring",ring1="kunaji ring",legs="Reverence breeches +1",
                feet="Souveran Schuhs",ear1="bloodgem earring",ear2="thureous earring",ammo="Egoist's Tathlum"}

    FastCast = {head="carmine mask",neck="voltsurge torque",body="jumalik mail",
                ear1="loquacious earring",ring1="prolix ring",
                feet="Carmine greaves"}

end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec pldput.txt') 
    end


    send_command('unbind !1')
    send_command('unbind !2')
    send_command('unbind !3')
    send_command('unbind !4')
    send_command('unbind !5')
    send_command('unbind !6')
    send_command('unbind !7')
    send_command('unbind !8')
    send_command('unbind !9')
    send_command('unbind !0')


    send_command('unbind ^2')
    send_command('unbind ^5')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')

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
                equip (VIT)
                add_to_chat(158,'VIT WS Gear')
            elseif Name == "Chant du Cygne" then
                equip (DEX)
                add_to_chat(158,'DEX WS Gear')
            elseif Name == "Requiescat" then
                equip (MID)
                add_to_chat(158,'MID WS Gear')
            else
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
            add_to_chat(158,Name..' Detected: +87~100 Enmity Gear')
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
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else

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
    elseif VITMode == true then     
        equip(VIT)
    elseif STRMode == true then     
        equip(STR)
    elseif DEXMode == true then     
        equip(DEX)
    elseif MIDMode == true then     
        equip(MID)
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
            add_to_chat(158,'Fight Mode Change To: SDTMode'..SDTSTATS)
        elseif SDTMode == true then            
            SDTMode = false
            HPMode = true
            add_to_chat(158,'Fight Mode Change To: HPMode')
        elseif HPMode == true then            
            HPMode = false
            EnmityMode = true
            add_to_chat(158,'Fight Mode Change To: EnmityMode '..ESTATS)
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
            DEXMode = true
            add_to_chat(158,'Fight Mode Change To: DEXMode')
        elseif DEXMode == true then  
            DEXMode = false   
            MIDMode = true
            add_to_chat(158,'Fight Mode Change To: MIDMode')
        elseif MIDMode == true then  
            MIDMode = false   
            VITMode = true
            add_to_chat(158,'Fight Mode Change To: VITMode')
        elseif VITMode == true then  
            VITMode = false
            DTMode = true
            add_to_chat(158,'Fight Mode Change To: DTMode '..DTSTATS)
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
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 89;')
    elseif command == "Requiescat" then
         send_command('input /ws "Requiescat" <t>')
    elseif command == "AttackBuff" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>;wait 2;input /ja hasso <me>;wait 2; input /ja restraint <me>')
    elseif command == "SneakInvis" then
         send_command('input /ja "spectral jig" <me>')
    elseif command == "SavageBlade" then
         send_command('input /ws "Savage Blade" <t>')
    elseif command == "Provoke" then
         send_command('input /ja provoke <t>')
    elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')
    elseif command == "Cure" then
         send_command('input /ma "Cure IV" <me>')
    elseif command == "ChantDuCygne" then
         send_command('input /ws "Chant Du Cygne" <t>')
    elseif command == "palisade" then
         send_command('input /ja "palisade" <me>')
    elseif command == "Sentinel" then
         send_command('input /ja "Sentinel" <me>')
    elseif command == "Phalanx" then
         send_command('input /ma Phalanx <me>')
    elseif command == "Crusade" then
         send_command('input /ma crusade <me>')
    elseif command == "Rampart" then
         send_command('input /ja rampart <me>')
    elseif command == "EnlightII" then
         send_command('input /ma "Enlight ii" <me>')
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
