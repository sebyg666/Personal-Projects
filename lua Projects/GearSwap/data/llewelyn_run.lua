include('organizer-lib.lua')	

    -- *** Credit goes to Flippant for helping me with Gearswap *** --
    -- ** I Use Some of Motenten's Functions ** --
    -- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --
     
    function get_sets()
            AccIndex = 1
            AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
            IdleIndex = 1
            IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
            Armor = 'None'
            target_distance = 25 -- Set Default Distance Here --
     
            sc_map = {SC1="Resolution", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
     
            -- Idle/Town Sets --
            sets.Idle = {
			                ammo="Brigantia Pebble",
                            head="Fu. Bandeau +1",
                            neck="Loricate Torque +1",
							ear1="Genmei Earring",
                            ear2="Ethereal Earring",
                            body="Runeist Coat +1",
                            hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+23','"Occult Acumen"+10','"Refresh"+1','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
                            ring1="Defending Ring",
                            ring2="Gelatinous Ring +1",
                            back="Shadow Mantle",
                            waist="Fucho-no-obi",
                            legs="Carmine Cuisses +1",
                            feet={ name="Herculean Boots", augments={'AGI+8','"Refresh"+1','Accuracy+13 Attack+13',}}}
            sets.Idle.Regen = {
			                ammo="Brigantia Pebble",
                            head="Fu. Bandeau +1",
                            neck="Loricate Torque +1",
							ear1="Genmei Earring",
                            ear2="Ethereal Earring",
                            body="Runeist Coat +1",
                            hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+23','"Occult Acumen"+10','"Refresh"+1','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
                            ring1="Defending Ring",
                            ring2="Gelatinous Ring +1",
                            back="Shadow Mantle",
                            waist="Fucho-no-obi",
                            legs="Carmine Cuisses +1",
                            feet={ name="Herculean Boots", augments={'AGI+8','"Refresh"+1','Accuracy+13 Attack+13',}}}
            sets.Idle.Movement =  {                           
			                ammo="Brigantia Pebble",
                            head="Fu. Bandeau +1",
                            neck="Loricate Torque +1",
							ear1="Genmei Earring",
                            ear2="Ethereal Earring",
                            body="Runeist Coat +1",
                            hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+23','"Occult Acumen"+10','"Refresh"+1','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
                            ring1="Defending Ring",
                            ring2="Gelatinous Ring +1",
                            back="Shadow Mantle",
                            waist="Fucho-no-obi",
                            legs="Carmine Cuisses +1",
                            feet={ name="Herculean Boots", augments={'AGI+8','"Refresh"+1','Accuracy+13 Attack+13',}}}
     
            -- TP Sets --
            sets.TP = {
                            ammo="Ginsen",
                            head="Adhemar Bonnet +1",
                            neck="Asperity Necklace",
                            ear1="Brutal Earring",
                            ear2="Cessance Earring",
                            body="Adhemar Jacket +1",
                            hands="Adhemar Wrist. +1",
                            ring1="Petrov Ring",
                            ring2="Epona's Ring",
                            back="Evasionist's Cape",
                            waist="Windbuffet Belt +1",
                            legs="Samnuha Tights",
                            feet={ name="Herculean Boots", augments={'Accuracy+15','"Triple Atk."+4','DEX+10',}}}
            sets.TP.MidACC = set_combine(sets.TP,{})
            sets.TP.HighACC = set_combine(sets.TP.MidACC,{})
     
            -- PDT/MDT Sets --
            sets.PDT = {
							main="Epeolatry",
							sub="Balarama Grip",
							ammo="Brigantia Pebble",
                            head={name="Blistering Sallet +1", priority=14},
                            neck="Loricate Torque +1",
                            ear1={name="Odnowa Earring", priority=12},
                            ear2={name="Odnowa Earring +1", priority=13},
                            body={name="Erilaz Surcoat +1", priority=15},
                            hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+13','"Subtle Blow"+4','Damage taken-5%','Accuracy+8 Attack+8',}},
                            ring1="Defending Ring",
                            ring2="Gelatinous Ring +1",
                            back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10', priority=16}},
                            waist="Flume Belt +1",
                            legs={name="Eri. Leg Guards +1", priority=11},
                            feet="Erilaz Greaves +1"}
     
            sets.MDT = {
							ammo="Vanir Battery",
							head="Erilaz Galea +1",
							neck="Warder's Charm +1",
							ear1="Sanare Earring",
							ear2={name="Odnowa Earring +1", priority=15},
							body="Runeist Coat +1",
							hands="Futhark Mitons +1",
							ring1="Defending Ring",
							ring2="Shadow Ring",
							back={name="Reiki Cloak", priority=16},
							waist="Flax Sash",
							legs={name="Eri. Leg Guards +1", priority=14},
							feet="Erilaz Greaves +1"}
     
            -- Hybrid Sets --
            sets.TP.Hybrid = set_combine(sets.PDT,{})
            sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
            sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
     
            -- WS Base Set --
            sets.WS = {}
     
            -- WS Sets --
            sets.WS.Dimidiation = {                            
							ammo="Jukukik Feather",
							head="Adhemar Bonnet +1",
                            neck="Caro Necklace",
                            ear1="Brutal Earring",
                            ear2="Moonshade Earring",
                            body="Adhemar Jacket +1",
                            hands="Adhemar Wrist. +1",
                            ring1="Karieyh Ring",
                            ring2="Epona's Ring",
                            back="Bleating Mantle",
                            waist="Grunfeld Rope",
                            legs="Lustr. Subligar +1",
                            feet="Lustra. Leggings +1"}
            sets.WS.Dimidiation.MidACC = set_combine(sets.WS.Dimidiation,{})
            sets.WS.Dimidiation.HighACC = set_combine(sets.WS.Dimidiation.MidACC,{})
     
            sets.WS.Requiescat = {}
            sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
            sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})
     
            -- Enmity Set --
            sets.Enmity = {
							ammo="Sapience Orb",
							head="Halitus Helm",
							neck="Unmoving Collar +1",
							ear1={name="Odnowa Earring", priority=14},
							ear2={name="Odnowa Earring +1", priority=15},
							body="Emet Harness +1",
							hands="Kurys Gloves",
							ring1={name="Eihwaz Ring", priority=12},
							ring2={name="Supershear Ring", priority=11},
							back={name="Reiki Cloak", priority=16},
							waist="Goading Belt",
							legs={name="Eri. Leg Guards +1", priority=13},
							feet="Erilaz Greaves +1"}
			
			-- Lunge Set --
			sets.Lunge = {
							ammo="Pemphredo Tathlum",
							head="Herculean Helm",
							neck="Baetyl Pendant",
							ear1="Friomisi Earring",
							ear2="Crematio Earring",
							body="Samnuha Coat",
							hands={ name="Herculean Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst mdg.+6%','"Mag.Atk.Bns."+8',}},
							ring1="Mujin Band",
							ring2="Locus Ring",
							back="Argocham. Mantle",
							waist="Eschan Stone",
							legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Magic burst mdg.+5%','Mag. Acc.+2',}},
							feet={ name="Herculean Boots", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst mdg.+6%','"Mag.Atk.Bns."+15',}}}
							
			sets.Swipe = {
							ammo="Pemphredo Tathlum",
							head="Herculean Helm",
							neck="Baetyl Pendant",
							ear1="Friomisi Earring",
							ear2="Crematio Earring",
							body="Samnuha Coat",
							hands={ name="Herculean Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst mdg.+6%','"Mag.Atk.Bns."+8',}},
							ring1="Mujin Band",
							ring2="Locus Ring",
							back="Argocham. Mantle",
							waist="Eschan Stone",
							legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Magic burst mdg.+5%','Mag. Acc.+2',}},
							feet={ name="Herculean Boots", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst mdg.+6%','"Mag.Atk.Bns."+15',}}}
     
            -- JA Sets --
            sets.JA = {}
            sets.JA.Vallation = set_combine(sets.Enmity,{body="Runeist Coat +1",back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}})
            sets.JA.Swordplay = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
            sets.JA.Lunge = set_combine(sets.Lunge)
			sets.JA.Swipe = set_combine(sets.Swipe)
            sets.JA.Pflug = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
            sets.JA.Valiance = set_combine(sets.Enmity,{body="Runeist Coat +1",back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}})
            sets.JA.Embolden = set_combine(sets.Enmity)
            sets.JA.Gambit = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
            sets.JA.Liement = set_combine(sets.Enmity,{body="Futhark Coat +1"})
			sets.JA["Vivacious Pulse"] = set_combine(sets.Enmity,{
				head="Erilaz Galea +1",neck="Incanter's Torque",ear1="Beatific Earring",
				ring2="Globidonta Ring",
				back="Altruistic Cape",waist="Bishop's Sash",legs="Rune. Trousers +1"})
            sets.JA["One For All"] = set_combine(sets.Enmity)
            sets.JA.Battuta = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
            sets.JA.Rayke = set_combine(sets.Enmity)
			sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
     
            -- Waltz Set --
            sets.Waltz = {}
     
            sets.Precast = {}
            -- Fastcast Set --
            sets.Precast.FastCast = {
                            ammo="Impatiens",
                            head="Carmine Mask +1",
                            neck="Orunmila's Torque",
                            ear1={name="Odnowa Earring", priority=13},
							ear2={name="Odnowa Earring +1", priority=14},
							body={name="Erilaz Surcoat +1", priority=15},
                            hands="Leyline Gloves",
                            ring1="Defending Ring",
							ring2="Gelatinous Ring +1",
							back={name="Reiki Cloak", priority=16},
							waist="Flume Belt +1",
							legs={name="Futhark Trousers +1", priority=12},
							feet="Carmine Greaves +1"}
     
            -- Utsusemi Precast Set --
            sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})
     
            -- Precast Enhancing Magic --
            sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})
			
			sets.Precast['Blue Magic'] = set_combine(sets.Precast.FastCast)
     
            -- Midcast Base Set --
            sets.Midcast = {}
     
            -- Magic Haste Set --
            sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})
     
            -- Flash Set --
            sets.Midcast.Flash = set_combine(sets.Precast.FastCast,{
							ammo="Sapience Orb",
							neck="Unmoving Collar +1",
							body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
							ring1={name="Eihwaz Ring", priority=15},
							ring2="Supershear Ring",
							waist="Goading Belt",
							legs={name="Eri. Leg Guards +1", priority=16}})
							
			sets.Midcast['Blue Magic'] = set_combine(sets.Midcast.Flash)
			
			sets.Midcast['Refueling'] = set_combine(sets.Precast.FastCast)
			
            -- Enhancing Magic --
            sets.Midcast['Enhancing Magic'] = {
							head={name="Erilaz Galea +1", priority=13},
							neck="Incanter's Torque",
							ear1="Andoaa Earring",
							ear2={name="Odnowa Earring +1", priority=15},
							body={name="Futhark Coat +1", priority=12},
							hands={name="Runeist Mitons +1", priority=11},
							ring2={name="Meridian Ring", priority=14},
							back={name="Reiki Cloak", priority=16},
							waist="Olympus Sash",
							legs="Futhark Trousers +1",
							feet="Erilaz Greaves +1"}
     
            -- Stoneskin --
            sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})
     
            -- Phalanx --
            sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{
							head="Fu. Bandeau +1",
							body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
							hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
							legs={ name="Taeon Tights", augments={'"Fast Cast"+5','Phalanx +3',}},
							feet={ name="Taeon Boots", augments={'Accuracy+15 Attack+15','"Dual Wield"+5','Phalanx +3',}},
							ring1={name="Meridian Ring", priority=11},
							ring2={name="Eihwaz Ring", priority=10}})
     
            -- Regen --
            sets.Midcast['Regen IV'] = {
							head="Rune. Bandeau +1",
							hands={ name="Taeon Gloves", augments={'"Fast Cast"+5','"Regen" potency+3',}},
							ring2={name="Meridian Ring", priority=16},
							feet={ name="Taeon Boots", augments={'"Fast Cast"+5','"Regen" potency+3',}}}
     
            -- Divine Magic --
            sets.Midcast['Divine Magic'] = {}
			
			
			sets.extra = {main="Epeolatry",sub="Balarama Grip"}
    end
     
    function pretarget(spell,action)
            if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                    cancel_spell()
                    send_command('input /item "Echo Drops" <me>')
            elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
                    cancel_spell()
                    add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                    return
            end
    end
     
    function precast(spell,action)
            if spell.type == "WeaponSkill" then
                    if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
                            cancel_spell()
                            add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
                            return
                    else
                            equipSet = sets.WS
                            if equipSet[spell.english] then
                                    equipSet = equipSet[spell.english]
                            end
                            if equipSet[AccArray[AccIndex]] then
                                    equipSet = equipSet[AccArray[AccIndex]]
                            end
                            equip(equipSet)
                    end
            elseif spell.type == "JobAbility" or spell.type == "Ward" or spell.type == "Effusion" then
                    if sets.JA[spell.english] then
                            equip(sets.JA[spell.english])
                    end
            elseif spell.type == "Rune" then
            elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
                    if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
                            cancel_spell()
                            add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
                            return
                    else
                            if string.find(spell.english,'Utsusemi') then
                                    if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                                            cancel_spell()
                                            add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
                                            return
                                    else
                                            equip(sets.Precast.Utsusemi)
                                    end
                            elseif sets.Precast[spell.skill] then
                                    equip(sets.Precast[spell.skill])
                            else
                                    equip(sets.Precast.FastCast)
                            end
                    end
            elseif spell.type == "Waltz" then
                    refine_waltz(spell,action)
                    equip(sets.Waltz)
            elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                    cast_delay(0.2)
                    send_command('cancel Sneak')
            end
    end
     
    function midcast(spell,action)
            equipSet = {}
            if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
                    equipSet = sets.Midcast
                    if equipSet[spell.english] then
                            equipSet = equipSet[spell.english]
                    elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
                            equipSet = equipSet.Haste
                            if spell.target.name == player.name then
                                    equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
                            end
                    elseif spell.english == "Stoneskin" then
                            if buffactive.Stoneskin then
                                    send_command('@wait 2.8;cancel stoneskin')
                            end
                            equipSet = equipSet.Stoneskin
                    elseif spell.english == "Sneak" then
                            if spell.target.name == player.name and buffactive['Sneak'] then
                                    send_command('cancel sneak')
                            end
                            equipSet = equipSet.Haste
                    elseif string.find(spell.english,'Spikes') then
                            equipSet = equipSet.Haste
                    elseif string.find(spell.english,'Utsusemi') then
                            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                                    send_command('@wait 1.7;cancel Copy Image*')
                            end
                            equipSet = equipSet.Haste
                    elseif spell.english == 'Monomi: Ichi' then
                            if buffactive['Sneak'] then
                                    send_command('@wait 1.7;cancel sneak')
                            end
                            equipSet = equipSet.Haste
                    elseif equipSet[spell.skill] then
                            equipSet = equipSet[spell.skill]
                    end
            elseif equipSet[spell.english] then
                    equipSet = equipSet[spell.english]
            end
            equip(equipSet)
    end
     
    function aftercast(spell,action)
            if spell.type == "WeaponSkill" and not spell.interrupted then
                    send_command('wait 0.2;gs c TP')
            end
            status_change(player.status)
    end
     
    function status_change(new,old)
            if Armor == 'PDT' then
                    equip(sets.PDT)
            elseif Armor == 'MDT' then
                    equip(sets.MDT)
            elseif new == 'Engaged' then
                    equipSet = sets.TP
                    if Armor == 'Hybrid' and equipSet["Hybrid"] then
                            equipSet = equipSet["Hybrid"]
                    end
                    if equipSet[AccArray[AccIndex]] then
                            equipSet = equipSet[AccArray[AccIndex]]
                    end
                    equip(equipSet)
            else
                    equip(sets.Idle[IdleArray[IdleIndex]])
            end
    end
     
    function buff_change(buff,gain)
            buff = string.lower(buff)
            if buff == 'weakness' then -- Weakness Timer --
                    if gain then
                            send_command('timers create "Weakness" 300 up')
                    else
                            send_command('timers delete "Weakness"')
                    end
            end
            if not midaction() then
                    status_change(player.status)
            end
    end
     
    -- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
    function self_command(command)
            if command == 'C1' then -- Accuracy Level Toggle --
                    AccIndex = (AccIndex % #AccArray) + 1
                    add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
                    status_change(player.status)
            elseif command == 'C5' then -- Auto Update Gear Toggle --
                    status_change(player.status)
                    add_to_chat(158,'Auto Update Gear')
            elseif command == 'C2' then -- Hybrid Toggle --
                    if Armor == 'Hybrid' then
                            Armor = 'None'
                            add_to_chat(123,'Hybrid Set: [Unlocked]')
                    else
                            Armor = 'Hybrid'
                            add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
                    end
                    status_change(player.status)
            elseif command == 'C7' then -- PDT Toggle --
                    if Armor == 'PDT' then
                            Armor = 'None'
                            add_to_chat(123,'PDT Set: [Unlocked]')
                    else
                            Armor = 'PDT'
                            add_to_chat(158,'PDT Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C15' then -- MDT Toggle --
                    if Armor == 'MDT' then
                            Armor = 'None'
                            add_to_chat(123,'MDT Set: [Unlocked]')
                    else
                            Armor = 'MDT'
                            add_to_chat(158,'MDT Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C8' then -- Distance Toggle --
                    if player.target.distance then
                            target_distance = math.floor(player.target.distance*10)/10
                            add_to_chat(158,'Distance: '..target_distance)
                    else
                            add_to_chat(123,'No Target Selected')
                    end
            elseif command == 'C6' then -- Idle Toggle --
                    IdleIndex = (IdleIndex % #IdleArray) + 1
                    add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
                    status_change(player.status)
            elseif command == 'TP' then
                    add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
            elseif command:match('^SC%d$') then
                    send_command('//' .. sc_map[command])
            end
    end
     
    function refine_waltz(spell,action)
            if spell.type ~= 'Waltz' then
                    return
            end
     
            if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
                    return
            end
     
            local newWaltz = spell.english
            local waltzID
     
            local missingHP
     
            if spell.target.type == "SELF" then
                    missingHP = player.max_hp - player.hp
            elseif spell.target.isallymember then
                    local target = find_player_in_alliance(spell.target.name)
                    local est_max_hp = target.hp / (target.hpp/100)
                    missingHP = math.floor(est_max_hp - target.hp)
            end
     
            if missingHP ~= nil then
                    if player.sub_job == 'DNC' then
                            if missingHP < 40 and spell.target.name == player.name then
                                    add_to_chat(123,'Full HP!')
                                    cancel_spell()
                                    return
                            elseif missingHP < 150 then
                                    newWaltz = 'Curing Waltz'
                                    waltzID = 190
                            elseif missingHP < 300 then
                                    newWaltz = 'Curing Waltz II'
                                    waltzID = 191
                            else
                                    newWaltz = 'Curing Waltz III'
                                    waltzID = 192
                            end
                    else
                            return
                    end
            end
     
            local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
            local tpCost = waltzTPCost[newWaltz]
     
            local downgrade
     
            if player.tp < tpCost and not buffactive.trance then
     
                    if player.tp < 20 then
                            add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
                            cancel_spell()
                            return
                    elseif player.tp < 35 then
                            newWaltz = 'Curing Waltz'
                    elseif player.tp < 50 then
                            newWaltz = 'Curing Waltz II'
                    elseif player.tp < 65 then
                            newWaltz = 'Curing Waltz III'
                    elseif player.tp < 80 then
                            newWaltz = 'Curing Waltz IV'
                    end
     
                    downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
            end
     
            if newWaltz ~= spell.english then
                    send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
                    if downgrade then
                            add_to_chat(158, downgrade)
                    end
                    cancel_spell()
                    return
            end
     
            if missingHP > 0 then
                    add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
            end
    end
     
    function find_player_in_alliance(name)
            for i,v in ipairs(alliance) do
                    for k,p in ipairs(v) do
                            if p.name == name then
                                    return p
                            end
                    end
            end
    end
     