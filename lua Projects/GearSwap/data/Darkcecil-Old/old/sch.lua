function get_sets()
    AutoMode        = false
    IsBursting      = false
    BuffPartyMode   = false
    LastSpellCast = ""
    IsCasting     = false
    IsCastingTS   = os.time()
    LastRingCheck = os.time()
    
    TNextUsedHour=null
    TNextUsedMin=null
    TNextUsedDay=null
    CPNextUsedHour=null
    CPNextUsedMin=null
    CPNextUsedDay=null

    GearCheck       = 0
    BurstMode       = 0

    BurstSets()
   
    Sublim  = {head="Acad. Mortarboard", body="pedagogy Gown"}
    Immanence    = {hands="arbatel bracers"}
    AclarityS    = {feet="Peda. loagers"}
    Aclarity     = {feet="Academic's loafers +1"}
    TabulaRasa   = {legs="Pedagogy pants"}
    Elightenment = {body="Pedagogy gown"}
    Kilmaform     = {feet="arbatel loafers"}
    HachirinNoObi = {waist="Hachirin-No-Obi"}
    Trust    = {body="yoran unity shirt"}
    EnhancMagic = {waist="siegel sash"}
    Aspir = {waist="fucho-no-obi"}

    Idel = {head="merlinic hood", ear1="lifestorm earring",ear2="psystorm earring",
            neck="twilight torque",body="arbatel gown +1",back="iximulew cape",hands="Amalric Gages",
            ring1="Defending ring", ring2="patricius ring",legs='assiduity pants +1',waist="fucho-no-obi",
            feet="Merlinic crackows"} 
   FastCast = {Ammo="Incantor Stone",head="nahtirah hat",Ear1="loquac. earring",
                Neck="voltsurge torque",body="Helios Jacket",back="Swith cape",hands="Academic's bracers +1",
                ring1="Prolix ring",ring2="locus ring",waist="Channeler's Stone",Legs="psycloth lappas",feet="Academic's loafers +1"}

    Mattack  = {Main="Akademos",Ammo="Ghastly tathlum",head="merlinic hood",Ear1="Hecate's Earring",
                Ear2="friomisi earring",Neck="eddy necklace",body="arbatel gown +1",back="bookworm's cape",
                hands="Amalric Gages",ring1="locus ring",ring2="mujin band",waist="Eschan Stone",
                Legs="Merlinic shalwar",feet="Merlinic crackows"}
