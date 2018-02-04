function get_sets()


    send_command('input /macro book 6')
    send_command('input /macro set 1')

    send_command('gs enable ring1')
    send_command('gs enable ring2')

    DDMode       = true
    DDACCMode    = false
    ACCMode      = false
    PDTMode      = false
    STRMode      = false
    CapacityMode = false
    CastingEXP   = false
    AutoMode     = false

    CapacityMode    = false
    CastingEXP      = false
    LastSpellCast = ""
    IsCasting     = false
    IsCastingTS   = os.time()
    LastRingCheck = os.time()
    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}
    Hasso   = {hands="Wakido Kote +1"}
    Meditate= {head="Wakido Kabuto +1",back="takaha mantle",hands="Sakonji Kote"}
    Trust    = {body="yoran unity shirt"}

    STR      = {head="Rao Kabuto",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="kasuga domaru +1",hands="rao kote",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Ryuo hakama",feet="Rao sune-ate",back="buquwik Cape"}

    DD      = {head="Founder's corona",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Founder's breastplate",hands="Founder's gauntlets",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="Ryuo hakama",feet="loyalist sabatons",back="takaha mantle"}

    DDACC    = {head="Ryuo somen",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="kasuga domaru +1",hands="Ryuo tekko",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="Ryuo hakama",feet="Valorous greaves",back="takaha mantle"}

    ACC     = {head="valorous mask",neck="subtlety spectacles",ear2="steelflash earring",
               ear1="zennaroi earring",body="kasuga domaru +1",hands="Ryuo tekko",
               ring1="Ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Ryuo hakama",feet="Rao sune-ate",back="Grounded Mantle +1"}

    PDT     = {head="xaddi headgear",neck="twilight torque",ear2="steelflash earring",
               ear1="bladeborn earring",body="emet harness +1",hands="Xaddi gaundlets",
               ring1="vocane ring",ring2="Defending Ring",back="iximulew cape",
               waist="flume belt",legs="xaddi cuisses",feet="amm greaves"}

end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        equip(STR)
    else
      cancel_spell()
       
    end
end
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('wait 2;input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end

-------------------------------------------------------------------------------------------------------------------
function MeditateSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Meditate)
    else
        cancel_spell()
    end
end        
-------------------------------------------------------------------------------------------------------------------
function HassoSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Hasso)
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function Kozenittai(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then
        if windower.ffxi.get_ability_recasts()[141] < 1 then
            send_command('input /ja sengikori <me>;')
            cast_delay(1)
        end
   else
        cancel_spell()
   end

end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then

   else
        cancel_spell()
   end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then

    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == "Hasso" then
        HassoSpell(Spell)
    elseif Spell.name == "Meditate" then
        MeditateSpell(Spell)
    elseif Spell.name == "Konzen-ittai" then
        Kozenittai(Spell)
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
    elseif Spell.type =="Trust" then
        equip(Trust)
    elseif Spell.type =="Item" then
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

    SetPostEventGear()

    if CastingEXP then
        CastEXPRing()
    end
        AutoBuffs()
end
------------------------------------------------------------------------------------------------
function buff_change(name,gain)
    local expBuff = buffactive.Commitment
    if CapacityMode == true then
        if not expBuff and not CastingEXP then
            local RingReady  = RingReady("Trizek Ring","Capacity Ring")
            if RingReady then
                equip(EXPRing)
 
                CastingEXP = true
                send_command('gs disable ring1')
                send_command('gs disable ring2')

                add_to_chat(158,'Using Trizek Ring Or Capacity Ring')
            end    
        elseif Gain and Name == "Commitment" and CastingEXP then
            CastingEXP = false 
            send_command('gs enable ring1')
            send_command('gs enable ring2')
            add_to_chat(158,'Commitment Gained')
        elseif expBuff and CastingEXP then
            CastingEXP = false
            send_command('gs enable ring1')
            send_command('gs enable ring2')
            add_to_chat(158,'Commitment Detected') 
        end
    end

    if CastingEXP and not IsBursting then
        CastEXPRing()  
    end 

    AutoBuffs()
end
--------------------------------------------------------------------------------------------------------------------
function AutoBuffs()
    if AutoMode == true then

        local Berserk = 1
        local Aggressor = 4
        local Hasso = 138
        local spell_recasts = windower.ffxi.get_ability_recasts()

        if player.status == "Engaged" and not midaction() then 
            if not buffactive.berserk and spell_recasts[Berserk] < 1 and spell_recasts[Aggressor] < 1 then 
               send_command('wait 1;input /ja berserk <me>;')
            elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 and buffactive.berserk then 
               send_command('wait 1;input /ja aggressor <me>;')
            elseif not buffactive.hasso and spell_recasts[Hasso] < 1 then 
                   send_command('wait 1;input /ja hasso <me>;')
            end
        end
    end 
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()


    if DDMode == true then    
        equip(DD)
    elseif DDACCMode == true then    
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif PDTMode == true then     
        equip(PDT)
    elseif STRMode == true then     
        equip(STR)
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
            CastingEXP      = false
            send_command('gs enable ring1')
            send_command('gs enable ring2')
            add_to_chat(158,'Capacity Mode Turn Off')
        else
            CapacityMode = true
            add_to_chat(158,'Capacity Mode Turn On')
        end
        SetPostEventGear()
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 82;')
    elseif command == "Help" then
        ShortCuts()         
    end
        
    if command == 'coffer' then
                cycle = 0
                invCount = windower.ffxi.get_bag_info(0).count
                if invCount == 80 then
                        add_to_chat(140,'Inv. full. Ending cycle')
                elseif player.inventory["silt pouch"] then
                        send_command('input /item "silt pouch" <me>')
                        cycle = 1
                else
                        add_to_chat(140,'No Coffers found in inv.')
                        send_command('findall Velkk Coffer')
                end
                if cycle == 1 then
                        send_command('wait 2;gs c coffer')
                end
        end

    if CapacityMode == true then
        equip(CapGear)
    end
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)

    if new == "Idle" then
      ---
    else
       -- if player.target.distance > 5 then
       --   --  send_command('input /ja provoke <t>')
           -- send_command('input /ra <t>')
       -- else
            AutoBuffs()
       -- end
    end  
end 
--------------------------------------------------------------------------------------------------------------------
function RingReady(Trizek, Capacity)

    local ExtData   = null
    local Res       = null
    local Trizek1Data = null
    local CapacityData = null
    local LastCheck   = LastRingCheck+30  --check after every 30 seconds
    local RingReady   = false;
    local Continue    = false;
    local TZOffset    = 5 -- +5 for CST might be +4 for Easter and +6 for Moutain 
                          -- not sure what daylight saving will make happen
    local CheckT = null
    local CheckCP = null
    local CurrentTime = os.time()
    local CHour = os.date("%H",CurrentTime)
    local CMin  = os.date("%M",CurrentTime)
    local CDay  = os.date("%d",CurrentTime)
    CMin    = CMin + ( CHour *60 )

    local   TD=null
    local THour =null
    local TMin  =null
    local TDay  =null
    local CPD   = null
    local CPHour  = null
    local CPMin   = null
    local CPDay   = null

    if LastCheck < CurrentTime then
        if TNextUsedDay ~= null and CPNextUsedDay ~= null then
            CheckT  = TNextUsedMin +  (TNextUsedHour*60) 
            CheckCP = CPNextUsedMin + (CPNextUsedHour*60) 

            if TNextUsedDay < CDay or CPNextUsedDay < CDay then
                Continue = true
            elseif  CheckT < CMin then
                Continue = true
            elseif  CheckCP < CMin then
                Continue = true
            end
            --add_to_chat(158,"T Ring Will Be Ready In: CheckT: "..CheckT.." < CMin: "..CMin.." || C Ring Will Be Ready In: CheckCP: "..CheckCP.." < Cmin: "..CMin.." Mins")
        else
            --add_to_chat(158,"Null Detected passing")

            Continue = true
        end 

        if Continue then      
            LastRingCheck = CurrentTime 
            ExtData   = require("extdata")
            Res       = require 'resources'
    
            for _,n in pairs({"inventory"}) do
                for _,v in pairs(gearswap.items[n]) do

                    if type(v) == "table" and v.id ~= 0 and Res.items[v.id].en == Trizek then
                        TrizekData = ExtData.decode(v)
                    end
                    if type(v) == "table" and v.id ~= 0 and Res.items[v.id].en == Capacity then
                        CapacityData = ExtData.decode(v)
                    end
                end        
            end

            if TrizekData ~= null then
                THour   = os.date("%H",TrizekData.next_use_time)
                TMin    = os.date("%M",TrizekData.next_use_time)
                TDay    = os.date("%d",TrizekData.next_use_time)
                THour   = THour + TZOffset;
                TMin    = TMin + ( THour *60 )
                TD    = TMin-CMin
                --add_to_chat(158,"Trizek Data: "..TMin.."-"..CMin.."="..TD)
                --add_to_chat(158,"Capacity Charges: "..TrizekData.charges_remaining)
           
                if TrizekData.charges_remaining > 0 then
                    if TD < 0 or CDay > TDay then
                        RingReady= true
                        TNextUsedHour = os.date("%H",TrizekData.next_use_time)+ TZOffset + 2
                        TNextUsedMin  = os.date("%M",TrizekData.next_use_time)
                        TNextUsedDay  = os.date("%d",TrizekData.next_use_time)
                    else
                        TNextUsedHour = os.date("%H",TrizekData.next_use_time)+ TZOffset
                        TNextUsedMin  = os.date("%M",TrizekData.next_use_time)
                        TNextUsedDay  = os.date("%d",TrizekData.next_use_time)
                    end
                end
            else
                add_to_chat(158,"Trizek Ring: Missing")
            end

            if CapacityData ~= null then
                CPHour  = os.date("%H",CapacityData.next_use_time)
                CPMin   = os.date("%M",CapacityData.next_use_time)
                CPDay   = os.date("%d",CapacityData.next_use_time)
                CPHour  = CPHour + TZOffset;
                CPMin   = CPMin + ( CPHour *60 )
                CPD   = CPMin-CMin
                --add_to_chat(158,"Capacity Data: "..CPMin.."-"..CMin.."="..CPD..")
                --add_to_chat(158,"Capacity Charges: "..CapacityData.charges_remaining)

                if CapacityData.charges_remaining > 0 then
                    if CPD < 0  or CDay > CPDay then
                        RingReady= true
                        CPNextUsedHour = os.date("%H",CapacityData.next_use_time) + TZOffset
                        CPNextUsedMin  = os.date("%M",CapacityData.next_use_time) +15
                        CPNextUsedDay  = os.date("%d",CapacityData.next_use_time)  
                    else
                        CPNextUsedHour = os.date("%H",CapacityData.next_use_time) + TZOffset
                        CPNextUsedMin  = os.date("%M",CapacityData.next_use_time)
                        CPNextUsedDay  = os.date("%d",CapacityData.next_use_time)  
                    end
                elseif TD > 30 then
                    equip (CapGear)
                    send_command('gs disable back')
                    CapacityMode    = false
                    CastingEXP      = false
                end
            else
                add_to_chat(158,"Capcity Ring: Missing")
            end 
        end

        if RingReady then
            --add_to_chat(158,"Return: True")
        else
            --add_to_chat(158,"Return: False")
        end
    end

    return RingReady
end