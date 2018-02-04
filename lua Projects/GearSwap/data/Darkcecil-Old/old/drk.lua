function get_sets()
    send_command('input /macro book 5')
    send_command('input /macro set 1')

    DDMode          = true
    DDACCMode       = false
    ACCMode         = false
    PDTMode         = false
    VITSTRMode      = false
    CRITMode        = false
    STRMode         = false
    CapacityMode    = false
    CastingEXP      = false
    AutoMode        = false

    CapGear = {back="Mecistopins mantle"}
    EXPRing = {ring1="Trizek Ring",ring2="Capacity Ring"}

    DreadSk = {body="Heathen's cuirass",head="Fallen's burgeonet"}
    AbsorbTP= {hands="Heathen's gauntlets"}
    LastResr= {feet="Fallen's sollerets"}
    SoulEat = {head="Ignominy burgeonet +1"}


    CRIT     = {ammo="aqreaqa bomblet",head="Lustratio cap",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="lustratio mittens",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Argosy Breeches",feet="lustratio leggings",back="buquwik cape"}


    STR      = {ammo="aqreaqa bomblet",head="Argosy Celata",neck="fotia gorget",ear1="flame pearl",
               ear2="flame pearl",body="Founder's breastplate",hands="Argosy Mufflers",
               ring1="Ifrit ring",ring2="Ifrit ring",waist="fotia Belt",
               legs="Argosy Breeches",feet="Argosy sollerets",back="buquwik cape"}

    VITSTR  = {ammo="aqreaqa bomblet",head="Ignominy burgeonet +1",neck="fotia gorget",ear1="soil Pearl",
               ear2="flame Pearl",body="Founder's breastplate",hands="odyssean gauntlets",
               ring1="Ifrit ring",ring2="ifrit ring",waist="fotia Belt",
               legs="Founder's hose",feet="amm greaves",back="buquwik cape"}

    DD      = {ammo="amar cluster",head="Argosy Celata",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Founder's breastplate",hands="founder's gauntlets",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="Argosy Breeches",feet="loyalist sabatons",back="atheling mantle"}

    DDACC   = {ammo="amar cluster",head="Argosy Celata",neck="asperity necklace",ear2="steelflash earring",
               ear1="bladeborn earring",body="Founder's breastplate",hands="Argosy Mufflers",
               ring1="rajas ring",ring2="petrov ring",waist="cetl belt",
               legs="Argosy Breeches",feet="Argosy sollerets",back="atheling mantle"}

    ACC     = {ammo="amar cluster",head="valorous mask",neck="subtlety spectacles",ear2="steelflash earring",
               ear1="zennaroi earring",body="Founder's breastplate",hands="Odyssean Gauntlets",
               ring1="ramuh ring",ring2="enlivened ring",waist="olseni belt",
               legs="Argosy Breeches",feet="Argosy sollerets",back="Grounded Mantle +1"}

    PDT     = {ammo="amar cluster",head="Yorium Barbuta",neck="twilight torque",ear2="steelflash earring",
               ear1="zennaroi earring",body="jumalik mail",hands="Yorium Gauntlets",
               ring1="vocane ring",ring2="Defending Ring",back="iximulew cape",
               waist="Nierenschutz",legs="Yorium cuisses",feet="amm greaves"}
send_command("gs validate")
end
-------------------------------------------------------------------------------------------------------------------
function WeaponSkill(name)

    if player.tp > 999 then
        if not CastingEXP then 
            if  Name == "Scourge" then
                equip( VITSTR )
                add_to_chat(158,'Load VIT/STR Gear')
            elseif Name == "Torcleaver" then
                equip (STR)
                add_to_chat(158,'CRIT WS Gear')
            elseif Name == "Resolution" then
                equip(STR)
                add_to_chat(158,'STR WS Gear')
            end
        else
            --noswap
        end
    else
         cancel_spell()
    end 
end
-------------------------------------------------------------------------------------------------------------------
function DeadSpikesSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,'Dread Spikes Detected: Loading Dread Spikes Gear')
            equip(DreadSk)
        else
            cancel_spell()
        end
    else
        --noswap
    end
end
-------------------------------------------------------------------------------------------------------------------
function SouleaterSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Souleater Detected: Loading Souleater Gear')
            equip(SoulEat)
        else
            cancel_spell()
        end
    else
        --noswap
    end
end
-------------------------------------------------------------------------------------------------------------------
function LastResortSpell(ID)
   local ID   = Spell.recast_id
   local Name = Spell.name

   if not CastingEXP then
        if windower.ffxi.get_ability_recasts()[ID] < 1 then
            add_to_chat(158,'Last Resort Detected: Loading Last Resort Gear')
            equip(LastResr)
        else
            cancel_spell()
        end
    else
        --noswap
    end
end
-------------------------------------------------------------------------------------------------------------------
function AbsorbTPSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if not CastingEXP then
        if windower.ffxi.get_spell_recasts()[ID] < 1 then
            add_to_chat(158,'Absorb-TP Detected: Loading Absorb-TP Gear')
            equip(AbsorbTP)
        else
            cancel_spell()
        end
    else
        --noswap
    end
end
-------------------------------------------------------------------------------------------------
function MagicSpell(Spell)
    local ID   = Spell.recast_id
    local Name = Spell.name

    if windower.ffxi.get_spell_recasts()[ID] > 0 then
        --noswap
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
-------------------------------------------------------------------------------------------------------------------
function CastEXPRing()
    send_command('input /item "Trizek Ring" <me>;input /item "Capacity Ring" <me>;')  
end
------------------------------------------------------------------------------------------------
function precast(Spell)

    if Spell.type == 'WeaponSkill' then
        WeaponSkill(name)
    elseif Spell.name == "Dread Spikes" then
        DeadSpikesSpell(Spell)
    elseif Spell.name == "Absorb-TP" then
        AbsorbTPSpell(Spell)
    elseif Spell.name == "Last Resort" then
        LastResortSpell(Spell)
    elseif Spell.name == "Souleater" then
        SouleaterSpell(Spell)
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
function aftercast(spell)
    if not CastingEXP then
        SetPostEventGear()
    end    
end
------------------------------------------------------------------------------------------------
function buff_change(Name,Gain)
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

    if AutoMode == true then
        local Retal         = 8  --- retaliation
        local Berserk=1
        local Aggressor =4
        local Hasso =138
        local spell_recasts = windower.ffxi.get_spell_recasts()

        if player.status == "Engaged" and not midaction() then 
            if not buffactive.retaliation and spell_recasts[Retal] and RetaliationMode < 1 then   
               send_command('input /ja retaliation <me>;')
            elseif not buffactive.berserk and spell_recasts[Berserk] < 1 then 
               send_command('input /ja berserk <me>;')
            elseif not buffactive.hasso and spell_recasts[Hasso] < 1 then 
               send_command('input /ja hasso <me>;')
            elseif not buffactive.aggressor and spell_recasts[Aggressor] < 1 then 
               send_command('input /ja aggressor <me>;')
        elseif AutoMode and not buffactive.Enlight  and SpellName ~= "Enlight II" and spell_recasts[EnlightII] < 1  then
                add_to_chat(158,'EnlightII Missing Recasting')
                send_command('@wait 1;input /ma "Enlight II" <me>;')
            end
        end
    end   
end
-----------------------------------------------------------------------------------------------
function SetPostEventGear()

    if DDMode == true then    
        equip(DD)
    elseif DDACCMode == true then    
        equip(DDACC)
    elseif ACCMode == true then      
        equip(ACC)
    elseif PDTMode == true then     
        equip(PDT)
    elseif VITSTRMode == true then     
        equip(VITSTR)
    elseif CRITMode == true then     
        equip(CRIT)
    elseif STRMode == true then     
        equip(STR)
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
            send_command('input /lockstyleset 90;')
    end
end
