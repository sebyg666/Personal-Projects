function get_sets()

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5 ;exec samget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 6')
    send_command('input /macro set 1')
    send_command('bind !1 gs c Provoke ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c PDTMode')
    send_command('bind !4 gs c Fudo')
    send_command('bind !5 gs c Kasha')
    send_command('bind !6 gs c AutoMode')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c Konzen')
    send_command('bind !9 gs c Meditate')
    send_command('bind !0 gs c AttackBuff')

    send_command('bind ^1 gs c SneakInvis')
    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^3 gs c Shosha')
    send_command('bind ^4 gs c Rana')
    send_command('bind ^5 gs c Geeko')
    send_command('bind ^7 gs c LockStyle')
    send_command('bind ^8 gs c Sengikor')
    send_command('bind ^9 gs c Sekkanoki')
    send_command('bind ^0 gs c ThirdEye')

    send_command('input /macro book 6')
    send_command('input /macro set 1')

    DDMode       = false
    DDACCMode    = true
    ACCMode      = false
    PDTMode      = false
    STRMode      = false

    Main = {main="kurikaranotachi",sub="bloodrain strap",range="cibitshavore"}
    Hasso   = {hands="Wakido Kote +1"}
    Meditate= {head="Wakido Kabuto +1",back="takaha mantle",hands="Sakonji Kote"}
    Trust    = {body="yoran unity shirt"}
 
   legsDD ={ name="Valor. Hose",      augments={'Accuracy+28','"Dbl.Atk."+3'}}
   legsTP ={ name="Valor. Hose",      augments={'Accuracy+15 Attack+15','"Store TP"+4','VIT+3','Accuracy+15'}}
   maskDD ={ name="Valorous Mask",    augments={'Accuracy+19 Attack+19','"Dbl.Atk."+5','Accuracy+8','Attack+1'}}
   maskTP ={ name="Valorous Mask",    augments={'Accuracy+18 Attack+18','"Store TP"+5','VIT+3','Accuracy+12','Attack+11'}}
 

    STR      = {head="Rao Kabuto",neck="fotia gorget",ear1="ishvara earring",
               ear2="moonshade earring",body="hizamaru haramaki +1",hands="rao kote",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="hizamaru hizayoroi +1",feet="Ryuo sune-ate",back="buquwik Cape"}

    DD      = {head=maskDD,neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="Ryuo tekko",
               ring1="rajas ring",ring2="k'ayres ring",waist="kentarch belt +1",
               legs=legsDD,feet="valorous greaves",back="takaha mantle"}

    DDACC    = {head="Ryuo Somen",neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="kasuga domaru +1",hands="Ryuo tekko",
               ring1="rajas ring",ring2="k'ayres ring",waist="cetl belt",
               legs=legsTP,feet="valorous greaves",back="takaha mantle"}

    ACC     = {head="Ryuo Somen" ,neck="subtlety spectacles",ear2="brutal earring",
               ear1="zennaroi earring",body="hizamaru haramaki +1",hands="Ryuo tekko",
               ring1="Ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="hizamaru hizayoroi +1",feet="Rao sune-ate",back="Grounded Mantle +1"}

    PDT     = {head="Loess Barbuta +1",neck="loricate torque +1",ear2="brutal earring",
               ear1="zennaroi earring",body="emet harness +1",hands="Xaddi gauntlets",
               ring1="vocane ring",ring2="Defending Ring",back="iximulew cape",
               waist="tempus fugit",legs="xaddi cuisses",feet="xaddi boots"}

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
    send_command('unbind ^4')
    send_command('unbind ^5')
    send_command('unbind ^3')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')

end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec samput.txt') 
    end
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.TP >999 then
        equip(STR)
    else
      cancel_spell()
       
    end
end
-------------------------------------------------------------------------------------------------------------------
function MeditateSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Meditate)
    else
        cancel_spell()
    end
end        
-------------------------------------------------------------------------------------------------------------------
function HassoSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Hasso)
    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function Kozenittai(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then
        if windower.ffxi.get_ability_recasts()[141] < 1 then
            send_command('input /ja sengikori <me>;')
            cast_delay(1)
        end
   else
        cancel_spell()
   end

end
------------------------------------------------------------------------------------------------
function ThirdEyeSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name
   if windower.ffxi.get_ability_recasts()[ID] < 1 then
        if windower.ffxi.get_ability_recasts()[139] < 1 then
            send_command('input /ja Seigan <me>;')
            cast_delay(1)
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
function MagicSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] < 1 then

    else
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell.name)
    elseif Spell.name == "Hasso" then
        HassoSpell(Spell)
    elseif Spell.name == "Third Eye" then
        ThirdEyeSpell(Spell)
    elseif Spell.name == "Meditate" then
        MeditateSpell(Spell)
    elseif Spell.name == "Konzen-ittai" then
        Kozenittai(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" then
        equip(Trust)
    elseif Spell.type =="Item" then
        --noting
    else

    end
    

end
------------------------------------------------------------------------------------------------
function aftercast(spell)

    SetPostEventGear()

end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if PDTMode == true then     
        equip(PDT)
    elseif DDACCMode == true then    
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif DDMode == true then    
        equip(DD)
    elseif STRMode == true then     
        equip(STR)
    else
        add_to_chat(158,'Gear Selection Errors')
    end
    
    if RetaliationMode == true then
        equip(Retaliat)
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
            STRMode  = true  
            add_to_chat(158,'Fight Mode Change To: STRMode')
        elseif STRMode == true then  
            STRMode = false   
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
         else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        send_command('input /lockstyle off;')
        SetPostEventGear()
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 82;')
    elseif command == "Help" then
        ShortCuts()     
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 82;')    
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
    elseif command == "Provoke" then
         send_command('input /ja provoke <t>')
    elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')
    elseif command == "Shosha" then
         send_command('input /ws "Tachi: Shoha" <t>')
    elseif command == "Fudo" then
         send_command('input /ws "Tachi: Fudo" <t>')
    elseif command == "Rana" then
         send_command('input /ws "Tachi: Rana" <t>')
    elseif command == "Meditate" then
         send_command('input /ja meditate <me>')
    elseif command == "AttackBuff" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>;wait 2;input /ja hasso <me>;')
    elseif command == "SneakInvis" then
         send_command('input /ja "spectral jig" <me>')
    elseif command == "Geeko" then
         send_command('input /ws "Tachi: Gekko" <t>')
    elseif command == "Kasha" then
         send_command('input /ws "Tachi: Kasha" <t>')
    elseif command == "Sekkanoki" then
         send_command('input /ja "Sekkanoki" <me>')    
    elseif command == "Retaliation" then
         send_command('input /ja Retaliation <me>')
    elseif command == "Konzen" then
         send_command('input /ja "Konzen-ittai" <me>')
    elseif command == "Sengikor" then
         send_command('input /ja hagakure <me>')
    elseif command == "ThirdEye" then
         send_command('input /ja "Third Eye" <me>')
    end
 

end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)
       AutoBuffs()
end 
