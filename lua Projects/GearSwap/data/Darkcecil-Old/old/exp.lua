function get_sets()
            send_command('gs enable ring1')
            send_command('gs enable ring2')
    CapGear = {back="Mecistopins mantle"}

    CPRing  = {ring1="Trizek Ring",ring2="Capacity Ring"}

    CapacityMode    = true
    CastingEXP      = false

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


end
---------------------------------------------------------------------------------------------------------------------
function aftercast(spell)

        if CapacityMode == true then
           equip(CapGear)

           if CastingEXP then
               CastEXPRing()
           end
        end

end  
---------------------------------------------------------------------------------------------------------------------
function buff_change(name,gain)

    local expBuff = buffactive.Commitment

    if CapacityMode == true then

        if not expBuff and not CastingEXP then
            local RingReady  = RingReady("Trizek Ring","Capacity Ring")
            if RingReady then
                equip(CPRing)
 
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
            add_to_chat(158,"T Ring Will Be Ready In: CheckT: "..CheckT.." < CMin: "..CMin.." || C Ring Will Be Ready In: CheckCP: "..CheckCP.." < Cmin: "..CMin.." Mins")
        else
            add_to_chat(158,"Null Detected passing")

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
                add_to_chat(158,"Trizek Data: "..TMin.."-"..CMin.."="..TD.." |".. CDay.." > "..TDay)
                add_to_chat(158,"Capacity Charges: "..TrizekData.charges_remaining)
           
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
                add_to_chat(158,"Capacity Data: "..CPMin.."-"..CMin.."="..CPD.." |".. CDay.." > "..CPDay)
                add_to_chat(158,"Capacity Charges: "..CapacityData.charges_remaining)

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
                add_to_chat(158,"Capcity Ring: Missing")
            end 
        end

        if RingReady then
            add_to_chat(158,"Return: True")
        else
            add_to_chat(158,"Return: False")
        end
    end

    return RingReady
end
