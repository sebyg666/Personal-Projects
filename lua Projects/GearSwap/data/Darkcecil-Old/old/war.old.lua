texts = require('texts')


function get_sets()


speed = texts.new()

speed:show()
speed:text('test')

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec warget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 3')
    send_command('input /macro set 1')
    send_command('bind !1 gs c Provoke ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c PDTMode')
    send_command('bind !4 gs c Resolution')
    send_command('bind !5 gs c UkkosFury')
    send_command('bind !6 gs c SavageBlade')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c RetaliationMode')
    send_command('bind !9 gs c Meditate')
    send_command('bind !0 gs c AttackBuff')

    send_command('bind ^1 gs c SneakInvis')
    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^4 gs c Scourge')
    send_command('bind ^5 gs c Upheavel')
    send_command('bind ^6 gs c Requiescat')
    send_command('bind ^7 gs c LockStyle')
    send_command('bind ^8 gs c AutoMode')
    send_command('bind ^9 gs c Sekkanoki')
    send_command('bind ^0 gs c Retaliation')

    DDMode          = true
    DDACCMode       = false
    ACCMode         = false
    PDTMode         = false
    VITMode         = false
    VITSTRMode      = false
    CRITMode        = false
    STRMode         = false
    RetaliationMode = false

    Retaliat = {feet="Boii Calligae +1"}
    Aggressr = {Body="agoge lorica",head="Pummeler's Mask +1"}
    BloodRag = {body="Boii Lorica +1"}
    Berserk  = {Body="Pummeler's lorica +1",feet="agoge calligae"}
    WarCharg = {legs="agoge Cuisses"}
    WarCry   = {head="agoge mask"}
    Trust    = {body="yoran unity shirt"}
    Main    = {main="ragnarok",sub="balarama grip"}

   backDD ={ name="Cichol's Mantle",  augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
   backCR ={ name="Cichol's Mantle",  augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}
   legsDD ={ name="Valor. Hose",      augments={'Accuracy+28','"Dbl.Atk."+3'}}
   legsTP ={ name="Valor. Hose",      augments={'Accuracy+15 Attack+15','"Store TP"+4','VIT+3','Accuracy+15'}}
   maskDD ={ name="Valorous Mask",    augments={'Accuracy+19 Attack+19','"Dbl.Atk."+5','Accuracy+8','Attack+1'}}
   maskTP ={ name="Valorous Mask",    augments={'Accuracy+18 Attack+18','"Store TP"+5','VIT+3','Accuracy+12','Attack+11'}}
   

    STR      = {ammo="ginsen",head="Argosy Celata",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="Argosy Hauberk",hands="argosy mufflers",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="Argosy breeches",feet="Argosy sollerets",back=backDD}  

    Crit      = {ammo="ginsen",head="lustratio cap",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="lustratio harness",hands="lustratio mittens",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="lustratio subligar",feet="lustratio leggings",back=backCR}  

    VIT      = {ammo="ginsen",head="sulevia's mask +1",neck="fotia gorget",ear1="brutal earring",
               ear2="moonshade earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="titan ring",ring2="titan ring",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back=backDD}

    VITSTR   = {ammo="ginsen",head="sulevia's mask +1",neck="fotia gorget",ear1="ishvara earring",
               ear2="moonshade earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="Ifrit ring +1",ring2="titan ring",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1s",back=backDD}

    DD       = {ammo="ginsen",head=maskDD,neck="asperity necklace",ear2="zennaroi earring",
               ear1="brutal earring",body="ravenous breastplate",hands="odyssean gauntlets",
               ring1="rajas ring",ring2="k'ayres ring",waist="kentarch belt +1",
               legs=legsDD ,feet="odyssean greaves",back=backDD}

    DDACC      = {ammo="ginsen",head=maskTP ,neck="asperity necklace",ear2="zennaroi earring",
               ear1="brutal earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="rajas ring",ring2="k'ayres ring",waist="kentarch belt +1",
               legs=legsTP,feet="valorous greaves",back=backDD}

    ACC      = {ammo="ginsen",head=maskTP ,neck="subtlety spectacles",ear2="thunder pearl",
               ear1="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Odyssean cuisses",feet="valorous greaves",back=backDD}


    PDT      = {ammo="ginsen",head="sulevia's mask +1",neck="loricate torque +1",ear2="thunder pearl",
               ear1="bladeborn earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="vocane ring",ring2="Defending Ring",back="Grounded Mantle +1",
               waist="tempus fugit",legs="sulevia's cuisses +1",feet="sulevia's leggings +1"}
end
-------------------------------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec warput.txt') 
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
    send_command('unbind ^4')
    send_command('unbind ^5')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')

end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(Name)

    if player.tp > 999 then
            if  Name == "Scourge" then
                equip( VITSTR )
                add_to_chat(158,'Load VIT/STR Gear')
            elseif Name =="Upheaval" then
                equip (VIT)
                add_to_chat(158,'VIT WS Gear')
            elseif Name == "Ukko's Fury" then
                equip (Crit)
                add_to_chat(158,'CRIT WS Gear')
            elseif Name == "Resolution" then
                equip(STR)
                add_to_chat(158,'STR WS Gear')
            elseif Name =="Savage Blade" then
                equip (STR)
                add_to_chat(158,'STR WS Gear')
            else
                equip(STR)
                add_to_chat(158,'STR WS Gear')
            end
    else
        cancel_spell()
    end 

end
-------------------------------------------------------------------------------------------------------------------
function BloodRageSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip (BloodRag)
    else
        cancel_spell()
    end

end
--------------------------------------------------------------------------------------------------------------------
function WarcrySpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name


    if windower.ffxi.get_ability_recasts()[ID]< 1 then
        equip(WarCry)
    else
        cancel_spell()
    end

end
--------------------------------------------------------------------------------------------------------------------
function BerserkSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name


    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Berserk)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function AggressorSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name


    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(Aggressr)
    else
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function WarChargeSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name


    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip (WarCharg)
    else
        cancel_spell()
    end
end
--------------------------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_spell_recasts()[ID] > 0 then
        cancel_spell()
    end
end
------------------------------------------------------------------------------------------------------------------
function JobAbility(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] > 0 then
        cancel_spell()
    end
end
-------------------------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
           WeaponSkill(Spell.name)
        elseif Spell.name == "provoke" then 
     equip(Enmity)

    elseif PDTMode then
                SetPostEventGear() 

     equip(Enmity)
    elseif Spell.name == "Blood Rage" then
        BloodRageSpell(Spell)
    elseif Spell.name == "Aggressor" then
        AggressorSpell(Spell)
    elseif Spell.name == "Berserk" then
        BerserkSpell(Spell)
    elseif Spell.name == "Warrior's Charge" then
        WarChargeSpell(Spell)
    elseif Spell.name == "Warcry" then
        WarcrySpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" then
        equip(Trust)
    end
end
--------------------------------------------------------------------------------------------------------------------
function aftercast(Spell)

    SetPostEventGear()
    AutoBuffs()

  local Mesg

  if PDTMode  == true then
      Mesg = "PDT Mode"      
  elseif DDACCMode == true then
      Mesg = "TP Mode"      
  elseif DDMode == true then
      Mesg = "DD Mode"      
  end    
speed:text(Mesg)
end
--------------------------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)
    AutoBuffs()
