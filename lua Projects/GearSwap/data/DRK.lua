-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--require('functions')
-- Initialization function for this job file.
include('Make-Settings.lua')
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')

end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	state.Buff.doom = buffactive.doom or false
	state.Buff.Souleater = buffactive.souleater or false
    state.Buff['Last Resort'] = buffactive['Last Resort'] or false
	
	state.Buff["Aftermath: Lv.1"] = buffactive["Aftermath: Lv.1"] or false
	state.Buff["Aftermath: Lv.2"] = buffactive["Aftermath: Lv.2"] or false
	state.Buff["Aftermath: Lv.3"] = buffactive["Aftermath: Lv.3"] or false
	
	include('Organizer-lib.lua')
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT', 'MDTNoShell')
	
	state.CP  						= M(false, 'CP')
	state.PhysicalDefense   = M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	state.Auto_Kite  			= M(false, 'Auto_Kite')
	
	-- key bind 
	send_command('bind f12 gs c update user')
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind @f12 gs c toggle kiting')
	
	send_command('bind ^F11 gs c cycle CP')
	
	send_command('bind [ gs c toggle PhysicalDefense')
	send_command('bind @[ gs c cycle HybridMode')
	send_command('bind ^[ gs c cycle OffenseMode')
	
	send_command('bind ] gs c toggle MagicalDefense')
	
	-- lists for various things
	Ring_lock = S{"Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring"}
	Tele_Ring = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)"}
	Ear_lock = S{"Reraise Earring"}
	Bar_Status = S{'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barsilencra','Barvira','Barpetra','Baramnesra',
						'Barsleep','Barpoison','Barparalyze','Barblind','Barsilence','Barvirus','Barpetrify','Baramnesia'}
	
	send_command('gi ugs true')
	
	-- defaults, DO NOT ALTER 
	Haste = 0
	DW_needed = 0
	DW = false
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	send_command('gi update')
    select_default_macro_book()
	update_combat_form()
	determine_haste_group()
	
	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	initialize(text_box)
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Set up gear sets.