end
--===============================================================================================Gear Swap Functions
--==================================================================================================================
--==================================================================================================================
function precast(Spell)

    if IsCasting and LastSpellCast == Spell.name then
        local CurrentTime = os.time()
        local TotalSecs = 0;
        local CH = os.date("%H",CurrentTime)
        local CM = os.date("%M",CurrentTime)
        local CS = os.date("%S",CurrentTime)
        local IH = os.date("%H",IsCastingTS)
        local IM = os.date("%M",IsCastingTS)
        local IS = os.date("%S",IsCastingTS)
        
        local TH = CH - IH;
        TotalSecs = ( TH *60)*60
        
        local TM = CM - IM
        TotalSecs = TotalSecs+(TM*60)
        
        local TS = CS - IS
        TotalSec = TotalSecs+(TS)

        if  TotalSec < 3 then
            cancel_spell()
            return
        end
    end

    LastSpellCast = Spell.name
    IsCasting=true
    IsCastingTS=os.time()

    if buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
        equip({main="Akademos"})
    elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
        equip({main="serenity"})
    end     

    if Spell.name == 'Alacrity' then
        AlacrityAbility(Spell)
    elseif Spell.name == 'Immanence' then
        ImmanenceAbility(Spell)
    elseif Spell.name == 'Tabula Rasa' then
        TabulaRasaAbility(Spell)
    elseif Spell.name == 'Enlightenment' then
        EnlightenmentAbility(Spell)
    elseif Spell.name == 'Kilmaform' then
        KilmaformSpell(Spell)
    elseif Spell.name == "Fire"        or Spell.name == "Fire II"     or Spell.name == "Fire III" or 
           Spell.name == "Fire IV"     or Spell.name == "Fire V" then
        CastFireNuke(Spell)
    elseif Spell.name == "Stone"       or Spell.name == "Stone II"    or Spell.name == "Stone III" or 
           Spell.name == "Stone IV"    or Spell.name == "Stone V" then
        CastStoneNuke(Spell)
    elseif Spell.name == "Water"       or Spell.name == "Water II"    or Spell.name == "Water III" or 
           Spell.name == "Water IV"    or Spell.name == "Water V" then
        CastWaterNuke(Spell)
    elseif Spell.name == "Thunder"     or Spell.name == "Thunder II"  or Spell.name == "Thunder III" or 
           Spell.name == "Thunder IV"  or Spell.name == "Thunder V" then
        CastThunderNuke(Spell)
    elseif Spell.name == "Blizzard"    or Spell.name == "Blizzard II" or Spell.name == "Blizzard III" or 
           Spell.name == "Blizzard IV" or Spell.name == "Blizzard V" then
        CastBlizzardNuke(Spell)
    elseif Spell.name == "Aero"        or Spell.name == "Aero II"     or Spell.name == "Aero III" or 
           Spell.name == "Aero IV"     or Spell.name == "Aero V" then
        CastAeroNuke(Spell)
    elseif Spell.type == "BlackMagic" then
        MagicCast(Spell) 
    elseif Spell.type == "WhiteMagic" then
        MagicCast(Spell) 
    elseif Spell.type =="Trust"  then
        equip(Trust)
    end

end
---------------------------------------------------------------------------------------------------------------------
function midcast(Spell)

    if Spell.type == "BlackMagic" then
        equip(Mattack)

        if GetCurrentStorm() then
            equip(HachirinNoObi)
        end

       if Spell.name=="Aspir" or Spell.name=="Aspir ii" then
           equip(Aspir)
       end

    end

end
---------------------------------------------------------------------------------------------------------------------
function aftercast(spell)
IsCasting=false
    if not IsBursting then
        equip(Idel)
        
        if buffactive['Sublimation: Activated'] then
            equip(Sublim)
        end

        AutoBuffs(Name)
   end 
end   
--====================================================================================================Auto Functions
--==================================================================================================================
--==================================================================================================================
function AutoBuffs(Name)

    local SublimID=234
    local SublimActive = buffactive['Sublimation: Activated']
    local SublimReady  = buffactive['Sublimation: Complete']
    local Myrkr = false;

    if AutoMode and not midaction() and not IsBursting  then
        if player.mpp <50 then
            if SublimReady then
                if windower.ffxi.get_spell_recasts()[SublimID] < 1 then
                    add_to_chat(158,"Sublimation: Ready MP < 50%")
                    --send_command('wait 1;input /ja Sublimation <me>;wait 31;input /ja Sublimation <me>')
                else
                    Myrkr = true; 
                end
            else
                Myrkr = true; 
            end

            if Myrkr and player.tp > 1000 and player.tp < 2000 and player.mpp < 50  then
                add_to_chat(158,"Myrkr: @1000:TP Ready MP < 50%")
            elseif Myrkr and player.tp > 1999 and player.tp < 3000 and player.mpp < 40  then
                add_to_chat(158,"Myrkr: @2000:TP Ready MP < 40%")
            elseif Myrkr and player.tp == 3000 and player.mpp < 30  then
                add_to_chat(158,"Myrkr: @3000:TP Ready MP < 30%")
            end
        end

        if not SublimActive and not SublimReady then
            if windower.ffxi.get_ability_recasts()[SublimID] < 1 then
                add_to_chat(158,"Sublimation: DOWN!!!!! Ready For Recast")
            end
        end

        if  not GetCurrentStorm() then
            add_to_chat(158,"Storm: DOWN!!!!! Ready For Recast")
        end

        if  not buffactive['KilmaForm'] then
            add_to_chat(158,"KilmaformStorm: DOWN!!!!! Ready For Recast")
        end

        if  not buffactive['Regain'] and player.tp < 3000 then
            add_to_chat(158,"regain: DOWN!!!!! Ready For Recast")
        end

    end