end
--------------------------------------------------------------------------------------------------------------------
function AutoBuffs()
    if AutoMode == true then

        local Restraint=9
        local Retaliation= 8  
        local Berserk = 1
        local Aggressor = 4
        local Hasso = 138
        local LastResort = 87
        local spell_recasts = windower.ffxi.get_ability_recasts()

        if player.status == "Engaged" and not midaction() then 
            if not buffactive.retaliation and spell_recasts[Retaliation] < 1 and RetaliationMode then   
               send_command('input /ja retaliation <me>;')
            elseif not buffactive.berserk and spell_recasts[Berserk] < 1 and spell_recasts[Aggressor] < 1 then 
               send_command('input /ja berserk <me>;')
            elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 and buffactive.berserk then 
               send_command('input /ja aggressor <me>;')
            elseif not buffactive.restraint and spell_recasts[Restraint] < 1 then
               send_command('input /ja restraint <me>;')
            elseif player.sub_job == 'SAM' then
                if not buffactive.hasso and spell_recasts[Hasso] < 1 then 
                   send_command('input /ja hasso <me>;')
                end
            elseif player.sub_job == 'DRK' then
                if not buffactive.berserk and spell_recasts[Berserk] > 60 and spell_recasts[LastResort] < 1 and not buffactive['last resort'] then
                   send_command('input /ja "last Resort" <me>;')
                end   
            end
        end
    end 
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)

       SetPostEventGear()

