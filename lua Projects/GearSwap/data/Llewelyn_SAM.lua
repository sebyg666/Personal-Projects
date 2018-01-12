	include('organizer-lib.lua')

    -- *** Credit goes to Flippant for helping me with Gearswap *** --
    -- ** I Use Some of Motenten's Functions ** --
    -- Last Updated: 05/02/14 8:00 PM *Advanced Version* --
     
    function get_sets()
            AccIndex = 1
            AccArray = {"LowACC","MidACC","HighACC","MaxACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
            WeaponIndex = 1
            WeaponArray = {"Kogarasumaru","Yoichinoyumi","DojikiriYasutsuna","Masamune","Amanomurakumo","Norifusa","Murasamemaru"} -- Default TP Set Is Kogarasumaru. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
            Armor = 'None'
            Twilight = 'None'
            Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
            Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
            Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
            Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
            target_distance = 23 -- Set Default Distance Here --
			
			send_command('bind f9 gs c C1')
			send_command('bind f10 gs c C7')
			send_command('bind f11 gs c C15')
			send_command('bind f12 gs c C17')
			send_command('bind !f9 gs c C2')
     
            sc_map = {SC1="TachiFudo", SC2="TachiRana", SC3="NamasArrow"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
     
            sets.Idle = {	sub="Utu Grip",	
                            head="Wakido Kabuto +3",
                            neck="Loricate Torque +1",
                            ear1="Sanare Earring",
                            ear2="Etiolation Earring",
                            body="Hiza. Haramaki +1",
                            hands="Rao Kote +1",
                            ring1="Defending Ring",
                            ring2="Karieyh Ring",
                            back="Shadow Mantle",
                            waist="Flume Belt +1",
                            legs="Rao Haidate +1",
                            feet="Danzo Sune-Ate"}
            sets.Idle.Kogarasumaru = set_combine(sets.Idle,{
                            main="Kogarasumaru",
							ammo="Staunch Tathlum +1"})
            sets.Idle.Yoichinoyumi = set_combine(sets.Idle,{
							main="Amanomurakumo",
                            range="Yoichinoyumi"})
            sets.Idle.DojikiriYasutsuna = set_combine(sets.Idle,{
                            main="Dojikiri Yasutsuna",
							ammo="Staunch Tathlum +1"})
			sets.Idle.Masamune = set_combine(sets.Idle,{
                            main="Masamune",
							ammo="Staunch Tathlum +1"})
            sets.Idle.Amanomurakumo = set_combine(sets.Idle,{
                            main="Amanomurakumo",
							ammo="Staunch Tathlum +1"})
            sets.Idle.Norifusa = set_combine(sets.Idle,{
							main="Norifusa +1",
							ammo="Staunch Tathlum +1"})
            sets.Idle.Murasamemaru = set_combine(sets.Idle,{
							main="Murasamemaru",
							ammo="Staunch Tathlum +1"})
     
            sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
     
            -- TP Base Set --
            sets.TP = {}
     
            -- Kogarasumaru TP Sets --
            sets.TP.Kogarasumaru = {
                            main="Kogarasumaru",
							sub="Utu Grip",
                            ammo="Ginsen",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Telos Earring",
                            ear2="Dedition Earring",
                            body="Kasuga Domaru +1",
                            hands="Wakido Kote +3",
                            ring1="Niqmaddu Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
                            waist="Ioskeha Belt +1",
                            legs="Ryuo Hakama +1",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.TP.Kogarasumaru.MidACC = set_combine(sets.TP.Kogarasumaru,{
							ear2="Cessance Earring",
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Accuracy+30','"Store TP"+7','DEX+8','Attack+1',}}})
            sets.TP.Kogarasumaru.HighACC = set_combine(sets.TP.Kogarasumaru.MidACC,{ 
							ammo="Amar Cluster",
							neck="Combatant's Torque",
							ear2="Mache Earring +1",
							body="Ryuo Domaru +1"})
            sets.TP.Kogarasumaru.MaxACC = set_combine(sets.TP.Kogarasumaru.HighACC,{
							head="Ryuo Somen +1",
							ear1="Mache Earring +1",
							hands="Ryuo Tekko +1",
							ring2="Ramuh Ring +1",
							feet="Wakido Sune. +3"})
			
            -- Yoichinoyumi TP Sets --
            sets.TP.Yoichinoyumi = {
                            main="Amanomurakumo",
							sub="Utu Grip",
                            range="Yoichinoyumi",
							ammo="Yoichi's Arrow",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Brutal Earring",
                            ear2="Telos Earring",
                            body="Kasuga Domaru +1",
                            hands={ name="Valorous Mitts", augments={'Accuracy+21','"Store TP"+8','Attack+3',}},
                            ring1="Petrov Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+4','"Store TP"+3',}},
                            waist="Ioskeha Belt +1",
                            legs="Kasuga Haidate +1",
                            feet="Ryuo Sune-Ate +1"}
            sets.TP.Yoichinoyumi.MidACC = set_combine(sets.TP.Yoichinoyumi,{
							hands="Ryuo Tekko +1",
							back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
							feet={ name="Valorous Greaves", augments={'Accuracy+30','"Store TP"+7','DEX+8','Attack+1',}}})
            sets.TP.Yoichinoyumi.HighACC = set_combine(sets.TP.Yoichinoyumi.MidACC,{
							neck="Combatant's Torque",
							ear1="Cessance Earring",
							body="Ryuo Domaru +1",
							ring2="Ramuh RIng +1",
							waist="Kentarch Belt +1"})
            sets.TP.Yoichinoyumi.MaxACC = set_combine(sets.TP.Yoichinoyumi.HighACC,{
							head="Ryuo Somen +1",
							ear1="Zennaroi Earring",
							ring1="Ramuh Ring +1",
							waist="Olseni Belt",
							legs="Flamma Dirs +1",
							feet="Wakido Sune. +3"})
							
            -- Dojikiri Yasutsuna TP Sets --
            sets.TP.DojikiriYasutsuna = {
			                main="Dojikiri Yasutsuna",
							sub="Utu Grip",
							ammo="Ginsen",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Brutal Earring",
                            ear2="Cessance Earring",
                            body="Kasuga Domaru +1",
                            hands="Wakido Kote +3",
                            ring1="Niqmaddu Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
                            waist="Ioskeha Belt +1",
                            legs="Ryuo Hakama +1",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.TP.DojikiriYasutsuna.MidACC = set_combine(sets.TP.DojikiriYasutsuna,{
							ammo="Amar Cluster",
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Accuracy+30','"Store TP"+7','DEX+8','Attack+1',}}})
            sets.TP.DojikiriYasutsuna.HighACC = set_combine(sets.TP.DojikiriYasutsuna.MidACC,{
							neck="Combatant's Torque",
							ear1="Mache Earring +1",
							body="Ryuo Domaru +1",
							back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}})
            sets.TP.DojikiriYasutsuna.MaxACC = set_combine(sets.TP.DojikiriYasutsuna.HighACC,{
							head="Ryuo Somen +1",
							ear2="Mache Earring +1",
							hands="Ryuo Tekko +1",
							ring2="Ramuh Ring +1",
							feet="Wakido Sune. +3"})
			
            -- Masamune TP Sets --
            sets.TP.Masamune = {
			                main="Masamune",
							sub="Utu Grip",
							ammo="Ginsen",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Brutal Earring",
                            ear2="Cessance Earring",
                            body="Kasuga Domaru +1",
                            hands="Wakido Kote +3",
                            ring1="Niqmaddu Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
                            waist="Ioskeha Belt +1",
                            legs="Ryuo Hakama +1",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.TP.Masamune.MidACC = set_combine(sets.TP.Masamune,{
							ammo="Amar Cluster",
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Accuracy+29','"Dbl.Atk."+5','Attack+5',}}})
            sets.TP.Masamune.HighACC = set_combine(sets.TP.Masamune.MidACC,{
							neck="Combatant's Torque",
							ear1="Mache Earring +1",
							ear2="Mache Earring +1",
							body="Ryuo Domaru +1"})
            sets.TP.Masamune.MaxACC = set_combine(sets.TP.Masamune.HighACC,{
							head="Ryuo Somen +1",
							hands="Ryuo Tekko +1",
							ring2="Ramuh Ring +1",
							feet="Wakido Sune. +3"})

            -- Amanomurakumo TP Sets --
            sets.TP.Amanomurakumo = {
			                main="Amanomurakumo",
							sub="Utu Grip",
							ammo="Ginsen",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Brutal Earring",
                            ear2="Cessance Earring",
                            body="Kasuga Domaru +1",
                            hands="Wakido Kote +3",
                            ring1="Niqmaddu Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
                            waist="Ioskeha Belt +1",
                            legs="Ryuo Hakama +1",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.TP.Amanomurakumo.MidACC = set_combine(sets.TP.Amanomurakumo,{
							ammo="Amar Cluster",
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Accuracy+30','"Store TP"+7','DEX+8','Attack+1',}}})
            sets.TP.Amanomurakumo.HighACC = set_combine(sets.TP.Amanomurakumo.MidACC,{
							neck="Combatant's Torque",
							ear1="Mache Earring +1",
							ear2="Mache Earring +1",
							body="Ryuo Domaru +1",
							back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}})
            sets.TP.Amanomurakumo.MaxACC = set_combine(sets.TP.Amanomurakumo.HighACC,{
							head="Ryuo Somen +1",
							hands="Ryuo Tekko +1",
							ring2="Ramuh Ring +1",
							feet="Wakido Sune. +3"})

			
            -- Norifusa TP Sets --
            sets.TP.Norifusa = {
                            main="Norifusa +1",
							sub="Utu Grip",
                            ammo="Ginsen",
                            head="Flam. Zucchetto +1",
                            neck="Ganesha's Mala",
                            ear1="Telos Earring",
                            ear2="Dedition Earring",
                            body="Kasuga Domaru +1",
                            hands="Wakido Kote +3",
                            ring1="Niqmaddu Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
                            waist="Ioskeha Belt +1",
                            legs="Ryuo Hakama +1",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.TP.Norifusa.MidACC = set_combine(sets.TP.Norifusa,{
							ear2="Cessance Earring",
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Accuracy+30','"Store TP"+7','DEX+8','Attack+1',}}})
            sets.TP.Norifusa.HighACC = set_combine(sets.TP.Norifusa.MidACC,{ 
							ammo="Amar Cluster",
							neck="Combatant's Torque",
							ear2="Mache Earring +1",
							body="Ryuo Domaru +1"})
            sets.TP.Norifusa.MaxACC = set_combine(sets.TP.Norifusa.HighACC,{
							head="Ryuo Somen +1",
							ear1="Mache Earring +1",
							hands="Ryuo Tekko +1",
							ring2="Ramuh Ring +1",
							feet="Wakido Sune. +3"})
							
            -- Murasamemaru TP Sets --
            sets.TP.Murasamemaru = {
                            main="Murasamemaru",
							sub="Utu Grip",
							ammo="Ginsen",
                            head={ name="Acro Helm", augments={'Accuracy+18 Attack+18','Haste+3','STR+6 DEX+6',}},
                            neck="Ganesha's Mala",
                            ear1="Brutal Earring",
                            ear2="Telos Earring",
                            body="Kasuga Domaru +1",
                            hands={ name="Valorous Mitts", augments={'Accuracy+21','"Store TP"+8','Attack+3',}},
                            ring1="Petrov Ring",
                            ring2="Hetairoi Ring",
                            back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+4','"Store TP"+3',}},
                            waist="Windbuffet Belt +1",
                            legs="Kasuga Haidate +1",
                            feet="Ryuo Sune-Ate +1"}
            sets.TP.Murasamemaru.MidACC = set_combine(sets.TP.Murasamemaru,{
							neck="Combatant's Torque",
							hands="Ryuo Tekko +1",
							back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}})
            sets.TP.Murasamemaru.HighACC = set_combine(sets.TP.Murasamemaru.MidACC,{
							ammo="Amar Cluster",
							ear1="Cessance Earring",
							body="Ryuo Domaru +1",
							ring1="Ramuh Ring +1",
							waist="Kentarch Belt +1",
							feet="Wakido Sune. +3"})
            sets.TP.Murasamemaru.MaxACC = set_combine(sets.TP.Murasamemaru.HighACC,{
							head="Ryuo Somen +1",
							ear1="Zennaroi Earring",
							ring2="Ramuh Ring +1",
							waist="Olseni Belt",
							legs="Hiza. Hizayoroi +1"})
     
            -- Seigan TP Set --
            sets.TP.Seigan = {}
     
            -- Third Eye TP Set --
            sets.TP['Third Eye'] = {}
    
            -- PDT/MDT Sets --
            sets.PDT = {
							ammo="Staunch Tathlum +1",
                            head="Genmei Kabuto",
                            neck="Loricate Torque +1",
                            ear1="Odnowa Earring",
							ear2="Odnowa Earring +1",
                            body="Tartarus Platemail",
                            hands="Crusher's Gauntlets",
                            ring1="Defending Ring",
                            ring2="Gelatinous Ring +1",
                            back="Shadow Mantle",
                            waist="Flume Belt +1",
                            legs="Arjuna Breeches",
                            feet="Amm Greaves"}
     
            sets.MDT = {
							ammo="Staunch Tathlum +1",
							head="Founder's Corona",
							neck="Warder's Charm +1",
                            ear1="Etiolation Earring",
                            ear2="Sanare Earring",
                            body="Chozor. Coselete",
							hands="Leyline Gloves",
                            ring1="Defending Ring",
							ring2="Shadow Ring",
                            back="Reiki Cloak",
							waist="Ioskeha Belt +1",
							legs="Wakido Haidate +3",
							feet="Flam. Gambieras +1"}
     
            -- Hybrid Sets --
            sets.TP.Hybrid = {
							ammo="Staunch Tathlum +1",
							head="Ynglinga Sallet",
							neck="Agitator's Collar",
							ear1="Mache Earring +1",
							ear2="Mache Earring +1",
							body="Wakido Domaru +3",
							hands="Wakido Kote +3",
							ring1="Defending Ring",
							ring2="Patricius Ring",
							back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
							waist="Ioskeha Belt +1",
							legs="Arjuna Breeches",
							feet={ name="Valorous Greaves", augments={'Accuracy+28','Phys. dmg. taken -4%',}}}
            sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
            sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
							body="Ryuo Domaru +1"})
            sets.TP.Hybrid.MaxACC = set_combine(sets.TP.Hybrid.HighACC,{})
     
            -- WS Base Set --
            sets.WS = {}
     
            -- Tachi: Fudo Sets --
			sets.WS["Tachi: Fudo"] = {
							ammo="Knobkierrie",
                            head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+14','Attack+6',}},
                            neck="Fotia Gorget",
                            ear1="Ishvara Earring",
                            ear2="Moonshade Earring",
                            body={ name="Valorous Mail", augments={'Weapon skill damage +5%','STR+10','Accuracy+15','Attack+14',}},
                            hands={ name="Valorous Mitts", augments={'Accuracy+11','Weapon skill damage +5%','STR+9','Attack+10',}},
                            ring1="Niqmaddu Ring",
                            ring2="Karieyh Ring",
                            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
                            waist="Fotia Belt",
                            legs="Wakido Haidate +3",
                            feet={ name="Valorous Greaves", augments={'Weapon skill damage +4%','STR+10','Accuracy+15','Attack+5',}}}
            sets.WS["Tachi: Fudo"].MidACC = set_combine(sets.WS["Tachi: Fudo"],{
							ear1="Telos Earring",
							body="Rao Togi +1"})
            sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{
							body="Ryuo Domaru +1",
							hands="Ryuo Tekko +1"})
            sets.WS["Tachi: Fudo"].MaxACC = set_combine(sets.WS["Tachi: Fudo"].HighACC,{
							head="Ryuo Somen +1",
							ear1="Mache Earring +1",
							feet="Wakido Sune. +3"})
							
							
            -- Tachi: Fudo(Attack) Set --
			
			sets.WS["Tachi: Fudo"].ATT = set_combine(sets.WS["Tachi: Fudo"],{waist="Prosilio Belt +1"})
            sets.WS["Tachi: Fudo"].ATT.MidACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{waist="Prosilio Belt +1"})
            sets.WS["Tachi: Fudo"].ATT.HighACC = set_combine(sets.WS["Tachi: Fudo"].HighACC,{})
            sets.WS["Tachi: Fudo"].ATT.MaxACC = set_combine(sets.WS["Tachi: Fudo"].MaxACC,{})
			
            sets.WS["Tachi: Ageha"] = {
							ammo="Pemphredo Tathlum",
                            head="Flam. Zucchetto +1",
                            neck="Combatant's Torque",
                            ear1="Digni. Earring",
                            ear2="Moonshade Earring",
							body="Flamma Korazin +1",
                            hands="Flam. Manopolas +1",
                            ring1="Etana Ring",
                            ring2="Sangoma Ring",
                            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
                            waist="Eschan Stone",
                            legs="Flamma Dirs +1",
                            feet="Flam. Gambieras +1"}
            sets.WS["Tachi: Ageha"].MidACC = set_combine(sets.WS["Tachi: Ageha"],{})
            sets.WS["Tachi: Ageha"].HighACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
            sets.WS["Tachi: Ageha"].MaxACC = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			
            sets.WS["Tachi: Yukikaze"] = set_combine(sets.WS["Tachi: Ageha"],{})
            sets.WS["Tachi: Yukikaze"].MidACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
            sets.WS["Tachi: Yukikaze"].HighACC = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			sets.WS["Tachi: Yukikaze"].MaxACC = set_combine(sets.WS["Tachi: Ageha"].MaxACC,{})
			
            sets.WS["Tachi: Gekko"] = set_combine(sets.WS["Tachi: Ageha"],{})
            sets.WS["Tachi: Gekko"].MidACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
            sets.WS["Tachi: Gekko"].HighACC = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			sets.WS["Tachi: Gekko"].MaxACC = set_combine(sets.WS["Tachi: Ageha"].MaxACC,{})
			
            sets.WS["Tachi: Hobaku"] = set_combine(sets.WS["Tachi: Ageha"],{})
            sets.WS["Tachi: Hobaku"].MidACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
            sets.WS["Tachi: Hobaku"].HighACC = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			sets.WS["Tachi: Hobaku"].MaxACC = set_combine(sets.WS["Tachi: Ageha"].MaxACC,{})

            sets.WS["Tachi: Kasha"] = set_combine(sets.WS["Tachi: Fudo"],{})
            sets.WS["Tachi: Kasha"].MidACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{})
            sets.WS["Tachi: Kasha"].HighACC = set_combine(sets.WS["Tachi: Fudo"].HighACC,{})
            sets.WS["Tachi: Kasha"].MaxACC = set_combine(sets.WS["Tachi: Fudo"].MaxACC,{})



			
            sets.WS["Tachi: Kaiten"] = set_combine(sets.WS["Tachi: Fudo"],{})
            sets.WS["Tachi: Kaiten"].MidACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{})
            sets.WS["Tachi: Kaiten"].HighACC = set_combine(sets.WS["Tachi: Fudo"].HIghACC,{})
            sets.WS["Tachi: Kaiten"].MaxACC = set_combine(sets.WS["Tachi: Fudo"].MaxACC,{})
			
            -- Tachi: Shoha Sets --
            sets.WS["Tachi: Shoha"] = {
							ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+14','Attack+6',}},
                            neck="Fotia Gorget",
                            ear1="Brutal Earring",
                            ear2="Moonshade Earring",
                            body={ name="Valorous Mail", augments={'Weapon skill damage +5%','STR+10','Accuracy+15','Attack+14',}},
                            hands={ name="Valorous Mitts", augments={'Accuracy+11','Weapon skill damage +5%','STR+9','Attack+10',}},
                            ring1="Niqmaddu Ring",
                            ring2="Karieyh Ring",
                            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
                            waist="Fotia Belt",
                            legs="Wakido Haidate +3",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.WS["Tachi: Shoha"].MidACC = set_combine(sets.WS["Tachi: Shoha"],{
							body="Rao Togi +1",
							hands="Ryuo Tekko +1",
							feet="Wakido Sune. +3"})
            sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"].MidACC,{
							head="Ryuo Somen +1",
							ear1="Mache Earring +1"})
            sets.WS["Tachi: Shoha"].MaxACC = set_combine(sets.WS["Tachi: Shoha"].HighACC,{
							ammo="Amar Cluster",
							ring2="Ramuh Ring +1",
							waist="Ioskeha Belt +1"})

     
            -- Tachi: Rana Sets --
            sets.WS["Tachi: Rana"] = {
							ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+14','Attack+6',}},
                            neck="Fotia Gorget",
                            ear1="Brutal Earring",
                            ear2="Cessance Earring",
                            body="Rao Togi +1",
                            hands="Rao Kote +1",
                            ring1="Niqmaddu Ring",
                            ring2="Ifrit Ring +1",
                            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
                            waist="Fotia Belt",
                            legs="Wakido Haidate +3",
                            feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+22','Weapon skill damage +3%','Quadruple Attack +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}}
            sets.WS["Tachi: Rana"].MidACC = set_combine(sets.WS["Tachi: Rana"],{
							ear2="Telos Earring",
							body="Ryuo Domaru +1",
							hands="Ryuo Tekko +1",
							ring2="Karieyh Ring",
							feet={ name="Valorous Greaves", augments={'Weapon skill damage +4%','STR+10','Accuracy+15','Attack+5',}}})
            sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"].MidACC,{
							head="Ryuo Somen +1",
							ear1="Mache Earring +1",
							ear2="Mache Earring +1",
							feet="Wakido Sune. +3"})
            sets.WS["Tachi: Rana"].MaxACC = set_combine(sets.WS["Tachi: Rana"].HighACC,{
							ammo="Amar Cluster",
							ear2="Moonshade Earring",
							ring2="Ramuh Ring +1",
							waist="Ioskeha Belt +1"})
	
            -- Namas Arrow Sets --
            sets.WS["Namas Arrow"] = {
                            ammo="Yoichi's Arrow",
                            head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+14','Attack+6',}},
                            neck="Fotia Gorget",
                            ear1="Ishvara Earring",
                            ear2="Telos Earring",
                            body={ name="Valorous Mail", augments={'Weapon skill damage +5%','STR+10','Accuracy+15','Attack+14',}},
                            hands={ name="Valorous Mitts", augments={'Accuracy+11','Weapon skill damage +5%','STR+9','Attack+10',}},
                            ring1="Niqmaddu Ring",
                            ring2="Karieyh Ring",
                            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
                            waist="Fotia Belt",
                            legs="Wakido Haidate +3",
                            feet="Wakido Sune. +3"}
            sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{
							body="Kyujutsugi"})
            sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{
							head={ name="Acro Helm", augments={'Rng.Atk.+20','Weapon Skill Acc.+16','Weapon skill damage +3%',}},
							hands="Kasuga Kote +1"})
            sets.WS["Namas Arrow"].MaxACC = set_combine(sets.WS["Namas Arrow"].HighACC,{
							ring1="Garuda Ring +1",
							ring2="Garuda Ring +1"})
							
            -- JA Sets --
            sets.JA = {}
            sets.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +1",back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
            sets.JA["Warding Circle"] = {head="Wakido Kabuto +3"}
			sets.JA.Provoke = {
							head="Loess Barbuta +1",
							neck="Unmoving Collar +1",
							ear1="Cryptic Earring",	
							ear2="Trux Earring",
							body="Emet Harness +1",
							hands="Macabre Gaunt. +1",
							ring1="Supershear Ring",
							ring2="Eihwaz Ring",
							back="Earthcry Mantle",
							feet="Usk. Sune-Ate +1"}
     
            sets.Precast = {}
            -- Fastcast Set --
            sets.Precast.FastCast = {}
     
            sets.Midcast = {}
            -- Magic Haste Set --
            sets.Midcast.Haste = set_combine(sets.PDT,{})
			
			sets.org = {ear1="Lugra Earring +1",body="Kas. Sune-Ate +1",head="Sak. Sune-ate +1"}
    end
     
    function pretarget(spell,action)
            if spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
                    cancel_spell()
                    send_command('ThirdEye')
            end
    end
     
    function precast(spell,action)
            if spell.type == "WeaponSkill" then
                            equipSet = sets.WS
                            if equipSet[spell.english] then
                                    equipSet = equipSet[spell.english]
                            end
                            if equipSet[AccArray[AccIndex]] then
                                    equipSet = equipSet[AccArray[AccIndex]]
                            end
                            if buffactive.Sekkanoki then -- Equip Unkai Kote +2 When Sekkanoki Is On --
                                    equipSet = set_combine(equipSet,{hands="Kasuga Kote +1"})
                            end
                            if buffactive["Meikyo Shisui"] then
                                    equipSet = set_combine(equipSet,{feet="Sak. Sune-Ate +1"})
                            end
                            if (world.day == 'Firesday' or world.day == 'Watersday' or world.day == 'Windsday' or world.day == 'Iceday' or world.day == 'Lightningday' or world.day == 'Lightsday') and spell.english == 'Namas Arrow' then 
                                    equipSet = set_combine(equipSet,{head="Gavialis Helm"})
                            end
                            if buffactive.Sengikori then -- Equip Unkai Sune-ate +2 When Sengikori Is On --
                                    equipSet = set_combine(equipSet,{feet="Kas. Sune-Ate +1"})
                            end
							if (world.time > 1019 or world.time < 421) and (spell.english == 'Namas Arrow' or spell.english == 'Tachi: Rana') then
									equipSet = set_combine(equipSet,{ear2="Lugra Earring +1"})
							end
                            equip(equipSet)
            elseif spell.type == "JobAbility" then
                    if sets.JA[spell.english] then
                            equip(sets.JA[spell.english])
                    end
            elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
                    if string.find(spell.english,'Utsusemi') then
                                    equip(sets.Precast.FastCast)
                    else
                            equip(sets.Precast.FastCast)
                    end
            end
            if Twilight == 'Twilight' then
                    equip(sets.Twilight)
            end
    end
     
    function midcast(spell,action)
            if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
                    if string.find(spell.english,'Utsusemi') then
                            equip(sets.Midcast.Haste)
                    elseif spell.english == 'Monomi: Ichi' then
                            if buffactive['Sneak'] then
                                    send_command('@wait 1.7;cancel sneak')
                            end
                            equip(sets.Midcast.Haste)
                    else
                            equip(sets.Midcast.Haste)
                    end
            end
    end
     
    function aftercast(spell,action)
            if not spell.interrupted then
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
                    if equipSet[WeaponArray[WeaponIndex]] then
                            equipSet = equipSet[WeaponArray[WeaponIndex]]
                    end
                    if equipSet[AccArray[AccIndex]] then
                            equipSet = equipSet[AccArray[AccIndex]]
                    end
                    if buffactive.Seigan then -- Use Seigan Toggle For Seigan TP Set --
                            equipSet = set_combine(equipSet,{})
                    end
                    if buffactive.Seigan and not buffactive["Third Eye"] then -- Use Seigan Toggle For Seigan TP Set --
                            equipSet = set_combine(equipSet,{})
                    end
                    if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
                            equipSet = set_combine(equipSet,{})
                    end
                    equip(equipSet)
            else
                    equipSet = sets.Idle
                    if equipSet[WeaponArray[WeaponIndex]] then
                            equipSet = equipSet[WeaponArray[WeaponIndex]]
                    end
                    equip(equipSet)
            end
            if Twilight == 'Twilight' then
                    equip(sets.Twilight)
            end
    end
     
    function buff_change(buff,gain)
            buff = string.lower(buff)
            if buff == "Sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
                    equip({head=="Frenzy Sallet"})
            else
                    if not midaction() then
                            status_change(player.status)
                    end
            end
    end
     
    -- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
    function self_command(command)
            if command == 'C1' then -- Accuracy Toggle --
                    AccIndex = (AccIndex % #AccArray) + 1
                    add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
                    status_change(player.status)
            elseif command == 'C17' then -- Main Weapon Toggle --
                    WeaponIndex = (WeaponIndex % #WeaponArray) + 1
                    add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
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
            elseif command == 'C16' then -- Seigan Toggle --
                    if Seigan == 'ON' then
                            Seigan = 'OFF'
                            add_to_chat(123,'Seigan Set: [Unlocked]')
                    else
                            Seigan = 'ON'
                            add_to_chat(158,'Seigan Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C12' then -- Third Eye Toggle --
                    if Third_Eye == 'ON' then
                            Third_Eye = 'OFF'
                            add_to_chat(123,'Third Eye Set: [Unlocked]')
                    else
                            Third_Eye = 'ON'
                            add_to_chat(158,'Third Eye Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C11' then -- SAM Roll Toggle --
                    if Samurai_Roll == 'ON' then
                            Samurai_Roll = 'OFF'
                            add_to_chat(123,'SAM Roll: [OFF]')
                    else
                            Samurai_Roll = 'ON'
                            add_to_chat(158,'SAM Roll: [ON]')
                    end
                    status_change(player.status)
            elseif command == 'C3' then -- Twilight Toggle --
                    if Twilight == 'Twilight' then
                            Twilight = 'None'
                            add_to_chat(123,'Twilight Set: [Unlocked]')
                    else
                            Twilight = 'Twilight'
                            add_to_chat(158,'Twilight Set: [locked]')
                    end
                    status_change(player.status)
            elseif command == 'C6' then -- Idle Toggle --
                    IdleIndex = (IdleIndex % #IdleArray) + 1
                    add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
                    status_change(player.status)
            elseif command == 'TP' then
                    add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
            elseif command:match('^SC%d$') then
                    send_command('//'..sc_map[command])
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