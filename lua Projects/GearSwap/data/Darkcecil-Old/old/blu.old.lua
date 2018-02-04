function get_sets()
    send_command('input /macro book 1')
    send_command('input /macro set 1')


  

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec bluget.txt;wait 5;gs c LoadSet')
    end

    DDMode       = true
    DDACCMode    = false
    ACCMode      = false
    PDTMode      = false
    MNDMode = false
    IdelMode = false
    FCMode = false
    MATKMode =false
    STRMode      = false
    DEXMode      = false
    CounterStanceMode = false


    Trust    = {body="yoran unity shirt"}
    Main    = {main="aizushintogo", sub="shigi"}

    Diffusion= {feet="luhlaza charuqs"}

    BackDD={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
    BackWS={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}
    BootDD={ name="Herculean Boots", augments={'Accuracy+27','"Store TP"+4','DEX+4','Attack+8'}}
   

    DEX     = {ammo="falcon eye",head="adhemar bonnet",neck="fotia gorget",ear1="moonshade earring",ear2="brutal earring",
               body="adhemar jacket",hands="adhemar wristbands",ring1="Epona's Ring",
               ring2="Ramuh ring",waist="fotia Belt",legs="samnuha tights",feet="carmine greaves",
               back=BackWS}

    STR     = {head="Carmine mask",neck="fotia gorget",ear1="moonshade earring",ear2="brutal earring",
               body="adhemar jacket",hands="adhemar wristbands",ring1="ifrit ring +1",
               ring2="ifrit ring +1",waist="fotia Belt",legs="samnuha tights",feet="herculean boots",
               back=BackDD}
   
    MND      ={head="Carmine mask",neck="fotia gorget",ear1="moonshade earring",
               ear2="brutal earring",body="mekosuchinae harness",hands="Carmine finger gauntlets",
               ring1="Epona's Ring",ring2="leviathan ring",waist="fotia Belt",
               legs="carmine cuisses",feet="carmine greaves",back=BackDD}

    DD      ={ammo="ginsen",head="adhemar bonnet",neck="asperity necklace",ear2="brutal earring",
               ear1="suppanomimi",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt +1",
               legs="samnuha tights",feet=BootDD,back=BackDD}

    DDACC    = {ammo="falcon eye",head="adhemar bonnet",neck="asperity necklace",ear2="brutal earring",
               ear1="suppanomimi",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt +1",
               legs="samnuha tights",feet=BootDD,back=BackDD}


    ACC     = {ammo="falcon eye",head="Carmine mask",neck="subtlety spectacles",ear2="suppanomimi",
               ear1="zennaroi earring",body="Rawhide vest",hands="adhemar wristbands",
               ring1="Ramuh ring",ring2="enlivened ring",legs="carmine cuisses",
               feet=BootDD,back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}

    PDT     = {head=PDTHead ,neck="loricate torque +1",body="emet harness +1",ear2="brutal earring",
               ear1="zennaroi earring",
               hands=PDTHand ,ring1="vocane ring",ring2="Defending ring",
               legs= PDTLegs,feet=PDTFeet,back="solemnity cape",waist="olseni belt"}


    Idel = {head="Rawhide mask",neck="loricate torque +1",body="mekosuchinae harness",ear2="brutal earring",
               ear1="suppanomimi",
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs="carmine cuisses",feet=PDTFeet,back="solemnity cape",waist="fucho-no-obi"} 

    FastCast = {head="Psycloth tiara",Ear1="loquac. earring",
                Neck="voltsurge torque",body="Helios Jacket",back="Swith cape",hands="leyline gloves",
                ring1="Prolix ring",waist="witful belt",Legs="psycloth lappas",feet="carmine greaves"}

    Mattack  = {ammo="ghastly tathlum",head="amalric coif",Ear1="Hecate's Earring",
                Ear2="friomisi earring",Neck="sanctity necklace",body="amalric doublet",back="argochampsa mantle",
                hands="Amalric Gages",ring1="acumen ring",ring2="Mephitas's Ring",waist="Eschan Stone",
                Legs="amalric slops",feet="amalric nails"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec bluput.txt') 
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(Name)

    if player.TP >999 then
            if Name == "Chant du Cygne" then
                equip (DEX)
            --    add_to_chat(158,'DEX WS Gear')
            elseif Name == "Requiescat" then
                equip (MID)
                add_to_chat(158,'MID WS Gear')
            else
                equip(STR)
            --    add_to_chat(158,'STR WS Gear')
            end
    else
      cancel_spell()
    end
end
----------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        if buffactive['Diffusion'] then
            equip(FastCast)
            equip(Diffusion)
        else
            equip(FastCast)
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
        add_to_chat(158,Name..' Detected:')
    else
        cancel_spell()
    end

end
-------------------------------------------------------------------------------------------------
function DiffusionAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,Name..' Detected:')
        equip(Diffusion)
    else
        cancel_spell()
    end

end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name =="Diffusion" then
        DiffusionAbility(Spell)
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

   
end
---------------------------------------------------------------------------------------------------------------------
function midcast(Spell)

    if buffactive['Diffusion'] then
        equip(Diffusion)
    elseif Spell.type == "BlackMagic" then
        equip(Mattack)
    elseif Spell.type == "BlueMagic" then
        equip(Mattack) 
    end
end
------------------------------------------------------------------------------------------------
function aftercast(Spell)

    if player.status ~= "Engaged" then
       equip(Idel)           
    else
        SetPostEventGear()
    end

end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if PDTMode == true then     
        equip(PDT)
    elseif DDMode == true then    
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
        send_command('input /lockstyleset 91;')        
    elseif command == "Help" then
        ShortCuts() 
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 91;')        
    end
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)
       SetPostEventGear()
end