end
--============================================================================================Regain Storm Functions
--==================================================================================================================
--==================================================================================================================
function GetCurrentStorm()

    if BurstMode == 0 then
        if buffactive['Firestorm'] then
           return true
        end
    elseif BurstMode == 1 then
        if buffactive['Hailstorm'] then 
            return true
        end
    elseif BurstMode == 2 then
        if buffactive['Windstorm'] then
            return true
        end
    elseif BurstMode == 3 then
        if buffactive['Sandstorm'] then
            return true
        end
    elseif BurstMode == 4 then
        if buffactive['Thunderstorm'] then
            return true
        end
    elseif BurstMode == 5 then
        if buffactive['Rainstorm'] then
            return true
        end
    elseif BurstMode == 6 then
        if buffactive['Aurorastorm'] then
            return true
        end
    elseif BurstMode == 7 then
        if buffactive['Voidstorm'] then
            return true
        end
    end

    return false
end
--------------------------------------------------------------------------------------------------------------------
function CastCurrentStorm(Target,Time)
    if BurstMode == 0 then
        send_command('wait '..Time..';input /ma "Firestorm II" <'..Target..'>')
    elseif BurstMode == 1 then 
        send_command('wait '..Time..';input /ma "Hailstorm II" <'..Target..'>')
    elseif BurstMode == 2 then
        send_command('wait '..Time..';input /ma "Windstorm II" <'..Target..'>')
    elseif BurstMode == 3 then
        send_command('wait '..Time..';input /ma "Sandstorm II" <'..Target..'>')
    elseif BurstMode == 4 then
        send_command('wait '..Time..';input /ma "Thunderstorm II" <'..Target..'>')
    elseif BurstMode == 5 then
        send_command('wait '..Time..';input /ma "Rainstorm II" <'..Target..'>')
    elseif BurstMode == 6 then
        send_command('wait '..Time..';input /ma "Aurorastorm II" <'..Target..'>')
    elseif BurstMode == 7 then
        send_command('wait '..Time..';input /ma "Voidstorm II" <'..Target..'>')
    end
end
--------------------------------------------------------------------------------------------------------------------
function CastCurrentRegain(Target,Time)
    send_command('wait '..Time..';input /ma Adloquium <'..Target..'>')
