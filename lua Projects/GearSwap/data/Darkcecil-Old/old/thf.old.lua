function get_sets()

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec thfget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 17')
    send_command('input /macro set 1')

    send_command('bind !1 gs c Pull ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c PDTMode')
    send_command('bind !4 gs c Waltz')
    send_command('bind !5 gs c BullFTA')
    send_command('bind !6 gs c RudraTA')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c RangeMode')
    send_command('bind !9 gs c FTA')
    send_command('bind !0 gs c AttackBuff')

    send_command('bind ^1 gs c SneakInvis')
    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^3 gs c Flee ')
    send_command('bind ^5 gs c BullFSA')
    send_command('bind ^6 gs c RudraSA')
    send_command('bind ^7 gs c LockStyle')
    send_command('bind ^8 gs c THMode')
    send_command('bind ^9 gs c FSA')
    send_command('bind ^0 gs c CapacityMode')

    DDMode       = true
    ACCMode      = false
    DDModeTH     = false
    ACCModeTH    = false
    DEXMode      = false
    PDTMode      = false
    CapacityMode = false
    THMode       = true
    RunFastMode  = false
    CastingEXP   = false
    Trust    = {body="yoran unity shirt"}
    CapGear = {back="Mecistopins mantle"}

    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    Flee    = {feet="pillager's poulaines +1"}
    TH      = {hands="plunderer's armlets +1",waist="Chaac belt", feet="skulker's poulaines"}
    Accompli= {head="Skulker's bonnet"}
    Collabor= {head="Skulker's bonnet"}
    PerfectD= {hands="Plunderer's armlets +1"}
    Hide    = {body="Pillager's vest +1"}
    Steal   = {legs="Pillager's culottes +1"}
    Main    = {main="shijo",sub="sandung",range="raider's boomerang"}

    HercBoots = { name="Herculean Boots", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','STR+6','Accuracy+12'}}  

    WS      = {head="lustratio cap",neck="fotia gorget",ear1="moonshade earring",
               ear2="brutal earring",body="Lustratio harness",hands="Lustratio mittens",
               ring1="Epona's Ring",ring2="Ramuh ring",waist="fotia Belt",
               legs="Lustratio subligar",feet="Lustratio Leggings",back="Kayapa Cape"}

    DD      = {head="adhemar bonnet",neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi",body="adhemar jacket",hands="adhemar wristbands",
               ring1="Epona's Ring",ring2="rajas ring",waist="kentarch belt +1",
               legs="samnuha tights",feet=HercBoots,back="Canny Cape"}

    ACC     = {head="adhemar bonnet",neck="subtlety spectacles",ear2="brutal earring",
               ear1="zennaroi",body="adhemar jacket",
               hands="adhemar wristbands",ring1="Epona's Ring",ring2="enlivened ring",
               legs="samnuha tights",feet="herculean boots",back="Grounded Mantle +1",waist="olseni belt"}

    PDTHead = {name = "qaaxo Mask", augments={"accuracy+15"}}
    PDTHand = {name = "qaaxo Mitaines", augments={"accuracy+15"}}
    PDTLegs = {name = "qaaxo Tights", augments={"accuracy+15"}}
    PDTFeet = {name = "qaaxo leggings", augments={"accuracy+15"}}
    PDT     = {head=PDTHead,neck="loricate torque +1",body="emet harness +1",ear2="brutal earring",
               ear1="zennaroi", hands=PDTHand,ring1="vocane ring",ring2="Defending ring",
               legs=PDTLegs,feet=PDTFeet,back="solemnity cape",waist="flume belt"}

end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec thfput.txt') 
    end

    send_command('unbind !1')
    send_command('unbind !2')
    send_command('unbind !3')
    send_command('unbind !4')
    send_command('unbind !5')
    send_command('unbind !6')
    send_command('unbind !7')
    send_command('unbind !8')
    send_command('unbind !9')
    send_command('unbind !0')

    send_command('unbind ^1')
    send_command('unbind ^2')
    send_command('unbind ^3')
    send_command('unbind ^5')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        add_to_chat(158,'Load WS Gear')
            equip(WS)
    else
      cancel_spell()     
    end
end
------------------------------------------------------------------------------------------------
function Range()
    if RACMode == true then
        equip (RngACC)
    else
        equip (Rng)
    end
end
-------------------------------------------------------------------------------------------------------------------
function PerfectDodgeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,"Perfect Dodge Detected: Perfect Dodge On")
        equip(PerfectD)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function StealSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,"Steal Detected: Steal Gear On")
        equip(Steal)  
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function FleeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID]< 1 then
        add_to_chat(158,"Flee Detected: Run Fast Boots")
        equip(Flee)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function HideSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,"Hide Detected: Accomp Gear On")
        equip(Hide)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function AccompliceSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        add_to_chat(158,"Accomplice Detected: Accomp Gear On")
        equip(Accompli)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function CollaboratorSpell()
    local ID   = Spell.recast_id
    local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then
       add_to_chat(158,"Collaborator Detected: Collabor Gear On")
       equip(Collabor)
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
       equip( TH )
   else
       cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)
    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == 'Ranged' then
        Range()
    elseif Spell.name == 'Flee' then
         FleeSpell(Spell)
    elseif Spell.name == "Accomplice" then 
        AccompliceSpell(Spell)
    elseif Spell.name == "Perfect Dodge" then
        PerfectDodgeSpell(Spell)
    elseif Spell.name == "Hide" then 
        HideSpell(Spell)
    elseif Spell.name == "Steal" then
        StealSpell(Spell)
    elseif Spell.name == "Collaborator" then
        CollaboratorSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" or Spell.type =="Item" then
        equip(Trust)
    else
 
    end
    
    if CapacityMode == true then
        equip(CapGear)
    end
