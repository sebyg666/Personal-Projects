function get_sets()
    send_command('input /macro book 2')
    send_command('input /macro set 1')

    send_command('gs enable ring1')
    send_command('gs enable ring2')
  

    send_command('input /macro book 2')
    send_command('input /macro set 1')
    send_command('bind !1 gs c Provoke ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c PDTMode')
    send_command('bind !4 gs c ShijinSpiral')
    send_command('bind !5 gs c VictorySmite')
    send_command('bind !6 gs c CounterStance')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c CounterStanceMode')
    send_command('bind !9 gs c Dodge')
    send_command('bind !0 gs c AttackBuff')

    send_command('bind ^1 gs c SneakInvis')
    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^6 gs c Chakra')
    send_command('bind ^7 gs c LockStyle')
    send_command('bind ^8 gs c AutoMode')
    send_command('bind ^9 gs c Impetus')
    send_command('bind ^0 gs c CapacityMode')

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec mnkget.txt;wait 5;gs c LoadSet')
    end

    DDMode       = true
    DDACCMode    = false
    ACCMode      = false
    PDTMode      = false
    STRMode      = false
    CapacityMode = false
    CounterStanceMode = false
    CastingEXP   = false
    AutoMode     = false

    Impetus = {body="Bhikku Cyclas +1"}
    HF      = {legs="Hesychast's Hose"}
    Focus   = {head="Anchorite's Crown +1"}
    Dodge   = {feet="Anchorite's Gaiters +1"}
    Boost   = {hands="Anchorite's Gloves +1"}
    Chakra  = {body="Anchorite's Cyclas +1"}
    CounterS= {Feet="Hesychast's Gaiters"}
    Mantra  = {Feet="Hesychast's Gaiters"}
    Formless= {body="Hesychast's Cyclas"}
    Trust    = {body="yoran unity shirt"}
    Main    = {main="nyepel"}

    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    STR      = {head="Rao Kabuto",neck="fotia gorget",ear1="ishvara earring",ear2="moonshade earring",
               body="Bhikku Cyclas +1",hands="Rao kote",ring1="Ifrit ring +1",
               ring2="Ifrit ring +1",waist="fotia Belt",legs="rao haidate",feet="Ryuo sune-ate",
               back="Buquwik Cape"}
   
    DD      = {head="Adhemar bonnet",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Rawhide vest",hands="ryuo tekko",
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="samnuha tights",feet="naga kyahan",back="grounded mantle +1"}

    DDACC    = {head="Ryuo somen",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Rawhide vest",hands="ryuo tekko",
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="Ryuo hakama",feet="rao sune-ate",back="grounded mantle +1"}


    ACC     = {head="Ryuo somen",neck="subtlety spectacles",ear1="zennaroi earring",
               ear2="steelflash earring",body="Rawhide vest",hands="Ryuo tekko",
               ring1="Raumh ring",ring2="enlivened ring",legs="samnuha tights",
               feet="rao sune-ate",back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {main="oatixur",head=PDTHead,neck="loricate torque +1",body="emet harness +1",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="black belt"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec mnkput.txt') 
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

    send_command('unbind ^1')
    send_command('unbind ^2')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        add_to_chat(158,'Load WS Gear')
        if windower.ffxi.get_ability_recasts()[2] < 1 then
            send_command('input /ja warcry <me>;')
            cast_delay(1)
        elseif windower.ffxi.get_ability_recasts()[16] < 1 then
            send_command('input /ja "boost" <me>;')
            cast_delay(1)
        end
        equip(STR)
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

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Impetus)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function HundredFistsSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(HF)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FocusSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Dodge)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function DodgeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Focus)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function BoostSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Boost)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function ChakraSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Chakra)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function CounterstanceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(CounterS)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function MantraSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Mantra)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FormlessStrikesSpell()
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Formless)
    else
        cancel_spell()
    end
end
----------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then

    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,Name..' Detected:')
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
    elseif Spell.type =="Trust" then
        equip(Trust)
    end
    if CapacityMode == true then
        equip(CapGear)
    end
    
end
------------------------------------------------------------------------------------------------
function aftercast(spell, action, spellMap, eventArgs)
    SetPostEventGear()
    
    if CastingEXP then
        CastEXPRing()
    end
        AutoBuffs()