function init_gear_sets()                                                       	
	
	-----------------------------------------------
	-- Section for Augments and JSE gear
	-----------------------------------------------
	
	-- method to parse correct augments.
	------------------------------------
	-- equip the desired gear in game with gearswap loaded
	-- type //gs export, or in the console just gs export
	-- go to ur windower folder -> addons -> gearswap -> data -> export
	-- open the file and copy the desire item to here
	-- eg -> legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+9%','"Mag.Atk.Bns."+15',}},
	
	-- make sure you remove the comma from the end and also give your item a new name
	-- eg -> Merl_legs_Burst ={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+9%','"Mag.Atk.Bns."+15',}}
	
	-- now you can use that item in your sets, remember this is a variable so it does not need to be surrounded by quotes
	-- eg. -> legs = Merl_legs_Burst
	-- you can rename any item in the game like this as you will see below with the addition to AF, Relic and Emperean to easily change them after upgrade
	-- all you need to do is change the item discription
	-- eg. -> from    	:   AF_body ={ name="Ignominy Cuirass" }
	-- to ->			:	AF_body	={ name="Ignominy Cuirass +3" }
	
	
	Lustratio_head		={ name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}}
	Lustratio_body		={ name="Lustr. Harness +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}}
	Lustratio_feet		={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}}
	
	Carmine_legs		={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}
	
	Argosy_head			={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}}  -- 7 stp
	Argosy_body			={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}}  -- 6 stp
	Argosy_hands		={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}}  -- 6 stp
	Argosy_legs			={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}}	-- 6 stp
	Argosy_feet			={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}  -- 5 stp
	Argosy_feet_STP		={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}  -- 10 stp
	
	Valorous_head		={ name="Valorous Mask", augments={'Accuracy+21','Weapon skill damage +4%','STR+10',}}
	Valorous_body		={ name="Valorous Mail", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+5','Accuracy+11','Attack+2',}} -- 3 stp
	Valorous_hands		={ name="Valorous Mitts", augments={'Accuracy+25 Attack+25','Weapon Skill Acc.+4','STR+8','Accuracy+10','Attack+4',}}
	Valorous_feet		={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+3','VIT+6','Accuracy+15',}}  -- 5stp
	
	Odyssean_hands		={ name="Odyssean Gauntlets", augments={'Accuracy+21 Attack+21','STR+12','Accuracy+13','Attack+15',}}
	Odyssean_legs		={ name="Odyssean Cuisses", augments={'Accuracy+18 Attack+18','"Dbl.Atk."+4','CHR+4','Accuracy+9','Attack+15',}} -- 5 stp
	
	Niht_back			={ name="Niht Mantle", augments={'Attack+14','Dark magic skill +7','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}}
	WS_back_reso		={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}
	WSD_back_STR		={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	DA_back_STR			={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+7','"Dbl.Atk."+10',}}
	DA_back_DEX			={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	
	CP_Cape				={ name="Mecisto. Mantle", augments={'Cap. Point+48%','HP+28','"Mag.Atk.Bns."+1','DEF+4',}}
	
	AF_head 			={ name="Ignominy Burgonet +2" }
	AF_body				={ name="Ignominy Cuirass +3" }
	AF_hands 			={ name="Ignominy Gauntlets +2" }
	AF_legs 			={ name="Ignominy Flanchard +2" }
	AF_feet 			={ name="Ignominy Sollerets +2" }
	
	Relic_head			={ name="Fallen's Burgeonet +1", 		augments={'Enhances "Dark Seal" effect',}}
	Relic_body			={ name="Fallen's Cuirass +1", 			augments={'Enhances "Blood Weapon" effect',}}
    Relic_hands			={ name="Fallen's Finger Gauntlets +1",	augments={'Enhances "Diabolic Eye" effect',}}
	Relic_legs			={ name="Fallen's Flanchard +1", 		augments={'Enhances "Muted Soul" effect',}}
	Relic_feet			={ name="Fallen's Sollerets +1", 		augments={'Enhances "Desperate Blows" effect',}}
		
	Empy_head 			={ name="Heathen's Burgonet +1" }
	Empy_body			={ name="Heathen's Cuirass +1" }
	Empy_hands			={ name="Heathen's Gauntlets +1" }
	Empy_legs 			={ name="Heathen's Flanchard +1" }
	Empy_feet 			={ name="Heathen's Sollerets +1" }
	
	Moonshade_Ear ={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}} 
	
	gear.TP_Bonus_Ear = Moonshade_Ear
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Diabolic Eye'] = {hands=Relic_hands}
    sets.precast.JA['Nether Void']  = {legs=Empy_legs}
    sets.precast.JA['Dark Seal']    = {head=Relic_head}
    sets.precast.JA['Souleater']    = {head=AF_head}
    sets.precast.JA['Blood Weapon'] = {body=Relic_body}
    sets.precast.JA['Last Resort']  = {back=DA_back_DEX}
	
	-- Fast cast sets for spells
	sets.precast.FC = {}
	
	-- ideal set
	-- sets.precast.FC = {
		-- head = "Carmine Mask + 1 (Path D)", neck = "Voltsurge Torque", ear1 = "Enchanter's earring +1", ear2 = "Loquatious earring",
		-- Body = "Odyssean Chestplate (FC + 7 augment)", hands = "Leyline gloves (perfect)" , ring1 = "rahab ring", ring2 = "Kishar ring",
		-- back = "ambuscade cape with 10%", waist = "none", legs = " Odyssean Cuisses (7%FC)", feet = "Odyssean greaves (7% aug)"}
		
		--  **********  Other options include ****************
		-- ring = "prolix ring"
		-- legs = "Enif legs"
		-- head = "Odyssean  Helm (7% FC)" or "NQ Carmine mask (path D)"
		-- earring = "Eitiolation earring"
		-- hands =  "Odyssean Gauntlets (7 fc aug)"
	
	-- WS sets
	-- global set that works for any WS that isn't defined below by name
	sets.precast.WS = {ammo="Knobkierrie",
			head=Valorous_head,neck="Fotia Gorget",ear1="Bale Earring",ear2=Moonshade_Ear,
			body=AF_body,hands=Argosy_hands,ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",     -- 6stp
			back=WS_back,waist="Fotia Belt",legs=AF_legs,feet="Sulev. Leggings +1"}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	--												Greatsword WS
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 73-85% STR
	sets.precast.WS['Resolution'] 					= set_combine(sets.precast.WS, {
			ammo="Seeth. Bomblet +1",
			head=Lustratio_head,neck="Fotia Gorget",ear1="Bale Earring",ear2=Moonshade_Ear,
			body=Argosy_body,hands=Argosy_hands,ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",   -- 23 STP
			back=WS_back_reso,waist="Fotia Belt",legs=Argosy_legs,feet=Argosy_feet})
    sets.precast.WS['Resolution']['Ilvl~118'] 		= set_combine(sets.precast.WS['Resolution'], {})
	sets.precast.WS['Resolution']['Ilvl~122'] 		= set_combine(sets.precast.WS['Resolution']['Ilvl~118'], {})
	sets.precast.WS['Resolution']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Resolution']['Ilvl~122'], {})

	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- VIT 80%
	sets.precast.WS['Torcleaver'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Torcleaver']['Ilvl~118'] 		= set_combine(sets.precast.WS['Torcleaver'], {})
	sets.precast.WS['Torcleaver']['Ilvl~122'] 		= set_combine(sets.precast.WS['Torcleaver']['Ilvl~118'], {})
	sets.precast.WS['Torcleaver']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Torcleaver']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- STR 40% VIT 40%
	sets.precast.WS['Scourge'] 						= set_combine(sets.precast.WS, {
			ammo="Knobkierrie",
			head=Valorous_head,neck="Fotia Gorget",ear1="Bale Earring",ear2=Moonshade_Ear,
			body=AF_body,hands=Argosy_hands,ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",   -- 6stp
			back=WSD_back_STR,waist="Fotia Belt",legs=AF_legs,feet="Sulev. Leggings +1"})
    sets.precast.WS['Scourge']['Ilvl~118'] 			= set_combine(sets.precast.WS['Scourge'], {})
	sets.precast.WS['Scourge']['Ilvl~122'] 			= set_combine(sets.precast.WS['Scourge']['Ilvl~118'], {})
	sets.precast.WS['Scourge']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Scourge']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	--												SCYTHE WS
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 20% STR / 20% INT 
	sets.precast.WS['Insurgency'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Insurgency']['Ilvl~118'] 		= set_combine(sets.precast.WS['Insurgency'], {})
	sets.precast.WS['Insurgency']['Ilvl~122'] 		= set_combine(sets.precast.WS['Insurgency']['Ilvl~118'], {})
	sets.precast.WS['Insurgency']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Insurgency']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 
	sets.precast.WS['Catastrophe'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Catastrophe']['Ilvl~118'] 		= set_combine(sets.precast.WS['Catastrophe'], {})
	sets.precast.WS['Catastrophe']['Ilvl~122'] 		= set_combine(sets.precast.WS['Catastrophe']['Ilvl~118'], {})
	sets.precast.WS['Catastrophe']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Catastrophe']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 60% STR / 60% MND
	sets.precast.WS['Cross Reaper'] 				= set_combine(sets.precast.WS, {})
    sets.precast.WS['Cross Reaper']['Ilvl~118'] 	= set_combine(sets.precast.WS['Cross Reaper'], {})
	sets.precast.WS['Cross Reaper']['Ilvl~122'] 	= set_combine(sets.precast.WS['Cross Reaper']['Ilvl~118'], {})
	sets.precast.WS['Cross Reaper']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Cross Reaper']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 86-100% INT
	sets.precast.WS['Entropy'] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Entropy']['Ilvl~118'] 			= set_combine(sets.precast.WS['Entropy'], {})
	sets.precast.WS['Entropy']['Ilvl~122'] 			= set_combine(sets.precast.WS['Entropy']['Ilvl~118'], {})
	sets.precast.WS['Entropy']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Entropy']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 60% STR / MND
	sets.precast.WS['Quietus'] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Quietus']['Ilvl~118'] 			= set_combine(sets.precast.WS['Quietus'], {})
	sets.precast.WS['Quietus']['Ilvl~122'] 			= set_combine(sets.precast.WS['Quietus']['Ilvl~118'], {})
	sets.precast.WS['Quietus']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Quietus']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 50% STR / 50% INT 
	sets.precast.WS['Spiral Hell'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Spiral Hell']['Ilvl~118'] 		= set_combine(sets.precast.WS['Spiral Hell'], {})
	sets.precast.WS['Spiral Hell']['Ilvl~122'] 		= set_combine(sets.precast.WS['Spiral Hell']['Ilvl~118'], {})
	sets.precast.WS['Spiral Hell']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Spiral Hell']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 40% STR 40% INT - Darkness Elemental
	sets.precast.WS['Shadow of Death'] 				= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shadow of Death']['Ilvl~118'] 	= set_combine(sets.precast.WS['Shadow of Death'], {})
	sets.precast.WS['Shadow of Death']['Ilvl~122'] 	= set_combine(sets.precast.WS['Shadow of Death']['Ilvl~118'], {})
	sets.precast.WS['Shadow of Death']['Ilvl~124+'] = set_combine(sets.precast.WS['Shadow of Death']['Ilvl~122'], {})
	
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 40% STR 40% INT - Darkness Elemental
	sets.precast.WS['Dark Harvest'] 				= set_combine(sets.precast.WS, {})
    sets.precast.WS['Dark Harvest']['Ilvl~118'] 	= set_combine(sets.precast.WS['Dark Harvest'], {})
	sets.precast.WS['Dark Harvest']['Ilvl~122'] 	= set_combine(sets.precast.WS['Dark Harvest']['Ilvl~118'], {})
	sets.precast.WS['Dark Harvest']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Dark Harvest']['Ilvl~122'], {})
	
	--------------------------------------
    -- Midcast sets
    --------------------------------------
	
	--fast recast, Cap haste at 25% then ram in as much FC as possible for recast (FC is halved when calculated for recast)
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
	
	sets.midcast.Drain = set_combine(sets.midcast.FastRecast, {ammo="Knobkierrie",
			head=Empty,neck="Incanter's Torque",ear1="Bale Earring",ear2="Abyssal Earring",
			body="Lugra Cloak +1",hands=Relic_hands,ring1="Excelsis Ring",ring2="Evanescence Ring",
			back=Niht_back,waist="Austerity Belt +1",legs=Empy_legs,feet="Flam. Gambieras +1"})
			
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb'] = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast['Endark'] = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Endark II'] = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast.FastRecast, {})
	
	--------------------------------------
    -- Idle sets
    --------------------------------------
	
	sets.Refresh 	= {}
	sets.Kiting 	= {legs=Carmine_legs}
    sets.resting 	= set_combine(sets.Refresh, {})
	
	sets.idle = {}
		
	sets.idle.PDT = {}
	
	sets.idle.Weak = {}
    
	sets.idle.Refresh 		= set_combine(sets.idle.PDT, sets.Refresh)
    sets.latent_refresh 	= {waist="Fucho-no-obi"}
	
	--------------------------------------
    -- Defense sets
    --------------------------------------
        
    sets.defense.PDT = {}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.MDT = {}
		
	sets.defense.MDTNoShell = {}
		
	--------------------------------------
    -- Engaged sets
    --------------------------------------
	-- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
    -- sets.engaged['SAM'][state.CombatWeapon]['Ilvl~118'].DT['H: 820']['Mythic AM3']
	
	-- baseTP = floor(61+[(Delay-180)ร—88รท360])
	-- Weapons
	-- Greatswords
	-- ['Ragnarok'] 431 delay Relic           
	-- ['Caladbolg'] 430 delay Emperean
	-- combine to ['Greatsword']				
	-- Scythes
	-- ['Apocalypse'] 513 delay Relic					
	-- ['Redemption'] 502 delay Emperean		
	-- ['Liberator'] 528 delay Mythic			
	
	-- Basic defined Sets
	-- for any weapon that isnt listed above
	
	sets.engaged 				= 	{ammo="Ginsen",
									head=Argosy_head,neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
									body=Valorous_body,hands="Sulev. Gauntlets +1",ring1="Chirich Ring",ring2="Chirich Ring",
									back=DA_back_DEX,waist="Ioskeha Belt",legs=AF_legs,feet=Valorous_feet}
	sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged,				{})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'],	{})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'],	{})
	
	-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
	-- only need 12% Gear haste (when Last Resort is up)
	sets.engaged['H: 908+'] 				= set_combine(sets.engaged,							{})
	sets.engaged['Ilvl~118']['H: 908+']		= set_combine(sets.engaged['H: 908+'],				{})
	sets.engaged['Ilvl~122']['H: 908+'] 	= set_combine(sets.engaged['Ilvl~118']['H: 908+'],	{})
	sets.engaged['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['Ilvl~122']['H: 908+'],	{})
	
	-- Sub SAM sets
	sets.engaged['SAM'] 				= set_combine(sets.engaged,						{})
	sets.engaged['SAM']['Ilvl~118'] 	= set_combine(sets.engaged['SAM'],				{})
	sets.engaged['SAM']['Ilvl~122'] 	= set_combine(sets.engaged['SAM']['Ilvl~118'],	{})
	sets.engaged['SAM']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Ilvl~122'],	{})
	
	-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
	-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
	sets.engaged['SAM']['H: 820'] 					= set_combine(sets.engaged['SAM'],							{})
	sets.engaged['SAM']['Ilvl~118']['H: 820']		= set_combine(sets.engaged['SAM']['H: 820'],				{})
	sets.engaged['SAM']['Ilvl~122']['H: 820'] 		= set_combine(sets.engaged['SAM']['Ilvl~118']['H: 820'],	{})
	sets.engaged['SAM']['Ilvl~124+']['H: 820'] 		= set_combine(sets.engaged['SAM']['Ilvl~122']['H: 820'],	{})
	-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
	sets.engaged['SAM']['H: 856'] 					= set_combine(sets.engaged['SAM'],							{})
	sets.engaged['SAM']['Ilvl~118']['H: 856']		= set_combine(sets.engaged['SAM']['H: 856'],				{})
	sets.engaged['SAM']['Ilvl~122']['H: 856'] 		= set_combine(sets.engaged['SAM']['Ilvl~118']['H: 856'],	{})
	sets.engaged['SAM']['Ilvl~124+']['H: 856'] 		= set_combine(sets.engaged['SAM']['Ilvl~122']['H: 856'],	{})
	-- only need 12% Gear haste (when Last Resort is up)
	sets.engaged['SAM']['H: 908+'] 					= set_combine(sets.engaged['SAM'],							{})
	sets.engaged['SAM']['Ilvl~118']['H: 908+']		= set_combine(sets.engaged['SAM']['H: 908+'],				{})
	sets.engaged['SAM']['Ilvl~122']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Ilvl~118']['H: 908+'],	{})
	sets.engaged['SAM']['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['SAM']['Ilvl~122']['H: 908+'],	{})
	
	-- Sets Based per weapon
	------------------------------
	-- Greatsword SETS for both relic and emperyan 430 delay
	
	-- (Based on WS sets, needs 79 stp to 4 hit + ws  ,,  and 44 stp to 5 hit + ws)
	sets.engaged['Greatsword'] 					= set_combine(sets.engaged,								{})
	sets.engaged['Greatsword']['Ilvl~118'] 		= set_combine(sets.engaged['Greatsword'],				{})
	sets.engaged['Greatsword']['Ilvl~122'] 		= set_combine(sets.engaged['Greatsword']['Ilvl~118'],	{})
	sets.engaged['Greatsword']['Ilvl~124+'] 	= set_combine(sets.engaged['Greatsword']['Ilvl~122'],	{})
	
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['Greatsword']['H: 908+'] 				= set_combine(sets.engaged['Greatsword'],							{})
			sets.engaged['Greatsword']['Ilvl~118']['H: 908+']	= set_combine(sets.engaged['Greatsword']['H: 908+'],				{})
			sets.engaged['Greatsword']['Ilvl~122']['H: 908+'] 	= set_combine(sets.engaged['Greatsword']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['Greatsword']['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['Greatsword']['Ilvl~122']['H: 908+'],	{})
			
		-- Sub SAM sets  (Based on WS sets, needs 61 stp to 4 hit + ws)
		sets.engaged['SAM']['Greatsword'] 				= set_combine(sets.engaged['SAM']['Greatsword'],				{})
		sets.engaged['SAM']['Greatsword']['Ilvl~118'] 	= set_combine(sets.engaged['SAM']['Greatsword'],				{})
		sets.engaged['SAM']['Greatsword']['Ilvl~122'] 	= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~118'],	{})
		sets.engaged['SAM']['Greatsword']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~122'],	{})
			
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
			sets.engaged['SAM']['Greatsword']['H: 820'] 					= set_combine(sets.engaged['SAM']['Greatsword'],						{})
			sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 820']			= set_combine(sets.engaged['SAM']['Greatsword']['H: 820'],				{})
			sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 820'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 820'],	{})
			sets.engaged['SAM']['Greatsword']['Ilvl~124+']['H: 820'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 820'],	{})
			-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
			sets.engaged['SAM']['Greatsword']['H: 856'] 					= set_combine(sets.engaged['SAM']['Greatsword'],						{})
			sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 856']			= set_combine(sets.engaged['SAM']['Greatsword']['H: 856'],				{})
			sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 856'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 856'],	{})
			sets.engaged['SAM']['Greatsword']['Ilvl~124+']['H: 856'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 856'],	{})
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['SAM']['Greatsword']['H: 908+'] 					= set_combine(sets.engaged['SAM']['Greatsword'],						{})
			sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 908+']		= set_combine(sets.engaged['SAM']['Greatsword']['H: 908+'],				{})
			sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['SAM']['Greatsword']['Ilvl~124+']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Greatsword']['Ilvl~122']['H: 908+'],	{})
	
	-- ['Apocalypse'] SETS
	
	sets.engaged['Apocalypse'] 					= set_combine(sets.engaged,								{})
	sets.engaged['Apocalypse']['Ilvl~118'] 		= set_combine(sets.engaged['Apocalypse'],				{})
	sets.engaged['Apocalypse']['Ilvl~122'] 		= set_combine(sets.engaged['Apocalypse']['Ilvl~118'],	{})
	sets.engaged['Apocalypse']['Ilvl~124+'] 	= set_combine(sets.engaged['Apocalypse']['Ilvl~122'],	{})
	
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['Apocalypse']['H: 908+'] 				= set_combine(sets.engaged['Apocalypse'],							{})
			sets.engaged['Apocalypse']['Ilvl~118']['H: 908+']	= set_combine(sets.engaged['Apocalypse']['H: 908+'],				{})
			sets.engaged['Apocalypse']['Ilvl~122']['H: 908+'] 	= set_combine(sets.engaged['Apocalypse']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['Apocalypse']['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['Apocalypse']['Ilvl~122']['H: 908+'],	{})
			
			-- Sub SAM sets
			sets.engaged['SAM']['Apocalypse']				= set_combine(sets.engaged['SAM']['Apocalypse'],				{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~118'] 	= set_combine(sets.engaged['SAM']['Apocalypse'],				{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~122'] 	= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~118'],	{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~122'],	{})
			
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
			sets.engaged['SAM']['Apocalypse']['H: 820'] 					= set_combine(sets.engaged['SAM']['Apocalypse'],						{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 820']			= set_combine(sets.engaged['SAM']['Apocalypse']['H: 820'],				{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 820'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 820'],	{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~124+']['H: 820'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 820'],	{})
			-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
			sets.engaged['SAM']['Apocalypse']['H: 856'] 					= set_combine(sets.engaged['SAM']['Apocalypse'],						{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 856']			= set_combine(sets.engaged['SAM']['Apocalypse']['H: 856'],				{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 856'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 856'],	{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~124+']['H: 856'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 856'],	{})
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['SAM']['Apocalypse']['H: 908+'] 					= set_combine(sets.engaged['SAM']['Apocalypse'],						{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 908+']		= set_combine(sets.engaged['SAM']['Apocalypse']['H: 908+'],				{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['SAM']['Apocalypse']['Ilvl~124+']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Apocalypse']['Ilvl~122']['H: 908+'],	{})
	
	-- ['Redemption'] SETS
	
	sets.engaged['Redemption'] 					= set_combine(sets.engaged,				{})
	sets.engaged['Redemption']['Ilvl~118'] 		= set_combine(sets.engaged,				{})
	sets.engaged['Redemption']['Ilvl~122'] 		= set_combine(sets.engaged['Ilvl~118'],	{})
	sets.engaged['Redemption']['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'],	{})
	
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['Redemption']['H: 908+'] 				= set_combine(sets.engaged['Redemption'],							{})
			sets.engaged['Redemption']['Ilvl~118']['H: 908+']	= set_combine(sets.engaged['Redemption']['H: 908+'],				{})
			sets.engaged['Redemption']['Ilvl~122']['H: 908+'] 	= set_combine(sets.engaged['Redemption']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['Redemption']['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['Redemption']['Ilvl~122']['H: 908+'],	{})
			
			-- Sub SAM sets
			sets.engaged['SAM']['Redemption'] 				= set_combine(sets.engaged['SAM']['Redemption'],				{})
			sets.engaged['SAM']['Redemption']['Ilvl~118'] 	= set_combine(sets.engaged['SAM']['Redemption'],				{})
			sets.engaged['SAM']['Redemption']['Ilvl~122'] 	= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~118'],	{})
			sets.engaged['SAM']['Redemption']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~122'],	{})
			
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
			sets.engaged['SAM']['Redemption']['H: 820'] 					= set_combine(sets.engaged['SAM']['Redemption'],						{})
			sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 820']			= set_combine(sets.engaged['SAM']['Redemption']['H: 820'],				{})
			sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 820'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 820'],	{})
			sets.engaged['SAM']['Redemption']['Ilvl~124+']['H: 820'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 820'],	{})
			-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
			sets.engaged['SAM']['Redemption']['H: 856'] 					= set_combine(sets.engaged['SAM']['Redemption'],						{})
			sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 856']			= set_combine(sets.engaged['SAM']['Redemption']['H: 856'],				{})
			sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 856'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 856'],	{})
			sets.engaged['SAM']['Redemption']['Ilvl~124+']['H: 856'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 856'],	{})
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['SAM']['Redemption']['H: 908+'] 					= set_combine(sets.engaged['SAM']['Redemption'],						{})
			sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 908+']		= set_combine(sets.engaged['SAM']['Redemption']['H: 908+'],				{})
			sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['SAM']['Redemption']['Ilvl~124+']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Redemption']['Ilvl~122']['H: 908+'],	{})
	
	-- ['Liberator'] SETS
	
	sets.engaged['Liberator'] 					= set_combine(sets.engaged,				{})
	sets.engaged['Liberator']['Ilvl~118'] 		= set_combine(sets.engaged,				{})
	sets.engaged['Liberator']['Ilvl~122'] 		= set_combine(sets.engaged['Ilvl~118'],	{})
	sets.engaged['Liberator']['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'],	{})
	-- AM3 up sets
	-- Drop DA for more STP / Crit / TA / QA
	sets.engaged['Liberator']['AM3'] 				= set_combine(sets.engaged,						{})
	sets.engaged['Liberator']['Ilvl~118']['AM3']	= set_combine(sets.engaged['AM3'],				{})
	sets.engaged['Liberator']['Ilvl~122']['AM3'] 	= set_combine(sets.engaged['Ilvl~118']['AM3'],	{})
	sets.engaged['Liberator']['Ilvl~124+']['AM3'] 	= set_combine(sets.engaged['Ilvl~122']['AM3'],	{})
	
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['Liberator']['H: 908+'] 				= set_combine(sets.engaged['Liberator'],						{})
			sets.engaged['Liberator']['Ilvl~118']['H: 908+']	= set_combine(sets.engaged['Liberator']['H: 908+'],				{})
			sets.engaged['Liberator']['Ilvl~122']['H: 908+'] 	= set_combine(sets.engaged['Liberator']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['Liberator']['Ilvl~124+']['H: 908+'] 	= set_combine(sets.engaged['Liberator']['Ilvl~122']['H: 908+'],	{})
				-- AM3 up sets
				-- Drop DA for more STP / Crit / TA / QA
				sets.engaged['Liberator']['H: 908+']['AM3']					= set_combine(sets.engaged['Liberator']['AM3'],							{})
				sets.engaged['Liberator']['Ilvl~118']['H: 908+']['AM3']		= set_combine(sets.engaged['Liberator']['H: 908+']['AM3'],				{})
				sets.engaged['Liberator']['Ilvl~122']['H: 908+']['AM3'] 	= set_combine(sets.engaged['Liberator']['Ilvl~118']['H: 908+']['AM3'],	{})
				sets.engaged['Liberator']['Ilvl~124+']['H: 908+']['AM3'] 	= set_combine(sets.engaged['Liberator']['Ilvl~122']['H: 908+']['AM3'],	{})
			-- Sub SAM sets
			sets.engaged['SAM']['Liberator'] 				= set_combine(sets.engaged['SAM']['Liberator'],				{})
			sets.engaged['SAM']['Liberator']['Ilvl~118'] 	= set_combine(sets.engaged['SAM']['Liberator'],				{})
			sets.engaged['SAM']['Liberator']['Ilvl~122'] 	= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118'],	{})
			sets.engaged['SAM']['Liberator']['Ilvl~124+'] 	= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122'],	{})
				-- AM3 up sets
				-- Drop DA for more STP / Crit / TA / QA
				sets.engaged['SAM']['Liberator']['AM3']					= set_combine(sets.engaged['SAM']['Liberator'],						{})
				sets.engaged['SAM']['Liberator']['Ilvl~118']['AM3'] 	= set_combine(sets.engaged['SAM']['Liberator']['AM3'],				{})
				sets.engaged['SAM']['Liberator']['Ilvl~122']['AM3']		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['AM3'],	{})
				sets.engaged['SAM']['Liberator']['Ilvl~124+']['AM3'] 	= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['AM3'],	{})
			
			-- sets to drop gear haste% for more STP / DA / TA / QA / Crit
			-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
			sets.engaged['SAM']['Liberator']['H: 820'] 						= set_combine(sets.engaged['SAM']['Liberator'],							{})
			sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 820']			= set_combine(sets.engaged['SAM']['Liberator']['H: 820'],				{})
			sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 820'] 			= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 820'],	{})
			sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 820'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 820'],	{})
			-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
			sets.engaged['SAM']['Liberator']['H: 856'] 						= set_combine(sets.engaged['SAM']['Liberator'],							{})
			sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 856']			= set_combine(sets.engaged['SAM']['Liberator']['H: 856'],				{})
			sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 856'] 			= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 856'],	{})
			sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 856'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 856'],	{})
			-- only need 12% Gear haste (when Last Resort is up)
			sets.engaged['SAM']['Liberator']['H: 908+'] 					= set_combine(sets.engaged['SAM']['Liberator'],							{})
			sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 908+']			= set_combine(sets.engaged['SAM']['Liberator']['H: 908+'],				{})
			sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 908+'],	{})
			sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 908+'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 908+'],	{})
				
				-- AM3 up sets
				-- sets to drop gear haste% for more STP / TA / QA / Crit
				-- only need 22% Gear haste (when Hasso + haste samba from a /DNC are up)
				sets.engaged['SAM']['Liberator']['H: 820']['AM3'] 					= set_combine(sets.engaged['SAM']['Liberator']['AM3'],							{})
				sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 820']['AM3']		= set_combine(sets.engaged['SAM']['Liberator']['H: 820']['AM3'],				{})
				sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 820']['AM3'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 820']['AM3'],	{})
				sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 820']['AM3'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 820'],			{})
				-- only need 17% Gear haste (when Hasso + haste samba from a main DNC are up)
				sets.engaged['SAM']['Liberator']['H: 856']['AM3'] 					= set_combine(sets.engaged['SAM']['Liberator']['AM3'],							{})
				sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 856']['AM3']		= set_combine(sets.engaged['SAM']['Liberator']['H: 856']['AM3'],				{})
				sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 856']['AM3'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 856']['AM3'],	{})
				sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 856']['AM3'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 856']['AM3'],	{})
				-- only need 12% Gear haste (when Last Resort is up)
				sets.engaged['SAM']['Liberator']['H: 908+']['AM3'] 					= set_combine(sets.engaged['SAM']['Liberator']['AM3'],							{})
				sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 908+']['AM3']		= set_combine(sets.engaged['SAM']['Liberator']['H: 908+']['AM3'],				{})
				sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 908+']['AM3'] 		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~118']['H: 908+']['AM3'],	{})
				sets.engaged['SAM']['Liberator']['Ilvl~124+']['H: 908+']['AM3']		= set_combine(sets.engaged['SAM']['Liberator']['Ilvl~122']['H: 908+']['AM3'],	{})
	
	sets.engaged.DW = {}
	sets.engaged.DW['Ilvl~118'] 	= set_combine(sets.engaged.DW,				{})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'],	{})
	sets.engaged.DW['Ilvl~124+']	= set_combine(sets.engaged.DW['Ilvl~122'],	{})
	
	-- hybrid sets for when your tanking
    sets.engaged.DT = {}
	sets.engaged['Ilvl~118'].DT 	= set_combine(sets.engaged.DT,				{})
	sets.engaged['Ilvl~122'].DT		= set_combine(sets.engaged['Ilvl~118'].DT,	{})
	sets.engaged['Ilvl~124+'].DT	= set_combine(sets.engaged['Ilvl~122'].DT,	{})
	
	--------------------------------------
    -- Misc. sets
    --------------------------------------
   
	sets.buff.Doom 		= {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
	sets.buff.sleep 	= {neck="Berserker's Torque"}
	sets.CP 			= {back=CP_Cape}
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		if player.tp < 2850 then
			gear.ws_ear.name = gear.TP_Bonus_Ear.name
		else
			gear.ws_ear.name = gear.Max_TP_Ear
		end
	end	
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.CP.value == true and state.DefenseMode.current ~= 'None' then
		equip(sets.CP)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
   if state.Buff[spell.name] == false and not spell.interrupted then
		state.Buff[spell.name] = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain, buff_info)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)

	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == 'Ilvl~118' then
		state.WeaponskillMode:set('Ilvl~118')
	elseif state.OffenseMode.value == 'Ilvl~122' then
		state.WeaponskillMode:set('Ilvl~122')
	elseif state.OffenseMode.value == 'Ilvl~124+' then
		state.WeaponskillMode:set('Ilvl~124+')
	end
	
	if field == "PhysicalDefense" then
		if state.PhysicalDefense.value == true then
			state.DefenseMode.current = 'Physical'
			state.DefenseMode:set('Physical')
			state.MagicalDefense = M(false)
		end
	elseif field == "MagicalDefense" then
		if state.MagicalDefense.value == true then
			state.DefenseMode.current = 'Magical'
			state.DefenseMode:set('Magical')
			state.PhysicalDefense = M(false)
			if not buffactive.Shell then
				state.MagicalDefenseMode:set('MDTNoShell')
			else
				state.MagicalDefenseMode:set('MDT')
			end
		end
	end
	if field == "MagicalDefense" or field == "PhysicalDefense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