end
--===================================================================================================Burst Functions
--==================================================================================================================
--==================================================================================================================
function Burst(Type)

    if not buffactive['Addendum: Black'] then
        add_to_chat(158,'Dark Arts: Activated')
        send_command('input /ja "Dark Arts" <me>;wait 4;input /ja "Addendum: Black" <me>;')
        return
    elseif get_current_strategem_count() < 2 then
        add_to_chat(158,'Not Enough Charges To Burst')
        return
    elseif IsBursting then
        add_to_chat(158,"Already Bursting Please wait for cycle to end")
    elseif  Type == "Fire" then
        send_command('gs c IsBursting;input /p Opening Fire Burst;   input /ja immanence <me>;wait 2; input /ma fire <t>;       wait 4;input /p Closing Fire Burts;   input /ja immanence <me>;wait 3;input /ma thunder <t>;   wait 4;input /p Casting Burst;input /ma "Fire V" <t>;    wait 7;gs c IsNotBursting')
    elseif  Type == "Water" then
        send_command('gs c IsBursting;input /p Opening Water Burst;  input /ja immanence <me>;wait 4; input /ma luminohelix <t>;wait 6;input /p Closing Water Burts;  input /ja immanence <me>;wait 3;input /ma stone <t>;     wait 4;input /p Casting Burst;input /ma "Water V" <t>;   wait 7;gs c IsNotBursting')
    elseif  Type == "Thunder" then
        send_command('gs c IsBursting;input /p Opening Thunder Burst;input /ja immanence <me>;wait 4; input /ma blizzard <t>;   wait 4;input /p Closing Thunder Burts;input /ja immanence <me>;wait 3;input /ma water <t>;     wait 4;input /p Casting Burst;input /ma "Thunder V" <t>; wait 7;gs c IsNotBursting')
    elseif  Type == "Blizzard" then
        send_command('gs c IsBursting;input /p Opening Ice Burst;    input /ja immanence <me>;wait 4; input /ma luminohelix <t>;wait 6;input /p Closing Ice Burts;    input /ja immanence <me>;wait 3;input /ma stone <t>;     wait 4;input /p Casting Burst;input /ma "blizzard V" <t>;wait 7;gs c IsNotBursting')
    elseif  Type == "Stone" then
        send_command('gs c IsBursting;input /p Opening Earth Burst;  input /ja immanence <me>;wait 4; input /ma aero <t>;       wait 4;input /p Closing Earth Burts;  input /ja immanence <me>;wait 3;input /ma noctohelix <t>;wait 6;input /p Casting Burst;input /ma "stone V" <t>;   wait 7;gs c IsNotBursting')
    elseif  Type == "Aero" then
        send_command('gs c IsBursting;input /p Opening Wind Burst;   input /ja immanence <me>;wait 4; input /ma blizzard <t>;   wait 4;input /p Closing Wind Burts;   input /ja immanence <me>;wait 3;input /ma water <t>;     wait 4;input /p Casting Burst;input /ma "aero V" <t>;    wait 7;gs c IsNotBursting') 
    elseif  Type == "Light" then
        send_command('gs c IsBursting;input /p Opening Light Burst;  input /ja immanence <me>;wait 4; input /ma fire <t>;       wait 4;input /p Closing Light Burts;  input /ja immanence <me>;wait 3;input /ma thunder <t>;   wait 4;                                                         gs c IsNotBursting')
    elseif  Type == "Dark" then
        send_command('gs c IsBursting;input /p Opening Dark Burst;   input /ja immanence <me>;wait 2; input /ma aero <t>;       wait 4;input /p Closing Dark Burts;   input /ja immanence <me>;wait 3;input /ma noctohelix <t>;wait 4;                                                         gs c IsNotBursting')
    end
end
--------------------------------------------------------------------------------------------------------------------
function Nuke(Type)
    if not buffactive['Addendum: Black'] then
        add_to_chat(158,'Dark Arts: Activated')
        send_command('input /ja "Dark Arts" <me>;wait 4;input /ja "Addendum: Black" <me>;')
        return
    elseif  Type == "Fire" then
        send_command('input /ma "fire V" <t>')
    elseif  Type == "Water" then
        send_command('input /ma "Water V" <t>')
    elseif  Type == "Thunder" then
        send_command('input /ma "Thunder V" <t>')
    elseif  Type == "Blizzard" then
        send_command('input /ma "blizzard V" <t>')
    elseif  Type == "Stone" then
        send_command('input /ma "Stone V" <t>')
    elseif  Type == "Aero" then
        send_command('input /ma "Aero V" <t>')
    end
end
--==================================================================================================Action Functions
--==================================================================================================================
--==================================================================================================================
function BurstSets()
    if BurstMode < 0 then
        BurstMode = 0
    elseif BurstMode > 7 then
        BurstMode = 0
    end

    if BurstMode == 0 then
        add_to_chat(158,"Burst Mode: Fire")
    elseif BurstMode == 1 then
        add_to_chat(158,"Burst Mode: Blizzard")
    elseif BurstMode == 2 then
        add_to_chat(158,"Burst Mode: Aero")
    elseif BurstMode == 3 then
        add_to_chat(158,"Burst Mode: Stone")
    elseif BurstMode == 4 then
        add_to_chat(158,"Burst Mode: Thunder")
    elseif BurstMode == 5 then
        add_to_chat(158,"Burst Mode: Water")
    elseif BurstMode == 6 then
        add_to_chat(158,"Burst Mode: Light")
    elseif BurstMode == 7 then
        add_to_chat(158,"Burst Mode: Dark")
    end
