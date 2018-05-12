 
function init_gear_sets()
		
	print('Uae_BRD_Gear.lua sidecar loaded')  
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	Kali_mac = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}
	
	AF_head 			={ name="Brioso Roundlet +1" }
	AF_body			={ name="Brioso Justaucorps +2" }
	AF_hands 		={ name="Brioso Cuffs +2" }
	--AF_legs 			={ name="Brioso Cannions +2" }
	AF_feet 			={ name="Brioso Slippers +2" }
	
	Relic_head			={ name="Bihu Roundlet +1", augments={'Enhances "Foe Sirvente" effect',}}
	Relic_body			={ name="Bihu Justaucorps", augments={'Enhances "Troubadour" effect',}}
	--Relic_hands			={ name="Bihu Cuffs", augments={'Enh. "Adventurer\'s Dirge" effect',}}
	Relic_legs				={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}}	
	--Relic_feet				={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}}
	
	Empy_head 			={ name="Fili Calot" }
	Empy_body			={ name="Fili Hongreline" }
	Empy_hands			={ name="Fili Manchettes" }
	Empy_legs 			={ name="Fili Rhingrave" }
	Empy_feet 			={ name="Fili Cothurnes" }
	
	FC_back				={ name="Intarabus's Cape", augments={'CHR+20','"Fast Cast"+10',}}
	
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
	
    -- Precast Sets
	
	-- Precast sets to enhance JAs    	
	
    sets.precast.JA.Nightingale = {} --{feet=Relic_feet}
    sets.precast.JA.Troubadour = {body=Relic_body}
    sets.precast.JA['Soul Voice'] = {legs=Relic_legs}

    -- Fast cast sets for spells
    sets.precast.FC = { 
		main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
		head=Relic_head, neck="", ear1="", ear2="Loquac. Earring", 
		body="Inyanga Jubbah", hands="Gende. Gages +1", ring1="Prolix Ring", ring2="", 
		back=FC_back, waist="Witful Belt", legs="Ayanmo Cosciales", feet="Rostrum Pumps", }
	
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {neck="Aoidos' Matinee", ear1="Aoidos' Earring", feet="Telchine Pigaches",})
		
	
	sets.precast.FC.BardSong['Honor March'] = set_combine(sets.precast.FC.BardSong, {range={name='Marsyas',priority = 16},})
	
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
		

    sets.precast.FC.Daurdabla = {range={name='Terpander',priority = 16},}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = { 
		head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Brutal Earring", ear2="Matanki Earring", 
		body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Rajas Ring", ring2="Ayanmo Ring", 
		back="Bleating Mantle", waist="Velocious Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
   
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, { })

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{})

	sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {})
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {
		main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
		head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Loquac. Earring", ear2="Matanki Earring", 
		body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Prolix Ring", ring2="Ayanmo Ring", 
		back=FC_back, waist="Witful Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
				
	sets.midcast['Enfeebling'] = { 
		main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
		head="Inyanga Tiara +1", neck="Moonbow Whistle", ear1="Loquac. Earring", ear2="Desamilion Earring", 
		body=AF_body, hands="Brioso Cuffs +2", ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
		back="Altruistic Cape", waist="Refoccilation Stone", legs="Inyanga Shalwar +2", feet="Brioso Slippers +2", }
		
	sets.midcast['Dia'] 	= set_combine(sets.midcast['Enfeebling Magic'], {})	
				
	sets.midcast.SongRecast =  set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast['Buff'] 								= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=Empy_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}
	sets.midcast['Buff']['Paeon']	 					= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}
	sets.midcast['Buff']['Honor March']					= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Marsyas',priority = 16},
															head=Empy_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}												
	sets.midcast['Buff']['Extra Length']				= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=Empy_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Extra Length']['Paeon']		= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Extra Length']['Honor March']	= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Marsyas',priority = 16},
															head=Empy_head,neck="Moonbow Whistle",ear1="Loquac. Earring",ear2="",
															body=Empy_body,hands=Empy_hands,ring1="Prolix Ring",ring2="",
															back=FC_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Buff']['Etude']						= sets.midcast['Buff']['Extra Length']
	sets.midcast['Buff']['Extra Length']['Etude']		= sets.midcast['Buff']['Extra Length']
	sets.midcast['Debuff'] 								= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=Empy_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet=AF_feet}								
	sets.midcast['Debuff'].Resistant					= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=AF_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs=AF_legs,feet=AF_feet}
	sets.midcast['Debuff']['F-Lullaby']  				= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=Empy_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet=AF_feet}
	sets.midcast['Debuff']['F-Lullaby'] .Resistant		= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=AF_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs=AF_legs,feet=AF_feet}
	sets.midcast['Debuff']['H-Lullaby']  				= {main=Kali_mac,sub={name="Genbu's Shield",priority = -1},range={name='Gjallarhorn',priority = 16}, -- range={name='Nibiru Harp',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=Empy_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet=AF_feet}	
	sets.midcast['Debuff']['H-Lullaby'] .Resistant		= {main="Grioavolr",sub={name="Clerisy Strap",priority = -1},range={name='Gjallarhorn',priority = 16},
															head=AF_head,neck="Moonbow Whistle",ear1="Musical Earring", ear2="Desamilion Earring", 
															body=AF_body,hands=AF_hands,ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
															back=FC_back,waist="Refoccilation Stone",legs=AF_legs,feet=AF_feet}
     
    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast['Dummy'] = {
							main=Kali_mac, sub="Genbu's Shield", range="Terpander", ammo="", 
							head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Loquac. Earring", ear2="Matanki Earring", 
							body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Prolix Ring", ring2="Ayanmo Ring", 
							back=FC_back, waist="Witful Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
    -- Other general spells and classes.
   sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {})
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Cure day / weather'] = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
        
    sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +1"})

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
    
	-- no skill bassed buffs
    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {range="Oneiros Harp",legs="Assiduity Pants +1"})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = { 
			main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
			head=Relic_head, neck="Yarak Torque", ear1="Ethereal Earring", ear2="Matanki Earring", 
			body=Relic_body, hands="Brioso Cuffs +2", ring1="Jelly Ring", ring2="Ayanmo Ring", 
			back="Boxer's Mantle", waist="Witful Belt", legs="Assiduity Pants +1", feet="Aya. Gambieras +1",}
			
	sets.idle.PDT = {
			main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
			head=Relic_head, neck="Yarak Torque", ear1="Ethereal Earring", ear2="Matanki Earring", 
			body=Relic_body, hands="Brioso Cuffs +2", ring1="Jelly Ring", ring2="Ayanmo Ring", 
			back="Boxer's Mantle", waist="Witful Belt", legs=Relic_legs	, feet="Aya. Gambieras +1", }
   
	sets.idle.Weak = {
			main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
			head=Relic_head, neck="Yarak Torque", ear1="Ethereal Earring", ear2="Matanki Earring", 
			body=Relic_body, hands="Brioso Cuffs +2", ring1="Jelly Ring", ring2="Ayanmo Ring", 
			back="Boxer's Mantle", waist="Witful Belt", legs=Relic_legs	, feet="Aya. Gambieras +1", }
   
   
	-- Defense sets

	sets.defense.PDT = { 
			main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
			head=Relic_head, neck="Yarak Torque", ear1="Ethereal Earring", ear2="Matanki Earring", 
			body=Relic_body, hands="Brioso Cuffs +2", ring1="Jelly Ring", ring2="Ayanmo Ring", 
			back="Boxer's Mantle", waist="Witful Belt", legs=Relic_legs	, feet="Aya. Gambieras +1", }

	sets.defense.MDT = {
			main=Kali_mac, sub="Genbu's Shield", range="Gjallarhorn", ammo="", 
			head="Inyanga Tiara +1", neck="Moonbow Whistle", ear1="Ethereal Earring", ear2="Desamilion Earring", 
			body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Shiva Ring +1", ring2="Ayanmo Ring", 
			back="Reiki Cloak", waist="Witful Belt", legs="Inyanga Shalwar +2", feet="Aya. Gambieras +1", }

	sets.Kiting = {feet=Empy_feet}
	sets.CP = {back=""}
	sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
			head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Brutal Earring", ear2="Matanki Earring", 
			body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Rajas Ring", ring2="Ayanmo Ring", 
			back="Bleating Mantle", waist="Velocious Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
			
	sets.engaged.Acc = {
			head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Brutal Earring", ear2="Matanki Earring", 
			body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Rajas Ring", ring2="Ayanmo Ring", 
			back="Bleating Mantle", waist="Velocious Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
	
	sets.engaged.DW = {
			head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Brutal Earring", ear2="Matanki Earring", 
			body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Rajas Ring", ring2="Ayanmo Ring", 
			back="Bleating Mantle", waist="Velocious Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
			
	sets.engaged.DW.Acc = {
			head="Aya. Zucchetto +1", neck="Subtlety Spec.", ear1="Brutal Earring", ear2="Matanki Earring", 
			body="Inyanga Jubbah", hands="Brioso Cuffs +2", ring1="Rajas Ring", ring2="Ayanmo Ring", 
			back="Bleating Mantle", waist="Velocious Belt", legs="Ayanmo Cosciales", feet="Aya. Gambieras +1", }
			
	sets.buff.Reive = {neck=""}
	sets.warp = {ring2='Warp Ring'}
	
	sets.Locked_Main_Sub = {main=Kali_mac,sub="Genbu's Shield"}
	sets.Locked_Main_Sub_DW = {main="",sub=""}
		
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 8)
	
	
end
 