end

function job_status_change(new_status, old_status)
	--table.vprint(sets)
	handle_equipping_gear(player.status)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    update_combat_form()
	determine_haste_group()
	update()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	
	lockouts()
	
    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end	
	
	if state.DefenseMode.current == 'None' then
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.Auto_Kite.value == true then
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	
	lockouts()
	
	if state.Buff.sleep and player.inventory['Berserkers Torque'] or player.wardrobe['Berserkers Torque'] or player.wardrobe2['Berserkers Torque'] or player.wardrobe3['Berserkers Torque'] or player.wardrobe4['Berserkers Torque'] then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 2 then
					meleeSet = set_combine(meleeSet, sets.buff.sleep)
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping Frenzy Sallet '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 19 then
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Nightmare'):color(warning_text)  .. (' while Engaged *****__\\||//__'):color(text_color) )
				end
			end
		end
	end
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.DefenseMode.current == 'None' then 
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
	end
    return meleeSet
end

function customize_defense_set(defenseSet)
	lockouts()
    
    if state.Buff.doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end

    if state.Buff.sleep and player.inventory['Berserkers Torque'] or player.wardrobe['Berserkers Torque'] or player.wardrobe2['Berserkers Torque'] or player.wardrobe3['Berserkers Torque'] or player.wardrobe4['Berserkers Torque'] then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 2 then
					meleeSet = set_combine(meleeSet, sets.buff.sleep)
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping Frenzy Sallet '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 19 then
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Nightmare'):color(warning_text)  .. (' while Engaged *****__\\||//__'):color(text_color) )
				end
			end
		end
	end
    return defenseSet