end
--=======================================================================================Ability and Spell Functions
--==================================================================================================================
--==================================================================================================================
function CastFireNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   if Spell.name == "Fire III" or Spell.name == "Fire IV" or Spell.name == "Fire V" then
       if DarkArtsDown() then
           return
       end
   end
   if Spell.name == "Fire V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 207 then
           cancel_spell()
           send_command('input /ma "Fire IV" <t>')
           return
       end
   elseif Spell.name == "Fire IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 123 then
           cancel_spell()
           send_command('input /ma "Fire III" <t>')
           return
       end
   elseif Spell.name == "Fire III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 58 then
           cancel_spell()
           send_command('input /ma "Fire II" <t>')
           return
       end
   elseif Spell.name == "Fire II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 25  then
           cancel_spell()
           send_command('input /ma "Fire" <t>')
           return
       end
   elseif Spell.name == "Fire"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastWaterNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
   if Spell.name == "Water III" or Spell.name == "Water IV" or Spell.name == "Water V" then
       if DarkArtsDown() then
           return
       end
   end

   if Spell.name == "Water V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 159 then
           cancel_spell()
           send_command('input /ma "Water IV" <t>')
           return
       end
   elseif Spell.name == "Water IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 91 then
           cancel_spell()
           send_command('input /ma "Water III" <t>')
           return
       end
   elseif Spell.name == "Water III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 43 then
           cancel_spell()
           send_command('input /ma "Water II" <t>')
           return
       end
   elseif Spell.name == "Water II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 18  then
           cancel_spell()
           send_command('input /ma "Water" <t>')
           return
       end
   elseif Spell.name == "Water"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastAeroNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
   if Spell.name == "Aero III" or Spell.name == "Aero IV" or Spell.name == "Aero V" then
       if DarkArtsDown() then
           return
       end
   end

   if Spell.name == "Aero V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 180 then
           cancel_spell()
           send_command('input /ma "Aero IV" <t>')
           return
       end
   elseif Spell.name == "Aero IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 105 then
           cancel_spell()
           send_command('input /ma "Aero III" <t>')
           return
       end
   elseif Spell.name == "Aero III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 50 then
           cancel_spell()
           send_command('input /ma "Aero II" <t>')
           return
       end
   elseif Spell.name == "Aero II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 20  then
           cancel_spell()
           send_command('input /ma "Aero" <t>')
           return
       end
   elseif Spell.name == "Aero"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastStoneNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
   if Spell.name == "Stone III" or Spell.name == "Stone IV" or Spell.name == "Stone V" then
       if DarkArtsDown() then
           return
       end
   end

   if Spell.name == "Stone V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 142 then
           cancel_spell()
           send_command('input /ma "Stone IV" <t>')
           return
       end
   elseif Spell.name == "Stone IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 81 then
           cancel_spell()
           send_command('input /ma "Stone III" <t>')
           return
       end
   elseif Spell.name == "Stone III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 37 then
           cancel_spell()
           send_command('input /ma "Stone II" <t>')
           return
       end
   elseif Spell.name == "Stone II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 16  then
           cancel_spell()
           send_command('input /ma "Stone" <t>')
           return
       end
   elseif Spell.name == "Stone"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastBlizzardNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
   if Spell.name == "Blizzard III" or Spell.name == "Blizzard IV" or Spell.name == "Blizzard V" then
       if DarkArtsDown() then
           return
       end
   end

   if Spell.name == "Blizzard V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 242 then
           cancel_spell()
           send_command('input /ma "Blizzard IV" <t>')
           return
       end
   elseif Spell.name == "Blizzard IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 147 then
           cancel_spell()
           send_command('input /ma "Blizzard III" <t>')
           return
       end
   elseif Spell.name == "Blizzard III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 69 then
           cancel_spell()
           send_command('input /ma "Blizzard II" <t>')
           return
       end
   elseif Spell.name == "Blizzard II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 29  then
           cancel_spell()
           send_command('input /ma "Blizzard" <t>')
           return
       end
   elseif Spell.name == "Blizzard"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastThunderNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
   if Spell.name == "Thunder III" or Spell.name == "Thunder IV" or Spell.name == "Thunder V" then
       if DarkArtsDown() then
           return
       end
   end

   if Spell.name == "Thunder V"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 277 then
           cancel_spell()
           send_command('input /ma "Thunder IV" <t>')
           return
       end
   elseif Spell.name == "Thunder IV" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 177 then
           cancel_spell()
           send_command('input /ma "Thunder III" <t>')
           return
       end
   elseif Spell.name == "Thunder III" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 83 then
           cancel_spell()
           send_command('input /ma "Thunder II" <t>')
           return
       end
   elseif Spell.name == "Thunder II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 35  then
           cancel_spell()
           send_command('input /ma "Thunder" <t>')
           return
       end
   elseif Spell.name == "Thunder"  then
       if windower.ffxi.get_spell_recasts()[ID] > 0 then
           cancel_spell()
           return
       end
   else
         cancel_spell()
         return
   end

   equip(FastCast)

