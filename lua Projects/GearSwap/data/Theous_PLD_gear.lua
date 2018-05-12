
function init_gear_sets()
	
	print('Theous_PLD_Gear side_cart loaded')	
	
	Carmine_body		={ name="Carm. Scale Mail",augments={'Accuracy+10','DEX+10','MND+15',}}
	Carmine_legs_HQ     ={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	Carmine_hands_HQ    ={ name="Carmine Fin. Ga. +1", augments={'Accuracy+12','DEX+12','MND+20',}}
	
	Souveran_legs_HQ		={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
    Souveran_feet_HQ		={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
    Souveran_head_HQ        ={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
    Souveran_hands_HQ       ={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}
    
	--head							={ name="Despair Helm", augments={'STR+12','VIT+7','Haste+2%',}}
	
	Valorous_head_acc		={ name="Valorous Mask", augments={'"Dbl.Atk."+2','Accuracy+11','Attack+14',}}
	--head							={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','Crit.hit rate+4','VIT+4','Attack+13',}}
	
	Eschite_legs			={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}}
	Eschite_feet			={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}}
    
	Odyss_hands			={ name="Odyssean Gauntlets", augments={'Attack+10','"Dbl.Atk."+3','VIT+1','Accuracy+13',}}
    Odyss_hands_acc		={ name="Odyssean Gauntlets", augments={'Accuracy+28','Enmity+2','STR+7','Attack+9',}}
	Odyss_legs			={ name="Odyssean Cuisses", augments={'Accuracy+22','"Dbl.Atk."+3','Attack+15',}}
	Odyss_legs_acc		={ name="Odyssean Cuisses", augments={'Accuracy+21 Attack+21','"Cure" potency +2%','STR+8','Accuracy+9','Attack+12',}}
	
	Enmity_back			={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+10 Attack+10','Enmity+10',}}
	FC_back				={ name="Rudianos's Mantle", augments={'"Fast Cast"+10',}}
	Weard_back			={ name="Weard Mantle", augments={'VIT+2','DEX+2','Enmity+4','Phalanx +4',}}
                                                        
	Relic_head				={ name="Caballarius Coronet +1", 	augments={'Enhances "Iron Will" effect',}}
	Relic_body				={ name="Caballarius Surcoat +1", augments={'Enhances "Fealty" effect',}}
    Relic_hands			={ name="Caballarius Gauntlets +1", augments={'Enhances "Chivalry" effect',}}
	Relic_legs				={ name="Caballarius Breeches +1", augments={'Enhances "Invincible" effect',}}
	Relic_feet				={ name="Caballarius Leggings +1", augments={'Enhances "Guardian" effect',}}
	
	AF_head 				={ name="Reverence Coronet +1" }
	AF_body				={ name="Reverence Surcoat +1" }
	AF_hands 			={ name="Reverence Gauntlets +1" }
	AF_legs 				={ name="Reverence Breeches +1" }
	AF_feet 				={ name="Reverence Leggings +1" }
		
	-- Empy_head 			={ name="Chevalier's Armet" }
	-- Empy_body			={ name="Chevalier's Cuirass" }
	-- Empy_hands			={ name="Chevalier's Gauntlets +1" }
	-- Empy_legs 			={ name="Chevalier's Cuisses +1" }
	-- Empy_feet 			={ name="Chevalier's Sabatons" }
	
	CP_back={ name="Mecisto. Mantle", augments={'Cap. Point+50%','AGI+1','Rng.Acc.+2','DEF+10',}}	
		
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
	sets.precast.Enmity = { ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Moonbeam Necklace",ear1="Friomisi Earring",ear2="Merman's Earring",
		body=AF_body,hands=Relic_hands,ring1="Apeile Ring",ring2="Apeile Ring +1",
		back=Enmity_back,waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Eschite_feet}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = 		set_combine(sets.precast.Enmity,{legs=Relic_legs})
    sets.precast.JA['Holy Circle'] = 		set_combine(sets.precast.Enmity,{feet=AF_feet})
    sets.precast.JA['Shield Bash'] = 		set_combine(sets.precast.Enmity,{ear1="Knightly Earring",hands=Relic_hands})
    sets.precast.JA['Sentinel'] = 			set_combine(sets.precast.Enmity,{feet=Relic_feet})
    sets.precast.JA['Fealty'] = 			set_combine(sets.precast.Enmity,{body=Relic_body})
    sets.precast.JA['Divine Emblem'] = 		set_combine(sets.precast.Enmity,{feet=Empy_feet})
    sets.precast.JA['Cover'] = 				set_combine(sets.precast.Enmity,{head=AF_head, body=Relic_body})
	sets.precast.JA['Intervene'] = 			set_combine(sets.precast.Enmity,{})	
		-- sub WAR JA
	sets.precast.JA['Provoke'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Berserk'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Defender'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Warcry'] = 			set_combine(sets.precast.Enmity,{})
	sets.precast.JA['Agressor'] = 			set_combine(sets.precast.Enmity,{})

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = set_combine(sets.precast.Enmity,{
		ear1="Nourish. Earring +1",ear2="Static Earring",
		body="Cohort Cloak +1",hands="Despair Fin. Gaunt.",
		legs="Despair Cuisses",feet="Thereoid Greaves"})
	-- add VIT for Rampart
	sets.precast.JA['Rampart'] = set_combine(sets.precast.Enmity,{
		ammo="Brigantia Pebble",
        head=Relic_head,
        body="Sulevia's Plate.",hands=Odyss_hands_acc,ring1="Petrov Ring",
        back=Weard_back,waist="Flume Belt +1",legs="Flamma Dirs +1",feet=Eschite_feet})	
	
    -- Fast cast sets for spells
    -- range={name='Gjallarhorn',priority = 16}
    sets.precast.FC = {
		back=FC_back,ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		legs=Eschite_legs,ring1="Kishar Ring",ring2="Weatherspoon Ring"}	
		
	sets.precast.FC.HighHP 					= set_combine(sets.precast.FC,{})	
	sets.precast.FC.DT							= set_combine(sets.precast.FC,{})	
    sets.precast.FC['Enhancing Magic'] 	= set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Cure 						= set_combine(sets.precast.FC, {})
	-- These sets are used for dropping your HP before casting when on full HP
    sets.precast.FC.cureCheatFour 			= set_combine(sets.precast.FC,{})
	sets.precast.FC.cureCheatThree 		= set_combine(sets.precast.FC,{})
		
		
	------------------------------------------------------------  WS SETS ---------------------------------------------------------------------------

	sets.precast.MaxTP = {ear1="Brutal Earring",ear2="Ishvara Earring",}
	
	-- Default set for any weaponskill that isn't any more specifically defined
		sets.precast.WS = {ammo="Ginsen",
		head="Sulevia's mask +1",neck="Homeric Gorget",ear1="Mache Earring",ear2="Ishvara Earring",
		body="Sulevia's platemail +1",hands=Odyss_hands_acc,ring1="Petrov Ring",ring2="Rajas Ring",
		back=Enmity_back,waist="Kentarch Belt",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Atonement'] 					= set_combine(sets.precast.WS,sets.precast.Enmity)
	
	sets.precast.WS['Requiescat'] 					= set_combine(sets.precast.WS, {})
	sets.precast.WS['Requiescat'].Acc 			= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Chant du Cygne'] 			= set_combine(sets.precast.WS, {ammo="Jukukik Feather"})
	sets.precast.WS['Chant du Cygne'].Acc 	= set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Exenterator'] 					= set_combine(sets.precast.WS, {})

	sets.precast.WS['Aeolian Edge'] 				= set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Savage Blade']				= set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Sanguine Blade'] 			= set_combine(sets.precast.WS, {})
	
		
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = set_combine(sets.midcast.FC, {})
	
	-- 102% spell interuption = cap
	sets.SIRD = {}
		
	sets.midcast.FastRecast.SIRD = set_combine(sets.midcast.FastRecast, sets.SIRD)
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
        
    sets.midcast.Enmity = set_combine(sets.precast.Enmity, {})
	
	sets.midcast['Blue Magic'] 			= set_combine(sets.precast.Enmity, {})
	sets.midcast['Blue Magic'].SIRD 	= set_combine(sets.precast.Enmity, sets.SIRD)
	sets.midcast['Cocoon'] 				= sets.midcast.FastRecast.SIRD
	sets.midcast['Refueling'] 				= sets.midcast.FastRecast.SIRD

    sets.midcast.Flash 						= set_combine(sets.midcast.Enmity, {})
    sets.midcast.Stun 						= sets.midcast.Flash
    
    sets.midcast.Cure 						= set_combine(sets.precast.Enmity,  {neck="Diemer Gorget",ear1="Nourishing Earring +1",ear2="Mendicant's Earring",legs=Odyss_legs_acc})
	sets.midcast.Cure.SIRD 				= set_combine(sets.midcast.Cure, sets.SIRD)

	sets.midcast.CureSelf 					= set_combine(sets.midcast.Cure, {head=Souveran_head_HQ,waist="Chuq'aba belt",ear2="Oneiros Earring",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ} )
	sets.midcast.CureSelf.SIRD 			= set_combine(sets.midcast.CureSelf, sets.SIRD)

    sets.midcast['Enhancing magic'] 			= set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Enhancing magic'].SIRD 	= set_combine(sets.midcast['Enhancing magic'], sets.SIRD)
	sets.midcast['Phalanx'] 						= set_combine(sets.midcast['Enhancing magic'], {hands=Souveran_hands_HQ,back=Weard_back,feet=Souveran_feet_HQ})
	sets.midcast['Phalanx'] .SIRD 				= set_combine(sets.midcast['Phalanx'], sets.SIRD)
	
	sets.midcast['Reprisal'] = set_combine(sets.midcast.FastRecast, {
		ammo="Staunch Tathlum",
		head="Flam. Zucchetto +1",neck="Bathy Choker",ear1="Grit Earring",ear2="Oneiros Earring",
		body=AF_body,hands=AF_hands,ring1="Prolix Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ})
	sets.midcast['Reprisal'].SIRD = set_combine(sets.midcast['Reprisal'], sets.SIRD)
		
	sets.midcast['Divine magic'] 		= set_combine(sets.midcast.FastRecast, {body=AF_body,hands=Eschite_hands,waist="Asklepian Belt"})
	sets.midcast['Enlight'] 				= sets.midcast['Divine magic']
	sets.midcast['Enlight'].SIRD 		= set_combine(sets.midcast['Enlight'], sets.SIRD)
	sets.midcast['Enlight II'] 			= sets.midcast['Divine magic']
	sets.midcast['Enlight II'].SIRD 	= set_combine(sets.midcast['Enlight II'], sets.SIRD)
	
    sets.midcast['Diaga'] 				= set_combine(sets.midcast.Enmity)
	
    sets.midcast['Protect'] 				= set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
	sets.midcast['Protect'].SIRD 		= set_combine(sets.midcast['Protect'], sets.SIRD)
    sets.midcast['Shell'] 					= set_combine(sets.midcast.FastRecast, {ring1="Sheltered Ring"})
	sets.midcast['Shell'].SIRD 			= set_combine(sets.midcast['Shell'], sets.SIRD)
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise 	= {} --{head="Twilight Helm",body="Twilight Mail"}
	sets.Refresh 	= {neck="Coatl Gorget +1"}
	sets.Kiting 	= {legs=Carmine_legs_HQ}
    sets.resting 	= set_combine(sets.Refresh, {})
    

    -- Idle sets
	sets.idle = {ammo="Homiliary",
		head=AF_head,neck="Coatl Gorget +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands="Redan Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Carmine_legs_HQ,feet=Souveran_feet_HQ}
		
	sets.idle.PDT = {ammo="Brigantia Pebble",
		head=AF_head,neck="Coatl Gorget +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands="Redan Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
	
	sets.idle.Weak = {ammo="Brigantia Pebble",
		head=AF_head,neck="Coatl Gorget +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands="Redan Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
    
    sets.idle.Weak.Reraise 	= set_combine(sets.idle.PDT, sets.Reraise)
	sets.idle.Reraise 		= set_combine(sets.idle.PDT, sets.Reraise)
	sets.idle.Refresh 		= set_combine(sets.idle.PDT, sets.Refresh)
    sets.latent_refresh 	= {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Resist_Death 	= {ammo="Staunch Tathlum",}
	sets.Resist_Terror 	= {ammo="Staunch Tathlum",}
	sets.Resist_Charm 	= {ammo="Staunch Tathlum",legs=Souveran_legs_HQ}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield 	= {sub="Aegis"} -- Aegis
	sets.TurtleShield 	= {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Coatl Gorget +1",ear1="Merman's Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands_HQ,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Coatl Gorget +1",ear1="Merman's Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands_HQ,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
		
	sets.defense.MDTNoShell = {
		ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Coatl Gorget +1",ear1="Merman's Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands_HQ,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
	
	sets.defense.Turtle = {
		ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Coatl Gorget +1",ear1="Merman's Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands_HQ,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
		
	sets.defense.Reraise = {
		ammo="Staunch Tathlum",
		head=Souveran_head_HQ,neck="Coatl Gorget +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
		body=AF_body,hands=Souveran_hands_HQ,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {ammo="Staunch Tathlum",
		head="Sulevia's Mask +1",neck="Homeric Gorget",ear1="Mache Earring",ear2="Brutal Earring",
		body="Sulevia's Platemail +1",hands="Sulevia's Gauntlets +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Sulevia's Cuisses +1",feet="Sulevia's leggings +1"}
	
	sets.engaged.Acc = set_combine(sets.engaged,{ammo="Ginsen",
		head="Sulevia's Mask +1",neck="Asperity Necklace",ear1="Mache Earring",ear2="Brutal Earring",
		body="Sulevia's Platemail +1",hands="Sulevia's Gauntlets +1",ring1="Petrov Ring",ring2="Moonbeam Ring",
		back="Atheling Mantle",waist="Kentarch Belt",legs="Sulevia's Cuisses +1",feet="Flam. Gambieras +1"})
	
    sets.engaged.DW = {ammo="Staunch Tathlum",
		head="Sulevia's Mask +1",neck="Homeric Gorget",ear1="Mache Earring",ear2="Brutal Earring",
		body="Sulevia's Platemail +1",hands="Sulevia's Gauntlets +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{ammo="Ginsen",neck="Subtlety Spectacles"})

    sets.engaged.PDT = {ammo="Staunch Tathlum",
		head=AF_head,neck="Homeric Gorget",ear1="Mache Earring",ear2="Brutal Earring",
		body=AF_body,hands=AF_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs=Souveran_legs_HQ,feet=Souveran_feet_HQ}
	
    sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT,{})

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {})


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom 		= {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Cover 		= {body=Relic_body}
	sets.buff.Sentinel		= {feet=Relic_feet}
	sets.buff.Reive 			= {neck="Ygnas's Resolve +1"}
	sets.CP 					= {back=CP_back}
			
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	
    -- send_command('bind ^` input /ja "sentinel" <me>')
	-- send_command('bind !` input /ma "Shield Bash" <t>')
	-- send_command('bind @` input /ma "Rampart" <me>')
	
	-- send_command('bind F7 input /ma "flash" <stnpc>')
	
	-- send_command('bind F8 input /ws "Atonement" <t>')
	-- send_command('bind ^F8 input /ws "Requiescat" <t>')
	-- send_command('bind @F8 input /ws "Savage Blade" <t>')
	
	-- send_command('bind F9 input /ma "Phalanx" <me>')
	-- send_command('bind ^F9 input /ma "Crusade" <me>')
	-- send_command('bind @F9 input /ma "Reprisal" <me>')
	
	-- send_command('bind F10 input /ma "cure 3" <stal>')
	-- send_command('bind F11 input /ma "cure 4" <stal>')
	
	-- if player.sub_job:upper() == 'WAR' then	
	
		-- send_command('bind ^F7 input /ja "provoke" <stnpc>')
		
	-- elseif player.sub_job:upper() == 'DNC' then
		
		-- send_command('bind F7 input /ja "Box step" <stnpc>')
		-- send_command('bind F8 input /ja "Violent flourish" <stnpc>')
		-- send_command('bind ^F8 input /ja "Drain Samba II" <me>')
		-- send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		-- send_command('bind ^F9 input /ja "Haste Samba" <me>')
		-- send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		-- send_command('bind ^F11 input /ja "Divine Waltz" <me>')
		
	-- elseif player.sub_job:upper() == 'BLU' then
		
		-- send_command('bind ^F7 input /ma "Blank Gaze" <stnpc>')
		-- send_command('bind @F7 input /ma "Geist Wall" <stnpc>')
		-- send_command('bind !F7 input /ma "Jettatura" <stnpc>')
		
		-- send_command('bind ^F10 input /ma "Cocoon" <me>')
		-- send_command('bind @F10 input /ma "Refueling" <me>')
	
	-- elseif player.sub_job:upper() == 'RDM' then
		
	-- end
	
	set_macro_page(4, 9)
end