end

function lockouts()

	if Tele_Ring:contains(player.equipment.ring1) and unlock_em == false then
		if Ring_slot_locked_1 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_1 = true
		disable('ring1')
	end
	if Tele_Ring:contains(player.equipment.ring2) and unlock_em == false then
		if Ring_slot_locked_2 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_2 = true
		disable('ring2')
	end
	
	if (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then
		enable('ring1')
		enable('ring2')
	elseif not (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then 
		unlock_em = false
		Ring_slot_locked_1 = false
		Ring_slot_locked_2 = false
		add_to_chat(200,('[Zoned: '):color(Notification_color) .. ('-> Un-locking Tele/Warp Rings '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring1) and Ring_slot_locked_1 and unlock_em == false then 
		Ring_slot_locked_1 = false
		enable('ring1')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring2) and Ring_slot_locked_2 and unlock_em == false then 
		Ring_slot_locked_2 = false
		enable('ring2')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot '):color(text_color) .. (']'):color(Notification_color) )
	end
	--------------------------------
	-- Ring locks for exp ring use
	
	if Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		disable('ring1')
	elseif not Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		enable('ring1')
	end
	
	if Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		disable('ring2')
	elseif not Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		enable('ring2')
	end
	
	---------------------------------
	-- earring locks
	
	if Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	elseif not Ear_lock:contains(player.equipment.ear1) then
		enable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	elseif not Ear_lock:contains(player.equipment.ear2) then
		enable('Ear2')
	end
	
end

function reset_rings()
	if Ring_slot_locked_1 or Ring_slot_locked_2 then
		unlock_em = true
	end
end

windower.raw_register_event('zone change',reset_rings)

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	if player.equipment.main == 'Ragnarok' or player.equipment.main == 'Caladbolg' then
		state.CombatWeapon:set('Greatsword')
	elseif player.equipment.main == 'Apocalypse' then
		state.CombatWeapon:set('Apocalypse')
	elseif player.equipment.main == 'Redemption' then
		state.CombatWeapon:set('Redemption')
	elseif player.equipment.main == 'Liberator' then
		state.CombatWeapon:set('Liberator')
	else -- use regular set
		state.CombatWeapon:reset()
	end
	handle_equipping_gear(player.status)
end

function check_moving()
	if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
		if state.Auto_Kite.value == false and moving then
			state.Auto_Kite:set(true)
		elseif state.Auto_Kite.value == true and moving == false then
			state.Auto_Kite:set(false)
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
	state.CombatForm:reset()
	if DW == true then
		state.CombatForm:set('DW')
	end
	if player.sub_job == 'SAM' then
		state.CombatForm:set('SAM')
	end
	if DW == true and player.sub_job == 'SAM' then
		state.CombatForm:reset()
		state.CombatForm:set('DW')
	end
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	
    local msg = ('   [Melee'):color(Notification_color)
    
    if state.CombatForm.has_value then
        msg = msg .. (' (' .. state.CombatForm.value .. ')'):color(text_color)
    end
    
	if #classes.CustomMeleeGroups > 0 then
        for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then
					msg = msg .. (' ('):color(Notification_color)
				end
				msg = msg .. (classes.CustomMeleeGroups[i]):color(Notification_color)
				if i < #classes.CustomMeleeGroups then
					msg = msg .. (' + '):color(Notification_color)
				end
				if i == #classes.CustomMeleeGroups then
					msg = msg .. (')'):color(Notification_color)
				end
			end
        end
    end
	
    msg = msg .. (': '):color(Notification_color)
    
   if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end
	
	if state.HybridMode.value ~= 'Normal' then
        msg = msg .. (' + '):color(text_color) .. (state.HybridMode.value):color(warning_text)
    end
	
    if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
	
    msg = msg .. (' [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	if state.Kiting.value == true or state.CP.value == true then
        msg = msg .. '\n'
    end
	
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.CP.value == true then
        msg = msg .. ('[CP Cape'):color(Notification_color) .. ('] '):color(Notification_color)
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ('[Target PC: '):color(Notification_color)..state.PCTargetMode.value .. ('] '):color(Notification_color)
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ('[Target NPCs'):color(Notification_color).. ('] '):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n ')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)
	eventArgs.handled = true
	save_settings()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()

	classes.CustomMeleeGroups:clear()
	-- choose sets based on Haste
	if Haste >= 908 then
		classes.CustomMeleeGroups:append('H: 908+')
	elseif Haste > 855 and Haste < 908 then
		classes.CustomMeleeGroups:append('H: 856')
	elseif Haste > 819 and Haste < 856 then
		classes.CustomMeleeGroups:append('H: 819')
	end
	
	if state.Buff["Aftermath: Lv.3"] and player.equipment.main == 'Liberator' then
		-- or player.equipment.main == 'Redemption' or player.equipment.main == 'Caladbolg'
		classes.CustomMeleeGroups:append('AM3')
	end
	-- Choose gearset based on DW needed
	if DW == true then
		-- if DW_needed <= 5 then
			-- classes.CustomMeleeGroups:append('DW: 5-0')
		-- elseif DW_needed > 5 and DW_needed < 12 then
			-- classes.CustomMeleeGroups:append('DW: 6-11')
		-- elseif DW_needed > 11 and DW_needed < 22 then
			-- classes.CustomMeleeGroups:append('DW: 12-21')
		-- elseif DW_needed > 21 and DW_needed < 37 then
			-- classes.CustomMeleeGroups:append('DW: 22-36')
		-- elseif DW_needed > 36 then
			-- classes.CustomMeleeGroups:append('DW: 37+')
		-- end
	end
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
	gearinfo(cmdParams, eventArgs)
	if cmdParams[1] == 'help' then
	
		local chat_purple = string.char(0x1F, 200)
		local chat_grey = string.char(0x1F, 160)
		local chat_red = string.char(0x1F, 167)
		local chat_white = string.char(0x1F, 001)
		local chat_green = string.char(0x1F, 214)
		local chat_yellow = string.char(0x1F, 036)
		local chat_d_blue = string.char(0x1F, 207)
		local chat_pink = string.char(0x1E, 5)
		local chat_l_blue = string.char(0x1E, 6)
		
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_white.. 	'                         ----------------------------------' )
		windower.add_to_chat(6, chat_d_blue.. 	'                         Welcome to Sebs Gearswap help!' )
		windower.add_to_chat(6, chat_white.. 	'                         ----------------------------------' )
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_d_blue.. 	'You may manually type these with \"\/\/gs c [function]\" eg. '.. chat_yellow ..' \"\/\/gs c update user\"')
		windower.add_to_chat(6, chat_yellow.. 	'W-key'.. chat_d_blue ..' means Windows key')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_green.. 	'Key Binds available:')
		windower.add_to_chat(6, chat_yellow.. 	'           \'F12\''..chat_l_blue  ..' = update user ' .. chat_white .. '  --  Will check and equip correct gear.')
		windower.add_to_chat(6, chat_yellow..	'   \'Ctrl + F12\''..chat_l_blue  ..' = cycle CastingMode ' .. chat_white .. '   --  Cycles to resistant mode \(more Macc\).')
		windower.add_to_chat(6, chat_yellow..	'    \'Alt + F12\''..chat_l_blue  ..' = cycle IdleMode ' .. chat_white .. '  --  Cycle through idle modes.')
		windower.add_to_chat(6, chat_yellow..	'\'W-Key + F12\''..chat_l_blue  ..' = toggle kiting ' .. chat_white .. '  --  Locks movement speed gear on over any set')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow..	'   \'Ctrl + F11\''..chat_l_blue  ..' = cycle CP ' .. chat_white .. '  --  Makes you utilise CP cape')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow.. 	'             \'[\''..chat_l_blue  ..' = toggle PhysicalDefense ' .. chat_white .. '  --  Locks PDT set on.')
		windower.add_to_chat(6, chat_yellow..	'      \'Ctrl + [\''..chat_l_blue  ..' = cycle OffenseMode ' .. chat_white .. '   --  Cycles throught accuracy modes.')
		windower.add_to_chat(6, chat_yellow..	'  \'W-Key + [\''..chat_l_blue  ..' = cycle HybridMode ' .. chat_white .. '  --  Cycles thought Hybrid modes \(usually just DT\)')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow..	'             \']\''..chat_l_blue  ..' = toggle MagicalDefense ' .. chat_white .. '  --  Locks MDT set on.')
		windower.add_to_chat(6, ' ')
	
	end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.IdleMode then
        properties:append('${HybridMode}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.Kiting then
        properties:append('${Kiting}')
    end
	if state.CP then
        properties:append('${CP}')
    end
	if state.DefenseMode then
        properties:append('${DefenseMode}')
    end
	properties:append('${is_Moving}')
    text:clear()
    text:append(properties:concat(''))
	update()
end

function update()
	
	local white = '\\cs(220,220,220)'
	local blue = '\\cs(150,150,235)'
	local red = '\\cs(255,0,0)'
	local orange = '\\cs(232,138,13)'
	local yellow = '\\cs(220,220,0)'
	local green = '\\cs(0,225,0)'
	local purple = '\\cs(213,43,196)'
	
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
		text_box:hide()
		return
	end
	
	local inform = {}
	local msg = ' [Melee'
	
	if state.CombatForm.has_value then
        msg = msg .. ' (' .. tostring(state.CombatForm.value) .. ')'
    end
	
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg .. ')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value == 'None' then
		if state.HybridMode.value ~= 'Normal' then
			msg = blue .. msg .. white .. state.OffenseMode.value .. blue .. ' + ' .. yellow .. state.HybridMode.value .. blue .. '] '
		else
			msg = blue .. msg .. white .. state.OffenseMode.value .. blue .. '] '
		end
	else
		if state.HybridMode.value ~= 'Normal' then
			msg = red .. msg .. state.OffenseMode.value .. ' + ' .. state.HybridMode.value .. '] '
		else
			msg = red .. msg .. state.OffenseMode.value .. '] '
		end
	end

	if state.DefenseMode.value ~= 'None' then 
		inform.OffenseMode = msg .. '\\cr'
	else
		inform.OffenseMode = msg .. '\\cr'
	end
	
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '.. white .. state.IdleMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	end
		
	if state.DefenseMode.value == 'None' then
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (orange .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (orange .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	else
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (red .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (red .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	end

	if state.DefenseMode.value ~= 'None' then
		inform.DefenseMode = (red .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. white ..' (' ..state[state.DefenseMode.value .. 'DefenseMode'].value ..')'..red..']' )) .. '\\cr'
	else
		inform.DefenseMode = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		if moving == true then
			inform.is_Moving = (yellow .. ('\n [Moving]' )) .. '\\cr'
		else
			inform.is_Moving = ('')
		end
	end
	
	if not table.equals(old_inform, inform) then
		--print('change text')
		text_box:update(inform)
		text_box:show()
		old_inform = inform
	end
end


windower.register_event('unload', function()
	text_box:destroy()
	text_box = nil
	
	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')
	
	send_command('unbind f7')
	send_command('unbind ^f7')
	send_command('unbind !f7')
	send_command('unbind @f7')
	
	send_command('unbind f8')
	send_command('unbind ^f8')
	send_command('unbind !f8')
	send_command('unbind @f8')
	
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind @f10')
	
	send_command('unbind f11')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind @f11')
	
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')
	send_command('unbind @f12')
	
end)

windower.register_event('job change',function()
    send_command('gs r')
end)

function select_default_macro_book()
end