function get_sets()

    send_command('input /macro book 10')
    send_command('input /macro set 1')

    send_command('bind ^0 gs c DawnMus')

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec bstget.txt;wait 5;gs c LoadSet')
    end
   
    DDMode         = false
    ACCMode        = false
    ReadyMode      = false
    ReadyAcc1      = false
    ReadyAcc2      = false
    PDTMode        = false
    PetPDTMode     = true

    CallBst = {main="arktoi",sub="Skullrender",body="Mirke wardecors"}    
    ReadyDly= {sub="charmer's merlin",legs="desultor tassets"}

    Reward  = {main="mdomo axe",sub="zoraal ja's axe",body="Totemic jackcoat +1",hands="ogre gloves",
               legs="totemic trousers +1",feet="loyalist sabatons"}

    legsDD   ={ name="Valor. Hose", augments={'Accuracy+21','"Dbl.Atk."+3','DEX+10'}}
    legsTP  = { name="Valor. Hose", augments={'Accuracy+15 Attack+15','"Store TP"+4','VIT+3','Accuracy+15'}}
    ValLegs = { name="Valor. Hose", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','Pet: "Subtle Blow"+9','Pet: DEX+6','Pet: Accuracy+10 Pet: Rng. Acc.+10'}}


    Theta = {ammo="Pet Food Theta Biscuit"}
    Eta   = {ammo="Pet Food Eta Biscuit"}
    Zeta  = {ammo="Pet Food Zeta Biscuit"}
    Epsi  = {ammo="Pet Food Epsilon Biscuit"}

    Trust    = {body="yoran unity shirt"}
    Main    = {main="arktoi",sub="Skullrender"}

    PetReadyBack={name = "Pastoralist's mantle", augments={'Pet: Damage taken -1%'}}
    PetReadyFeet={name = "Acro leggings", augments={'Pet: Attack+20 Pet: Rng.Atk.+20'}}
    PetReadyAc2Feet={name = "Acro leggings", augments={'Pet: Damage taken -3%'}}
    PetPDTBack={name = "Pastoralist's mantle", augments={'Pet: Damage taken -3%'}}
    PetPDTFeet={name = "Acro leggings", augments={'Pet: Damage taken -3%'}}

    WS      = {head="argosy celata",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="argosy hauberk",hands="argosy Mufflers",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="argosy breeches",feet="argosy sollerets",back="buquwik Cape"}

    DD      = {ammo="ginsen",main="arktoi",sub="Skullrender",head=maskTP,neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="Epona's Ring",ring2="rajas rings",waist="cetl belt",
               legs=legsTP,feet="Valorous greaves",back="grounded mantle +1"}

    ACC     = {main="arktoi",sub="Skullrender",head=DDHead,neck="subtlety spectacles",ear1="brutal earring",
               ear2="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="Ramuh ring",ring2="enlivened ring",legs=legsTP,
               feet="Valorous greaves",back="grounded mantle +1",waist="olseni belt"}

    PDT     = {main="arktoi",sub="Skullrender",head="jumalik helm",neck="loricate torque +1",body="jumalik mail",
               hands="xaddi gauntlets",ring1="vocane ring",ring2="Defending ring",ear1="handler's earring",
               ear2="handler's earring +1",legs="xaddi cuisses",feet="xaddi boots",back="Iximulew cape",waist="dynamic belt +1"}
    --gs export did the trick in the data/export folder


    PetPDT  = {main="arktoi",sub="Skullrender",head="despair helm",neck="Empath necklace",ear1="handler's earring",
               ear2="handler's earring +1",body="Acro Surcoat",hands="Acro gauntlets",
               ring1="vocane ring",ring2="Defending ring",
               legs="Acro Breeches",feet=PetPDTFeet,back=PetPDTBack,waist="hurch'lan sash"}
   
    PetReadyAc2 = {body="acro surcoat",hands ="acro gauntlets",hands ="acro gauntlets",legs="Acro Breeches", feet=PetReadyAc2Feet}
    PetReadyAc1 = {feet=PetReadyAc2Feet}

    PetReady   = {main="arktoi",sub="Skullrender",head="despair helm" ,neck="Empath necklace",ear1="handler's earring",
               ear2="handler's earring +1",body="Taeon Tabard",hands="nukumi manoplas",
               ring1="vocane ring",ring2="Defending ring",waist="hurch'lan sash",
               legs=ValLegs,feet=PetReadyFeet,back=PetReadyBack}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec bstput.txt') 
    end


end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkillSpell()

    if player.TP >999 then
            add_to_chat(158,'Load WS Gear')
            equip(WS)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function BeastLoyalitySpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,'Beast Loyality Detected:')
        equip(CallBst)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function CallBeastSpell(Spell)
     local ID   = Spell.recast_id
     local Name = Spell.name

     if windower.ffxi.get_ability_recasts()[ID] < 1 then
         if player.equipment.ammo == "Bubbly Broth" then
             add_to_chat(158,'Call Beast Detected: Bretha Detected Aborting')
             equip ({ammo=empty})
             cancel_spell()
         else
             add_to_chat(158,'Call Beast Detected: Pet OK')
        end
    else
        cancel_spell()
    end
