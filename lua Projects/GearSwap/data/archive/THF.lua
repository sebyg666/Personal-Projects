-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('Haste2_parsing.lua')
include('Organizer-lib.lua')
res = require('resources')
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
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
	state.Buff.sleep = buffactive.sleep or false
	state.Buff.Stoneskin =  buffactive.stoneskin or false
	state.Buff.doom = buffactive.doom or false
	state.Buff['Geo-Haste'] = false
	state.Buff['MyHaste'] = false
	state.Buff['Haste II'] = false
	state.Buff['Marches'] = 0
	state.Buff['Hsamba'] = false
	DW_needed = 0
    
    include('Mote-TreasureHunter')
	
	info.haste = 'None'
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
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
	state.MagicalDefenseMode:options('MDT')

    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Caudata Belt"
	
	state.CP  				= M(false, 'CP')
	state.OneirosRing 		= M(false, 'Oneiros Ring')
	
	state.PhysicalDefense   = M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	
    -- Additional local binds
	
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind ^f12 gs c cycle CastingMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind @F11 gs c cycle treasuremode')
	send_command('bind !F11 gs c toggle OneirosRing') 
	send_command('bind @] gs c cycle HybridMode')
	send_command('bind ^] gs c cycle RangedMode')
	
	Ring_lock = S{"Warp Ring", "Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring", "Dim. Ring (Dem)"}
	Ear_lock = S{"Reraise Earring"}
	Max_Bards = S{'Kittensgomew', 'Darklabyrinth'}
	
	info.haste = 'None'
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	include('Haste2_parsing.lua')
	res = require('resources')
		
    select_default_macro_book()
	determine_haste_group()
	
	defaults = {}
	defaults.display = {}
	defaults.display.pos = {}
	defaults.display.pos.x = 1085
	defaults.display.pos.y = 550
	defaults.display.bg = {}
	defaults.display.bg.red = 0
	defaults.display.bg.green = 0
	defaults.display.bg.blue = 0
	defaults.display.bg.alpha = 150
	defaults.display.bg.visible = true
	defaults.display.flags = {}
	defaults.display.flags.draggable = false
	defaults.display.text = {}
	defaults.display.text.font = 'Consolas'
	defaults.display.text.red = 255
	defaults.display.text.green = 255
	defaults.display.text.blue = 255
	defaults.display.text.alpha = 255
	defaults.display.text.size = 12
	defaults.display.text.stroke = {}
	defaults.display.text.stroke.width = 2
	defaults.display.text.stroke.alpha = 255
	defaults.display.text.stroke.red = 0
	defaults.display.text.stroke.green = 0
	defaults.display.text.stroke.blue = 0

	old_inform = {}
	text_box = texts.new(defaults.display, defaults)
	
	text_box:register_event('reload', initialize)
	
	initialize(text_box)

end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

end

