function get_sets()

    send_command('gs enable ring1')
    send_command('gs enable ring2')

    send_command('input /macro book 13')
    send_command('input /macro set 1')

    RNGMode      = true
    DDMode       = false
    ACCMode      = false
    RATMode      = true
    RACMode      = false
    PDTMode      = false
    CapacityMode = false
    CastingEXP   = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="barataria ring",ring2="Capacity Ring"}

    Fold    = {hands="Lanun gants +1"}
    Roll    = {head="Lanun Tricorne +1",body="Lanun frac +1",hands="Chasseur's gants",
               ring1="barataria ring",legs="lanun culottes +1",feet="Lanun bottes +1",
               back="Gunslinger's Cape"}
    WildCard= {feet="Lanun Bottes +1"}
    RandomDL= {body="Lanun Frac +1"}
    SnakeEys= {legs="Lanun Culottes +1"}

    WSmFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    WSmelee = {head="Dampening tam",neck="fotia gorget",ear1="Flame pearl",
               ear2="Flame pearl",
               body="Samnuha coat",hands="Floral gauntlets",ring1="Ifrit ring",
               ring2="Ifrit ring",waist="fotia Belt",legs="samnuha tights",
               feet=WSmFeet,back="Buquwik Cape"}

    WSlastS = {head="Pursuer's beret",neck="fotia gorget",ear1="breeze pearl",
               ear2="breeze pearl",body="Pursuer's doublet",hands="Floral gauntlets",
               ring1="Garuda ring",ring2="Garuda ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="Gunslinger's Cape"}

    WSwildF = {head="Pursuer's beret",neck="fotia gorget",ear1="friomisi earring",
               ear2="hecate's earring",body="Samnuha coat",hands="leyline gloves",
               ring1="acumen ring",ring2="Garuda ring",waist="eschan stone",
               legs="shneddick tights",feet="sombra leggings",back="Argochampsa Mantle"}

    DDBody   = {name = "qaaxo harness",  augments={"attack+15"}}
    DDFeet  = {name = "qaaxo leggings", augments={"attack+15"}}
    DD      = {head="Dampening tam",neck="asperity necklace",ear2="Dudgeon earring",
               ear1="heartseeker earring",body=DDBody,hands="Floral gauntlets",
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="samnuha tights",feet=DDFeet,back="atheling mantle"}

    ACCFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    DDAcc   = {head="Dampening tam",neck="subtlety spectacles",ear1="zennaroi earring",
               ear2="steelflash earring",body="samnuha coat",hands="Floral gauntlets",
               ring1="Ramuh ring",ring2="enlivened ring",legs="samnuha tights",
               feet=ACCFeet,back="Grounded mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDTBody   = {name = "qaaxo harness",  augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="Twilight torque",body=PDTBody,
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}

    Rng     = {head="Pursuer's beret",neck="Gaudryi necklace",ear1="volley earring",
               ear2="clearview earring",body="Pursuer's doublet",hands="manibozho gloves",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="eschan stone",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="Gunslinger's Cape"}

    RngAcc  = {head="Dampening tam",neck="Gaudryi necklace",ear1="volley earring",
               ear2="clearview earring",body="Pursuer's doublet",hands="Floral gauntlets",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="eschan stone",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="Gunslinger's Cape"}
end
-------------------------------------------------------------------------------------------------------------------
function RangeAttack()
        if RATMode == true then
            equip (Rng)
        else
            equip (RngAcc)
        end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

            if name=="Last Stand" then
                add_to_chat(158,'Load Last Stand Gear')
                equip(WSlastS)
            elseif name=="Wildfire" then
                add_to_chat(158,'Load WildFire Gear')
                equip(WSwildF)
            elseif name=="Leaden Salute" then
                add_to_chat(158,'Load Leaden Salute Gear')
                equip(WSwildF)
            else
                equip(WSmelee)
            end
end
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
-------------------------------------------------------------------------------------------------
function MagicCast(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

            if windower.ffxi.get_spell_recasts()[ID] < 1 then
                add_to_chat(158,Name..' Detected:')
             else
                cancel_spell()
            end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

            if windower.ffxi.get_ability_recasts()[ID] < 1 then
                add_to_chat(158,Name..' Dected:')
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
------------------------------------------------------------------------------------------------
function Accession(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name
    if windower.ffxi.get_spell_recasts()[ID] < 1 then
        send_command('input /ja accession <me>;')
        cast_delay(1)
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == 'Hailstorm' then
        Accession(Spell)
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
    elseif Spell.type == 'Ninjutsu' then
        MagicCast(Spell)
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
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell);
    elseif Spell.type == "CorsairShot" then
        RangeAttack();
    elseif Spell.type == "WhiteMagic" then
        MagicCast(Spell)
    elseif Spell.type == "blackMagic" then
        MagicCast(Spell)
    elseif Spell.type == "Scholar" then
        JobAbility(Spell)
      
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        --noting
    else
        ID = Spell.recast_id
        add_to_chat(158,ID)
        add_to_chat(158,Spell.type)
        add_to_chat(158,"Unregistered Spell "..Spell.name.." type "..Spell.type.." now canceling")
        cancel_spell() 
    end
    if Spell.type == "CorsairRoll" then
  
    else
        if CapacityMode == true then
           equip(CapGear)
        end
    end
end
------------------------------------------------------------------------------------------------
function aftercast(spell)
        SetPostEventGear()
end    
------------------------------------------------------------------------------------------------
function buff_change(name,gain)

    local expBuff = buffactive.Commitment
    if CapacityMode == true then
        if not expBuff and not CastingEXP then
            CastingEXP = true
            equip(EXPRing)
            send_command('gs disable ring1')
            send_command('gs disable ring2')
            add_to_chat(158,'Using Trizek Ring Or Capacity Ring')    
        elseif Gain and Name == "Commitment" and CastingEXP then
            CastingEXP = false 
            send_command('gs enable ring1')
            send_command('gs enable ring2')
            add_to_chat(158,'Commitment Gained')
        elseif expBuff and CastingEXP then
            CastingEXP = false
            add_to_chat(158,'Commitment Detected') 
        end
    end
    
    if not gain and name == "Hailstorm" then
        send_command('input /ma "hailstorm" <me>;')
    end

    if CastingEXP then
        equip(EXPRing)
        CastEXPRing()
    end    
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if DDMode == true then 
        equip(DD)
    elseif ACCMode == true then
        equip(DDAcc)
    elseif  PDTMode == true then
        equip(PDT)
    elseif RNGMode == true then
        if RATMode == true then
            equip (Rng)
        else
            equip (RngAcc)
        end
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
        if RNGMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode')
            RNGMode = false
            DDMode  = true
        elseif DDMode == true then
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
            
    end
end
