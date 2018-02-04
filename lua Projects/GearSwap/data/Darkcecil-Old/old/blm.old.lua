function get_sets()

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5 ;exec blmget.txt;wait 5;gs c LoadSet')
    end
    
    send_command('input /macro book 18')
    send_command('input /macro set 1')

    GearCheck       = 1
    BurstMode       = 0
    DeathMode       = false;

    BurstSets()
    HachirinNoObi = {waist="Hachirin-No-Obi"}
    Trust    = {body="yoran unity shirt"}
    Aspir = {waist="fucho-no-obi",feet="Merlinic crackows"}
    ManaWall = {feet="wicce sabots"}
    BlmAF1Body = { body = "spaekona's coat +1"}

    Idel = {head="amalric coif", ear1="lifestorm earring",ear2="psystorm earring",
            neck="loricate torque +1",body="almeric doublet",back="solemnity cape",hands="Amalric Gages",
            ring1="Defending ring", ring2="vocane ring",legs='assiduity pants +1',waist="fucho-no-obi",
            feet="almalric nails"} 

    FastCast = {head="amalric coif",Ear1="loquac. earring",
                Neck="voltsurge torque",body="Helios Jacket",back="Swith cape",hands="merlinic dastanas",
                ring1="Prolix ring",waist="witful belt",Legs="psycloth lappas",feet="regal pumps +1"}

    Mattack  = {Ammo="Ghastly tathlum",head="merlinic hood",Ear1="Hecate's Earring",
                Ear2="friomisi earring",Neck="mizu. kubikazari",body="amalric doublet",back="argochampsa mantle",
                hands="Amalric Gages",ring1="locus ring",ring2="mujin band",waist="Eschan Stone",
                Legs="Merlinic shalwar",feet="merlinic crackows"}

    DeathPre = {}

    DeathMid = {}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec blmput.txt') 
    end
end
--===============================================================================================Gear Swap Functions
--==================================================================================================================
--==================================================================================================================
function precast(Spell)


    if DeathMode then
        equip(DeathPre)
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
    elseif Spell.type =="Trust"  then
        equip(Trust)
    elseif Spell.type=="BlackMagic" or Spell.type=="WhiteMagic" then
        equip(FastCast)
    end

end
---------------------------------------------------------------------------------------------------------------------
function midcast(Spell)

    if DeathMode then
        if Spell.name == "Death" then
            equip(DeathMid)
        else
            equip(DeathPre)
        end
    elseif Spell.type == "BlackMagic" then
        equip(Mattack)

        if player.mpp < 25 then
           equip(BlmAF1Body)
        end

        if Spell.name=="Aspir" or Spell.name=="Aspir ii" or Spell.name=="Aspir iii" then
           equip(Aspir)
        elseif GetCurrentStorm() then
            equip(HachirinNoObi)
        end
    elseif Spell.skill == "Enhancing Magic" then
           equip (Enhancing)
    end
end
---------------------------------------------------------------------------------------------------------------------
function aftercast(spell)

    if DeathMode then
        equip(DeathPre)
    elseif not IsBursting then
        equip(Idel)
       
        if buffactive['Mana Wall'] then
            equip(ManaWall)
        end
   end 
end
---------------------------------------------------------------------------------------------------------------------   
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
--===================================================================================================Burst Functions
--==================================================================================================================
--==================================================================================================================
function Nuke(Type)
    if  Type == "Fire" then
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 25 then
           cancel_spell()
           send_command('input /ma "Fire" <t>')
           return
       end
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastWaterNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 19 then
           cancel_spell()
           send_command('input /ma "Water" <t>')
           return
       end
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastAeroNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 21 then
           cancel_spell()
           send_command('input /ma "Aero" <t>')
           return
       end
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastStoneNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 16 then
           cancel_spell()
           send_command('input /ma "Stone" <t>')
           return
       end
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastBlizzardNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 30 then
           cancel_spell()
           send_command('input /ma "Blizzard" <t>')
           return
       end
   end

   equip(FastCast)

end
---------------------------------------------------------------------------------------------------------------------
function CastThunderNuke(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   
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
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 82 then
           cancel_spell()
           send_command('input /ma "Thunder II" <t>')
           return
       end
   elseif Spell.name == "Thunder II" then
       if windower.ffxi.get_spell_recasts()[ID] > 0 or player.mp < 35 then
           cancel_spell()
           send_command('input /ma "Thunder" <t>')
           return
       end
   end

   equip(FastCast)

end
--=================================================================================================Command Functions
--==================================================================================================================
--==================================================================================================================
function self_command(command)
    if command == "GearCheck" then -----------------------Gear Check
        GearCheck = GearCheck +1
        if GearCheck > 4 then
            GearCheck = 1
        end
        GearCheckSets()
    elseif command == "LockStyle" then ----------------------LockStyle Mode
        send_command('input /lockstyleset 94')
    elseif command == "BurstMode" then ------------------------BurstMode
        BurstMode = BurstMode +1
        if BurstMode > 7 then
            BurstMode = 0
        end
        BurstSets()
    elseif command == "DeathMode" then ------------------------BurstMode
        if DeathMode then
            DeathMode =  false
            add_to_chat(158,"DeathMode Off") 
        else
            DeathMode = true
            add_to_chat(158,"DeathMode On") 
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
    elseif command == "Myrkr" then  ----------------------Myrkr    
        send_command('input /ws Myrkr <me>')
    elseif command == "Help" then
        ShortCuts()
    elseif command == "LoadSet" then
        equip(Idel)
        send_command('input /lockstyleset 94;')               
    end
end
--====================================================================================================Init Functions
--==================================================================================================================
--==================================================================================================================
function GearCheckSets()

    if GearCheck == 1 then
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
    elseif GearCheck == 4 then
        add_to_chat(158,"Enhancing Gear Check") 
        equip(Enhancing)
        end
    end
end