-- Define sets and vars used by this job file.
function init_gear_sets()

	print('Ewellina_THF_Gear.lua sidecar load')

	--------------------------------------
	-- Augemnted Gear
	--------------------------------------	
	
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
        head=Herc_head_TP,neck="Twilight Torque",ear1="Genmei Earring",ear2="Infused Earring",
		body=Adhemar_body,
		back=DW_back,waist="Sveltesse Gouriz +1",legs=Herc_legs_TP,feet=Herc_feet_TP}
	
    sets.defense.PDT = {
		head="Meghanada Visor +1",neck="Twilight Torque",ear1="Genmei Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Vocane Ring",ring2="Defending Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Meghanada Chausses +1",feet=Herc_feet_TP_Acc}

    sets.defense.MDT = {
		head="Fugacity Beret +1",neck="Twilight Torque",ear1="Merman's earring",ear2="Merman's earring",
		body=Adhemar_body,hands=Herc_hands_WS,ring1="Vocane Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=Kaabnax_legs,feet=Herc_feet_TP}

	-------------------------------------------------------------------
    ---------- ********   Engaged sets  ********* ---------------
	-------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	-------------------------------------------------------------------
    ---------- ********   Normal melee group  ********* ---------------
	-------------------------------------------------------------------
	
	sets.engaged 				= {	ammo="Ginsen",
									head=Adhemar_head,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
									body=Adhemar_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
									back=DW_back,waist="Patentia Sash",legs=Samnuha_Tights,feet=Herc_feet_TP_TA}
    sets.engaged['Ilvl~118'] 	= set_combine(sets.engaged, 			{neck="Lissome Necklace"})
	sets.engaged['Ilvl~122'] 	= set_combine(sets.engaged['Ilvl~118'], {head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {neck="Ej Necklace",ring1="Rajas Ring",feet=Herc_feet_TP_Acck})
	
	sets.engaged.Evasion 				= set_combine(sets.engaged,{})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, {})
	sets.engaged['Ilvl~122'].Evasion 	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})
	
	sets.engaged.PDT 				= set_combine(sets.engaged,{})
	sets.engaged['Ilvl~118'].PDT 	= set_combine(sets.engaged.PDT, {})
	sets.engaged['Ilvl~122'].PDT 	= set_combine(sets.engaged['Ilvl~118'].PDT, {})
	sets.engaged['Ilvl~124+'].PDT 	= set_combine(sets.engaged['Ilvl~122'].PDT, {})

	---------------------------------------------------------------------------------------------------
    ---------- ********     ********* ---------------
	---------------------------------------------------------------------------------------------------
	sets.engaged.HighHaste					= set_combine(sets.engaged, 						{ear1="Bladeborn Earring",ear2="Steelflash Earring",back=TP_Back,waist="Windbuffet Belt +1",feet=Herc_feet_TP_TA})
    sets.engaged['Ilvl~118'].HighHaste 		= set_combine(sets.engaged.HighHaste, 				{neck="Lissome Necklace"})
	sets.engaged['Ilvl~122'].HighHaste 		= set_combine(sets.engaged['Ilvl~118'].HighHaste, 	{head=Dampening_Tam,neck="Sanctity Necklace",waist="Grunfeld Rope"})
	sets.engaged['Ilvl~124+'].HighHaste 	= set_combine(sets.engaged['Ilvl~122'].HighHaste, 	{neck="Ej Necklace",ring1="Rajas Ring",feet=Herc_feet_TP_Acc})
	
	sets.engaged.Evasion.HighHaste 				= set_combine(sets.engaged.HighHaste, {})
	sets.engaged['Ilvl~122'].Evasion.HighHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.HighHaste, {})
	sets.engaged['Ilvl~124+'].Evasion.HighHaste = set_combine(sets.engaged['Ilvl~122'].Evasion.HighHaste, {})
	
	sets.engaged.PDT.HighHaste 				= set_combine(sets.engaged.HighHaste, {})
	sets.engaged['Ilvl~118'].PDT.HighHaste 	= set_combine(sets.engaged.PDT.HighHaste, {})
	sets.engaged['Ilvl~122'].PDT.HighHaste 	= set_combine(sets.engaged['Ilvl~118'].PDT.HighHaste, {})
	sets.engaged['Ilvl~124+'].PDT.HighHaste = set_combine(sets.engaged['Ilvl~122'].PDT.HighHaste, {})

	---------------------------------------------------------------------------------------------------
    ---------- ********       ********* ---------------
	---------------------------------------------------------------------------------------------------
	
	sets.engaged.MaxHaste 				= set_combine(sets.engaged.HighHaste, {ear1="Bladeborn Earring",ear2="Steelflash Earring",waist="Windbuffet Belt +1"})
    sets.engaged['Ilvl~118'].MaxHaste 	= set_combine(sets.engaged.MaxHaste, {})
	sets.engaged['Ilvl~122'].MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].MaxHaste, {})
	sets.engaged['Ilvl~124+'].MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].MaxHaste, {})
	
	sets.engaged.Evasion.MaxHaste 				= set_combine(sets.engaged.MaxHaste, {})
	sets.engaged['Ilvl~118'].Evasion.MaxHaste 	= set_combine(sets.engaged.Evasion.MaxHaste, {})
	sets.engaged['Ilvl~122'].Evasion.MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].Evasion.MaxHaste, {})
	sets.engaged['Ilvl~124+'].Evasion.MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].Evasion.MaxHaste, {})
	
	sets.engaged.PDT.MaxHaste 				= set_combine(sets.engaged.MaxHaste, {})
	sets.engaged['Ilvl~118'].PDT.MaxHaste 	= set_combine(sets.engaged.PDT.MaxHaste, {})
	sets.engaged['Ilvl~122'].PDT.MaxHaste 	= set_combine(sets.engaged['Ilvl~118'].PDT.MaxHaste, {})
	sets.engaged['Ilvl~124+'].PDT.MaxHaste 	= set_combine(sets.engaged['Ilvl~122'].PDT.MaxHaste, {})
	
	----------------------
	-- Miscealeus sets
	----------------------
	
	--sets.Rancor = {neck="Rancor Collar"}
	sets.buff.sleep = {head="Frenzy Sallet"}
	sets.buff.Doom = {ring1="Saida Ring",ring2="Blenmot's Ring"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
end
 

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

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
	if buff == 'Haste' and gain == true then
		if buff_info.id == 580 then 
			state.Buff['Geo-Haste'] = true 
		elseif buff_info.id == 33 then 
			state.Buff['Haste'] = true
		end
	elseif buff == 'Haste' and gain == false then
		if buff_info.id == 580 then 
			state.Buff['Geo-Haste'] = false 
		elseif buff_info.id == 33 then 
			state.Buff['Haste'] = false
			state.Buff['Haste II'] = false
		end
	end
	if state.Buff[buff] ~= nil and buff ~= 'Haste' then
		state.Buff[buff] = gain
	end

	--Change_Marches()
    handle_equipping_gear(player.status)
end

function job_status_change(new_status, old_status)
	if new_status == 'Idle' then
		info['Hsamba'] = false
    end
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
    check_range_lock()
	determine_haste_group()
    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
	if state.Buff.doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	---------------------------------
	if Ring_lock:contains(player.equipment.ring1) and areas.Cities:contains(world.area) then
		enable('ring1')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ring_lock:contains(player.equipment.ring1) then
		disable('ring1')
	end
	if Ring_lock:contains(player.equipment.ring2) and areas.Cities:contains(world.area) then
		enable('ring2')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ring_lock:contains(player.equipment.ring2) then
		disable('ring2')
	end
	---------------------------------
	if Ear_lock:contains(player.equipment.ear1) and areas.Cities:contains(world.area) then
		enable('Ear1')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ear1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) and areas.Cities:contains(world.area) then
		enable('Ear2')
		add_to_chat(200,('[In Town: '):color(Notification_color) .. ('-> Removing \"'..player.equipment.ear2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
	elseif Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	end
	if state.DefenseMode.current == 'None' then
		if state.Buff["Reive Mark"] then
			idleSet = set_combine(idleSet, sets.buff.Reive)
		end
		if state.CP.value == true then
			idleSet = set_combine(idleSet, sets.CP)
		end
	end
    return idleSet
end


function customize_melee_set(meleeSet)
	if Ring_lock:contains(player.equipment.ring1) then
		enable('ring1')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	if Ring_lock:contains(player.equipment.ring2) then
		enable('ring2')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	--------------------------------------
	if Ear_lock:contains(player.equipment.ear1) then
		enable('ear1')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ear1 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	if Ear_lock:contains(player.equipment.ear2) then
		enable('ear2')
		add_to_chat(200,('[Mob Engaged: '):color(warning_text) .. ('-> Removing \"'..player.equipment.ear2 .. '\"'):color(text_color) .. (']'):color(warning_text) )
	end
	---------------------------------------
	if state.OneirosRing.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' then
		if player.mp > 99 then
			meleeSet = set_combine(meleeSet, sets.TA_Ring)
		end
	end
    if state.Buff.doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
    end
	
	if state.Buff.sleep then
		if player.buffs then
			for index, buff in pairs(player.buffs) do
				if buff == 19 then
					meleeSet = set_combine(meleeSet, sets.buff.sleep)
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

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    state.Buff['Geo-Haste'] = false
	state.Buff['Haste'] = false
	if player.buffs then	
		for index, buff in pairs(player.buffs) do
			if buff == 580 then 
				state.Buff['Geo-Haste'] = true
			elseif buff == 33 then
				state.Buff['Haste'] = true 
			end
		end
	end
	th_update(cmdParams, eventArgs)
	handle_equipping_gear(player.status)
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
	
	if state.OneirosRing.value == true then
		msg = msg .. (' + \"O. Ring\"'):color(text_color)
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
	
	if info.haste ~= 'None' then
		msg = msg .. ('[\"' .. info.haste..'\"'):color(Notification_color) .. (' set @: '..Total_haste..'/1024 || DW: ' .. DW_needed):color(text_color) .. (']'):color(Notification_color)
	end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
	
	-- HASTE INFO
    -------------------------------------------------------------------------------------------------
	-- Haste Samba = 5% 			51/1024
	
	-- haste = 14.7%    			150/1024				-- haste II = 30%    			307/1024
	
	-- Advancing March = 6.3%   	64/1024					-- Victory March = 9.4%   		96/1024
	-- Advancing March +1 = 7.9%   	80/1024                 -- Victory March +1 = 11%		112/1024
	-- Advancing March +2 = 9.4%   	96/1024                 -- Victory March +2 = 12.5%     128/1024
	-- Advancing March +3 = 11%    	112/1024                -- Victory March +3 = 14.1%     144/1024
	-- Advancing March +4 = 12.6	128/1024                -- Victory March +4 = 15.7%		160/1024
	-- Advancing March +5 = 14.1	144/1024                -- Victory March +5 = 17.2%		176/1024

	-------------------------------------------------------------------------------------------------
	-- magic haste cap = 43.8% 		448/1024
	-- Equipment haste cap = 25%	256/1024
	-- Job Ability haste cap = 25%	256/1024
	-- Ninja base Dual Weild = 35%	358/1024
	-- Total cap = 80%				820/1024	
	
	-- delay calc
	-- (delay1 + delay2) x (1-DW%) x (1024 - haste)/1024 >= (delay1 + delay2) x 0.2 
	-- total weapon delay x dual wiled x haste >= (has to be higher or equal to 80% of total delay)
	-- DW_needed = math.floor((((Total_Weapon_Delay * 0.2) / Total_Weapon_Delay / ((1024 - Total_haste) / 1024 ) -1) * -1 * 100) - Ninja_DW)
	
	
   info.haste = 'None'
	-- state.Buff['Geo-Haste']
	-- Magic Haste
	local M_Haste = 0
	if buffactive.embrava then 
		M_Haste = M_Haste + 205 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Embrava '))
	end
	if buffactive['Mighty Guard'] then 
		M_Haste = M_Haste + 150 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Mighty Guard '))
	end
	if state.Buff['Geo-Haste'] then 
		M_Haste = M_Haste + 358
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Geo '))
	end
	if state.Buff['Haste'] and not state.Buff['Haste II'] then 
		M_Haste = M_Haste + 150 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Haste 1 '))
	end
	if state.Buff['Haste'] and state.Buff['Haste II'] then 
		M_Haste = M_Haste + 307 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Haste 2 '))
	end
	
	if buffactive.march == 1 and state.Buff['Marches'] == 0 then 
		M_Haste = M_Haste + 96
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 1 March '))
	elseif buffactive.march == 1 and state.Buff['Marches'] ~= 0 then 
		M_Haste = M_Haste + state.Buff['Marches'] 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	end
	if buffactive.march == 2 and state.Buff['Marches'] == 0 then 
		M_Haste = M_Haste + 160
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	elseif buffactive.march == 2 and state.Buff['Marches'] ~= 0 then 
		M_Haste = M_Haste + state.Buff['Marches'] 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	end
	if buffactive['Slow'] then 
		M_Haste = M_Haste - 150 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Slow '))
	end
	if buffactive['Elegy'] then 
		M_Haste = M_Haste - 256 
		--add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Elegy '))
	end
	
	-- magic haste cap
	if M_Haste > 448 then M_Haste = 448 end
	
	-- JA haste
	local JA_Haste = 0
	if buffactive['haste samba'] or info['Hsamba'] then JA_Haste = JA_Haste + 51 end
	
	--add_to_chat(122, 'samba: '..tostring(info['Hsamba']))
	
	
	--JA haste cap
	if JA_Haste > 256 then JA_Haste = 256 end
	
	-- gear haste
	local Gear_Haste = 256
	
	-- Calcs
	-- local Total_haste = 0
	Total_haste = M_Haste + JA_Haste + Gear_Haste
	if Total_haste > 820 then Total_haste = 820 end
	
	local Main = ""
	local Sub = ""
	if player.equipment.main ~= "empty" then
		Main = res.items:with('en', player.equipment.main)
	end
	if player.equipment.sub ~= "empty" then
		Sub = res.items:with('en', player.equipment.sub)
	end
	if Main ~= "" and Main ~= nil and Sub ~= "" and Sub ~= nil then
		if Sub.category == "Armor" then
			Total_Weapon_Delay = 0
		else
			Total_Weapon_Delay = Main.delay + Sub.delay
		end
	else
		Total_Weapon_Delay = 0
	end
	
	THF_DW = 25
	
	DW_needed = math.floor((((Total_Weapon_Delay * 0.2) / Total_Weapon_Delay / ((1024 - Total_haste) / 1024 ) -1) * -1 * 100) - THF_DW)
	
	classes.CustomMeleeGroups:clear()
	-- Choose gearset based on DW needed
	if DW_needed <= 11 then
		classes.CustomMeleeGroups:append('MaxHaste')
		info.haste = 'MaxHaste'
	elseif DW_needed > 11 and DW_needed < 26 then
		classes.CustomMeleeGroups:append('HighHaste')
		info.haste = 'HighHaste'
	elseif DW_needed > 25 then
		classes.CustomMeleeGroups:append('NoHaste')
		info.haste = 'NoHaste'
	end
	--add_to_chat(122,'Marches = '..tostring(state.Buff['Marches']) .. ' / geo = '..tostring(state.Buff['Geo-Haste']).. ' / haste = '..tostring(state.Buff['MyHaste']).. ' / haste2 = '..tostring(state.Buff['Haste II']))
	
	--add_to_chat(122, 'DW needed: '..DW_needed..' Haste: '..Total_haste..' / 1024  ....   Gearset: '..info.haste)
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
	if state.OneirosRing then
        properties:append('${OneirosRing}')
    end
	if info.haste then
		properties:append('${haste}')
	end
	if state.DefenseMode then
        properties:append('${DefenseMode}')
    end
    text:clear()
    text:append(properties:concat(''))
end

-- causes great lag from inside gearswap
-- windower.register_event('incoming chunk',function(id)
    -- if id == 0xB and text_box:visible() then
        -- zoning_bool = true
    -- elseif id == 0xA and zoning_bool then
        -- zoning_bool = nil
    -- end
-- end)

preRenderID = windower.register_event('prerender', function()
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
        text_box:hide()
        return
    end
    if zoning_bool then
        text_box:hide()
        return
	else
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
		
		if state.HybridMode.value ~= 'Normal' then
			msg = msg .. state.OffenseMode.value .. ' + ' .. state.HybridMode.value .. '] '
		else
			msg = msg .. state.OffenseMode.value .. '] '
		end
		
		if state.DefenseMode.value ~= 'None' then
			msg = msg .. ' LOCKED '
		end
		
        if state.DefenseMode.value ~= 'None' then 
			inform.OffenseMode = ('\\cs(255,0,0)' .. (msg)) .. '\\cr'
		else
			inform.OffenseMode = ('\\cs(0,255,0)' .. (msg)) .. '\\cr'
		end
			
		if state.DefenseMode.value == 'None' then
			inform.TreasureMode = ('\\cs(150,150,255)' .. ('\n [Treasure Mode: '..state.TreasureMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		else
			inform.TreasureMode = ('\\cs(255,0,0)' .. ('\n [Treasure Mode: '..state.TreasureMode.value:lpad(' ', 2) .. '] LOCKED' )) .. '\\cr'
		end
		
		inform.CastingMode = ('\\cs(0,255,0)' .. ('\n [Casting: '..state.CastingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		
		if state.DefenseMode.value == 'None' then
			inform.IdleMode = ('\\cs(0,255,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. ']' )) .. '\\cr'
			inform.RangedMode = ('\\cs(0,255,0)' .. (' [Ranged: '..state.RangedMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
		else
			inform.IdleMode = ('\\cs(255,0,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. ']' )) .. '\\cr'
			inform.RangedMode = ('\\cs(255,0,0)' .. (' [Ranged: '..state.RangedMode.value:lpad(' ', 2) .. '] LOCKED ' )) .. '\\cr'
		end
			
		if state.DefenseMode.value == 'None' then
			if state.Kiting.value == true and state.CP.value == true then
				inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
				inform.CP = ('\\cs(232,138,13)' .. ('[CP Cape] ' )) .. '\\cr'
			elseif state.Kiting.value == true and state.CP.value == false then
				inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
				inform.CP = ('')
			elseif state.Kiting.value == false and state.CP.value == true then
				inform.Kiting = ('')
				inform.CP = ('\\cs(232,138,13)' .. ('\n [CP Cape] ' )) .. '\\cr'
			elseif state.Kiting.value == false and state.CP.value == false then
				inform.Kiting = ('')
				inform.CP = ('')
			end
		else
			if state.Kiting.value == true and state.CP.value == true then
				inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
				inform.CP = ('\\cs(255,0,0)' .. ('[CP Cape] LOCKED ' )) .. '\\cr'
			elseif state.Kiting.value == true and state.CP.value == false then
				inform.Kiting = ('\\cs(255,255,0)' .. ('\n [Kiting] ' )) .. '\\cr'
				inform.CP = ('')
			elseif state.Kiting.value == false and state.CP.value == true then
				inform.Kiting = ('')
				inform.CP = ('\\cs(255,0,0)' .. ('\n [CP Cape] LOCKED ' )) .. '\\cr'
			elseif state.Kiting.value == false and state.CP.value == false then
				inform.Kiting = ('')
				inform.CP = ('')
			end
		end
		
		if state.DefenseMode.value == 'None' then
			if state.OneirosRing. value == true then
				inform.OneirosRing = ('\\cs(150,150,255)' .. ('\n [Oneiros Ring] ' )) .. '\\cr'
			else
				inform.OneirosRing = ('')
			end
		else
			if state.OneirosRing. value == true then
				inform.OneirosRing = ('\\cs(255,0,0)' .. ('\n [Oneiros Ring] LOCKED ' )) .. '\\cr'
			else
				inform.OneirosRing = ('')
			end
		end
		
		if info.haste ~= 'None' then
			inform.haste = ('\\cs(213,43,196)' .. ('\n [Haste: '..Total_haste..'/1024] [DW: ' .. DW_needed .. '] ')) .. '\\cr'
		end
		
		if state.DefenseMode.value ~= 'None' then
			inform.DefenseMode = ('\\cs(255,0,0)' .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')]' )) .. '\\cr'
		else
			inform.DefenseMode = ('')
		end
		
		if old_inform ~= inform then
			text_box:update(inform)
			text_box:show()
			old_inform = inform
		end
    end
end)

windower.register_event('unload', function()
	windower.unregister_event(preRenderID)
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
    windower.unregister_event(preRenderID)
	text_box:destroy()
	text_box = nil
end)

function select_default_macro_book()
end