end 
-------------------------------------------------------------------------------------------------------------------
function PetRewardSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
         add_to_chat(158,'Reward Detected: Load Gear')
         equip (Reward)
         if pet.hpp > 69 then
            if player.inventory['Pet Food Epsilon Biscuit'] then
                equip(Epsi)
            else
                cancel_spell()
            end
         elseif pet.hpp > 58 then

            if player.inventory['Pet Food Zeta Biscuit'] then
                equip(Zeta)
            elseif player.inventory['Pet Food Epsilon Biscuit']  then
                equip(Epsi)
            else
                cancel_spell()
            end
         elseif pet.hpp > 43 then
            if player.inventory['Pet Food Eta Biscuit']  then
                equip(Eta)
            elseif player.inventory['Pet Food Zeta Biscuit']  then
                equip(Zeta)
            elseif player.inventory['Pet Food Epsilon Biscuit'] then
                equip(Epsi)
            else
                cancel_spell()
           
            end
         else
            if player.inventory['Pet Food Theta Biscuit'] then
                equip(Theta)
            elseif player.inventory['Pet Food Eta Biscuit'] then
                equip(Eta)
            elseif player.inventory['Pet Food Zeta Biscuit'] then
                equip(Zeta)
            elseif player.inventory['Pet Food Epsilon Biscuit'] then
                equip(Epsi)
            end
         end
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function ReadyUpSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name
    equip(ReadyDly)
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_spell_recasts()[ID] > 0 then
        cancel_spell()
   end
end
-------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] > 0 then
       cancel_spell()
   end
