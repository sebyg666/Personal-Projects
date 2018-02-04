function get_sets()
    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec corget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 13')
    send_command('input /macro set 1')

    MATMode      = false
    AGIMode      = false
    RLLMode      = false
    RNGMode      = false
    DDMode       = true
    ACCMode      = false
    RATMode      = true
    RACMode      = false
    STRMode      = false
    MNDMode      = false
    PDTMode      = false
   

    Fold     = {hands="Lanun gants +1"}
    Roll     = {head="Lanun Tricorne +1",body="Lanun frac +1",hands="Chasseur's gants",
               ring1="barataria ring",legs="lanun culottes +1",feet="Lanun bottes +1",
               back="camulus's mantle"}
    WildCard = {feet="Lanun Bottes +1"}
    RandomDL = {body="Lanun Frac +1"}
    SnakeEys = {legs="Lanun Culottes +1"}
    Trust    = {body="yoran unity shirt"}
    Main     = {main="demers. degen +1",sub="arendsi fleuret",range="compensator"}

    HercBtRng = { name="Herculean Boots", augments={'Rng.Acc.+15 Rng.Atk.+15','Enmity-3','CHR+1','Rng.Acc.+11','Rng.Atk.+7'}}
    HercBtDD  = { name="Herculean Boots", augments={'Accuracy+27','"Store TP"+4','DEX+4','Attack+8'}}

    WSmelee  = {head="carmine mask",neck="fotia gorget",ear1="brutal earring",ear2="moonshade earring",
               body="adhemar jacket",hands="Pursuer's cuffs",ring1="Epona's Ring",
               ring2="Ifrit ring +1",waist="fotia Belt",legs="samnuha tights",
               feet=HercBtDD,back="Gunslinger's Cape"}

    WSlastS  = {head="Pursuer's beret",neck="fotia gorget",ear1="ishvara earring",
               ear2="moonshade earring",body="adhemar jacket",hands="Pursuer's cuffs",
               ring1="Garuda ring",ring2="Garuda ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="Gunslinger's Cape"}

    WSwildF  = {head="herculean helm",neck="fotia gorget",ear1="friomisi earring",
               ear2="moonshade earring",body="Samnuha coat",hands="Pursuer's cuffs",
               ring1="acumen ring",ring2="Defending ring",waist="eschan stone",
               legs="shneddick tights",feet="adhemar gamashes",back="Gunslinger's Cape"}

    MND      = {head="Carmine mask",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="mekosuchinae harness",hands="Carmine finger gauntlets",
               ring1="Epona's Ring",ring2="leviathan ring",waist="fotia Belt",
               legs="carmine cuisses",feet="carmine greaves",back="Gunslinger's Cape"}

    DD       = {head="carmine mask",neck="asperity necklace",ear1="brutal earring",
               ear2="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt+1",
               legs="carmine cuisses",feet=HercBtDD,back="Grounded mantle +1"}

    DDAcc   = {head="carmine mask",neck="subtlety spectacles",ear1="brutal earring",
               ear12="zennaroi earring",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Ramuh ring",ring2="enlivened ring",legs="carmine cuisses",
               feet=HercBtDD ,back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDTBody   = {name = "qaaxo harness",  augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="loricate torque +1",body="emet harness +1",ear1="brutal earring",
               ear2="zennaroi earring",hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="solemnity cape",waist="flume belt"}

    SnapShot= {head="Chass. Tricorne",Body="pursuer's doublet",hands="carmine finger gauntlets",
               waist="impulse belt",legs="adhemar kecks",feet="adhemar gamashes"}

    Rng     = {head="herculean helm",neck="ocachi gorget",ear1="volley earring",
               ear2="enervating earring",body="adhemar jacket",hands="herculean gloves",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="herculean trousers",feet="Herculean boots",back="Gunslinger's Cape"}

    RngAcc  = {head="herculean helm",neck="Marked Gorget",ear1="volley earring",
               ear2="enervating earring",body="adhemar jacket",hands="herculean gloves",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="herculean trousers",feet="Herculean boots",back="Gunslinger's Cape"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec corput.txt') 
    end
end
-------------------------------------------------------------------------------------------------------------------
function RangeAttack()
       equip(SnapShot)
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)
    if player.TP > 999 then
        if name=="Last Stand" or name=="Wildfire" or name=="Leaden Salute"  then
            if player.equipment.ammo == 'empty' then
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
                end
           end
        else
            equip(WSmelee)
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
function CorJobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then
       add_to_chat(158,Name..' Dected: RollGear')
       equip(Roll)
   else
       cancel_spell()
   end
end
-------------------------------------------------------------------------------------------------------------------
function RandomDealSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Random Deald Detected: Loading Random Deal Gear')
        equip(RandomDL)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function SneakEyeSpell(Spell)

    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Snake Eye Detected: Loading Snake Eye Gear')
        equip(SnakeEys)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FoldSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if  buffactive.Bust then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Fold Detected: Loading Hands Gear')
            equip(Fold)
        else
            cancel_spell()
        end
    else
        cancel_spell()
    end
end

-------------------------------------------------------------------------------------------------------------------
function WildCardSpell(SP)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'WildCard Detected: Loading WildCard Gear')
                equip(WildCard)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------
function precast(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == 'Ranged' then
        RangeAttack()
    elseif Spell.name == "Double-Up" then
        CorJobAbility(Spell)
    elseif Spell.name == "Cutting Cards" then
        CorJobAbility(Spell)
    elseif Spell.name == "Triple Shot" then  
        CorJobAbility(Spell)
    elseif Spell.name == "Crooked Cards" then
        CorJobAbility(Spell)
    elseif Spell.name=="Fold" then
         FoldSpell(Spell)
    elseif Spell.name=="Wild Card" then
         CorJobAbility(Spell)
    elseif Spell.name=="Random Deal" then
        RandomDealSpell(Spell)
    elseif Spell.name=="Snake Eye" then
        SneakEyeSpell(Spell)
    elseif Spell.type == "CorsairRoll" then
        CorJobAbility(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" then
        equip(Trust)
    else

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
    end
end
------------------------------------------------------------------------------------------------
function aftercast(spell)
        SetPostEventGear()
end    
------------------------------------------------------------------------------------------------
function buff_change(name,gain)

end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if  PDTMode == true then
        equip(PDT)
    elseif RLLMode == true then 
        equip(Roll)
    elseif DDMode == true then 
        equip(DD)
    elseif ACCMode == true then
        equip(DDAcc)
    elseif  MATMode == true then
        equip(WSwildF)
    elseif  AGIMode == true then
        equip(WSlastS)
    elseif  STRMode == true then
        equip(WSmelee)
    elseif  MNDMode == true then
        equip(MND)
    elseif RNGMode == true then
        if RATMode == true then
            equip (Rng)
        else
            equip (RngAcc)
        end
    else
        add_to_chat(158,'Gear Selection Errors')
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
            RNGMode = true
        elseif RNGMode == true then
            add_to_chat(158,'Fight Mode Change To: ROLLMode')
            RNGMode = false
            RLLMode = true
       elseif RLLMode == true then
            add_to_chat(158,'Fight Mode Change To: MATMode')
            RLLMode = false       
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
        SetPostEventGear()
    elseif command == "RangeMode" then
        if RATMode == true then
            add_to_chat(158,'Range Mode Change To: RACMode')
            RATMode  = false
            RACMode  = true
        elseif RACMode == true then
            add_to_chat(158,'Range Mode Change To: RNGMode')
            RACMode = false
            RATMode = true
        else
            add_to_chat(158,'Range Mode Error: Undefined Mode')
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
            send_command('input /lockstyleset 83;')
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 83;')
    elseif command == "PDTMode" then
        if PDTMode == true then
            PDTMode = false
            add_to_chat(158,'PDTMode Turn Off')
        else
            PDTMode = true
            add_to_chat(158,'PDTMode Buff Turn On')
        end
        SetPostEventGear()         
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
