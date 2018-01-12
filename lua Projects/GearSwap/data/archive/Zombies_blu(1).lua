-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC","MaxACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	target_distance = 5 -- Set Default Distance Here --
	include('organizer-lib')
	organizer_items = {
		echos="Echo Drops",
		remedy="Remedy",
		Panacea="Panacea",
		Tizona="Tizona",
		Nibiru="Nibiru Blade",
		Sublime="Sublime Sushi",
		almace="Almace",
		sequence="Sequence"}
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="ChantduCygne", SC2="Berserk", SC3="HeadButt"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	PhysicalBlueMagic = S{
			'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite',
			'Queasyshroom','Power Attack','Ram Charge','Screwdriver','Sickle Slash',
			'Smite of Rage','Spinal Cleave','Spiral Spin','Terror Touch'}

	PhysicalBlueMagic_STR = S{
			'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
			'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
			'Whirl of Rage','Glutinous Dart','Sweeping Gouge','Sinker Drill'}

	PhysicalBlueMagic_DEX = S{
			'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
			'Vanity Dive'}

	PhysicalBlueMagic_VIT = S{
			'Cannonball','Delta Thrust','Grand Slam','Quad. Continuum',
			'Sprout Smack'}

	PhysicalBlueMagic_AGI = S{
			'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
			'Wild Oats'}

	MagicalBlueMagic = S{
			'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
			'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
			'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse',
			'Searing Tempest','Blinding Fulgor','Spectral Floe','Scouring Spate',
			'Anvil Lightning','Silent Storm','Entomb','Tenebral Crush','Subduction'}

	BlueMagic_Accuracy = S{
			'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
			'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
			'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
			'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
			'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
			'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
			'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
			'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn','Water Bomb','Absolute Terror',}

	BlueMagic_Breath = S{
			'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath',
			'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
			'Wind Breath'}

	BlueMagic_Buff = S{
			'Barrier Tusk','Carcharian Verve','Diamondhide','Metallic Body','Magic Barrier',
			"Occultation",'Orcish Counterstance','Nature\'s Meditation','Plasma Charge',
			'Pyric Bulwark','Reactor Cool','Erratic Flutter','Mighty Guard'}

	BlueMagic_Diffusion = S{
			'Amplification','Cocoon','Exuviation','Feather Barrier','Harden Shell','Memento Mori',
			'Metallic Body','Plasma Charge','Reactor Cool','Refueling','Saline Coat','Warm-Up',
			'Zephyr Mantle'}

	BlueMagic_Healing = S{
			'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','White Wind',
			'Wild Carrot'}

	BlueMagic_Stun = S{
			'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
			'Thunderbolt','Whirl of Rage'}

	BlueMagic_Unbridled = S{
			'Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
			'Droning Whirlwind','Gates of Hades','Harden Shell','Pyric Bulwark','Thunderbolt',
			'Tourbillion'}

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			ammo="Vanir Battery",
			head="Rawhide Mask",
			neck="Twilight Torque",
			ear1="Infused Earring",
			ear2="Genmei Earring",
			body="Vrikodara Jupon",
			hands={ name="Herculean Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','MND+13','"Refresh"+1','Accuracy+9 Attack+9','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			ring1="Sheltered Ring",
			ring2="Defending Ring",
			back="Kumbira Cape",
			waist="Flume Belt",
			legs="Carmine Cuisses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+18','Damage taken-3%',}},}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{})
	sets.Resting = set_combine(sets.Idle.Regen)

	-- TP Sets --
	sets.TP = {
    		ammo="Ginsen",
   			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
    		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    		hands="Adhemar Wristbands",
    		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    		feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+4','Attack+5',}},
    		neck="Asperity Necklace",
    		waist="Reiki Yotai",
    		left_ear="Eabani Earring",
    		right_ear="Suppanomimi",
    		left_ring="Epona's Ring",
    		right_ring="Petrov Ring",
    		back="Bleating Mantle",}
	sets.TP.MidACC = set_combine(sets.TP,{
			ammo="Falcon Eye",
			head="Taeon Chapeau",
			neck="Combatant's Torque",
			back="Rosmerta's Cape"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			head="Carmine Mask +1",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1"})
	sets.TP.MaxACC = set_combine(sets.TP.HighACC,{
			ear1="Zennaroi Earring",
			ear2="Cessance Earring",
			legs="Carmine Cuisses +1",
			waist="Olseni Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+2','DEX+7','Attack+15',}},})
			
	-- March x2 or Mighty Guard --
	sets.TP.MidHaste = {
			ammo="Ginsen",
   			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
    		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    		hands="Adhemar Wristbands",
    		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    		feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+4','Attack+5',}},
    		neck="Asperity Necklace",
    		waist="Windbuffet Belt +1",
    		left_ear="Brutal Earring",
   		    right_ear="Cessance Earring",
    		left_ring="Epona's Ring",
    		right_ring="Petrov Ring",
    		back="Bleating Mantle",}
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{
			ammo="Falcon Eye",
			neck="Combatant's Torque",
			back="Rosmerta's Cape"})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{    		
			head="Taeon Chapeau",
			ear1="Zennaroi Earring",
			ring2="Ramuh Ring +1",
			waist="Grunfeld Rope"})
	sets.TP.MaxACC.MidHaste = set_combine(sets.TP.HighACC.MidHaste,{    		
			head="Carmine Mask +1",
			ring1="Ramuh Ring +1",
			back="Rosmerta's Cape",
			waist="Olseni Belt",
			legs="Carmine Cuisses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+2','DEX+7','Attack+15',}},})
	

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+24','Damage taken-3%','AGI+1',}},
			neck="Twilight Torque",
			ear1="Ethereal Earring",
			ear2="Suppanomimi",
			body="Emet Harness +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Vocane Ring",
			ring2="Defending Ring",
			back="Xucau Mantle",
			waist="Flume Belt",
			legs="Herculean Trousers",
			feet={ name="Herculean Boots", augments={'Accuracy+18','Damage taken-3%',}},}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Vanir Battery",
			head="Hashishin Kavuk +1",
			ear1="Sanare Earring",
			ear2="Merman's Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Shadow Ring",
			back="Engulfer cape +1",
			legs="Hashishin Tayt +1",
			feet="Amalric Nails"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
	sets.TP.Hybrid.MaxACC = set_combine(sets.TP.Hybrid.HighACC,{})
				
	-- WS Base Set --
	sets.WS = {
			ammo="Falcon Eye",
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			body="Adhemar Jacket",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Vespid Mantle",
			waist="Fotia Belt",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +4%','STR+10',}},}

	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Falcon Eye",
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			body="Abnoba Kaftan",
			hands="Adhemar Wristbands",
			ring1="Epona's Ring",
			ring2="Ramuh Ring +1",
			back="Rosmerta's Cape",
			waist="Fotia Belt",
			legs="Samnuha Tights",
            feet="Thereoid Greaves"}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			ear1="Zennaroi Earring",
			ring1="Ramuh Ring +1",
			back="Grounded Mantle +1",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+2','DEX+7','Attack+15',}},})
	sets.WS["Chant du Cygne"].MaxACC = set_combine(sets.WS["Chant du Cygne"].HighACC,{
			head="Carmine Mask +1",
			neck="Combatant's Torque",
			ear1="Zennaroi Earring",
			body="Adhemar Jacket",
			waist="Grunfeld Rope",
			legs="Carmine Cuisses +1"})
			
	sets.WS.Requiescat = {
			ammo="Ginsen",
			head="Hashishin Kavuk +1",
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			body="Adhemar Jacket",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Epona's Ring",
			ring2="Rufescent Ring",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs="Carmine Cuisses +1",
			feet="Carmine Greaves"}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{
			ammo="Falcon Eye"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			back="Grounded Mantle +1"})
	sets.WS.Requiescat.MaxACC = set_combine(sets.WS.Requiescat.HighACC,{})
			
			sets.WS.Expiacion = {
			ammo="Falcon Eye",
			head="Lilitu Headpiece",
			neck="Caro Necklace",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			body="Adhemar Jacket",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Vespid Mantle",
			waist="Grunfeld Rope",
			legs="Samnuha Tights",
            feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +4%','STR+10',}},}
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion,{})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{
			neck="Fotia Gorget",
			ring2="Ramuh Ring +1",
			waist="Fotia Belt"})
	sets.WS.Expiacion.MaxACC = set_combine(sets.WS.Expiacion.HighACC,{})
			
			sets.WS["Savage Blade"] = {
			ammo="Falcon Eye",
			head="Lilitu Headpiece",
			neck="Caro Necklace",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			body="Abnoba Kaftan",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Vespid Mantle",
			waist="Grunfeld Rope",
			legs="Samnuha Tights",
            feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +4%','STR+10',}},}
    sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"],{
			head={ name="Taeon Chapeau", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','STR+6 DEX+6',}},})
    sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			neck="Fotia Gorget",
			ring2="Ramuh Ring +1",
			waist="Fotia Belt"})
	sets.WS["Savage Blade"].MaxACC = set_combine(sets.WS.Expiacion.HighACC,{})
			
	sets.WS["Sanguine Blade"] = {
			ammo="Pemphredo Tathlum",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Archon Ring",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Amalric Nails"}
			
	sets.WS["Flash Nova"] = {
			ammo="Pemphredo Tathlum",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Store TP"+1','INT+6','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Sortiarius Earring",
			ear2="Friomisi Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Amalric Nails"}
	
	sets.WS["Red Lotus Blade"] = {
			ammo="Pemphredo Tathlum",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Store TP"+1','INT+6','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Moonshade Earring",
			ear2="Friomisi Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Amalric Nails"}
	
	
	-- JA Sets --
	sets.JA = {}
	sets.JA['Azure Lore'] = {}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
            head="Carmine Mask +1",
            neck="Orunmila's Torque",
            ear1="Loquac. Earring",
			ear2="Enchanter Earring +1",
			body="Dread Jupon",
            hands="Leyline Gloves",
            ring1="Prolix Ring",
            ring2="Defending Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Enif Cosciales",
			feet="Carmine Greaves"}

	sets.Precast["Blue Magic"] = {
			ammo="Impatiens",
            head="Carmine Mask +1",
            neck="Orunmila's Torque",
            ear1="Loquac. Earring",
			ear2="Enchanter Earring +1",
			body="Hashishin Mintan +1",
            hands="Leyline Gloves",
            ring1="Prolix Ring",
            ring2="Defending Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Enif Cosciales",
			feet="Carmine Greaves"}
			
	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

	-- Enhancing Magic Base Set --
	sets.Midcast['Enhancing Magic'] = {}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- For Cure Spells & The Listed Healing Blue Magic --
	sets.Midcast.Cure = {
			ammo="Impatiens",
    		head="Carmine Mask",
    		body="Vrikodara Jupon",
    		hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+3%',}},
   			legs="Carmine Cuisses +1",
    		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    		neck="Phalaina Locket",
    		left_ear="Mendi. Earring",
    		left_ring="Levia. Ring +1",
    		right_ring="Rufescent Ring",
    		back="Tempered Cape +1"}

	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
    		left_ring="Vocane Ring",
    		right_ring="Kunaji Ring",
			waist="Gishdubar Sash"})

	-- For The Listed Physical Type Blue Magic --
	sets.Midcast.PhysicalBlueMagic = {
			ammo="Falcon Eye",
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Caro Necklace",
			ear1="Vulcan's Pearl",
			ear2="Vulcan's Pearl",
			body="Adhemar Jacket",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','STR+9',}},
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Cornflower Cape",
			waist="Grunfeld Rope",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +4%','STR+10',}},}

	-- Blue Magic STR Set --
	sets.Midcast.PhysicalBlueMagic_STR = set_combine(sets.Midcast.PhysicalBlueMagic,{})

	-- Blue Magic STR/DEX Set --
	sets.Midcast.PhysicalBlueMagic_DEX = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ear1="Jupiter's Pearl",
			ear2="Jupiter's Pearl",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1"})

	-- Blue Magic STR/VIT Set --
	sets.Midcast.PhysicalBlueMagic_VIT = set_combine(sets.Midcast.PhysicalBlueMagic,{})

	-- Blue Magic STR/AGI Set --
	sets.Midcast.PhysicalBlueMagic_AGI = set_combine(sets.Midcast.PhysicalBlueMagic,{})

	-- For The Listed Magical Type Blue Magic --
	sets.Midcast.MagicalBlueMagic = {
			ammo="Pemphredo Tathlum",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Store TP"+1','INT+6','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Sortiarius Earring",
			ear2="Friomisi Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Amalric Nails"}

	-- Magic Accuracy For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Accuracy = {
			ammo="Mavi Tathlum",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Store TP"+1','INT+6','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Gwati Earring",
			ear2="Hermetic Earring",
			body="Amalric Doublet",
			hands="Rawhide Gloves",
			ring1="Shiva Ring +1",
			ring2="Sangoma Ring",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Psycloth Lappas",
			feet="Hashishin Basmak +1"}

	-- Stun Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Stun = set_combine(sets.Midcast.BlueMagic_Accuracy,{
			ammo="Falcon Eye",
			head="Carmine Mask +1",
			neck="Sanctity Necklace",
			ear1="Gwati Earring",
			ear2="Steelflash Earring",
			body="Samnuha Coat",
			hands="Rawhide Gloves",
			ring1="Ramuh Ring +1",
			ring2="Sangoma Ring",
			back="Cornflower Cape",
			waist="Olseni Belt",
			legs="Psycloth Lappas",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+2','DEX+7','Attack+15',}},})

	-- Buff Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Buff = {
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			body="Assim. Jubbah +1",
			hands="Rawhide Gloves",
			back="Cornflower Cape",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"}

	-- Breath Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Breath = {}

	-- BlueMagic Base Set For Any Non Listed Blue Magic --
	sets.Midcast['Blue Magic'] = {}

	-- Tenebral Crush --
	sets.Midcast['Tenebral Crush'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			head="Pixie Hairpin +1",
			ring1="Archon Ring"})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif BlueMagic_Unbridled:contains(spell.english) and not buffactive['Unbridled Learning'] then
		if windower.ffxi.get_ability_recasts()[81] < 1 and not buffactive.amnesia and not buffactive.charm then -- Auto Use Unbridled Learning When You Cast One of The Unbridled Spells.
			cancel_spell()
			send_command('input /ja "Unbridled Learning" <me>;wait 1.5;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
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
			if spell.english == "Chant du Cygne" and player.tp > 2990 then
				equipSet = set_combine(equipSet,{ear2="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
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
		elseif (string.find(spell.english,'Cur') or BlueMagic_Healing:contains(spell.english)) and spell.english ~= "Cursna" then
            if spell.english:startswith('Cure') or BlueMagic_Healing:contains(spell.english) then
                 if spell.target.name == player.name then
                equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{})
			end
		elseif PhysicalBlueMagic:contains(spell.english) or PhysicalBlueMagic_STR:contains(spell.english) or PhysicalBlueMagic_DEX:contains(spell.english) or PhysicalBlueMagic_VIT:contains(spell.english) or PhysicalBlueMagic_AGI:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_STR
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_DEX
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_VIT
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_AGI
			elseif PhysicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic
			end
			if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,{head="Hashishin Kavuk +1"})
			end
			if buffactive.Efflux then
				equipSet = set_combine(equipSet,{legs="Hashishin Tayt +1"})
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Charged Whisker" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Charged Whisker" then
				equipSet = equipSet[spell.name]
			end
			if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet,{head="Hashishin Basmak +1"})
			end
			if buffactive.Convergence then
				equipSet = set_combine(equipSet,{head="Luhlaza Keffiyeh +1"})
			end
		elseif BlueMagic_Accuracy:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Accuracy
		elseif BlueMagic_Stun:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Stun
		elseif BlueMagic_Buff:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Buff
		elseif BlueMagic_Diffusion:contains(spell.english) and buffactive.Diffusion then
			equipSet = set_combine(equipSet,{feet="Luhlaza Charuqs +1"})
		elseif BlueMagic_Breath:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Breath
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
		if (buffactive.March == 2) or buffactive['Mighty Guard'] or (buffactive[580]) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
	equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
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

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 2)
	elseif player.sub_job == 'WHM' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'DNC' then
		set_macro_page(9, 2)
	elseif player.sub_job == 'BLM' then
		set_macro_page(10, 2)
	else
		set_macro_page(1, 2)
	end
end