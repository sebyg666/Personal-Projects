-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--require('functions')
-- Initialization function for this job file.
include('Make-Settings.lua')
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Seb-Include.lua')
	

end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff['Mighty Guard'] =  buffactive['Mighty Guard'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
	state.Buff.doom = buffactive.doom or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	
	include('Organizer-lib.lua')
	
    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm','Saurian Slide'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
		'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
		
		'Whirl of Rage','Glutinous Dart','Sweeping Gouge','Sinker Drill'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb','Tenebral Crush','Palling Salvo',
		'Entomb','Silent Storm','Anvil Lightning','Scouring Spate','Spectral Floe','Blinding Fulgor',
		'Searing Tempest','Atramentous Libations','Nectarous Deluge','Molting Plumage'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool','Occultation'
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
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
	-- options.MagicalDefenseModes = {'MDT'}
	state.MagicalDefenseMode:options('MDT', 'MDTNoShell')
	
	state.CP  				= M(false, 'CP')
	state.Learning  		= M(false, 'Learning')
	state.Auto_Kite  	= M(false, 'Auto_Kite')
	
	state.PhysicalDefense   = M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind !F11 gs c cycle Learning')
	
	send_command('gi ugs true')
	
	DW_needed = 0
	DW = false
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
	send_command('gi update')
    select_default_macro_book()
	update_combat_form()
	determine_haste_group()
	
	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	initialize(text_box)
	
	local msg = ''
	msg = ('You have loaded Seb\'s BLU lua. Please use '):color(text_color) .. ('\"\/\/GS c help\" '):color(Notification_color) .. ('for a full list of key bound functions. Enjoy!'):color(text_color)
	add_to_chat(122, msg)
	
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Set up gear sets.

function init_gear_sets()                                                       	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------
	gear.TP_Bonus_Ear = {name="Moonshade Earring"}
	gear.Max_TP_Ear = {name="Mache Earring"}
	gear.ws_ear = {name="Mache Earring"}
	
	
    sets.buff['Burst Affinity'] = {}
    sets.buff['Chain Affinity'] = {}
    sets.buff.Convergence = {}
    sets.buff.Diffusion = {}
    sets.buff.Enchainment = {}
    sets.buff.Efflux = {}

    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {}
	sets.precast.JA['Provoke'] = {}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})  
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})	
	sets.precast.FC['Blue Magic'].Healing = set_combine(sets.precast.FC['Blue Magic'], {})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat']				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Requiescat'] 	= set_combine(sets.precast.WS['Requiescat'] , {})
	sets.precast.WS['Ilvl~122']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~118']['Requiescat'] , {})
	sets.precast.WS['Ilvl~124+']['Requiescat']	= set_combine(sets.precast.WS['Ilvl~122']['Requiescat'] , {})

    sets.precast.WS['Sanguine Blade'] 				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Sanguine Blade'] 	= set_combine(sets.precast.WS['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~122']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~118']['Sanguine Blade'], {})
	sets.precast.WS['Ilvl~124+']['Sanguine Blade']	= set_combine(sets.precast.WS['Ilvl~122']['Sanguine Blade'], {})
	
	sets.precast.WS['Chant du Cygne'] 				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Chant du Cygne']	= set_combine(sets.precast.WS['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~122']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~118']['Chant du Cygne'], {})
	sets.precast.WS['Ilvl~124+']['Chant du Cygne'] 	= set_combine(sets.precast.WS['Ilvl~122']['Chant du Cygne'], {})
	
	sets.precast.WS['Savage Blade']  				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Savage Blade']  	= set_combine(sets.precast.WS['Savage Blade'] , {})
	sets.precast.WS['Ilvl~122']['Savage Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Savage Blade'] , {})
	sets.precast.WS['Ilvl~124+']['Savage Blade']  	= set_combine(sets.precast.WS['Ilvl~122']['Savage Blade'] , {})
	
	sets.precast.WS['Expiacion']  					= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Expiacion']  	= set_combine(sets.precast.WS['Expiacion'] , {})
	sets.precast.WS['Ilvl~122']['Expiacion']	= set_combine(sets.precast.WS['Ilvl~118']['Expiacion'] , {})
	sets.precast.WS['Ilvl~124+']['Expiacion']  	= set_combine(sets.precast.WS['Ilvl~122']['Expiacion'] , {})
	
	sets.precast.WS['Vorpal Blade']  				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~118']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Vorpal Blade'], {})
	sets.precast.WS['Ilvl~122']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~118']['Vorpal Blade'], {})
	sets.precast.WS['Ilvl~124+']['Vorpal Blade'] 	= set_combine(sets.precast.WS['Ilvl~122']['Vorpal Blade'], {})
    
    -- Midcast Sets
    sets.midcast.FastRecast = {}
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast["Flash"] = set_combine(sets.midcast.FastRecast, {})
    sets.midcast['Blue Magic'] = set_combine(sets.midcast.FastRecast, {})
    
    -- Physical Spells --
  
    sets.midcast['Blue Magic'].Physical = set_combine(sets.midcast['Blue Magic'], {})
    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})

    -- Magical Spells --	
	
    sets.midcast['Blue Magic'].Magical = {}
    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic']['Tenebral Crush'] 			= set_combine(sets.midcast['Blue Magic'].Magical, {})	
	sets.midcast['Blue Magic']['Tenebral Crush'].Resistant 	= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
    sets.midcast['Blue Magic'].MagicalMnd					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalMnd.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
    sets.midcast['Blue Magic'].MagicalChr 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
    sets.midcast['Blue Magic'].MagicalVit 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
    sets.midcast['Blue Magic'].MagicalDex 					= set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex.Resistant 		= set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})
    sets.midcast['Blue Magic'].MagicAccuracy 				= set_combine(sets.midcast['Blue Magic'].Magical, {})

    -- Breath Spells --
    sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, {})
    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun =  {}
    sets.midcast['Blue Magic']['White Wind'] = set_combine(sets.midcast.FastRecast, {})
    sets.midcast['Blue Magic'].Healing = set_combine(sets.midcast.FastRecast, {})
    sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.midcast.FastRecast, {})
    sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast.FastRecast, {})
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast.FastRecast, {})
    sets.midcast.Protect = {}
    sets.midcast.Protectra = {}
    sets.midcast.Shell = {}
    sets.midcast.Shellra = {}
   
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})
    -- Sets to return to when not performing an action.
    sets.latent_refresh = {}
    -- Resting sets
    sets.resting = {}   
    -- Idle sets
    sets.idle = {}
    sets.idle.PDT = {}
    sets.idle.Town = {}	
	sets.idle.Weak = {}
    -- Defense sets
    sets.defense.PDT = {}
    sets.defense.MDT = {}
    sets.Kiting = {}

    --------------------------------------
	-- Engaged sets
	--------------------------------------
	----------------------------------------
	-- Normal melee group: No Haste (38% DW)
	----------------------------------------
	sets.engaged 					= {}
	sets.engaged['Ilvl~118']		= set_combine(sets.engaged, 				{})
	sets.engaged.DW 					= {}
	sets.engaged.DW['Ilvl~118']		= set_combine(sets.engaged.DW, 				{})
	sets.engaged.DW['Ilvl~122']		= set_combine(sets.engaged.DW['Ilvl~118'], 	{})
	sets.engaged.DW['Ilvl~124+'] 	= set_combine(sets.engaged.DW['Ilvl~122'], 	{})
	
	------------------------------------------------------------------	

	sets.engaged['Ilvl~122']		= set_combine(sets.engaged['Ilvl~118'], 	{})
	sets.engaged['Ilvl~124+'] 		= set_combine(sets.engaged['Ilvl~122'], 	{})
	
	sets.engaged.DW['DW: 37+'] 					= set_combine(sets.engaged.DW, 							{})
	sets.engaged.DW['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged.DW['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 37+'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 37+'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 37+'], 	{})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: low Haste (~36% DW)-             
	--------------------------------------------            
	
	sets.engaged.DW['DW: 22-36'] 				= set_combine(sets.engaged.DW['DW: 37+'], 				{})
	sets.engaged.DW['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged.DW['DW: 22-36'], 			{})
	sets.engaged.DW['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 22-36'], {})
	sets.engaged.DW['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 22-36'], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			
	-- Custom melee group: MidHaste (~21% DW)-              
	--------------------------------------------            
	
	sets.engaged.DW['DW: 12-21']				= set_combine(sets.engaged.DW['DW: 22-36'], 			{})
	sets.engaged.DW['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged.DW['DW: 12-21'], 			{})
	sets.engaged.DW['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 12-21'], {})
	sets.engaged.DW['Ilvl~124+']['DW: 12-21']  	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 12-21'], {})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (5-11% DW)               
	---------------------------------------------           
	
	sets.engaged.DW['DW: 6-11'] 				= set_combine(sets.engaged.DW['DW: 12-21'], 			{})
	sets.engaged.DW['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged.DW['DW: 6-11'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~118']['DW: 6-11'],	{})
	sets.engaged.DW['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 6-11'], 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (0% DW)            
	-----------------------------------------           

	sets.engaged.DW['DW: 5-0'] 					= set_combine(sets.engaged.DW['DW: 6-11'],				{})
	sets.engaged.DW['Ilvl~118']['DW: 5-0'] 		= set_combine(sets.engaged.DW['DW: 5-0'], 				{})
	sets.engaged.DW['Ilvl~122']['DW: 5-0'] 		= set_combine(sets.engaged.DW['Ilvl~118']['DW: 5-0'], 	{})
	sets.engaged.DW['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged.DW['Ilvl~122']['DW: 5-0'], 	{})
    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing,{})
	sets.buff.Doom = {}
	sets.buff.Reive = {}
	sets.CP = {}
	sets.Learning = {}
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
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
		if state.Buff.Diffusion then 
			equip(sets.buff.Diffusion)
		end
		if state.Buff.Efflux then
			equip(sets.buff.Efflux)
		end
		if state.Buff['Burst Affinity'] then
			equip(sets.buff['Burst Affinity'])
		end
		if state.Buff['Chain Affinity'] then
			equip(sets.buff['Chain Affinity'])
		end
		if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end
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
	-- add_to_chat(200, buff .. '  ' .. tostring(gain) )
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
    -- if not midaction() then
		-- handle_equipping_gear(player.status)
	-- end
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
	check_moving()
	update()
