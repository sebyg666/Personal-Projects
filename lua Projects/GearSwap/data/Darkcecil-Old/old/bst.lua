function get_sets()

    send_command('input /macro book 10')
    send_command('input /macro set 1')

   
    DDMode         = false
    ACCMode        = false
    ReadyMode      = false
    ReadyAcc1      = false
    ReadyAcc2      = false
    PDTMode        = false
    PetPDTMode     = true

    CallBst = {main="Skullrender",sub="kerehcatl",body="Mirke wardecors"}    
    ReadyDly= {sub="charmer's merlin",legs="desultor tassets"}

    Reward  = {main="mdomo axe",sub="zoraal ja's axe",body="Totemic jackcoat +1",hands="ogre gloves",
               legs="totemic trousers +1",feet="loyalist sabatons"}
    Theta = {ammo="Pet Food Theta Biscuit"}
    Eta   = {ammo="Pet Food Eta Biscuit"}
    Zeta  = {ammo="Pet Food Zeta Biscuit"}
    Epsi  = {ammo="Pet Food Epsilon Biscuit"}


    WS      = {head="argosy celata",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="jumalik mail",hands="argosy Mufflers",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="argosy breeches",feet="argosy sollerets",back="buquwik Cape"}

    DDHands = {name = "acro gauntlets", augments={"Accuracy+11"}}
    DD      = {main="Skullrender",sub="kerehcatl",head="argosy celata",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="xaddi mail",hands="argosy Mufflers",
               ring1="Epona's Ring",ring2="petrov ring",waist="cetl belt",
               legs="argosy breeches",feet="loyalist sabatons",back="atheling mantle"}

    ACC     = {main="Skullrender",sub="kerehcatl",head="argosy celata",neck="subtlety spectacles",ear1="zennaroi earring",
               ear2="steelflash earring",body="Emet harness +1",hands="argosy Mufflers",
               ring1="Ramuh ring",ring2="enlivened ring",legs="argosy breeches",
               feet="argosy sollerets",back="grounded mantle +1",waist="Olseni belt"}

    PDT     = {main="Skullrender",sub="kerehcatl",head="jumalik helm",neck="Twilight torque",body="jumalik mail",
               hands="xaddi gauntlets",ring1="vocane ring",ring2="Defending ring",ear1="handler's earring",
               ear2="handler's earring +1",legs="xaddi cuisses",feet="amm greaves",back="Iximulew cape",waist="nierenschutz"}
    
    PetPDTBack={name = "Pastoralist's mantle", augments={'Pet: Damage taken -3%'}}
    PetPDTFeet={name = "Acro leggings", augments={'Pet: Damage taken -3%'}}
    PetPDT  = {main="Skullrender",sub="kerehcatl",head="Despair helm",neck="Empath necklace",ear1="handler's earring",
               ear2="handler's earring +1",body="Acro Surcoat",hands="Acro gauntlets",
               ring1="thurandaut ring",ring2="Defending ring",
               legs="Acro Breeches",feet=PetPDTFeet,back=PetPDTBack,waist="hurch'lan sash"}

    PetReadyAc2Feet={name = "Acro leggings", augments={'Pet: Damage taken -3%'}}
    PetReadyAc2 = {head="valorous Mask",body="acro surcoat",hands ="acro gauntlets",hands ="acro gauntlets",legs="Acro Breeches", feet=PetReadyAc2Feet}


    PetReadyAc1 = {head="valorous Mask",body="acro surcoat"}

    PetReadyBack={name = "Pastoralist's mantle", augments={'Pet: Damage taken -1%'}}
    PetReadyFeet={name = "Acro leggings", augments={'Pet: Attack+20 Pet: Rng.Atk.+20'}}
    PetReady   = {main="Skullrender",sub="kerehcatl",head="Despair helm",neck="Empath necklace",ear1="handler's earring",
               ear2="handler's earring +1",body="Taeon Tabard",hands="nukumi manoplas",
               ring1="thurandaut ring",ring2="Defending ring",waist="hurch'lan sash",
               legs="valorous hose",feet="Valorous Greaves",back=PetReadyBack}
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
   elseif windower.ffxi.get_ability_recasts()[45] < 1 then
       send_command('input /pet spur <me>;')
       cast_delay(3)
   end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if midcast() then
        cast_delay(1)
        if midcast() then
            cancel_spell()
        end
    end

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

    if DDMode == true then 
        equip(DD)
    elseif ACCMode == true then
        equip(ACC)
    elseif  PDTMode == true then
        equip(PDT)
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

