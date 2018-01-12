function get_sets()
    send_command('input /macro book 7')
    send_command('input /macro set 1')

    send_command('gs enable ring1')
    send_command('gs enable ring2')
  

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec ninget.txt;wait 5;gs c LoadSet')
    end

    DDMode       = true
    DDACCMode    = false
    ACCMode      = false
    PDTMode      = false
    DEXMode      = false
    AGIMode      = false
    CapacityMode = false
    CastingEXP   = false
    AutoMode     = false
    CapacityMode = false
    CastingEXP   = false
    IsCastingTS   = os.time()
    LastRingCheck = os.time()
    TNextUsedHour=null
    TNextUsedMin=null
    TNextUsedDay=null
    TNextUsedMon=null
    CPNextUsedHour=null
    CPNextUsedMin=null
    CPNextUsedDay=null
    CPNextUsedMon=null

    Trust    = {body="yoran unity shirt"}
    Main    = {main="aizushintogo", sub="shigi"}
    MD      = {head="Mochizuki hatsuburi", body="samuha coat", hands="Hattori tekko", 
              feet="Mochizuki kyahan",ear1="moldavite earring", ear2="hecate's earring",
               ring1="acumen ring",back="yokaze mantle"}
    Migawar = {body="Hattori ningi",hands="Mochizuki tekko"}
    Utsusemi= {feet="Hattori kyahan",body="Mochizuki chainmail +1",
               neck="magoraga beads",ring1="prolix ring",hands="leyline gloves"}
    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    BootDD={ name="Herculean Boots", augments={'Accuracy+27','"Store TP"+4','DEX+4','Attack+8'}}

    DEX     = {head="adhemar bonnet",neck="fotia gorget",ear1="moonshade earring",ear2="ishvara earring",
               body="adhemar jacket",hands="adhemar wristbands",ring1="Epona's Ring",
               ring2="ramuh ring",waist="fotia Belt",legs="hizamaru hizayoroi +1",feet="Ryuo sune-ate",
               back="yokaze Mantle"}

    AGI     = {head="adhemar bonnet",neck="fotia gorget",ear1="moonshade earring",ear2="brutal earring",
               body="adhemar jacket",hands="adhemar wristbands",ring1="Epona's Ring",
               ring2="garuda ring",waist="fotia Belt",legs="hizamaru hizayoroi +1",feet=BootDD,
               back="yokaze Mantle"}
   
    DD      = {ammo="togakuhsi shuriken",head="Ryuo somen",neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="adhemar jacket",hands="floral gauntlets",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt +1",
               legs="samnuha tights",feet="hizamaru sun-ate +1",back="yokaze Mantle"}

    DDACC    = {ammo="togakuhsi shuriken",head="Ryuo somen",neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt +1",
               legs="samnuha tights",feet=BootDD,back="yokaze Mantle"}


    ACC     = {ammo="togakuhsi shuriken",head="Ryuo somen",neck="subtlety spectacles",ear2="brutal earring",
               ear1="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Raumh ring",ring2="enlivened ring",legs="hizamaru hizayoroi +1",
               feet=BootDD,back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head="hizamaru somen +1",neck="loricate torque +1",body="hizamaru haramaki +1",
               hands="hizamaru kote +1",ring1="vocane ring",ring2="Defending ring",
               legs="hizamaru hizayoroi +1",feet="hizamaru sune-ate +1",back="solemnity cape",waist="flume belt"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec ninput.txt') 
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        if name == "Blade: Hi" then
            equip(DEX)
        elseif name == "Blade: Shun" then
            equip(AGI)
        end
    else
      cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('wait 5;input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
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
-----------------------------------------------------------------------------------------------
function MigawarSpell (Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        add_to_chat(158,'Migawari Detected: Loading Migawari Gear')
        equip(Migawar)
    else
        cancel_spell()
    end
end
-----------------------------------------------------------------------------------------------
function UtsusemiSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        add_to_chat(158,Name..' Detected: Shadow Boots On')
        equip(Utsusemi)
    else
        equip(PDT)
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_spell_recasts()[ID] < 1 then
        add_to_chat(158,Name..' Detected:')
   else
        cancel_spell()
   end
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name=="Utsusemi: Ichi" then
        UtsusemiSpell(Spell)
    elseif Spell.name=="Utsusemi: Ni" then
        UtsusemiSpell(Spell)
    elseif Spell.name=="Utsusemi: San" then
        UtsusemiSpell(Spell)
    elseif Spell.name=="Migawari: Ichi" then      
        MigawarSpell(Spell)
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
function aftercast(Spell)
    SetPostEventGear()
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

    if CastingEXP  then
        CastEXPRing()  
    end
 
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
            if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
                if not buffactive.berserk and spell_recasts[Berserk] < 1 and spell_recasts[Aggressor] < 1 then 
                    send_command('input /ja berserk <me>;')
                elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 and buffactive.berserk then 
                   send_command('input /ja aggressor <me>;')
                end
            else
                    CastShadows()
            end
        end
    end 
end
-------------------------------------------------------------------------------------------------------------------
function CastShadows()
    local Ichi = 338
    local Ni   = 339
    local San  = 340
    local spell_recasts = windower.ffxi.get_spell_recasts()
add_to_chat(158,'shadowcasting')
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
        elseif spell_recasts[Ichi] < spell_recasts[Ichi] then
            wait = math.ceil(spell_recasts[Ichi] / 100) +1
            send_command('@wait '..wait..';input /ma "Utsusemi: Ichi" <me>;')
        else
            equip(PDT)
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
    elseif DEXMode == true then     
        equip(DEX)
    elseif AGIMode == true then     
        equip(AGI)
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
            DEXMode  = true  
            add_to_chat(158,'Fight Mode Change To: DEXMode')
        elseif DEXMode == true then  
            DEXMode = false   
            AGIMode  = true  
            add_to_chat(158,'Fight Mode Change To: AGIMode')
        elseif AGIMode == true then  
            AGIMode = false   
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
        else
            CounterStanceMode= true
        end
    elseif command == "LockStyle" then
        send_command('input /lockstyleset 87;')        
    elseif command == "Help" then
        ShortCuts() 
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 87;')     
    elseif command == "PDTMode" then
        if PDTMode == true then
            PDTMode = false
            add_to_chat(158,'PDTMode Turn Off')
        else
            PDTMode = true
            add_to_chat(158,'PDTMode Buff Turn On')
        end
        SetPostEventGear()
        --send_command('input /lockstyle off;')   
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
    local CMon  = os.date("%m",CurrentTime)
    CMin    = CMin + ( CHour *60 )

    local   TD=null
    local THour =null
    local TMin  =null
    local TDay  =null
    local TMon   = null
    local CPD   = null
    local CPHour  = null
    local CPMin   = null
    local CPDay   = null
    local CPMon   = null

    if LastCheck < CurrentTime then
        if TNextUsedDay ~= null and CPNextUsedDay ~= null then
            CheckT  = TNextUsedMin +  (TNextUsedHour*60) 
            CheckCP = CPNextUsedMin + (CPNextUsedHour*60) 

            if TNextUsedDay < CDay or CPNextUsedDay < CDay or CPNextUsedMon > CMon or TNextUsedMon > CMon then
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
                TMon    = os.date("%m",TrizekData.next_use_time)
                THour   = THour + TZOffset;
                TMin    = TMin + ( THour *60 )
                TD    = TMin-CMin
                --add_to_chat(158,"Trizek Data: "..TMin.."-"..CMin.."="..TD.." |".. CDay.." > "..TDay)
                --add_to_chat(158,"Capacity Charges: "..TrizekData.charges_remaining)
           
                if TrizekData.charges_remaining > 0 then
                    if TD < 0 or CDay > TDay or CMon > TMon then
                        RingReady= true
                        TNextUsedHour = os.date("%H",TrizekData.next_use_time)+ TZOffset + 2
                        TNextUsedMin  = os.date("%M",TrizekData.next_use_time)
                        TNextUsedDay  = os.date("%d",TrizekData.next_use_time)
                        TNextUsedMon  = os.date("%m",TrizekData.next_use_time)

                    else
                        TNextUsedHour = os.date("%H",TrizekData.next_use_time)+ TZOffset
                        TNextUsedMin  = os.date("%M",TrizekData.next_use_time)
                        TNextUsedDay  = os.date("%d",TrizekData.next_use_time)
                        TNextUsedMon  = os.date("%m",TrizekData.next_use_time)
                    end
                end
            else
                add_to_chat(158,"Trizek Ring: Missing")
            end

            if CapacityData ~= null then
                CPHour  = os.date("%H",CapacityData.next_use_time)
                CPMin   = os.date("%M",CapacityData.next_use_time)
                CPDay   = os.date("%d",CapacityData.next_use_time)
                CPMon   = os.date("%m",CapacityData.next_use_time)
                CPHour  = CPHour + TZOffset;
                CPMin   = CPMin + ( CPHour *60 )
                CPD   = CPMin-CMin
                --add_to_chat(158,"Capacity Data: "..CPMin.."-"..CMin.."="..CPD.." |".. CDay.." > "..CPDay)
                --add_to_chat(158,"Capacity Charges: "..CapacityData.charges_remaining)

                if CapacityData.charges_remaining > 0 then
                    if CPD < 0  or CDay > CPDay or CMon > CPMon then
                        RingReady= true
                        CPNextUsedHour = os.date("%H",CapacityData.next_use_time) + TZOffset
                        CPNextUsedMin  = os.date("%M",CapacityData.next_use_time) +15
                        CPNextUsedDay  = os.date("%d",CapacityData.next_use_time)  
                        CPNextUsedMon  = os.date("%m",CapacityData.next_use_time)
                    else
                        CPNextUsedHour = os.date("%H",CapacityData.next_use_time) + TZOffset
                        CPNextUsedMin  = os.date("%M",CapacityData.next_use_time)
                        CPNextUsedDay  = os.date("%d",CapacityData.next_use_time)  
                        CPNextUsedMon  = os.date("%m",CapacityData.next_use_time)
                    end
                elseif TD > 30 then
                    equip (CapGear)
                    send_command('gs disable back')
                    CapacityMode    = false
                    CastingEXP      = false
                end
            else
                --add_to_chat(158,"Capcity Ring: Missing")
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
