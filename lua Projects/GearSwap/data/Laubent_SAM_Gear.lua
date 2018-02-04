function init_gear_sets()
	
	print('Laubent_SAM_Gear side_cart loaded')	
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------		
	
	Valorous_head		={ name="Valorous Mask", 		augments={'Mag. Acc.+17','Weapon skill damage +2%','STR+13',}}
	Valorous_body		={ name="Valorous Mail", 		augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','AGI+14','Accuracy+2','Attack+2',}} -- 3 stp
	Valorous_hands		={ name="Valorous Mitts", 		augments={'Accuracy+13','Weapon skill damage +3%','STR+11',}}
	Valorous_legs		={ name="Valor. Hose", 			augments={'Accuracy+30','"Store TP"+5','Attack+7',}} 											-- 0 stp + 5 stp (aug)
	Valorous_feet		={ name="Valorous Greaves", 	augments={'Accuracy+7 Attack+7','Weapon skill damage +3%','STR+3','Accuracy+10','Attack+9',}} 	-- 5 stp
	Valorous_feet_STP 	={ name="Valorous Greaves", 	augments={'Accuracy+14','"Store TP"+6','VIT+2',}} 	-- need 12 stp augment of 7 minimum
	Valorous_feet_PDT   ={ name="Valorous Greaves",     augments={'Accuracy+26','Phys. dmg. taken -5%','Attack+12',}}
	
	Ryuo_hands			={ name="Ryuo Tekko", 			augments={'DEX+10','Accuracy+20','"Dbl.Atk."+3',}}
	
	Rao_legs			={ name="Rao Haidate", 			augments={'STR+10','DEX+10','Attack+15',}}
	
	Founder_head		={ name="Founder's Corona", 	augments={'DEX+5','Accuracy+8',}}
	Founder_body		={ name="Found. Breastplate",	augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}}
	-- Founder_hands
	Founder_legs		={ name="Founder's Hose", 		augments={'MND+3','Mag. Acc.+3','Attack+7','Breath dmg. taken -1%',}}
	Founder_feet		={ name="Founder's Greaves", 	augments={'VIT+8','Accuracy+13','"Mag.Atk.Bns."+14','Mag. Evasion+14',}}
	
	NTakaha_Mantle		={ name="Takaha Mantle", 		augments={'STR+2','"Zanshin"+3','Meditate eff. dur. +8',}}
	Smertrios_STP		={ name="Smertrios's Mantle", 	augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+3','"Store TP"+10',}}
	Smertrios_WSD		={ name="Smertrios's Mantle", 	augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Smertrios_DA		={ name="Smertrios's Mantle", 	augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}

	CP_Cape				={ name="Mecisto. Mantle", 		augments={'Cap. Point+50%','HP+20','DEF+2',}}
	
	AF_head 			={ name="Wakido Kabuto +2" }
	AF_body				={ name="Wakido Domaru +3" }
	AF_hands 			={ name="Wakido Kote +3" }
	AF_legs 			={ name="Wakido Haidate +3" }
	AF_feet 			={ name="Wakido Sune-Ate +2" }
	
	Relic_head			={ name="Sakonji Kabuto +1", 	augments={'Enhances "Ikishoten" effect',}}
	Relic_body			={ name="Sakonji Domaru +1", 	augments={'Enhances "Overwhelm" effect',}}
    Relic_hands			={ name="Sakonji Kote +1", 		augments={'Enhances "Blade Bash" effect',}}
	Relic_legs			={ name="Sakonji Haidate +1", 	augments={'Enhances "Shikikoyo" effect',}}
	Relic_feet			={ name="Sakonji Sune-Ate +1", 	augments={'Enhances "Meikyo Shisui" effect',}}
		
	Empy_head 			={ name="Kasuga Kabuto +1" }
	Empy_body			={ name="Kasuga Domaru +1"}
	Empy_hands			={ name="Kasuga Kote +1" }
	Empy_legs 			={ name="Kasuga Haidate +1" }
	Empy_feet 			={ name="Kasuga Sune-Ate +1" }
	
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    -- Precast sets to enhance JAs
	
    -- sets.precast.JA['Meikyo Shisui'] 	= {feet=Relic_feet}
    sets.precast.JA['Warding Circle']  	= {feet=AF_feet}
    sets.precast.JA['Meditate'] 		= {head=AF_head, hands=Relic_hands, back=Smertrios_STP}
	sets.precast.JA['Blade Bash']    	= {hands=Relic_hands}
	sets.precast.JA['Shikikoyo']    	= {legs=Relic_legs}
	sets.precast.JA['Sengikori']    	= {feet=Empy_feet}
	
	-- sets.precast.JA['Seigan']    	= {head=Empy_head}
	-- sets.precast.JA['Third Eye']    	= {legs=Relic_legs}
	-- sets.precast.JA['Hasso']    		= {hands=AF_hands, legs=Empy_legs}
	-- sets.precast.JA['Sekkanoki']    	= {hands=Empy_hands}
	
	
	-- Fast cast sets for spells
	sets.precast.FC = {}
	
	-- WS sets
	-- global set that works for any WS that isn't defined below by name
	sets.precast.WS = {ammo="Knobkierrie",
		head=Valorous_head, neck="Fotia Gorget", ear1="Ishvara Earring", ear2="Telos Earring",
		body=Valorous_body, hands=Valorous_hands, ring1="Niqmaddu Ring", ring2="Regal Ring",
		back=Smertrios_WSD, waist="Fotia Belt", legs=AF_legs, feet=Valorous_feet}
		
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	-- 50% STR
	sets.precast.WS['Tachi: Rana'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana']['Ilvl~118'] 		= set_combine(sets.precast.WS['Tachi: Rana'], {})
	sets.precast.WS['Tachi: Rana']['Ilvl~122'] 		= set_combine(sets.precast.WS['Tachi: Rana']['Ilvl~118'], {})
	sets.precast.WS['Tachi: Rana']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Tachi: Rana']['Ilvl~122'], {})
	
	-- CHR 60% STR 40%
	-- Max ACC to land additional effect 'Defense Down'
	sets.precast.WS['Tachi: Ageha'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Ageha']['Ilvl~118'] 		= set_combine(sets.precast.WS['Tachi: Ageha'], {})
	sets.precast.WS['Tachi: Ageha']['Ilvl~122'] 		= set_combine(sets.precast.WS['Tachi: Ageha']['Ilvl~118'], {})
	sets.precast.WS['Tachi: Ageha']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Tachi: Ageha']['Ilvl~122'], {})
	
	-- STR 30% 
	-- elemental WS, can stack Magic attack bonus
	sets.precast.WS['Tachi: Jinpu'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Jinpu']['Ilvl~118'] 		= set_combine(sets.precast.WS['Tachi: Jinpu'], {})
	sets.precast.WS['Tachi: Jinpu']['Ilvl~122'] 		= set_combine(sets.precast.WS['Tachi: Jinpu']['Ilvl~118'], {})
	sets.precast.WS['Tachi: Jinpu']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Tachi: Jinpu']['Ilvl~122'], {})
	
	
	--------------------------------------
    -- Midcast sets
    --------------------------------------
	
	--fast recast, Cap haste at 25% then ram in as much FC as possible for recast (FC is halved when calculated for recast)
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
	
	--------------------------------------
    -- Idle sets
    --------------------------------------
	
	sets.Kiting 	= {feet="Danzo Sune-Ate"}
    sets.resting 	= {}
	
	sets.idle = {ammo="Staunch Tathlum",
			head="Ynglinga Sallet", neck="Sanctity Necklace", left_ear="Cessance Earring", right_ear="Telos Earring",
			body="Wakido Domaru +3", hands="Kurys Gloves", ring1="Chirich Ring",ring2="Sheltered Ring",
			back="Solemnity Cape", waist="Flume Belt +1", legs="Arjuna Breeches", feet="Danzo Sune-Ate"}
		
	sets.idle.PDT = {ammo="Staunch Tathlum",
			head="Ynglinga Sallet", neck="Loricate Torque +1", left_ear="Cessance Earring", right_ear="Telos Earring",
			body="Wakido Domaru +3", hands="Kurys Gloves", left_ring="Defending Ring", right_ring="Vocane Ring",
			back="Solemnity Cape", waist="Flume Belt +1", legs="Arjuna Breeches", feet="Hiza. Sune-Ate +1" }
	
	sets.idle.Weak = {}
	
	--------------------------------------
    -- Defense sets
    --------------------------------------
        
    sets.defense.PDT = {ammo="Staunch Tathlum",
			head="Ynglinga Sallet", neck="Loricate Torque +1", left_ear="Cessance Earring", right_ear="Telos Earring",
			body="Wakido Domaru +3", hands="Kurys Gloves", left_ring="Defending Ring", right_ring="Vocane Ring",
			back="Solemnity Cape", waist="Flume Belt +1", legs="Arjuna Breeches", feet=Valorous_feet_PDT }
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {ammo="Staunch Tathlum",
			head="Ynglinga Sallet", neck="Loricate Torque +1", left_ear="Cessance Earring", right_ear="Telos Earring",
			body="Wakido Domaru +3", hands="Kurys Gloves", left_ring="Defending Ring", right_ring="Vocane Ring",
			back="Solemnity Cape", waist="Flume Belt +1", legs="Arjuna Breeches", feet=Valorous_feet_PDT }
		
	sets.defense.MDTNoShell = {ammo="Staunch Tathlum",
			head="Ynglinga Sallet", neck="Loricate Torque +1", left_ear="Cessance Earring", right_ear="Telos Earring",
			body="Wakido Domaru +3", hands="Kurys Gloves", left_ring="Defending Ring", right_ring="Vocane Ring",
			back="Solemnity Cape", waist="Flume Belt +1", legs="Arjuna Breeches", feet=Valorous_feet_PDT }
		
	--------------------------------------
    -- Engaged sets
    --------------------------------------
	-- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
    -- sets.engaged['SAM'][state.CombatWeapon]['Ilvl~118'].DT['H: 820']['Mythic AM3']
	
	-- Haste caps
	-- gear haste = 256 / 1024
	-- magic haste = 448 / 1024
	-- JA haste = 256 / 1024
	-- total haste cap = 820 / 1024
	
	-- baseTP 	= floor(61+[(Delay-180)x 88 /360])
	--			= 127		(450 delay)
	--			= 123		(437 delay)
	
	-- Total_STP		= traits + merits + gifts +  gear 
	--					= 30 + 10 + 8 + 0
	-- TP/WS 	= floor( baseTP × (100 + Total_STP) ÷ 100 )	
	
	-- Weapons

	-- ['Amanomurakumo'] 437 delay Relic
	-- ['Dojikiri Yasutsuna'] 450 delay Aeonic					
	-- ['Masamune'] 437 delay Emperean		
	-- ['Kogarasumaru'] 450 delay Mythic			
	
	-- Basic defined Sets
	-- for any weapon that isnt listed above
	
	sets.engaged 				= 	{
		ammo="Ginsen",
		head="Flamma zucchetto +1",neck="Moonbeam nodowa",ear1="Cessance Earring",ear2="Telos Earring",
		body="Kendatsuba samue",hands=AF_hands,ring1="Niqmaddu ring",ring2="Ilabrat Ring",
		back=Smertrios_DA,waist="Windbuffet belt +1",legs="Kendatsuba hakama",feet=Valorous_feet_STP}
	sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged,				{})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'],	{})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'],	{})
	
	sets.engaged.DT 				= set_combine(sets.engaged,					{
		ammo="Staunch Tathlum",
		head="Ynglinga Sallet",neck="Agitator's Collar",
		body="Wakido Domaru +3",ring1="Defending Ring",ring2="Patricius Ring",
		waist="Ioskeha Belt",legs="Arjuna Breeches",})
	sets.engaged['Ilvl~118'].DT 	= set_combine(sets.engaged.DT,				{})
	sets.engaged['Ilvl~122'].DT		= set_combine(sets.engaged['Ilvl~118'].DT,	{})
	sets.engaged['Ilvl~124+'].DT	= set_combine(sets.engaged['Ilvl~122'].DT,	{})

	
	-- Sets Based per weapon
	------------------------------
	-- 450 delay Weapons
	------------------------------
	
	-- ['Dojikiri Yasutsuna'] Aeonic SETS
	
	-- (Based on WS sets (27 stp), needs 47 stp to 3 hit + ws  ,  and 6 stp to 4 hit + ws)
	sets.engaged['Aeonic'] 					= set_combine(sets.engaged,{
		ammo="Ginsen",
		head="Flamma zucchetto +1",neck="Moonbeam nodowa",ear1="Cessance Earring",ear2="Telos Earring",
		body="Kendatsuba samue",hands=AF_hands,ring1="Niqmaddu ring",ring2="Ilabrat Ring",
		back=Smertrios_DA,waist="Windbuffet belt +1",legs="Kendatsuba hakama",feet=Valorous_feet_STP}) -- 7 stp
	sets.engaged['Aeonic']['Ilvl~118'] 		= set_combine(sets.engaged['Aeonic'],				{})
	sets.engaged['Aeonic']['Ilvl~122'] 		= set_combine(sets.engaged['Aeonic']['Ilvl~118'],	{})
	sets.engaged['Aeonic']['Ilvl~124+'] 	= set_combine(sets.engaged['Aeonic']['Ilvl~122'],	{})	
		
		-- Hybrid Sets
		sets.engaged['Aeonic'].DT 				= set_combine(sets.engaged['Aeonic'],				{
			ammo="Staunch Tathlum",
			head="Ynglinga Sallet",neck="Agitator's Collar",
			body="Wakido Domaru +3",ring1="Defending Ring",ring2="Patricius Ring",
			waist="Ioskeha Belt",legs="Arjuna Breeches",feet=Valorous_feet_PDT})
		sets.engaged['Aeonic']['Ilvl~118'].DT 	= set_combine(sets.engaged['Aeonic'].DT,			{})
		sets.engaged['Aeonic']['Ilvl~122'].DT 	= set_combine(sets.engaged['Aeonic']['Ilvl~118'].DT,{})
		sets.engaged['Aeonic']['Ilvl~124+'].DT 	= set_combine(sets.engaged['Aeonic']['Ilvl~122'].DT,{})		
	
	-- ['Kogarasumaru'] Mythic SETS 
	-- (Based on WS sets (17 stp), needs 57 stp to 3 hit + ws  ,,  and 16 stp to 4 hit + ws)
	sets.engaged['Mythic'] 					= set_combine(sets.engaged,				{
		ammo="Ginsen",
		head="Flamma zucchetto +1",neck="Moonbeam nodowa",ear1="Cessance Earring",ear2="Telos Earring",
		body="Kendatsuba samue",hands=AF_hands,ring1="Niqmaddu ring",ring2="Ilabrat Ring",
		back=Smertrios_STP,waist="Windbuffet belt +1",legs=AF_legs,feet=Valorous_feet_STP})
	sets.engaged['Mythic']['Ilvl~118'] 		= set_combine(sets.engaged,				{})
	sets.engaged['Mythic']['Ilvl~122'] 		= set_combine(sets.engaged['Ilvl~118'],	{})
	sets.engaged['Mythic']['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'],	{})
		
		-- Hybrid Sets
		sets.engaged['Mythic'].DT 				= set_combine(sets.engaged['Mythic'],				{
			ammo="Staunch Tathlum",
			head="Ynglinga Sallet",neck="Agitator's Collar",
			body="Wakido Domaru +3",ring1="Defending Ring",ring2="Patricius Ring",
			waist="Ioskeha Belt",legs="Arjuna Breeches",feet=Valorous_feet_PDT})
		sets.engaged['Mythic']['Ilvl~118'].DT 	= set_combine(sets.engaged['Mythic'].DT,			{})
		sets.engaged['Mythic']['Ilvl~122'].DT 	= set_combine(sets.engaged['Mythic']['Ilvl~118'].DT,{})
		sets.engaged['Mythic']['Ilvl~124+'].DT 	= set_combine(sets.engaged['Mythic']['Ilvl~122'].DT,{})
		
	-- AM3 up sets
	-- Drop DA for more STP / Crit / TA / QA
	sets.engaged['Mythic']['AM3'] 				= set_combine(sets.engaged,						{})
	sets.engaged['Mythic']['Ilvl~118']['AM3']	= set_combine(sets.engaged['AM3'],				{})
	sets.engaged['Mythic']['Ilvl~122']['AM3'] 	= set_combine(sets.engaged['Ilvl~118']['AM3'],	{})
	sets.engaged['Mythic']['Ilvl~124+']['AM3'] 	= set_combine(sets.engaged['Ilvl~122']['AM3'],	{})
	
		-- Hybrid Sets
		sets.engaged['Mythic'].DT['AM3'] 					= set_combine(sets.engaged['Mythic']['AM3'],					{
			ammo="Staunch Tathlum",
			head="Ynglinga Sallet",neck="Agitator's Collar",
			body="Wakido Domaru +3",ring1="Defending Ring",ring2="Patricius Ring",
			waist="Ioskeha Belt",legs="Arjuna Breeches",feet="Hizamaru sune-ate +1"})
		sets.engaged['Mythic']['Ilvl~118'].DT['AM3']		= set_combine(sets.engaged['Mythic'].DT['AM3'],				{})
		sets.engaged['Mythic']['Ilvl~122'].DT['AM3'] 		= set_combine(sets.engaged['Mythic']['Ilvl~118'].DT['AM3'],	{})
		sets.engaged['Mythic']['Ilvl~124+'].DT['AM3'] 		= set_combine(sets.engaged['Mythic']['Ilvl~122'].DT['AM3'],	{})
				
	------------------------------
	-- 437 delay Weapons
	------------------------------
	
	-- ['Masamune'] Emperean SETS
	-- 15 stp for ws + 4hits (69 stp for ws + 3 hits)
	-- ['Emperean'] Emperean SETS
	
	sets.engaged['Emperean'] 					= set_combine(sets.engaged,							{})
	sets.engaged['Emperean']['Ilvl~118'] 		= set_combine(sets.engaged['Emperean'],				{})
	sets.engaged['Emperean']['Ilvl~122'] 		= set_combine(sets.engaged['Emperean']['Ilvl~118'],	{})
	sets.engaged['Emperean']['Ilvl~124+'] 		= set_combine(sets.engaged['Emperean']['Ilvl~122'],	{})
		
		-- Hybrid Sets
		sets.engaged['Emperean'].DT 					= set_combine(sets.engaged['Emperean'],					{
			ammo="Staunch Tathlum",
			head="Ynglinga Sallet",neck="Agitator's Collar",
			body="Wakido Domaru +3",ring1="Defending Ring",ring2="Patricius Ring",
			waist="Ioskeha Belt",legs="Arjuna Breeches",feet="Hizamaru sune-ate +1"})
		sets.engaged['Emperean']['Ilvl~118'].DT 		= set_combine(sets.engaged['Emperean'].DT,				{})
		sets.engaged['Emperean']['Ilvl~122'].DT 		= set_combine(sets.engaged['Emperean']['Ilvl~118'].DT,	{})
		sets.engaged['Emperean']['Ilvl~124+'].DT 		= set_combine(sets.engaged['Emperean']['Ilvl~122'].DT,	{})
			
	------------------------------
	-- Other
	------------------------------
				
	sets.engaged.DW = {}
	sets.engaged.DW['Ilvl~118'] 	= set_combine(sets.engaged.DW,				{})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'],	{})
	sets.engaged.DW['Ilvl~124+']	= set_combine(sets.engaged.DW['Ilvl~122'],	{})
	
	--------------------------------------
    -- Misc. sets
    --------------------------------------
   
	sets.buff.Doom 		= {head="Twilight Helm", body="Twilight Mail", ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
	sets.buff.sleep 	= {neck="Vim torque"}
	sets.Sekkanoki    	= {hands=Empy_hands}
	sets.Meikyo_Shisui 	= {feet=Relic_feet}
	sets.CP 			= {back=CP_Cape}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

    -- Default macro set/book
	set_macro_page(6, 1)
   
end
