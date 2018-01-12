function get_sets()
    send_command('input /macro book 16')
    send_command('input /macro set 1')

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec rngget.txt;wait 5;gs c LoadSet')
    end

    DDMode       = true
    ACCMode      = false
    RNGMode      = false
    DEXMode      = false
    MATMode      = false
    AGIMode      = false
    STRMode      = false
    MNDMode = false
    RATMode      = true
    RACMode      = false
    PDTMode      = false
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
    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}
    
    Velocity ={body ="amini caban"}
    BountySt={hands="Amini glovelettes"}
    Camouflg={body="Orion Jerkin +1"}
    SharpSt ={legs="Orion braccae +1"}
    Scavenge={feet="Orion Socks +1"}
    Barrage ={hands="Orion bracers +1"}
    Main    = {main="Vampirism",sub="malevolence", range="teller"}
    Trust    = {body="yoran unity shirt"}

    HercBtRng = { name="Herculean Boots", augments={'Rng.Acc.+15 Rng.Atk.+15','Enmity-3','CHR+1','Rng.Acc.+11','Rng.Atk.+7'}}
    HercBtDD  = { name="Herculean Boots", augments={'Accuracy+27','"Store TP"+4','DEX+4','Attack+8'}}

    WSmelee = {head="carmine mask",neck="fotia gorget",ear1="brutal earring",ear2="flame pearl",
               body="adhemar jacket",hands="Pursuer's cuffs",ring1="Ifrit ring +1",
               ring2="Ifrit ring +1",waist="fotia Belt",legs="samnuha tights",
               feet=HercBtDD,back="Buquwik Cape"}

    MND      ={head="Carmine mask",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="mekosuchinae harness",hands="Carmine finger gauntlets",
               ring1="epona's ring",ring2="leviathan ring",waist="fotia Belt",
               legs="carmine cuisses",feet="carmine greaves",back="tuilha cape"}

    WSlastS = {head="Pursuer's beret",neck="fotia gorget",ear1="ishvara earring",
               ear2="moonshade earring",body="adhemar jacket",hands="Pursuer's cuffs",
               ring1="Garuda ring",ring2="Garuda ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="ik Cape"}

    WSwildF = {head="herculean helm",neck="sanctity necklace",ear1="friomisi earring",
               ear2="hecate's earring",body="Samnuha coat",hands="Pursuer's cuffs",
               ring1="acumen ring",ring2="Defending ring",waist="eschan stone",
               legs="Gyve trousers",feet="adhemar gamashes",back="Argochampsa Mantle"}

    WSJin   = {head="herculean helm",neck="fotia gorget",ear1="ishvara earring",
               ear2="moonshade earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Ramuh ring",ring2="Ramuh ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="kayapa Cape"}
   
    DD      = {head="carmine mask",neck="asperity necklace",ear1="brutal earring",
               ear12="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="cetl belt",
               legs="carmine cuisses",feet=HercBtDD ,back="Grounded mantle +1"}

    DDAcc   = {head="carmine mask",neck="subtlety spectacles",ear1="brutal earring",
               ear12="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Ramuh ring",ring2="enlivened ring",legs="carmine cuisses",
               feet=HercBtDD ,back="Grounded mantle +1",waist="olseni belt"}

    PDTHead  = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand  = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs  = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet  = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDTBody   = {name = "qaaxo harness",  augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="loricate torque +1",body=PDTBody,ear1="brutal earring",
               ear12="zennaroi earring",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}

    SnapShot= {head="Amini Gapette",Body="pursuer's doublet",hands="carmine finger gauntlets",
               waist="impulse belt",legs="samnuha tights",feet="adhemar gamashes",back="lutian Cape"}

    Rng     = {head="herculean helm",neck="ocachi gorget",ear1="enervating earring",
               ear2="volley earring",body="adhemar jacket",hands="herculean gloves",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="herculean trousers",feet="Herculean boots",back="lutian Cape"}

    RngAcc  = {head="herculean helm",neck="Marked Gorget",ear1="enervating earring",
               ear2="volley earring",body="adhemar jacket",hands="herculean gloves",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="herculean trousers",feet="Herculean boots",back="lutian Cape"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec rngput.txt') 
    end
end
--------------------------------------------------------------------------------------------------------------------
function RangeAttack()
    if player.TP > 999 then
        cancel_spell() 
        send_command('input /ws "Jishnu\'s Radiance" <t>')
    else
            if player.equipment.ammo == 'empty' then
                equip ({ammo="ra'kaznar arrow"})
            elseif player.equipment.ammo == 'empty' then
                equip ({ammo="eminent bullet"})
            end

        equip(SnapShot)
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP > 999 then
        if name=="Last Stand" or name=="Wildfire" or name=="Leaden Salute" or name=="Jishnu's Radiance" then
            if name == "Jishnu's Radiance" and player.equipment.ammo == 'empty' then
                equip ({ammo="ra'kaznar arrow"})
            elseif player.equipment.ammo == 'empty' then
                equip ({ammo="eminent bullet"})
            end

            if player.equipment.ammo == 'empty' then
                cancel_spell()
                send_command('input /ws "savage blade" <t>')
            else
                if name=="Last Stand" then
                    equip(WSlastS)
                elseif name=="Wildfire" then
                    equip(WSwildF)
                elseif name=="Leaden Salute" then
                    equip(WSwildF)
                elseif name=="Jishnu's Radiance" then
                    equip(WSJin)
                end
            end
        elseif name == "Requiescat" then
            equip(MND)
        else
            equip(WSmelee)
        end
    else
        cancel_spell()      
    end
end
------------------------------------------------------------------------------------------------
function BarrageSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Barrage)
        add_to_chat(158,'Barrage Detected: Barrage Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function ScavengeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Scavenge)
        add_to_chat(158,'Scavenge Detected: Scavenge Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function CamouflageSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Camouflg)
        add_to_chat(158,'Camouflage Detected: Camouflage Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function SharpshotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(SharpSt)
        add_to_chat(158,'Sharpshot Detected: Sharpshot Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function VelocityShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name
 
    if windower.ffxi.get_ability_recasts()[ID]  < 1 then
        equip(Velocity)
        add_to_chat(158,'Velocity Shot Detected:Velocity Shot Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function DoubleShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(DoubleSt)
        add_to_chat(158,'Double Shot Detected: Double Shot Gear')
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function BountyShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID]  < 1 then
        equip(BountySt)
        add_to_chat(158,'Bounty Shot Detected: Bounty Shot Gear')
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
    elseif Spell.name == 'Ranged' then
        RangeAttack(Spell)
    elseif Spell.name == "Barrage" then
        BarrageSpell(Spell)
    elseif Spell.name == "Bounty Shot" then
        BountyShotSpell(Spell)
    elseif Spell.name == "Double Shot" then
        DoubleShotSpell(Spell)
    elseif Spell.name == "Camouflage" then
        CamouflageSpell(Spell)
    elseif Spell.name == "Sharpshot" then
        SharpshotSpell(Spell)
    elseif Spell.name == "Velocity Shot" then
        VelocityShotSpell(Spell)
    elseif Spell.name == "Scavenge" then
        ScavengeSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else

    end
    
    if CapacityMode == true then
        equip(CapGear)
    end
end
------------------------------------------------------------------------------------------------
function midcast(Spell)
    if Spell.name == 'Ranged' then
        if RATMode == true then
            equip (Rng)
        else
            equip (RngAcc)
        end
        if buffactive.Barrage then
            equip (Barrage)
        end
   end


    if CapacityMode == true then
       equip(CapGear)
    end

end
------------------------------------------------------------------------------------------------
function aftercast(spell)

    if CapacityMode == true then
       equip(CapGear)

       if CastingEXP then
           CastEXPRing()
       end
    end
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

end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if RNGMode == true then 
        if RACMode == true then
            equip(RngAcc)
        else
            equip(Rng)
        end
    elseif DDMode == true then 
        equip(DD)
    elseif ACCMode == true then
        equip(DDAcc)
    elseif  PDTMode == true then
        equip(PDT)
    elseif  DEXMode == true then
        equip(WSJin)
    elseif  MATMode == true then
        equip(WSwildF)
    elseif  AGIMode == true then
        equip(WSlastS)
    elseif  STRMode == true then
        equip(WSmelee)
    elseif  MNDMode == true then
        equip(MND)
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
            add_to_chat(158,'Fight Mode Change To: RNGMode')
            PDTMode = false
            RNGMode  = true 
        elseif RNGMode == true then
            add_to_chat(158,'Fight Mode Change To: DEXMode')
            RNGMode = false
            DEXMode = true
       elseif DEXMode == true then
            add_to_chat(158,'Fight Mode Change To: MATMode')
            DEXMode = false       
            MATMode = true   
        elseif MATMode == true then
            add_to_chat(158,'Fight Mode Change To: AGIMode')
            MATMode = false
            AGIMode = true
        elseif AGIMode == true then
            add_to_chat(158,'Fight Mode Change To: MNDMode')
            AGIMode = false
            MNDMode = true
        elseif MNDMode == true then
            add_to_chat(158,'Fight Mode Change To: STRMode')
            MNDMode = false
            STRMode = true
        elseif STRMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode')
            STRMode = false
            DDMode = true
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        send_command('input /lockstyle off;')
        SetPostEventGear()
    elseif command == "RangeMode" then
        if RATMode == true then
            add_to_chat(158,'Range Mode Change To: RACMode')
            RATMode  = false
            RACMode  = true
        elseif RACMode == true then
            add_to_chat(158,'Range Mode Change To: RATMode')
            RACMode = false
            RATMode = true
        else
            add_to_chat(158,'Range Mode Error: Undefined Mode')
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
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 88;')
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 88;')
    end
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)

    if new == "Idle" then
       equip(PDT)
    else
       SetPostEventGear()
    end  
end
--------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('wait 5;input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
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