end 
-------------------------------------------------------------------------------------------------------------------
function SetPostEventGear()

    if PDTMode == true then     
        equip(PDT)
    elseif DDMode == true then    
        equip(DD)
    elseif DDACCMode == true then      
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif VITMode == true then     
        equip(VIT)
    elseif VITSTRMode == true then     
        equip(VITSTR)
    elseif CRITMode == true then     
        equip(Crit)
    elseif STRMode == true then     
        equip(STR)
    else
        add_to_chat(158,'Gear Selection Errors')
    end
    
    if RetaliationMode == true then
        equip(Retaliat)
    end
    if CapacityMode == true then
        equip(CapGear)
    end  
end
-------------------------------------------------------------------------------------------------------------------
function self_command(command)
    local Mesg 

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
            VITMode = true  
            add_to_chat(158,'Fight Mode Change To: VITMode')
         elseif VITMode == true then            
            VITMode    = false
            VITSTRMode = true 
            add_to_chat(158,'Fight Mode Change To: VITSTRMode')
        elseif VITSTRMode == true then            
            VITSTRMode    = false
            STRMode = true 
            add_to_chat(158,'Fight Mode Change To: STRMode')
        elseif STRMode == true then  
            STRMode = false   
            CRITMode = true
            add_to_chat(158,'Fight Mode Change To: CRITMode')
        elseif CRITMode == true then  
            CRITMode = false   
            DDMode = true
            add_to_chat(158,'Fight Mode Change To: DDMode')
        else
            add_to_chat(158,'Melee Mode Error: Undefined Mode')
        end
        if PDTMode  == true then
            Mesg = "PDT Mode"      
        elseif DDACCMode == true then
            Mesg = "TP Mode"      
        elseif DDMode == true then
           Mesg = "DD Mode"      
        end    
        speed:text(Mesg)
        SetPostEventGear()
    elseif command == "RetaliationMode" then
        if RetaliationMode == true then
            RetaliationMode = false
            add_to_chat(158,'RetaliationMode: Off')
        else
            RetaliationMode = true
            add_to_chat(158,'RetaliationMode: On')
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
        if PDTMode  == true then
            Mesg = "PDT Mode"      
        elseif DDACCMode == true then
            Mesg = "TP Mode"      
        elseif DDMode == true then
            Mesg = "DD Mode"      
        end    
        speed:text(Mesg)
        --send_command('input /lockstyle off;')
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 85;')
    elseif command == "Help" then
        ShortCuts()
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 85;')
    elseif command == "Provoke" then
         send_command('input /ja provoke <t>')
    elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')
    elseif command == "Resolution" then
         send_command('input /ws resolution <t>')
    elseif command == "UkkosFury" then
         send_command('input /ws "ukko\'s fury" <t>')
    elseif command == "SavageBlade" then
         send_command('input /ws "Savage Blade" <t>')
    elseif command == "Meditate" then
         send_command('input /ja meditate <me>')
    elseif command == "AttackBuff" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>;wait 2;input /ja hasso <me>;wait 2; input /ja restraint <me>')
    elseif command == "SneakInvis" then
         send_command('input /ja "spectral jig" <me>')
    elseif command == "Scourge" then
         send_command('input /ws "Scourge" <t>')
    elseif command == "Upheavel" then
         send_command('input /ws "Upheavel" <t>')
    elseif command == "Requiescat" then
         send_command('input /ws "Requiescat" <t>')
    elseif command == "Sekkanoki" then
         send_command('input /ja "Sekkanoki" <me>')    
    elseif command == "Retaliation" then
         send_command('input /ja Retaliation <me>')
    end
end