end

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	--print('idle')
	lockouts()

    if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end	
	
	if state.DefenseMode.current == 'None' then
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
		if state.Learning.value == true then
			idleSet = set_combine(idleSet, sets.Learning)
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
	
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	if state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			meleeSet = set_combine(meleeSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
		if state.Learning.value == true then
			meleeSet = set_combine(meleeSet, sets.Learning)
		end
	end
    return meleeSet
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
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 1'):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring2) and Ring_slot_locked_2 and unlock_em == false then 
		Ring_slot_locked_2 = false
		enable('ring2')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 2'):color(text_color) .. (']'):color(Notification_color) )
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
	handle_equipping_gear(player.status)
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
	if DW == true then
		state.CombatForm:set('DW')
	elseif DW == false then
		state.CombatForm:reset()
	end
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
	
    if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
	
    msg = msg .. (' [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	if state.Kiting.value == true or state.CP.value == true or state.Learning.value == true then
        msg = msg .. '\n'
    end
	
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.CP.value == true then
        msg = msg .. ('[CP Cape'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.Learning.value == true then
        msg = msg .. ('[Learning'):color(Notification_color) .. ('] '):color(Notification_color)
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
	-- Choose gearset based on DW needed
	if DW == true then
		if DW_needed <= 5 then
			classes.CustomMeleeGroups:append('DW: 5-0')
		elseif DW_needed > 5 and DW_needed < 12 then
			classes.CustomMeleeGroups:append('DW: 6-11')
		elseif DW_needed > 11 and DW_needed < 22 then
			classes.CustomMeleeGroups:append('DW: 12-21')
		elseif DW_needed > 21 and DW_needed < 37 then
			classes.CustomMeleeGroups:append('DW: 22-36')
		elseif DW_needed > 36 then
			classes.CustomMeleeGroups:append('DW: 37+')
		end
	end
	--add_to_chat(122,'Marches = '..tostring(state.Buff['Marches']) .. ' / geo = '..tostring(state.Buff['Geo-Haste']).. ' / haste = '..tostring(state.Buff['Haste']).. ' / haste2 = '..tostring(state.Buff['Haste II']))
	
	--add_to_chat(122, 'DW needed: '..DW_needed..' Haste: '..Total_haste..' / 1024  ....   Gearset: '..info.haste)
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

    gearinfo(cmdParams, eventArgs)
	
	if cmdParams[1] == 'hide' then
		if hide_window then
			hide_window = false
		else
			hide_window = true
		end
		old_inform.hide_window = hide_window
	end
	
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
		windower.add_to_chat(6, chat_d_blue.. 	'If you wish to macro the functions please use \"\/con gs c [function]\" eg. '.. chat_yellow ..' \"\/con gs c update user\"')
		windower.add_to_chat(6, chat_yellow.. 	'W-key'.. chat_d_blue ..' means Windows key')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_green.. 	'Key Binds available:')
		windower.add_to_chat(6, chat_yellow.. 	'           \'F12\''..chat_l_blue  ..' = update user ' .. chat_white .. '  --  Will check and equip correct gear.')
		windower.add_to_chat(6, chat_d_blue.. 	'Will also save the current location of the gearswap info text box to file')
		windower.add_to_chat(6, chat_yellow..	'   \'Ctrl + F12\''..chat_l_blue  ..' = cycle CastingMode ' .. chat_white .. '   --  Cycles to resistant mode \(more Macc\).')
		windower.add_to_chat(6, chat_yellow..	'    \'Alt + F12\''..chat_l_blue  ..' = cycle IdleMode ' .. chat_white .. '  --  Cycle through idle modes.')
		windower.add_to_chat(6, chat_yellow..	'\'W-Key + F12\''..chat_l_blue  ..' = toggle kiting ' .. chat_white .. '  --  Locks movement speed gear on over any set')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow..	'   \'Ctrl + F11\''..chat_l_blue  ..' = cycle CP ' .. chat_white .. '  --  Makes you utilise CP cape')
		windower.add_to_chat(6, chat_yellow..	'   \'Alt + F11\''..chat_l_blue  ..' = cycle Learning ' .. chat_white .. '  --  Makes use of the gloves to better learn spells')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow.. 	'             \'[\''..chat_l_blue  ..' = toggle PhysicalDefense ' .. chat_white .. '  --  Locks PDT set on.')
		windower.add_to_chat(6, chat_yellow..	'      \'Ctrl + [\''..chat_l_blue  ..' = cycle OffenseMode ' .. chat_white .. '   --  Cycles throught melee accuracy modes.')
		windower.add_to_chat(6, chat_yellow..	'  \'W-Key + [\''..chat_l_blue  ..' = cycle HybridMode ' .. chat_white .. '  --  Cycles thought Hybrid modes \(usually just DT\)')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_yellow..	'             \']\''..chat_l_blue  ..' = toggle MagicalDefense ' .. chat_white .. '  --  Locks MDT set on.')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_d_blue.. 	'If you need more help or run into problems, you can contact me via email at ' .. chat_yellow .. 'sebyg666@hotmail.com')
		windower.add_to_chat(6, chat_d_blue.. 	'Alternatively if you have me on your skype list, just leave me a message there and ill get back to you.')
		windower.add_to_chat(6, ' ')
		windower.add_to_chat(6, chat_green.. 	'Warning: Shameless plug follows.')
		windower.add_to_chat(6, chat_d_blue.. 	'If You are a big fan of my lua\'s and you wish to support me, you are more then welcome to donate any amount of money')
		windower.add_to_chat(6, chat_d_blue.. 	'via paypal at the above email adress. You may also tell other people you trust about my lua\'s and how to contact me,')
		windower.add_to_chat(6, chat_d_blue.. 	'for help setting up, and finally you can also find me streaming live on twitch at '.. chat_yellow .. 'www.twitch.tv/Sebbyg')
		windower.add_to_chat(6, ' ')
	
	end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.MagicBurst then
        properties:append('${MagicBurst}')
    end
	if state.PreserveMP then
        properties:append('${PreserveMP}')
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
	if state.Learning then
		properties:append('${Learning}')
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
	
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() or zoning_bool or hide_window then
		text_box:hide()
		return
	end
	
	local inform = {}
	local msg = ' [Melee'
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg ..')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value == 'None' then
		msg = blue .. msg .. white .. state.OffenseMode.value .. blue..'] '
	else
		msg = red .. msg .. state.OffenseMode.value .. '] '
	end
	inform.OffenseMode = msg .. '\\cr'
			
	inform.CastingMode = (blue .. ('\n [Casting: '..white..state.CastingMode.value:lpad(' ', 2) ..blue.. '] ' )) .. '\\cr'
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '..white..state.IdleMode.value:lpad(' ', 2) .. blue..'] ' )) .. '\\cr'
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
	if state.DefenseMode.value == 'None' then
		if state.Learning. value == true then
			inform.Learning = (purple .. ('\n [Learning] ' )) .. '\\cr'
		else
			inform.Learning = ('')
		end
	else
		if state.Learning. value == true then
			inform.Learning = (red .. ('\n [Learning] ' )) .. '\\cr'
		else
			inform.Learning = ('')
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