end
--------------------------------------------------------------------------------------------------------------------
function MagicCast(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_spell_recasts()[ID] < 1 then
       equip(FastCast)
       if Spell.skill == "Enhancing Magic" then
           equip (EnhancMagic)
       end

       if Spell.name=="Aspir" or Spell.name=="Aspir ii" then
           equip(Aspir)
       end
   else
       cancel_spell()
   end
end
---------------------------------------------------------------------------------------------------------------------
function  AlacrityAbility(Spell)
    local ID     = Spell.recast_id
    local Charges = get_current_strategem_count()

    if Charges > 0 then
        if buffactive.AuroStorm or buffactive.Voidstorm or buffactive.Thunderstorm or buffactive.Hailstorm or 
           buffactive.Firestorm or buffactive.Sandstorm or buffactive.Windstorm or buffactive.Rainstorm then
            equip(AclarityS)
        else 
            equip(Aclarity)
        end
    else
        cancel_spell()
    end
end
---------------------------------------------------------------------------------------------------------------------
function ImmanenceAbility(Spell)

    local Charges = get_current_strategem_count()
    if  Charges > 0 then
        equip(Immanence)
    else
        cancel_spell()
    end
end
---------------------------------------------------------------------------------------------------------------------
function TabulaRasaAbility(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(TabulaRasa)
    else
        cancel_spell()
    end
end
---------------------------------------------------------------------------------------------------------------------
function EnlightenmentAbility(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Elightenment)
    else
        cancel_spell()
    end
end
---------------------------------------------------------------------------------------------------------------------
function KilmaformSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        equip(Kilmaform)
    else
        cancel_spell()
    end
end
--=================================================================================================Command Functions
--==================================================================================================================
--==================================================================================================================
function self_command(command)
    if command == "GearCheck" then -----------------------Gear Check
        GearCheck = GearCheck +1
        if GearCheck > 3 then
            GearCheck = 0
        end
        GearCheckSets()
    elseif command == "LockStyle" then ----------------------LockStyle Mode
        send_command('input /lockstyleset 81')
    elseif command == "BurstMode" then ------------------------BurstMode
        BurstMode = BurstMode +1
        if BurstMode > 7 then
            BurstMode = 0
        end
        BurstSets()
        AutoBuffs()
    elseif command == "IsBursting" then ---------------------Is Bursting
        add_to_chat(158,'IsBursting')
        IsBursting = true
    elseif command == "IsNotBursting" then --------Is No Longer Bursting
        add_to_chat(158,'IsNotBursting')
        IsBursting = false
        equip(idel)
    elseif command =="Burst" then --------------------------Burst Elements
        if BurstMode == 0 then
            Burst("Fire")
        elseif BurstMode == 1 then
            Burst("Blizzard")    
        elseif BurstMode == 2 then
            Burst("Aero")   
        elseif BurstMode == 3 then
            Burst("Stone")   
        elseif BurstMode == 4 then
            Burst("Thunder")     
        elseif BurstMode == 5 then
            Burst("Water")    
        elseif BurstMode == 6 then
            Burst("Light")    
        elseif BurstMode == 7 then
            Burst("Dark")
        end
    elseif command =="Nuke" then --------------------------Nuke Elements
        if BurstMode == 0 then
            Nuke("Fire")
        elseif BurstMode == 1 then
            Nuke("Blizzard")    
        elseif BurstMode == 2 then
            Nuke("Aero")   
        elseif BurstMode == 3 then
            Nuke("Stone")   
        elseif BurstMode == 4 then
            Nuke("Thunder")     
        elseif BurstMode == 5 then
            Nuke("Water")    
        elseif BurstMode == 6 then
            Nuke("Light")    
        elseif BurstMode == 7 then
            Nuke("Dark")
        end
    elseif command =="CastWeather" then --------------------------CastWeather
        --if not AutoMode then
            CastCurrentStorm("me","0")
        --else
        --add_to_chat(158,'Storm Party')

        --end
    elseif command =="CastRegain" then --------------------------CastRegain
        --if not AutoMode then
            CastCurrentRegain("me","0")
        --else
        --add_to_chat(158,'Regain Party')

        --end
    elseif command == "AutoMode" then  ----------------------Auto Mode    
        if AutoMode == true then
            add_to_chat(158,'Auto Buff Mode Off')
            AutoMode = false
        else
            add_to_chat(158,'Auto Buff Mode On')
            AutoMode= true
        end
        AutoBuffs()
    elseif command == "Sublimation" then  ----------------------Sublimation
         if buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete'] then
             send_command('input /ja Sublimation <me>;wait 31;input /ja Sublimation <me>')
         else
             send_command('input /ja Sublimation <me>')
         end    
    elseif command == "BuffPartyMode" then  ----------------------Buff Party Mode
        if BuffPartyMode == true then
            add_to_chat(158,'Buff Party Mode Mode Off')
            BuffPartyMode = false
        else
            add_to_chat(158,'Buff Party Mode Mode On')
            BuffPartyMode= true
        end    
    elseif command == "Myrkr" then  ----------------------Myrkr    
        send_command('input /ws Myrkr <me>')
    elseif command == "Help" then
        ShortCuts()                 
    end
end
--====================================================================================================Init Functions
--==================================================================================================================
--==================================================================================================================
function get_current_strategem_count()

    local AllRecasts   = windower.ffxi.get_ability_recasts() 
    local currentCharges = math.floor(5 - 5 * AllRecasts[231] / 165)

    return currentCharges
end
--------------------------------------------------------------------------------------------------------------------
function GearCheckSets()

    if GearCheck == 0 then
        add_to_chat(158,"Sublimation Gear Check") 
        equip(Sublim)
    elseif GearCheck == 1 then
        add_to_chat(158,"Idel Gear Check") 
        equip(Idel)
    elseif GearCheck == 2 then
        add_to_chat(158,"FastCast Gear Check") 
        equip(FastCast)
    elseif GearCheck == 3 then
        add_to_chat(158,"Mattack Gear Check") 
        equip(Mattack)
        if GetCurrentStorm() then
            equip(HachirinNoObi)
        end
    end
end
--------------------------------------------------------------------------------------------------------------------
function DarkArtsDown()
    if not buffactive['Dark Arts'] and not buffactive['Addendum: Black'] then
        cancel_spell()
        add_to_chat(158,'Dark Arts: Activated')
        send_command('input /ja "Dark Arts" <me>;wait 4;input /ja "Addendum: Black" <me>;')
        return true
    elseif not buffactive['Addendum: Black'] then
        cancel_spell()
        add_to_chat(158,'Addendum: Black Activated') 
        send_command('input /ja "Addendum: Black" <me>')
        return true
    end

    return false
end


