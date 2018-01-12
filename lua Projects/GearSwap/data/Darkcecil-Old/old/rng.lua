function get_sets()
    send_command('input /macro book 16')
    send_command('input /macro set 1')


    DDMode       = false
    ACCMode      = false
    RNGMode      = true
    RATMode      = true
    RACMode      = false
    PDTMode      = false
    CapacityMode = false
    CastingEXP   = false

    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}
    
    BountySt={hands="Amini glovelettes"}
    Camouflg={body="Orion Jerkin +1"}
    SharpSt ={legs="Orion braccae +1"}
    Scavenge={feet="Orion Socks +1"}
    Barrage ={hands="Orion bracers +1"}

    WSmHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    WSmFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    WSmelee = {head=WSmHead,neck="fotia gorget",ear1="Flame pearl",ear2="Flame pearl",
               body="Samnuha coat",hands="Floral gauntlets",ring1="Ifrit ring",
               ring2="Ifrit ring",waist="fotia Belt",legs="samnuha tights",
               feet=WSmFeet,back="Buquwik Cape"}

    WSlastS = {head="Pursuer's beret",neck="fotia gorget",ear1="breeze pearl",
               ear2="breeze pearl",body="Pursuer's doublet",hands="Floral gauntlets",
               ring1="Garuda ring",ring2="Garuda ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="ik Cape"}

    WSwildF = {head="Pursuer's beret",neck="fotia gorget",ear1="friomisi earring",
               ear2="hecate's earring",body="Samnuha coat",hands="leyline gloves",
               ring1="acumen ring",ring2="Garuda ring",waist="eschan stone",
               legs="Gyve trousers",feet="sombra leggings",back="Argochampsa Mantle"}

    WSJin   = {head="Pursuer's beret",neck="fotia gorget",ear1="thunder pearl",
               ear2="thunder pearl",body="Pursuer's doublet",hands="Pursuer's cuffs",
               ring1="Ramuh ring",ring2="Ramuh ring",waist="fotia Belt",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="kayapa Cape"}
   
    DDBody  = {name = "qaaxo harness",  augments={"attack+15"}}
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

    PDTHead  = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand  = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs  = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet  = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDTBody   = {name = "qaaxo harness",  augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="Twilight torque",body=PDTBody ,
               hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="Iximulew cape",waist="flume belt"}

    Rng     = {head="Arcadian Beret +1",neck="Marked Gorget",ear1="volley earring",
               ear2="clearview earring",body="Pursuer's doublet",hands="Pursuer's cuffs",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="lutian Cape"}

    RngAcc  = {head="Dampening tam",neck="Marked Gorget",ear1="volley earring",
               ear2="clearview earring",body="Pursuer's doublet",hands="Floral gauntlets",
               ring1="paqichikaji ring",ring2="Hajduk ring",waist="Eschan stone",
               legs="Pursuer's Pants",feet="Pursuer's Gaiters",back="lutian Cape"}
end

--------------------------------------------------------------------------------------------------------------------
function RangeAttack()
    if not CastingEXP then
        if RATMode == true then
            equip (Rng)
        else
            equip (RngAcc)
        end
    else
        --no swap
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)
    if player.TP >999 then
        if not CastingEXP then
            if spell.name=="Last Stand" then
                add_to_chat(158,'Last Stand Detected: Last Stand Gear')
                equip(WSlastS)
            elseif spell.name=="Wildfire" then
                add_to_chat(158,'Wildfire Detected: Wildfire Gear')
                equip(WSwildF)
            elseif spell.name=="Leaden Salute" then
                add_to_chat(158,'Leaden Salute Detected: Leaden Salute Gear')
                equip(WSwildF)
            elseif spell.name=="Jishnu's Radiance" then
                add_to_chat(158,'Jishnus Radiance Detected: Jishnus Radiance Gear')
                equip(WSJin)
            else
                add_to_chat(158,'WeaponSkill Detected: WeaponSkill Gear')
                equip(WSmelee)
            end
        else
            --no swap
        end
    else
        cancel_spell()      
    end
end
------------------------------------------------------------------------------------------------
function BarrageSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

  if not CastingEXP then
      if windower.ffxi.get_ability_recasts()[ID] < 1 then
         equip(Barrage)
         add_to_chat(158,'Barrage Detected: Barrage Gear')
      else
          cancel_spell()
      end
  else
      --no swap
  end
end
------------------------------------------------------------------------------------------------
function ScavengeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(Scavenge)
            add_to_chat(158,'Scavenge Detected: Scavenge Gear')
        else
            cancel_spell()
        end
    else
        --no swap
    end
end
------------------------------------------------------------------------------------------------
function CamouflageSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then 
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(Camouflg)
            add_to_chat(158,'Camouflage Detected: Camouflage Gear')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
------------------------------------------------------------------------------------------------
function SharpshotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then 
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(SharpSt)
            add_to_chat(158,'Sharpshot Detected: Sharpshot Gear')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
------------------------------------------------------------------------------------------------
function VelocityShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name
 
    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID]  < 1 then
            equip(Velocity)
            add_to_chat(158,'Velocity Shot Detected:Velocity Shot Gear')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
------------------------------------------------------------------------------------------------
function DoubleShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            equip(DoubleSt)
            add_to_chat(158,'Double Shot Detected: Double Shot Gear')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
------------------------------------------------------------------------------------------------
function BountyShotSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID]  < 1 then
            equip(BountySt)
            add_to_chat(158,'Bounty Shot Detected: Bounty Shot Gear')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
             add_to_chat(158,Name..' Detected:')
        else
             cancel_spell()
        end
    else
         --no swap
    end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

    if not CastingEXP then 
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,Name..' Detected:')
        else
            cancel_spell()
        end
    else
         --no swap
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)
    if Spell.type == 'WeaponSkill' then
        WeaponSkill(name)       
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
    elseif Spell.type =="Trust" or Spell.type =="Item" then
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
function midcast(spell)
    if not CastingEXP then
        if spell.name == "Barrage" then
            add_to_chat(158,'Barrage MidCast Detected: Racc Gear')
            equip(RngAcc)
        end
    end
end
------------------------------------------------------------------------------------------------
function aftercast(spell)
    if not CastingEXP then
        SetPostEventGear()
    end
end    
------------------------------------------------------------------------------------------------
function buff_change(name,gain)
    local expBuff = buffactive.Commitment

     if CapacityMode == true then
        if not expBuff and not CastingEXP then
            CastingEXP = true
            add_to_chat(158,'Using Trizek Ring Or Capacity Ring')    
        elseif Gain and Name == "Commitment" and CastingEXP then
            CastingEXP = false 
            add_to_chat(158,'Commitment Gained')
        elseif expBuff and CastingEXP then
            CastingEXP = false
            add_to_chat(158,'Commitment Detected') 
        end
    end

    if CastingEXP then
        equip(EXPRing)
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
            DDMode = true
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
            RNGMode  = true
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
    end
end