end
------------------------------------------------------------------------------------------------
function aftercast(spell)
    SetPostEventGear()
end    
------------------------------------------------------------------------------------------------
function buff_change(Spell,Gained)

end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if  PDTMode == true then
        equip(PDT)
    elseif ACCMode == true then
        equip(ACC)
    elseif DDMode == true then 
        equip(DD)
    elseif DEXMode == true then 
        equip(WS)
    else
        add_to_chat(158,'Gear Selection Errors')
    end

    if THMode then
        equip( TH )
    end

    if player.status == "Idle" then
        equip(Flee)
    
    end  
    if CapacityMode == true then
        equip(CapGear)
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
            add_to_chat(158,'Fight Mode Change To: DEXMode')
            PDTMode = false
            DEXMode  = true
        elseif DEXMode == true then
            add_to_chat(158,'Fight Mode Change To: DDMode')
            DEXMode = false
            DDMode  = true
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
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
    elseif command == "SetGear" then
        SetPostEventGear()
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 84;')
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 84;')
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
    elseif command == "THMode" then
        if THMode == true then
            THMode = false
            add_to_chat(158,'THMode Turn Off')
        else
            THMode = true
            add_to_chat(158,'THMode Buff Turn On')
        end
        SetPostEventGear()
    elseif command == "SneakInvis" then
         send_command('input /ja "spectral jig" <me>')
    elseif command == "AttackBuff" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>')
    elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')
    elseif command == "Pull" then
         send_command('input /ra <t>')
    elseif command == "Waltz" then
         send_command('input /ja "curing waltz iii" <me>')
    elseif command == "BullFTA" then
         send_command('input /ja bully <t>;wait 1;input /ja feint <me>;wait 1;input /ja "trick attack" <me>')
    elseif command == "BullFSA" then
         send_command('input /ja bully <t>;wait 1;input /ja feint <me>;wait 1;input /ja "Sneak attack" <me>')
    elseif command == "RudraTA" then
         send_command('input /ja "trick attack" <me>;wait 1;input /ws "rudra\'s storm" <t>' )
    elseif command == "RudraSA" then
         send_command('input /ja "sneak attack" <me>;wait 1;input /ws "rudra\'s storm" <t>' )
    elseif command == "FTA" then
         send_command('input /ja feint <me>;wait 1;input /ja "trick attack" <me>')
    elseif command == "FSA" then
         send_command('input /ja feint <me>;wait 1;input /ja "Sneak attack" <me>')
     elseif command == "Flee" then
         send_command('input /ja Flee <me>')
    end
end
---------------------------------------------------------------------------------------------
function status_change(new,old)

    if new  == "Engaged" then
        SetPostEventGear()
        equip(TH)
        send_command('wait 7;gs c SetGear')
    elseif new == "Idle" then
        equip(Flee)
    
    end  
end
