-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/05/14 12:00 AM *Fixed Magic Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	target_distance = 5 -- Set Default Distance Here --
	include('organizer-lib')
	organizer_items = {
		echos="Echo Drops",
		remedy="Remedy",
		Panacea="Panacea",
		Nibiru="Nibiru Blade",
		Tizona="Tizona",
		Sequence="Sequence"}
		
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
			'Whirl of Rage','Glutinous Dart','Sweeping Gouge'}

	PhysicalBlueMagic_DEX = S{
			'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
			'Vanity Dive'}

	PhysicalBlueMagic_VIT = S{
			'Cannonball','Delta Thrust','Grand Slam','Quad. Continuum',
			'Sprout Smack','Sinker Drill'}

	PhysicalBlueMagic_AGI = S{
			'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
			'Wild Oats'}

	MagicalBlueMagic = S{
			'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
			'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
			'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb',
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
			'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'}

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
			'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
			'Droning Whirlwind','Gates of Hades','Harden Shell','Pyric Bulwark','Thunderbolt',
			'Tourbillion'}

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			ammo="Ginsen",
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			ear1="Sanare Earring",
			ear2="Moonshade Earring",
			body="Adhemar jacket",
			hands="Umuthi Gloves",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Solemnity Cape",
			waist="Flume Belt +1",
			legs="Carmine Cuisses +1",
			feet="Battlecast Gaiters"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{})
	sets.Resting = set_combine(sets.Idle.Regen)

	-- TP Sets --
	sets.TP = {
			ammo="Ginsen",
			head="Adhemar Bonnet",
			neck="Asperity Necklace",
			ear1="Eabani Earring",
			ear2="Suppanomimi",
			body="Adhemar Jacket",
			hands="Adhemar Wristbands",
			ring1="Epona's Ring",
			ring2="Petrov Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Samnuha Tights", 
			feet="Taeon Boots"}
	sets.TP.MidACC = set_combine(sets.TP,{
			ammo="Falcon Eye",
			body="Adhemar Jacket", 
			back="Rosmerta's Cape"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			neck="Iqabi Necklace",
			ear1="Zennaroi Earring",
			ear2="Telos Earring",
			legs="Carmine Cuisses +1",
			ring2="Ramuh Ring +1",
			waist="Anguinus Belt",
			back="Rosmerta's Cape"})

			
	-- March x2 --
	sets.TP.HighHaste =  set_combine(sets.TP,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Falcon Eye",
			head="Lithelimb Cap",
			neck="Loricate Torque +1",
			ear1="Heartseeker Earring",
			ear2="Dudgeon Earring",
			body="Emet Harness +1",
			hands="Umuthi Gloves",
			ring1="Patricius Ring",
			ring2="Defending Ring",
			back="Mollusca Mantle",
			waist="Flume Belt +1",
			legs="Qaaxo Tights",
			feet="Qaaxo Leggings"}

	sets.MDT = set_combine(sets.PDT,{
			ear2="Sanare Earring",
			ring1="Dark Ring"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Falcon Eye",
			head="Adhemar Bonnet",  
			neck="Fotia Gorget",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Adhemar Jacket", 
			hands="Adhemar wristbands", 
			ring1="Epona's Ring",
			ring2="Begrudging Ring",
			back="Rosmerta's Cape",
			waist="Fotia Belt",
			legs="Samnuha Tights", 
            feet="Taeon Boots"}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			ammo="Falcon Eye",
			Ring2="Ramuh Ring +1",
			head="Whirlpool Mask",
			back="Letalis Mantle",})

			
	sets.WS.Requiescat = {
			ammo="Ginsen",
			head="Hashishin Kavuk +1",
			neck="Fotia Gorget",
			lear="Steelflash Earring",
			rear="Bladeborn Earring",
			body="Adhemar Jacket", 			
			hands="Adhemar Wristbands", 
			lring="Epona's Ring",
			ring2="Levia. Ring",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs="Quiahuiz Leggings",
			feet="Taeon Boots"}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{
			ammo="Falcon Eye"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			back="Letalis Mantle"})
			
	sets.WS["Sanguine Blade"] = {
			ammo="Pemphredo Tathlum",
			head="Pixie Hairpin +1",
			neck="Eddy Necklace",
			ear1="Friomisi Earring",
			ear2="Crematio Earring",
			body="Amalric Doublet",
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Helios Boots"}
			
	sets.WS["Flash Nova"] = {
			head="Helios Band",
			neck="Eddy Necklace",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body="Samnuha Coat",
			hands="Helios Gloves",
			ring1="Weatherspoon Ring",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Aswang Sash",
			legs="Hagondes Pants +1",
			feet="Hashishin Basmak +1"}
	
	sets.WS.Expiacion = {
			ammo="Falcon Eye",
			head="Adhemar Bonnet", 
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			body="Adhemar Jacket",
			hands="Taeon Gloves",
			ring1="Epona's Ring",
			ring2="Ifrit Ring +1",
			back="Buquwik Cape",
			waist="Fotia Belt",
			legs="Samnuha Tights",
            feet="Taeon Boots",}
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion,{
			back="Letalis Mantle"})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{
			ammo="Pemphredo Tathlum",
			ring2="Ramuh Ring +1"})
	
	-- JA Sets --
	sets.JA = {}
	sets.JA['Azure Lore'] = {}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
            head="Haruspex Hat +1",
            neck="Orunmila's Torque",
            ear1="Loquac. Earring",
			ear2="Enchanter Earring +1",
			body="Dread Jupon",
            hands="Leyline Gloves",
            ring1="Weatherspoon Ring",
            ring2="Prolix Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Enif Cosciales",
			feet="Chelona Boots"}

	sets.Precast["Blue Magic"] = {
			ammo="Impatiens",
            head="Haruspex Hat +1",
            neck="Orunmila's Torque",
            ear1="Loquac. Earring",
			ear2="Enchanter Earring +1",
			body="Hashishin Mintan +1",
            hands="Leyline Gloves",
            ring1="Weatherspoon Ring",
            ring2="Prolix Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Enif Cosciales",
			feet="Chelona Boots"}
			
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
			waist="Gishdubar Sash",
			Neck="Phalaina Locket",
			Ring1="Levia. Ring",
			Feet="Medium's Sabots",
			Ring2="Lebeche Ring",
			Back="Solemnity Cape",
			Earring1="Mendi. Earring"}

	-- For The Listed Physical Type Blue Magic --
	sets.Midcast.PhysicalBlueMagic = {
			ammo="Mavi Tathlum",
			head="Adhemar Bonnet", 
			neck="Caro Necklace",
			ear1="Vulcan's Pearl",
			ear2="Vulcan's Pearl",
			body="Adhemar Jacket",
			hands="Adhemar Wristbands",  
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Cornflower Cape",
			waist="Prosilio Belt +1",
			legs="Samnuha Tights",
			feet="Taeon Boots"}

	-- Blue Magic STR Set --
	sets.Midcast.PhysicalBlueMagic_STR = set_combine(sets.Midcast.PhysicalBlueMagic,{})

	-- Blue Magic STR/DEX Set --
	sets.Midcast.PhysicalBlueMagic_DEX = set_combine(sets.Midcast.PhysicalBlueMagic,{
			neck="Shifting Necklace +1",
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
			head="Helios band",
			neck="Eddy Necklace",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body="Amalric Doublet",
			hands="Amalric gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs="Amalric Slops",
			feet="Helios boots"}

	-- Magic Accuracy For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Accuracy = {
			ammo="Mavi Tathlum",
			head="Helios Band",
			neck="Eddy Necklace",
			ear1="Gwati Earring",
			ear2="Hermetic Earring",
			body="Amalric Doublet",
			hands="Leyline Gloves",
			ring1="Weatherspoon Ring",
			ring2="Sangoma Ring",
			back="Cornflower Cape",
			waist="Yamabuki-no-obi",
			legs="Amalric Slops",
			feet="Hashishin Baskmak +1"}

	-- Stun Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Stun = set_combine(sets.Midcast.BlueMagic_Accuracy,{
			ammo="Pemphredo Tathlum",
			head="Dampening Tam",
			neck="Eddy Necklace",
			ear1="Gwati Earring",
			ear2="Hermetic Earring",
			body="Hashishin Mintan +1",
			hands="Leyline Gloves",
			ring1="Weatherspoon Ring",
			ring2="Sangoma Ring",
			back="Cornflower Cape",
			waist="Yamabuki-no-obi",
			legs="Amalric Slops",
			feet="Taeon Boots"})

	-- Buff Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Buff = {
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			body="Assim. Jubbah +1",
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
			if string.find(spell.english,'Cure') or BlueMagic_Healing:contains(spell.english) then
				equipSet = equipSet.Cure
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape"})
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
		if buffactive.March == 2 and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
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
		set_macro_page(1, 11)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1,11)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 11)
	else
		set_macro_page(1, 11)
	end
end