end
------------------------------------------------------------------------------------------------
function buff_change(name,gain)
    AutoBuffs()
end
--------------------------------------------------------------------------------------------------------------------
function AutoBuffs()
    if AutoMode == true then

        local Berserk = 1
        local Aggressor = 4
        local Dodge = 14
        local Focus = 13
        local Counterstance = 17
        local Impetus = 31
        local spell_recasts = windower.ffxi.get_ability_recasts()

        if player.status == "Engaged" and not midaction() then 
            if not buffactive.berserk and spell_recasts[Berserk] < 1 and spell_recasts[Aggressor] < 1 then 
               send_command('input /ja berserk <me>;')
            elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 and buffactive.berserk then 
               send_command('input /ja aggressor <me>;')
            elseif not buffactive.focus and spell_recasts[Focus] < 1 then 
               send_command('input /ja Focus <me>;')
            elseif not buffactive.dodge and spell_recasts[Dodge] < 1 then 
               send_command('input /ja Dodge <me>;')
            elseif not buffactive.counterstance and spell_recasts[Counterstance] < 1 and CounterStanceMode then 
               send_command('input /ja Counterstance <me>;')
            elseif not buffactive.impetus and spell_recasts[Impetus] < 1 then 
               send_command('input /ja impetus <me>;')
            end
        end
    end 
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if PDTMode == true then     
        equip(PDT)
    elseif DDACCMode == true then    
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif DDMode == true then    
        equip(DD)
    elseif STRMode == true then     
        equip(STR)
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
            DDACCMode = true
            add_to_chat(158,'Fight Mode Change To: DDACCMode')
        elseif DDACCMode == true then           
            DDACCMode = false
            ACCMode = true
            add_to_chat(158,'Fight Mode Change To: ACCMode')
        elseif ACCMode == true then           
            ACCMode = false
            PDTMode = true
            add_to_chat(158,'Fight Mode Change To: PDTMode')
        elseif PDTMode == true then            
            PDTMode    = false
            STRMode  = true  
            add_to_chat(158,'Fight Mode Change To: STRMode')
        elseif STRMode == true then  
            STRMode = false   
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
         else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        send_command('input /lockstyle off;')
        SetPostEventGear()
    elseif command == "CapacityMode" then
        if CapacityMode == true then
            CapacityMode = false
            CastingEXP      = false
            send_command('gs enable ring1')
            send_command('gs enable ring2')
            add_to_chat(158,'Capacity Mode Turn Off')
        else
            CapacityMode = true
            add_to_chat(158,'Capacity Mode Turn On')
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
    elseif command == "CounterStanceMode" then
        if CounterStanceMode then
            CounterStanceMode =false
            add_to_chat(158,'CounterStanceMode Turn Off')
        else
            CounterStanceMode= true
            add_to_chat(158,'CounterStanceMode Turn On')
        end
    elseif command == "PDTMode" then
        if PDTMode == true then
            PDTMode = false
            add_to_chat(158,'PDTMode Turn Off')
        else
            PDTMode = true
            add_to_chat(158,'PDTMode Buff Turn On')
        end
        SetPostEventGear()
    elseif command == "LockStyle" then
        send_command('input /lockstyleset 86;')        
    elseif command == "Help" then
        ShortCuts() 
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 86;')
    elseif command == "Provoke" then
         send_command('input /ja provoke <t>') 
    elseif command == "AttackBuff" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>')
        elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')   
    elseif command == "ShijinSpiral" then
         send_command('input /ws "Shijin Spiral" <t>') 
    elseif command == "VictorySmite" then
         send_command('input /ws "Victory Smite" <t>')   
    elseif command == "Dodge" then
         send_command('input /ja dodge <me>') 
    elseif command == "CounterStance" then
         send_command('input /ja Counterstance <me>') 
    elseif command == "Chakra" then
         send_command('input /ja Chakra <me>') 
    elseif command == "Impetus" then
         send_command('input /ja Impetus <me>') 
  
    end
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)

    if new == "Idle" then
      ---
    else
        AutoBuffs()
    end  
end
