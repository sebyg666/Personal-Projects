function get_sets()
    send_command('input /macro book 9')
    send_command('input /macro set 1')

    send_command('gs enable ring1')
    send_command('gs enable ring2')
  

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec rdmget.txt;wait 5;gs c LoadSet')
    end

    DDMode       = true
    DDACCMode    = false
    ACCMode      = false
    PDTMode      = false
    MNDMode = false
    IdelMode = false
    FCMode = false
    MATKMode     =false
    STRMode      = false
    DEXMode      = false
    CapacityMode = false
    CounterStanceMode = false
    CastingEXP   = false
    AutoMode     = false

    Trust    = {body="yoran unity shirt"}
    Main    = {main="aizushintogo", sub="shigi"}

    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    DEX     = {head="Carmine mask",neck="fotia gorget",ear1="thunder pearl",ear2="thunder pearl",
               body="despair mail",hands="carmine finger gauntlets",ring1="ramuh ring",
               ring2="Ramuh ring",waist="fotia Belt",legs="carmine cuisse",feet="Carmine greaves",
               back="kayapa Cape"}

    STR     = {head="carmine mask",neck="fotia gorget",ear1="flame pearl",ear2="flame pearl",
               body="despair mail",hands="despair finger gauntlets",ring1="ifrit ring +1",
               ring2="ifrit ring +1",waist="fotia Belt",legs="samnuha tights",feet="despair greaves",
               back="Buquwik Cape"}
   
    MND      ={head="Carmine mask",neck="fotia gorget",ear1="aqua earring",
               ear2="aqua pearl",body="psycloth vest",hands="Carmine finger gauntlets",
               ring1="leviathan ring",ring2="leviathan ring",waist="fotia Belt",
               legs="carmine cuisses",feet="carmine greaves",back="tuilha cape"}

    DD       = {head="Carmine mask",neck="asperity necklace",ear2="dudgeon earring",
               ear1="heartseeker earring",body="despair mail",hands="despair finger gauntlets",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="carmine cuisses",feet="despair greaves",back="atheling mantle"}

    DDACC    = {head="Carmine mask",neck="asperity necklace",ear2="dudgeon earring",
               ear1="heartseeker earring",body="despair mail",hands="despair finger gauntlets",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="carmine cuisses",feet="despair greaves",back="atheling mantle"}


    ACC     = {head="Carmine mask",neck="subtlety spectacles",ear2="zennaroi earring",
               ear1="steelflash earring",body="despair mail",hands="despair finger gauntlets",
               ring1="Ramuh ring",ring2="enlivened ring",legs="carmine cuisses",
               feet="rawhide boots",back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="loricate torque +1",body="emet harness +1",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}


    Idel = {head=PDTHead,neck="Twilight torque",body="witching robe",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs="lengo pants",feet=PDTFeet,back="Iximulew cape",waist="flume belt"} 

    FastCast = {head="vanya hood",Ear1="loquac. earring",
                Neck="voltsurge torque",body="Helios Jacket",back="Swith cape",hands="gendewitha gages +1",
                ring1="Prolix ring",waist="witful belt",Legs="psycloth lappas",feet="carmine greaves"}

    Mattack  = {head="merlinic hood",Ear1="Hecate's Earring",
                Ear2="friomisi earring",Neck="mizukage-no-kubikazari",body="witching robe",back="argochampsa mantle",
                hands="merlinic dastanas",ring1="shiva ring",ring2="shiva ring",waist="Eschan Stone",
                Legs="merlinic shalwar",feet="merlinic crackows"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec rdmput.txt') 
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
            if Name == "Chant du Cygne" then
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
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
----------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        equip(FastCast)
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
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type == "BlackMagic" then
        MagicSpell(Spell) 
    elseif Spell.type == "WhiteMagic" then
        MagicSpell(Spell)
    elseif Spell.type == "BlueMagic" then
        MagicSpell(Spell) 
    elseif Spell.type =="Trust" then
        equip(Trust)
    end
    if CapacityMode == true then
        equip(CapGear)
    end
    
end
---------------------------------------------------------------------------------------------------------------------
function midcast(Spell)

    if Spell.type == "BlackMagic" then
        equip(Mattack)
    elseif Spell.type == "BlueMagic" then
        equip(Mattack) 
    end

end
------------------------------------------------------------------------------------------------
function aftercast(spell, action, spellMap, eventArgs)
    SetPostEventGear()
    
    if CastingEXP then
        CastEXPRing()
    end

end
------------------------------------------------------------------------------------------------
function buff_change(name,gain)

end
--------------------------------------------------------------------------------------------------------------------
function AutoBuffs()

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
    elseif DEXMode == true then     
        equip(DEX)
    elseif STRMode == true then     
        equip(STR)
    elseif MNDMode == true then     
        equip(MND)
    elseif IdelMode == true then     
        equip(Idel)
    elseif FCMode == true then     
        equip(FastCast)
    elseif MATKMode == true then     
        equip(Mattack)
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
            STRMode  = true  
            add_to_chat(158,'Fight Mode Change To: STRMode')
        elseif STRMode == true then  
            STRMode = false
            MNDMode = true
            add_to_chat(158,'Fight Mode Change To: MNDMode')
        elseif MNDMode == true then  
            MNDMode = false
            IdelMode = true
            add_to_chat(158,'Fight Mode Change To: IdelMode')
        elseif IdelMode == true then
            IdelMode = false
            FCMode = true
            add_to_chat(158,'Fight Mode Change To: FCMode')
        elseif FCMode == true then    
            FCMode = false
            MATKMode = true
            add_to_chat(158,'Fight Mode Change To: MATKMode')
        elseif MATKMode == true then
            MATKMode = false  
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
        send_command('input /lockstyleset 93;')        
    elseif command == "Help" then
        ShortCuts() 
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 93;')        
    end
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)

    if new == "Idle" then
        equip(Idel)
    else
        SetPostEventGear()
        AutoBuffs()
    end  
end