end
-------------------------------------------------------------------------------------------------
function FightAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] > 0 then
       cancel_spell()
   end
   --elseif windower.ffxi.get_ability_recasts()[45] < 1 then
   --    send_command('input /pet spur <me>;')
   --    cast_delay(3)
  -- end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)


    if Spell.type == 'WeaponSkill' then
        WeaponSkillSpell() 
    elseif Spell.name == 'Reward' then
        PetRewardSpell(Spell)
    elseif Spell.name == 'Call Beast' then
        CallBeastSpell(Spell)
    elseif Spell.name == 'Bestial Loyalty' then
        BeastLoyalitySpell(Spell)
    elseif Spell.type == 'Monster' then
        ReadyUpSpell(Spell)
    elseif Spell.name == 'Fight' then
        FightAbility(Spell)
    elseif Spell.type == 'PetCommand' then
        JobAbility(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else
    end
    
end
------------------------------------------------------------------------------------------------------------------
function aftercast(Spell)

    if Spell.interrupted then
        SetPostEventGear()
    elseif Spell.type == 'Monster' then
        equip(PetReady)
        
        if ReadyAcc1 == true then
            equip(PetReadyAc1)
        elseif ReadyAcc2 == true then
            equip(PetReadyAc2)
        end

    else  
        SetPostEventGear()
    end


    send_command('input /macro book 10')
    send_command('input /macro set 1')  
end
----------------------------------------------------------------------------------------------------------------
function pet_aftercast (spell)
    SetPostEventGear()
        if pet.hpp < 30 then
            send_command('input /ja reward <me>;') 
     end 
end
--------------------------------------------------------------------------------------------------------------------
function SetPostEventGear()

    if  PDTMode == true then
        equip(PDT)
    elseif ACCMode == true then
        equip(ACC)
    elseif DDMode == true then 
        equip(DD)
    elseif PetPDTMode == true then
        equip(PetPDT)
    elseif  ReadyMode == true then
        equip(PetReady)
        if ReadyAcc1 == true then
            equip(PetReadyAc1)
        elseif ReadyAcc2 == true then
            equip(PetReadyAc2)
        end
    else
        add_to_chat(158,'Gear Selection Errors')
    end

end
-------------------------------------------------------------------------------------------------------------------
function self_command(command)
    send_command('bind !] gs c WeaponSwapMode')
    if command == "MeleeMode" then
        if DDMode == true then
            add_to_chat(158,'Fight Mode Change To: ACCMode')
            DDMode  = false
            ACCMode = true
        elseif ACCMode == true then
            add_to_chat(158,'Fight Mode Change To: PetPDTMode')
            ACCMode = false
            PetPDTMode = true
        elseif PetPDTMode == true then
             add_to_chat(158,'Fight Mode Change To: PDTMode')
            PetPDTMode = false
            PDTMode = true
        elseif PDTMode == true then
            add_to_chat(158,'Fight Mode Change To: ReadyMode')
            PDTMode  = false
            ReadyMode = true
        elseif ReadyMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode')
            ReadyMode = false
            DDMode  = true
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        SetPostEventGear()
        send_command('input /lockstyle off;')
    elseif command == "ReadyAccMode" then
        if ReadyAcc1 == true then
            add_to_chat(158,'Ready Acc2 Mode On')
            ReadyAcc1 = false
            ReadyAcc2 = true
        elseif ReadyAcc2 == true then
            add_to_chat(158,'Ready Acc2 Mode Off')
            ReadyAcc2 = false
        elseif ReadyAcc2 == false and ReadyAcc1 == false then
            add_to_chat(158,'Ready Acc1 Mode On')
            ReadyAcc1 = true
        end
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
        --send_command('input /lockstyle off;')
    elseif command == "LockStyle" then 
            send_command('input /lockstyleset 92;')        
    elseif command == "Ready1" then
          Ready1()
    elseif command == "Ready2" then
          Ready2()  
    elseif command == "Ready3" then
          Ready3()  
    elseif command == "Ready4" then
          Ready4()
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 92;')
    else
       -- tp_percent = command;       
    end
end
------------------------------------------------------------------------------------------------ 
function Ready1()

    if pet.name =="BouncingBertha" or pet.name =="ScissorlegXerin" then
        send_command('input /pet "Sensilla blades" <me>;')
    elseif pet.name =="WarlikePatrick" then
        send_command('input /pet "Intimidate" <me>;')
    elseif pet.name =="AttentiveIbuki" then
        send_command('input /pet "Recoil Dive" <me>;')
    elseif pet.name =="AmiableRoche" then
        send_command('input /pet "Water Wall" <me>;')
    elseif pet.name =="HeadbreakerKen" then
        send_command('input /pet "Cursed Sphere" <me>;')
    elseif pet.name =="BlackbeardRandy" then
        send_command('input /pet "Claw Cyclone" <me>;') 
    elseif pet.name =="FleetReinhard" then
        send_command('input /pet "Scythe Tail" <me>;')
    elseif pet.name =="AlluringHoney" then
        send_command('input /pet "Tickling Tendrils" <me>;')
    elseif pet.name =="DroopyDortwin" or pet.name =="PonderingPeter" then
        send_command('input /pet "Whirl Claws" <me>;')             
    end
end
------------------------------------------------------------------------------------------------ 
function Ready2()
    if pet.name =="BouncingBertha" or pet.name =="ScissorlegXerin" then
        send_command('input /pet "Tegmina buffet" <me>;')
    elseif pet.name =="WarlikePatrick" then
        send_command('input /pet "Brain Crush" <me>;')
    elseif pet.name =="AttentiveIbuki" then
        send_command('input /pet "Swooping Frenzy" <me>;')  
    elseif pet.name =="HeadbreakerKen" then
        send_command('input /pet "Venom" <me>;')
    elseif pet.name =="BlackbeardRandy" then
        send_command('input /pet "Razor Fang" <me>;')    
    elseif pet.name =="FleetReinhard" then
        send_command('input /pet "Ripper Fang" <me>;')  
    elseif pet.name =="AlluringHoney" then
        send_command('input /pet "Nectarous Deluge" <me>;') 
    elseif pet.name =="DroopyDortwin" or pet.name =="PonderingPeter" then
        send_command('input /pet "Dust Cloud" <me>;')                    
    end
end
------------------------------------------------------------------------------------------------ 
function Ready3()
    if pet.name =="WarlikePatrick" then
        send_command('input /pet "Fireball" <me>;')
    elseif pet.name =="AttentiveIbuki" then
        send_command('input /pet "Pentapeck" <me>;')
    elseif pet.name =="HeadbreakerKen" then
        send_command('input /pet "Somersault" <me>;')      
    elseif pet.name =="BlackbeardRandy" then
        send_command('input /pet "Roar" <me>;')
    elseif pet.name =="FleetReinhard" then
        send_command('input /pet "Chomp Rush" <me>;')   
    elseif pet.name =="AlluringHoney" then
        send_command('input /pet "Nepenthic Plunge" <me>;')  
    elseif pet.name =="DroopyDortwin" or pet.name =="PonderingPeter" then
        send_command('input /pet "Wild Carrot" <me>;') 
    end       
end
------------------------------------------------------------------------------------------------ 
function Ready4()
    if pet.name =="WarlikePatrick" then
        send_command('input /pet "Tail Blow" <me>;')   
    elseif pet.name =="DroopyDortwin" or pet.name =="PonderingPeter" then
        send_command('input /pet "Foot Kick" <me>;') 
    end 
end
------------------------------------------------------------------------------------------------
function status_change(new,old)
    SetPostEventGear()
end

