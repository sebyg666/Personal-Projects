-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
    Custom commands:

    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime

--]]
-- Initialization function for this job file.
include('Make-Settings.lua')
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	state.Buff.doom = buffactive.doom or false

    include('Mote-TreasureHunter')
	include('Organizer-lib.lua')
	
    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.HybridMode:options('Normal', 'Evasion')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
	state.IdleMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
	options.MagicalDefenseModes = {'MDT'}

    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Caudata Belt"
	
	state.CP  						= M(false, 'CP')
	state.PhysicalDefense   	= M(false, 'PhysicalDefense')
	state.MagicalDefense    	= M(false, 'MagicalDefense')
	state.Auto_Kite  			= M(false, 'Auto_Kite')
	
    -- Additional local binds
	
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind @F11 gs c cycle treasuremode') 
	send_command('bind @] gs c cycle HybridMode')
	send_command('bind ^] gs c cycle RangedMode')
	
	send_command('gi ugs true')
	
	DW_needed = 0
	DW = false
	moving = false
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false
	
	send_command('gi update')
    select_default_macro_book()
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

-- Define sets and vars used by this job file.
function init_gear_sets()
	
	Adhemar_head	={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}}
    Adhemar_body	={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}}
	Adhemar_hands	={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}}
	
    Kaabnax_legs	={ name="Kaabnax Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}}
	
	Rawhide_body	={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}}
	Rawhide_hands	={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}}
	Rawhide_legs	={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}
	
    Lengo_Pants		={ name="Lengo Pants", augments={'INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	Dampening_Tam	={ name="Dampening Tam", augments={'DEX+5','Accuracy+8','Mag. Acc.+8',}}
	Samnuha_Coat	={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}}
	Samnuha_Tights	={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}}
	Leyline_Gloves	={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}	
	Mediums_Sabots	={ name="Medium's Sabots", augments={'MP+20','MND+1','"Cure" potency +1%',}}
	
    Herc_legs_TP	={ name="Herculean Trousers", augments={'Accuracy+24','"Triple Atk."+3','STR+10','Attack+6',}}
    Herc_feet_TP_Acc={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+5','STR+5','Accuracy+10','Attack+1',}}
	Herc_feet_TP_TA	={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','AGI+4','Attack+2',}}
	
	Herc_legs_DW	={ name="Herculean Trousers", augments={'Attack+23','"Dual Wield"+6',}}
	Taeon_feet_DW	={ name="Taeon Boots", augments={'Attack+10','"Dual Wield"+3','STR+3 AGI+3',}}
	
	Herc_head_WS	={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','Weapon skill damage +1%','STR+8','Accuracy+15','Attack+14',}}
	Herc_hands_WS	={ name="Herculean Gloves", augments={'Rng.Acc.+23','Crit. hit damage +1%','AGI+15','Attack+6',}}
	
	Herc_feet_FC	={ name="Herculean Boots", augments={'Mag. Acc.+1','DEX+7','"Fast Cast"+8',}}
	
	Herc_legs_Nuke	={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Crit. hit damage +3%','INT+5','Mag. Acc.+8','"Mag.Atk.Bns."+8',}}
	
	Relic_hands		={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
	
	DW_back			={ name="Canny Cape", augments={'DEX+3','AGI+2','"Dual Wield"+5','Crit. hit damage +1%',}}
	TP_Back			={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	sets.Org={}
	sets.Org.one = {}
	sets.Org.two = {}
	
	organizer_items = {		
	Capacity_Ring = "Capacity Ring",
	Facility_Ring = "Facility Ring",
	Caliber_Ring = "Caliber Ring",
	}
	                                                             	
    --------------------------------------                       
    -- Start defining the sets                                   
    --------------------------------------

    sets.TreasureHunter = {hands=Relic_hands,feet="Skulker's Poulaines +1"}
    sets.Kiting = {feet="Fajin Boots"}

    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head,neck="Caro Necklace",ear1="Dawn Earring",ear2="Pixie Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
		back=TP_Back,waist="Chiner's Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}

    sets.buff['Trick Attack'] = {
		ammo="Yetshila",
		head=Adhemar_head,neck="Caro Necklace",ear1="Dawn Earring",ear2="Brutal Earring",
		body=Adhemar_body,hands=Adhemar_hands,ring1="Apate Ring",ring2="Garuda Ring",
		back=TP_Back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {}
	sets.precast.JA["Assassin's Charge"] = {}
    sets.precast.JA['Accomplice'] = {}
    sets.precast.JA['Flee'] = {}
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {}
    sets.precast.JA['Steal'] = {}
    sets.precast.JA['Despoil'] = {}
    sets.precast.JA['Perfect Dodge'] = {hands=Relic_hands}
    sets.precast.JA['Feint'] = {}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret +1",waist="Impulse Belt"}
	----------------------
    -- Weaponskill sets
	----------------------
	
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Yetshila",
		head=Adhemar_head,neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Brutal Earring",
		body=Adhemar_body,hands="Meghanada Gloves +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=TP_Back,waist=gear.ElementalBelt,legs=Samnuha_Tights,feet=Herc_feet_TP_TA}
	sets.precast.WS['Ilvl~118'] 	= set_combine(sets.precast.WS, 				{})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], 	{})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], 	{})
	sets.precast.WS.SA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.TA 	 			= set_combine(sets.precast.WS, 				{})
	sets.precast.WS.SATA 			= set_combine(sets.precast.WS, 				{})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Exenterator']['Ilvl~118'] 		= set_combine(sets.precast.WS['Exenterator'], {})
	sets.precast.WS['Exenterator']['Ilvl~122'] 		= set_combine(sets.precast.WS['Exenterator']['Ilvl~118'], {})
	sets.precast.WS['Exenterator']['Ilvl~124+'] 	= set_combine(sets.precast.WS['Exenterator']['Ilvl~122'], {})
    sets.precast.WS['Exenterator'].SA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA 				= set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SATA 			= set_combine(sets.precast.WS['Exenterator'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Dancing Edge'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge']['Ilvl~118'] 		= set_combine(sets.precast.WS['Dancing Edge'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~122'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~118'], {})
	sets.precast.WS['Dancing Edge']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Dancing Edge']['Ilvl~122'], {})
    sets.precast.WS['Dancing Edge'].SA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].TA 					= set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SATA 				= set_combine(sets.precast.WS['Dancing Edge'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Evisceration'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Evisceration']['Ilvl~118'] 		= set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration']['Ilvl~122'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~118'], {})
	sets.precast.WS['Evisceration']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Evisceration']['Ilvl~122'], {})
    sets.precast.WS['Evisceration'].SA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA 					= set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SATA 				= set_combine(sets.precast.WS['Evisceration'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Rudra's Storm"] 					= set_combine(sets.precast.WS, {body="Meghanada Cuirie +1"})
    sets.precast.WS["Rudra's Storm"]['Ilvl~118'] 		= set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~122'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~118'], {})
	sets.precast.WS["Rudra's Storm"]['Ilvl~124+'] 		= set_combine(sets.precast.WS["Rudra's Storm"]['Ilvl~122'], {})
    sets.precast.WS["Rudra's Storm"].SA 				= set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].TA 				= set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].SATA 				= set_combine(sets.precast.WS["Rudra's Storm"], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS["Shark Bite"] 						= set_combine(sets.precast.WS, {})
    sets.precast.WS['Shark Bite']['Ilvl~118'] 			= set_combine(sets.precast.WS["Shark Bite"], {})
	sets.precast.WS['Shark Bite']['Ilvl~122'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~118'], {})
	sets.precast.WS['Shark Bite']['Ilvl~124+'] 			= set_combine(sets.precast.WS['Shark Bite']['Ilvl~122'], {})
    sets.precast.WS['Shark Bite'].SA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].TA 					= set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SATA 					= set_combine(sets.precast.WS['Shark Bite'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Mandalic Stab'] 					= set_combine(sets.precast.WS, {})
    sets.precast.WS['Mandalic Stab']['Ilvl~118'] 		= set_combine(sets.precast.WS['Mandalic Stab'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~122'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~118'], {})
	sets.precast.WS['Mandalic Stab']['Ilvl~124+'] 		= set_combine(sets.precast.WS['Mandalic Stab']['Ilvl~122'], {})
    sets.precast.WS['Mandalic Stab'].SA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].TA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].SATA 				= set_combine(sets.precast.WS['Mandalic Stab'], {})
	----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = {
		head=Herc_head_FC,neck="Atzintli Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Ramuh Ring",ring2="Petrov Ring",
		back="Aput Mantle",waist="Aquiline Belt",legs=Herc_legs_TP,feet=Herc_feet_FC}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",hands="Buremte Gloves",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head=Herc_head_FC,ear1="Loquacious Earring",ear2="Enchanter Earring +1",
		body="Foppish Tunica",ring1="Veneficium Ring",ring2="Prolix Ring",
		legs=Rawhide_legs,feet=Herc_feet_FC}
		
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Smilodon Mask +1",neck="Lissome Necklace",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		head="Smilodon Mask +1",neck="Lissome Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Repulse Mantle",waist="Flume Belt",legs=Herc_legs_TP,feet=Herc_feet_TP_Acc}

    sets.idle.Town = {
		head=Adhemar_head,neck="Asperity Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Epona's Ring",ring2="Petrov Ring",
		back=DW_back,waist="Patentia Sash",legs=Herc_legs_TP,feet="Fajin Boots"}

    sets.idle.Weak = {
		head="Smilodon Mask +1",neck="Lissome Necklace",ear1="Genmei Earring",ear2="Infused Earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Repulse Mantle",waist="Flume Belt",legs=Herc_legs_TP,feet=Herc_feet_TP_Acc}

    -- Defense sets

    sets.defense.Evasion = {
        head=Herc_head_TP,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body=Adhemar_body,
		back=DW_back,waist="Sveltesse Gouriz +1",legs=Herc_legs_TP,feet=Herc_feet_TP}
	
    sets.defense.PDT = {
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Vocane Ring",ring2="Defending Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}

    sets.defense.MDT = {
		head="Fugacity Beret +1",neck="Loricate Torque +1",ear1="Merman's earring",ear2="Merman's earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP}

	-------------------------------------------------------------------
    ---------- ********   Engaged sets  ********* ---------------
	-------------------------------------------------------------------
	-------------------------------------------------------------------
    ---------- ********   Normal melee group  ********* ---------------
	-------------------------------------------------------------------
	
	sets.engaged 				= {ammo="Ginsen",
								head=Adhemar_head,neck="Erudition Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
								body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
								back=TP_back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc}
    sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged, 			{neck="Lissome Necklace"})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'], {head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {neck="Ej Necklace",ring1="Rajas Ring"})
	
	-- evasion sets
	sets.engaged.Evasion 				= set_combine(sets.engaged,{})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, {})
	sets.engaged['Ilvl~122'].Evasion 	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})

	---------------------------------------------------------------------------------------------------
    -- Custom melee group: low to no haste (41+% DW)
	---------------------------------------------------------------------------------------------------
	sets.engaged['DW: 37+'] 				= set_combine(sets.engaged, 						{ammo="Ginsen",
																								head=Adhemar_head,neck="Erudition Necklace",ear1="Suppanomimi",ear2="Eabani Earring",
																								body=Adhemar_body,hands=Floral_Gauntlets,ring1="Epona's Ring",ring2="Petrov Ring",
																								back=DW_back,waist="Patentia Sash",legs=Herc_legs_DW,feet=Taeon_feet_DW})
	sets.engaged['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged['DW: 37+'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 37+'], 	{head=Dampening_Tam,neck="Erudition Necklace"})
	sets.engaged['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'], 	{neck="Ej Necklace"})
	
	-- evasion sets
	sets.engaged['DW: 37+'].Evasion 				= set_combine(sets.engaged.Evasion,							{})
	sets.engaged['Ilvl~118']['DW: 37+'].Evasion 	= set_combine(sets.engaged['DW: 37+'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 37+'].Evasion		= set_combine(sets.engaged['Ilvl~118']['DW: 37+'].Evasion,	{})
	sets.engaged['Ilvl~124+']['DW: 37+'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'].Evasion,	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			
	-- Custom melee group: High Haste (11% DW)              
	---------------------------------------------           
	
	sets.engaged['DW: 6-11'] 				= set_combine(sets.engaged['DW: 37+'] , 				{ear2="Brutal Earring",
																									hands=Adhemar_hands,
																									back=TP_Back,waist="Windbuffet Belt +1",legs=Samnuha_Tights,feet=Herc_feet_TP_Acc})
	sets.engaged['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged['DW: 6-11'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'], 	{head=Dampening_Tam})
	sets.engaged['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'], 	{neck="Ej Necklace",waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 6-11'].Evasion 				= set_combine(sets.engaged['DW: 37+'] .Evasion, 				{})
	sets.engaged['Ilvl~118']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['DW: 6-11'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'].Evasion, 	{})
	sets.engaged['Ilvl~124+']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			
	-- Custom melee group: Max Haste (-2% DW)            
	-----------------------------------------           
	
	sets.engaged['DW: 5-0'] 				= set_combine(sets.engaged['DW: 6-11'],				{ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Meg. Cuirie +1",})
	sets.engaged['Ilvl~118']['DW: 5-0'] 	= set_combine(sets.engaged['DW: 5-0'], 				{neck="Lissome Necklace",ring2="Apate Ring"})
	sets.engaged['Ilvl~122']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'], 	{head=Dampening_Tam,ring1="Ramuh Ring",})
	sets.engaged['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'], 	{neck="Ej Necklace",waist="Grunfeld Rope"})
					
	-- evasion sets                                        
	sets.engaged['DW: 5-0'].Evasion 					= set_combine(sets.engaged['DW: 6-11'].Evasion , 			{})
	sets.engaged['Ilvl~118']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['DW: 5-0'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'].Evasion, 	{})
	sets.engaged['Ilvl~124+']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'].Evasion, 	{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	----------------------
	-- Miscealeus sets
	----------------------
	
	--sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring"}
end
 

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if not midaction() then
		if spell.type == 'WeaponSkill' then
			if player.tp < 2850 then
				gear.ws_ear.name = gear.TP_Bonus_Ear.name
			else
				gear.ws_ear.name = gear.Max_TP_Ear
			end
		end
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
	if spell.type == 'WeaponSkill' then		
		if state.Buff["Reive Mark"] then
			equip(sets.buff.Reive)
		end
	end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	if state.OffenseMode.value == 'Normal' then
		state.WeaponskillMode:set('Normal')
	elseif state.OffenseMode.value == ('Ilvl~118') then
		state.WeaponskillMode:set('Ilvl~118')
	elseif state.OffenseMode.value == ('Ilvl~122') then
		state.WeaponskillMode:set('Ilvl~122')
	elseif state.OffenseMode.value == ('Ilvl~124+') then
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
		end
	end
	if field == "MagicalDefense" or field == "PhysicalDefense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain, buff_info)
	--add_to_chat(200, buff .. '  ' .. tostring(gain) )

	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end

    if not midaction() then
		handle_equipping_gear(player.status)
	end
end

function job_status_change(new_status, old_status)
	handle_equipping_gear(player.status)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
	update_combat_form()
    check_range_lock()
	determine_haste_group()
    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
	check_moving()
	update()
end

function customize_idle_set(idleSet)
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
		if state.Auto_Kite.value == true then
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end
    return idleSet
end


function customize_melee_set(meleeSet)
	lockouts()
	
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	
	if state.Buff.sleep then
		local helm = false
		local helm_name = ''
		
		if pplayer.inventory['Frenzy Sallet'] or player.wardrobe['Frenzy Sallet'] or player.wardrobe2['Frenzy Sallet'] or player.wardrobe3['Frenzy Sallet']  or player.wardrobe4['Frenzy Sallet']  then
			helm_name ={ name="Frenzy Sallet" }
			helm = true
		end
		
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 2 and helm == true then
					meleeSet = set_combine(meleeSet, {head=helm_name})
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping -> \"' .. helm_name .. '\" '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 2 then
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Nightmare'):color(warning_text)  .. (' while Engaged *****__\\||//__'):color(text_color) )
				end
			end
		end
	end
	if state.DefenseMode.current == 'None' then 
		if state.Buff["Reive Mark"] then
			meleeSet = set_combine(meleeSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
		if state.TreasureMode.value == 'Fulltime' then
			meleeSet = set_combine(meleeSet, sets.TreasureHunter)
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
	
	if state.Buff.sleep then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 19 then
					defenseSet = set_combine(defenseSet, sets.buff.sleep)
					add_to_chat(200,('__\\||//__***** Status '):color(text_color) .. ('Sleep'):color(warning_text)  .. (' while Engaged:'):color(text_color) .. (' Equiping Frenzy Sallet '):color(Notification_color) .. ('*****__\\||//__'):color(text_color) )
					if state.Buff.Stoneskin then
						send_command('cancel 37')
						add_to_chat(200,('[Cancelling '):color(Notification_color) .. ('Stoneskin'):color(warning_text) .. (' to wake up.]'):color(Notification_color) )
					end
				elseif buff == 2 then
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

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
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

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	
    local msg = ('[Melee'):color(Notification_color)
    
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
    
	msg = msg .. ('[TH Mode: '):color(Notification_color).. (state.TreasureMode.value):color(warning_text) .. (' ] '):color(Notification_color)
	
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ('[Target PC: '):color(Notification_color)..state.PCTargetMode.value .. ('] '):color(Notification_color)
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ('[Target NPCs'):color(Notification_color).. ('] '):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)

    eventArgs.handled = true
	save_settings()
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

function determine_haste_group()

	classes.CustomMeleeGroups:clear()
	-- Choose gearset based on DW needed
	if DW == true then
		if DW_needed < 6 then
			classes.CustomMeleeGroups:append('DW: 5-0')
		elseif DW_needed > 5 and DW_needed < 12 then
			classes.CustomMeleeGroups:append('DW: 6-11')
		elseif DW_needed > 11 then
			classes.CustomMeleeGroups:append('DW: 37+')
		end
	end

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
	
end


-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.TreasureMode then
        properties:append('${TreasureMode|0}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.RangedMode then
        properties:append('${RangedMode}')
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
				if i < #classes.CustomMeleeGroups then 
					msg = msg .. ' + ' 
				end
				if i == #classes.CustomMeleeGroups then 
					msg = msg .. ')' 
				end
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
		
	if state.DefenseMode.value == 'None' then
		inform.TreasureMode = (purple .. ('\n [Treasure Mode: '.. white .. state.TreasureMode.value:lpad(' ', 2) .. purple ..'] ' )) .. '\\cr'
	else
		inform.TreasureMode = (red .. ('\n [Treasure Mode: '..state.TreasureMode.value:lpad(' ', 2) .. ']' )) .. '\\cr'
	end
	
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: ' .. white..state.IdleMode.value:lpad(' ', 2) .. blue ..']' )) .. '\\cr'
		inform.RangedMode = (blue .. (' [Ranged: ' .. white..state.RangedMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. ']' )) .. '\\cr'
		inform.RangedMode = (red .. (' [Ranged: '..state.RangedMode.value:lpad(' ', 2) .. ']' )) .. '\\cr'
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
