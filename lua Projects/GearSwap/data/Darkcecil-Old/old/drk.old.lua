function get_sets()
    send_command('input /macro book 5')
    send_command('input /macro set 1')

    if windower.ffxi.get_info().mog_house then 
	send_command('wait 5;exec drkget.txt;wait 5;gs c LoadSet')
    end

    send_command('input /macro book 5')
    send_command('input /macro set 1')
    send_command('bind !1 gs c Provoke ')
    send_command('bind !2 gs c ShadowNi')
    send_command('bind !3 gs c PDTMode')
    send_command('bind !4 gs c Resolution')
    send_command('bind !5 gs c Torcleaver')
    send_command('bind !6 gs c DrainACC')
    send_command('bind !7 gs c MeleeMode')
    send_command('bind !8 gs c Meditate')
    send_command('bind !9 gs c AttAlt')
    send_command('bind !0 gs c AttackBuff')

    send_command('bind ^1 gs c SneakInvis')
    send_command('bind ^2 gs c ShadowIchi ')
    send_command('bind ^3 gs c EndarkII')
    send_command('bind ^4 gs c Scourge')
    send_command('bind ^5 gs c DrainTP')
    send_command('bind ^6 gs c SoulEater')
    send_command('bind ^7 gs c LockStyle')
    --send_command('bind ^8 gs c AutoMode')
    send_command('bind ^9 gs c Sekkanoki')
    --send_command('bind ^0 gs c CapacityMode')


    DDMode          = true
    DDACCMode       = false
    ACCMode         = false
    PDTMode         = false
    VITMode         = false
    VITSTRMode      = false
    CRITMode        = false
    STRMode         = false

    DreadSk = 
    AbsorbTP= {hands="Heathen's gauntlets"}
    LastResr= {feet="Fallen's sollerets"}
    SoulEat = {head="Ignominy burgeonet +1"}
    Trust    = {body="yoran unity shirt"}
    Main    = {main="ragnarok",sub="balarama grip"}

    legsDD ={ name="Valor. Hose",      augments={'Accuracy+28','"Dbl.Atk."+3'}}
    legsTP ={ name="Valor. Hose",      augments={'Accuracy+15 Attack+15','"Store TP"+4','VIT+3','Accuracy+15'}}
    maskDD ={ name="Valorous Mask",    augments={'Accuracy+19 Attack+19','"Dbl.Atk."+5','Accuracy+8','Attack+1'}}
    maskTP ={ name="Valorous Mask",    augments={'Accuracy+18 Attack+18','"Store TP"+5','VIT+3','Accuracy+12','Attack+11'}}
    CapeDD ={ name="Ankou's Mantle",   augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
    CapeWS ={ name="Ankou's Mantle",   augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}}


    STR      = {ammo="ginsen",head="Argosy Celata",neck="fotia gorget",ear1="moonshade earring",
               ear2="brutal earring",body="argosy hauberk",hands="argosy mufflers",
               ring1="Ifrit ring +1",ring2="Ifrit ring +1",waist="fotia Belt",
               legs="Argosy breeches",feet="argosy sollerets",back=CapeDD }

    FastCast = {head="carmine mask",body="Heathen's cuirass",neck="voltsurge torque",
                ear1="loquacious earring",hands="Heathen's gauntlets",ring1="prolix ring",
                feet="Carmine greaves"}



    VITSTR   = {ammo="ginsen",head="sulevia's mask +1",neck="fotia gorget",ear1="moonshade earring",
               ear2="ishvara earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="ifrit ring +1",ring2="titan ring",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back=CapeWS}


    VIT      = {ammo="ginsen",head="sulevia's mask +1",neck="fotia gorget",ear1="moonshade earring",
               ear2="ishvara earring",body="sulevia's platemail +1",hands="odyssean gauntlets",
               ring1="titan ring",ring2="titan ring",waist="fotia Belt",
               legs="sulevia's cuisses +1",feet="sulevia's leggings +1",back=CapeWS}

    DD      = {ammo="ginsen",head=maskDD,neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="Odyssean gauntlets",
               ring1="rajas ring",ring2="k'ayres ring",waist="kentarch belt +1",
               legs=legsDD,feet="Odyssean greaves",back=CapeDD }


    DDACC    = {ammo="ginsen",head=maskTP,neck="asperity necklace",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="rajas ring",ring2="k'ayres ring",waist="kentarch belt +1",
               legs=legsTP,feet="valorous greaves",back=CapeDD }

    ACC      = {ammo="ginsen",head=maskTP,neck="subtlety spectacles",ear2="brutal earring",
               ear1="zennaroi earring",body="ravenous breastplate",hands="emicho gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="dynamic belt +1",
               legs="sulevia's cuisses +1",feet="valorous greaves",back=CapeDD }

    PDT      = {ammo="ginsen",head="sulevia's mask +1",neck="loricate torque +1",ear2="brutal earring",
               ear1="zennaroi earring",body="sulevia's platemail +1",hands="sulevia's gauntlets +1",
               ring1="vocane ring",ring2="Defending Ring",back="Grounded Mantle +1",
               waist="tempus fugit",legs="sulevia's cuisses +1",feet="sulevia's leggings +1"}
end
-----------------------------------------------------------------------------------------------
function  file_unload()
    if windower.ffxi.get_info().mog_house then
	send_command('exec drkput.txt') 
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
    send_command('unbind ^4')
    send_command('unbind ^5')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')

end
-----------------------------------------------------------------------------------------------
function WeaponSkill(Spell)

    if player.tp > 999 then
        if  Spell.name == "Scourge" then
            equip (VITSTR)
        elseif Spell.name  == "Torcleaver" then
            equip (VIT)
        elseif Spell.name  == "Resolution" then
            equip (STR)
        else
            equip (STR)  
        end
    else
         cancel_spell()
    end
 
end
-----------------------------------------------------------------------------------------------
function SouleaterSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(SoulEat)
    else
        cancel_spell()
    end
end
-----------------------------------------------------------------------------------------------
function LastResortSpell(Spell)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if windower.ffxi.get_ability_recasts()[ID] < 1 then
        equip(LastResr)
   else
        cancel_spell()
   end
end
-----------------------------------------------------------------------------------------------
function JobAbility(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_ability_recasts()[ID] > 0 then
        cancel_spell()
    end
end

-----------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(Spell)
    elseif Spell.type == "BlackMagic" then
        equip(FastCast)
    elseif Spell.name == "Last Resort" then
        LastResortSpell(Spell)
    elseif Spell.name == "Souleater" then
        SouleaterSpell(Spell)
    elseif Spell.type == "JobAbility" then
        JobAbility(Spell)
    elseif Spell.type =="Trust" then
        equip(Trust)
    end

end
-----------------------------------------------------------------------------------------------
function aftercast(spell)
       SetPostEventGear()
end
-------------------------------------------------------------------------------------------------------------------
function status_change(new,old)
       SetPostEventGear()
end 
-----------------------------------------------------------------------------------------------
function SetPostEventGear()
    if CapacityMode == true then
        equip(CapGear)
    end  
    if PDTMode == true then     
        equip(PDT)
    elseif DDACCMode == true then    
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif DDMode == true then    
        equip(DD)
    elseif VITSTRMode == true then     
        equip(VITSTR)
    elseif CRITMode == true then     
        equip(CRIT)
    elseif STRMode == true then     
        equip(STR)
    elseif VITMode == true then     
        equip(VIT)
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
        SetPostEventGear()
        send_command('input /lockstyle off;')
    elseif command == "LockStyle" then
            send_command('input /lockstyleset 90;')
    elseif command == "LoadSet" then
         SetPostEventGear()
         equip(Main)
         send_command('input /lockstyleset 90;')
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
    elseif command == "AttackBuff" then
         send_command('input /ja "Last Resort"  <me>;wait 2;input /ja Hasso <me>;wait 2;input /ma "endark ii" <me>')
    elseif command == "AttAlt" then
         send_command('input /ja "berserk" <me>;wait 2; input /ja aggressor <me>;wait 2;input /ja Hasso <me>;wait 2;input /ma "endark ii" <me>')
    elseif command == "SneakInvis" then
         send_command('input /ja "spectral jig" <me>')
    elseif command == "Scourge" then
         send_command('input /ws "Scourge" <t>')
    elseif command == "Meditate" then
         send_command('input /ja meditate <me>')
    elseif command == "Sekkanoki" then
         send_command('input /ja "Sekkanoki" <me>')  
    elseif command == "Provoke" then
         send_command('input /ja provoke <t>')
    elseif command == "ShadowNi" then
         send_command('input /ma "utsusemi: ni" <me>')
    elseif command == "ShadowIchi" then
         send_command('input /ma "utsusemi: ichi" <me>')
    elseif command == "Resolution" then
         send_command('input /ws resolution <t>') 
    elseif command == "DrainTP" then
         send_command('input /ma "absorb-tp" <t>')
     elseif command == "DrainACC" then
         send_command('input /ma "absorb-acc" <t>')
    elseif command == "DrainSTR" then
         send_command('input /ma "absorb-str" <t>')
    elseif command == "DrainTP" then
         send_command('input /ma "absorb-tp" <t>')
    elseif command == "SoulEater" then
         send_command('input /ja Souleater <me>')
    elseif command == "EndarkII" then
         send_command('input /ma "Endark II" <me>')
    elseif command == "Torcleaver" then
         send_command('input /ws Torcleaver <t>;')
    end
end
