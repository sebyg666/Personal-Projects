-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
res = require('resources')
spells = res.spells:type('BlueMagic')

include('Organizer-lib.lua')
--include('Haste2_parsing.lua')

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')	
	include('Mote-SelfCommands_with_color.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
	state.Buff.Sange = buffactive.Sange or false
	state.Buff["Reive Mark"] = buffactive["Reive Mark"] or false
	state.Buff['Geo-Haste'] = false
	state.Buff['Haste'] = false
	state.Buff['Haste II'] = false
	state.Buff['Marches'] = 0
	info['Hsamba'] = false		
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.HybridMode:options('Normal', 'Evasion')
    state.WeaponskillMode:options('Normal', 'Ilvl~118', 'Ilvl~122', 'Ilvl~124+')
    state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
	options.MagicalDefenseModes = {'MDT'}
	
	state.Rancor 			= M(false, 'Rancor Collar')
	state.OneirosRing 		= M(false, 'Oneiros Ring')
	state.CP  				= M(false, 'CP')
	
	state.PhysicalDefense   = M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	
	gear.DakanAmmo = {name="Happo Shuriken"}
	
	gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Danzo Sune-ate"
    
	send_command('bind !f12 gs c cycle IdleMode')
	send_command('bind @] gs c cycle HybridMode')
	send_command('bind ^F11 gs c cycle CP')
	send_command('bind ^F12 gs c cycle CastingMode')
	send_command('bind @F11 gs c toggle OneirosRing')
	
	items_needed = S{"Shihei", "Inoshishinofuda", "Shikanofuda", "Chonofuda", "Happo Shuriken", "Toolbag (Shihe)", "Toolbag (Ino)", "Toolbag (Shika)", "Toolbag (Cho)", "Hap. Sh. Pouch", "Capacity Ring","Facility Ring","Caliber Ring"}
	Ring_lock = S{"Warp Ring", "Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring", "Dim. Ring (Dem)"}
	Ear_lock = S{"Reraise Earring"}
	Two_Handed = S{'Hoe', 'Pitchfork +1', 'Ark Tachi', 'Fire Staff'}
	Max_Bards = S{'Kittensgomew', 'Darklabyrinth'}
	ShunDays = S{'Firesday', 'Lightsday', 'Lightningsday'}
	TenDays = S{'Earthsday','Darksday'}
	
	info.haste = 'None'
	Notification_color = 200
	text_color = 160
	warning_text = 167
	
	DW_needed = 0
	
    select_default_macro_book()
	select_movement_feet()
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
	defaults.display.flags.draggable = true
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
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	gear.default.weaponskill_neck = ""
    gear.default.weaponskill_waist = ""
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Mijin Gakure'] = {}
	sets.precast.JA['Futae'] = {}
	sets.precast.JA['Sange'] = {}
	sets.precast.JA['Provoke'] = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Set for acc on steps, since Yonin drops acc a fair bit
	sets.precast.Step = {}
	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC.NinjutsuIII = set_combine(sets.precast.FC, {})
	
	-- Snapshot for ranged
	sets.precast.RA = {}
    
	------------------------------------------------------ 
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	------------------------------------------------------
	
	sets.precast.WS = {}
	sets.precast.WS['Ilvl~118']  	= set_combine(sets.precast.WS, {})
	sets.precast.WS['Ilvl~122'] 	= set_combine(sets.precast.WS['Ilvl~118'], {})
	sets.precast.WS['Ilvl~124+'] 	= set_combine(sets.precast.WS['Ilvl~122'], {})
	
	-----------------------------------------------------
	sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {})
	-----------------------------------------------------
	sets.precast.WS['Blade: Hi'] 				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Blade: Hi']['Ilvl~118']	= set_combine(sets.precast.WS['Blade: Hi'], {})
	sets.precast.WS['Blade: Hi']['Ilvl~122']	= set_combine(sets.precast.WS['Blade: Hi']['Ilvl~118'], {})
	sets.precast.WS['Blade: Hi']['Ilvl~124+']	= set_combine(sets.precast.WS['Blade: Hi']['Ilvl~122'], {})
	------------------------------------------------------
	sets.precast.WS['Blade: Shun'] 				= set_combine(sets.precast.WS, {})
	sets.precast.WS['Blade: Shun']['Ilvl~118']	= set_combine(sets.precast.WS['Blade: Shun'], {})
	sets.precast.WS['Blade: Shun']['Ilvl~122']	= set_combine(sets.precast.WS['Blade: Shun']['Ilvl~118'], {})
	sets.precast.WS['Blade: Shun']['Ilvl~124+']	= set_combine(sets.precast.WS['Blade: Shun']['Ilvl~122'], {})
	------------------------------------------------------
	sets.precast.WS['Blade: Yu'] 				= set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {})
	------------------------------------------------------
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Blade: Yu'], {})
	-------------------------------------------------------
	sets.precast.MaxTP_Agi = {}
	sets.precast.MaxTP_Dex = {}
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------
	sets.midcast.FastRecast = {}

	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = set_combine(sets.midcast.FastRecast, {})
	sets.midcast["Utsusemi: Ichi"] = set_combine(sets.midcast.SelfNinjutsu, {})
	sets.midcast["Utsusemi: Ni"] = set_combine(sets.midcast["Utsusemi: Ichi"], {})
	sets.midcast["Utsusemi: San"] = set_combine(sets.midcast["Utsusemi: Ichi"], {})

	-- any ninjutsu cast on enemies
	sets.midcast.ElementalNinjutsu = {}
	sets.midcast.NinjutsuIII = set_combine(sets.midcast.ElementalNinjutsu, {})
	sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	sets.midcast.NinjutsuIII.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	sets.midcast.NinjutsuDebuff = {}
	sets.midcast.NinjutsuBuff = set_combine(sets.midcast.SelfNinjutsu, {})
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.RA = {}
	sets.midcast["Flash"] = set_combine(sets.precast.JA['Provoke'], {})
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
	----------------------------------------
	-- Normal melee group: No Haste (38% DW)
	----------------------------------------
	sets.engaged 						= {}
	sets.engaged['Ilvl~118']	= set_combine(sets.engaged, 			{})
	sets.engaged['Ilvl~122']	= set_combine(sets.engaged['Ilvl~118'], {})
	sets.engaged['Ilvl~124+'] 	= set_combine(sets.engaged['Ilvl~122'], {})										
											
	sets.engaged.Evasion 				= set_combine(sets.engaged,						{})
	sets.engaged['Ilvl~118'].Evasion 	= set_combine(sets.engaged.Evasion, 			{})
	sets.engaged['Ilvl~122'].Evasion	= set_combine(sets.engaged['Ilvl~118'].Evasion, {})
	sets.engaged['Ilvl~124+'].Evasion 	= set_combine(sets.engaged['Ilvl~122'].Evasion, {})										
	
	------------------------------------------------------------------	
											
	sets.engaged['DW: 37+'] 				= set_combine(sets.engaged, 						{})
	sets.engaged['Ilvl~118']['DW: 37+']		= set_combine(sets.engaged['DW: 37+'], 				{})
	sets.engaged['Ilvl~122']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 37+'], 	{})
	sets.engaged['Ilvl~124+']['DW: 37+'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'], 	{})
	
	-- evasion sets
	sets.engaged['DW: 37+'].Evasion 				= set_combine(sets.engaged.Evasion,							{})
	sets.engaged['Ilvl~118']['DW: 37+'].Evasion 	= set_combine(sets.engaged['DW: 37+'].Evasion, 				{})
	sets.engaged['Ilvl~122']['DW: 37+'].Evasion		= set_combine(sets.engaged['Ilvl~118']['DW: 37+'].Evasion,	{})
	sets.engaged['Ilvl~124+']['DW: 37+'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 37+'].Evasion,	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			head="Hattori Zukin",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: low Haste (~31% DW)-             body=Relic_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
	--------------------------------------------            back="Bleating Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet=Herc_feet_TP_Acc}
	
	sets.engaged['DW: 22-36'] 				= set_combine(sets.engaged['DW: 37+'], 					{})
	sets.engaged['Ilvl~118']['DW: 22-36'] 	= set_combine(sets.engaged['DW: 22-36'], 				{})
	sets.engaged['Ilvl~122']['DW: 22-36'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 22-36'], 	{})
	sets.engaged['Ilvl~124+']['DW: 22-36'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 22-36'], 	{})
		
		----------------					head="Hattori Zukin",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body=Relic_body,hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Nusku's Sash",legs="Mochizuki Hakama +1",feet=Herc_feet_TP_Acc}
		
		sets.engaged['DW: 22-36'].Evasion				= set_combine(sets.engaged.Evasion, 							{})
		sets.engaged['Ilvl~118']['DW: 22-36'].Evasion 	= set_combine(sets.engaged['DW: 22-36'].Evasion, 				{})
		sets.engaged['Ilvl~122']['DW: 22-36'].Evasion 	= set_combine(sets.engaged['Ilvl~118']['DW: 22-36'].Evasion, 	{})
		sets.engaged['Ilvl~124+']['DW: 22-36'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 22-36'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------			head="Hattori Zukin",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi"
	-- Custom melee group: MidHaste (~21% DW)-              body=Relic_body,hands=Adhemar_hands,ring1="Epona's Ring",ring2="Petrov Ring",
	--------------------------------------------            back="Bleating Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet=Herc_feet_TP_Acc}
	
	sets.engaged['DW: 12-21'] 				= set_combine(sets.engaged['DW: 22-36'], 				{})
	sets.engaged['Ilvl~118']['DW: 12-21']  	= set_combine(sets.engaged['DW: 12-21'], 				{})
	sets.engaged['Ilvl~122']['DW: 12-21'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 12-21'], 	{})
	sets.engaged['Ilvl~124+']['DW: 12-21']  = set_combine(sets.engaged['Ilvl~122']['DW: 12-21'], 	{})
	
		----------------					head="Hattori Zukin",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi"				
		-- evasion sets                     body=Relic_body,hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Nusku's Sash",legs="Mochizuki Hakama +1",feet=Herc_feet_TP_Acc}
	
		sets.engaged['DW: 12-21'].Evasion  				= set_combine(sets.engaged['DW: 22-36'].Evasion, 				{})
		sets.engaged['Ilvl~118']['DW: 12-21'].Evasion  	= set_combine(sets.engaged['DW: 12-21'].Evasion, 				{})
		sets.engaged['Ilvl~122']['DW: 12-21'].Evasion  	= set_combine(sets.engaged['Ilvl~118']['DW: 12-21'].Evasion, 	{})
		sets.engaged['Ilvl~124+']['DW: 12-21'].Evasion  = set_combine(sets.engaged['Ilvl~122']['DW: 12-21'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------			head=Herc_head_WS,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: High Haste (15% DW)               body=Relic_body,hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Petrov Ring",
	---------------------------------------------           back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Hachiya Hakama +1",feet=Herc_feet_TP_Acc}
	
	sets.engaged['DW: 6-11'] 				= set_combine(sets.engaged['DW: 12-21'], 				{})
	sets.engaged['Ilvl~118']['DW: 6-11'] 	= set_combine(sets.engaged['DW: 6-11'], 				{})
	sets.engaged['Ilvl~122']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'], 	{})
	sets.engaged['Ilvl~124+']['DW: 6-11'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'], 	{})
	
		----------------					head=Herc_head_WS,neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body=Relic_body,hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Sveltesse Gouriz +1",legs="Hachiya Hakama +1",feet=Herc_feet_TP_Acc}
		
		sets.engaged['DW: 6-11'].Evasion 				= set_combine(sets.engaged['DW: 12-21'].Evasion, 				{})
		sets.engaged['Ilvl~118']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['DW: 6-11'].Evasion, 				{})
		sets.engaged['Ilvl~122']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~118']['DW: 6-11'].Evasion, 	{})
		sets.engaged['Ilvl~124+']['DW: 6-11'].Evasion 	= set_combine(sets.engaged['Ilvl~122']['DW: 6-11'].Evasion, 	{})
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------			head=Herc_head_WS,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
	-- Custom melee group: Max Haste (0% DW)            body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Petrov Ring",
	-----------------------------------------           back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	
	sets.engaged['DW: 5-0'] 				= set_combine(sets.engaged['DW: 6-11'],				{})
	sets.engaged['Ilvl~118']['DW: 5-0'] 	= set_combine(sets.engaged['DW: 5-0'], 				{})
	sets.engaged['Ilvl~122']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'], 	{})
	sets.engaged['Ilvl~124+']['DW: 5-0'] 	= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'], 	{})
	
		----------------					head=Herc_head_WS,neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",				
		-- evasion sets                     body="Emet Harness +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Dumakulem's Ring",
		----------------                    back="Atheling Mantle",waist="Sveltesse Gouriz +1",legs="Hachiya Hakama +1",feet=Herc_feet_TP_Acc}
		
		sets.engaged['DW: 5-0'].Evasion 					= set_combine(sets.engaged['DW: 12-21'].Evasion, 			{})
		sets.engaged['Ilvl~118']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['DW: 5-0'].Evasion, 				{})
		sets.engaged['Ilvl~122']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~118']['DW: 5-0'].Evasion, 	{})
		sets.engaged['Ilvl~124+']['DW: 5-0'].Evasion 		= set_combine(sets.engaged['Ilvl~122']['DW: 5-0'].Evasion, 	{})
																													
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------
	-- Max STP for 2 Handed weapons (used in proking)
	-----------------------------------------------------
	sets.ExtraSTP = {}
	
	---------------------------------------
	-- Buff Sets and Miscelanie
	---------------------------------------
	sets.Rancor = {neck="Rancor Collar"}
	sets.TA_Ring  = {ring2="Oneiros Ring"}
	sets.buff.Migawari = {}
	sets.buff.Doom = {}
	sets.buff.Yonin = {}
	sets.buff.Innin = {}
	sets.buff.Sange = {}
	sets.buff.Reive = {}
	sets.Gavialis = {}
	sets.CP = {}	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' then
		if spell.target.distance > 5 then
			eventArgs.cancel = true
			add_to_chat(123,('[Abort WS: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Target is too far.'):color(text_color) .. (']'):color(warning_text))
			return
		end
		-- Stop Gear Switching if in any Defence Sets
		if state.DefenseMode.current ~= 'None' then eventArgs.handled = true end
		-- Abort WS if TP < 1000
		if player.tp < 999 then
			add_to_chat(123,('[Abort WS: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> TP: '..player.tp..' / 3000'):color(text_color) .. (']'):color(warning_text))
			eventArgs.cancel = true
			return
		end
	end
	if spell.skill == "Ninjutsu" and S{'katon: san', 'hyoton: san', 'huton: san', 'doton: san', 'raiton: san', 'suiton: san'}:contains(spell.english:lower()) then
		classes.CustomClass = "NinjutsuIII"
	end
	if (spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' or spell.english == 'Utsusemi: San') and (buffactive['copy image (3)'] or buffactive['copy image (4+)']) then
		add_to_chat(123,('[Abort Spell: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> 3+ Shodows already up'):color(text_color) .. (']'):color(warning_text))
		eventArgs.cancel = true
		return
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then		
		if (spell.name == "Blade: Shun" and ShunDays:contains(world.day)) or (spell.name == "Blade: Ten" and TenDays:contains(world.day))then
			add_to_chat(123,('[WS Bonus: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Matching Day Bonus.'):color(text_color) .. (']'):color(warning_text))
			equip(sets.Gavialis)
		end
		if state.Buff["Reive Mark"] then
			equip(sets.buff.Reive)
		end
		-- Replace Moonshade Earring if we're at cap TP
        if player.tp > 2750 then
			if spell.name == "Blade: Hi" then
				equip(sets.precast.MaxTP_Agi)
			else
				equip(sets.precast.MaxTP_Dex)
			end
        end
	end
end

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

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
	if new_status == 'Idle' then
		info['Hsamba'] = false
    end
	handle_equipping_gear(player.status)
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
	select_movement_feet()
	determine_haste_group()
end

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
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


-- Modify the default melee set after it was constructed.
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
	if player.equipment.main ~= "empty" and player.equipment.sub == "empty" then
		meleeSet = set_combine(meleeSet, sets.ExtraSTP)
	end
	if state.OneirosRing.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' and not Two_Handed:contains(player.equipment.main) then
		if player.mp > 99 then
			meleeSet = set_combine(meleeSet, sets.TA_Ring)
		end
	end
	if state.Rancor.value == true and state.DefenseMode.current == 'None' and state.HybridMode.current == 'Normal' and not Two_Handed:contains(player.equipment.main) then
		meleeSet = set_combine(meleeSet, sets.Rancor)
	end
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
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
	end
	if state.Buff.Sange and player.inventory["Happo Shuriken"] and not Two_Handed:contains(player.equipment.main) then
		meleeSet = set_combine(meleeSet, sets.buff.Sange)
	else
		send_command('cancel Sange')
	end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	--Change_Marches()
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
	
	if state.Rancor.value == true then
		msg = msg .. (' + '):color(text_color) .. ('\"Rancor Collar\"'):color(warning_text)
	end
	
	if state.OneirosRing.value == true then
		msg = msg .. (' + \"Oneiros Ring\"'):color(text_color)
	end
	
    if state.DefenseMode.value == 'None' then
		msg = msg .. ('] [WS: '):color(Notification_color) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	else
		msg = msg .. ('] [WS: '):color(Notification_color) .. ('LOCKED: ' ):color(warning_text) .. (state.WeaponskillMode.value):color(text_color) .. ('] '):color(Notification_color)
	end
    
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ('[Target PC: '):color(Notification_color)..state.PCTargetMode.value .. ('] '):color(Notification_color)
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ('[Target NPCs'):color(Notification_color).. ('] '):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	-- if info.haste ~= 'None' then
		-- msg = msg .. ('[\"' .. info.haste..'\"'):color(Notification_color) .. (' set @: '..Total_haste..'/1024 || DW: ' .. DW_needed):color(text_color) .. (']'):color(Notification_color)
	-- end
	
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
	-- -- Change_Marches()
	
	-- -- HASTE INFO
    -- -------------------------------------------------------------------------------------------------
	-- -- Haste Samba = 5% 			51/1024
	
	-- -- haste = 14.7%    			150/1024				-- haste II = 30%    			307/1024
	
	-- -- Advancing March = 6.3%   	64/1024					-- Victory March = 9.4%   		96/1024
	-- -- Advancing March +1 = 7.9%   	80/1024                 -- Victory March +1 = 11%		112/1024
	-- -- Advancing March +2 = 9.4%   	96/1024                 -- Victory March +2 = 12.5%     128/1024
	-- -- Advancing March +3 = 11%    	112/1024                -- Victory March +3 = 14.1%     144/1024
	-- -- Advancing March +4 = 12.6	128/1024                -- Victory March +4 = 15.7%		160/1024
	-- -- Advancing March +5 = 14.1	144/1024                -- Victory March +5 = 17.2%		176/1024

	-- -------------------------------------------------------------------------------------------------
	-- -- magic haste cap = 43.8% 		448/1024
	-- -- Equipment haste cap = 25%	256/1024
	-- -- Job Ability haste cap = 25%	256/1024
	-- -- Ninja base Dual Weild = 35%	358/1024
	-- -- Total cap = 80%				820/1024	
	
	-- -- delay calc
	-- -- (delay1 + delay2) x (1-DW%) x (1024 - haste)/1024 >= (delay1 + delay2) x 0.2 
	-- -- total weapon delay x dual wiled x haste >= (has to be higher or equal to 80% of total delay)
	-- -- DW_needed = math.floor((((Total_Weapon_Delay * 0.2) / Total_Weapon_Delay / ((1024 - Total_haste) / 1024 ) -1) * -1 * 100) - Ninja_DW)
	
	
    -- info.haste = 'None'
	-- -- state.Buff['Geo-Haste']
	-- -- Magic Haste
	-- local M_Haste = 0
	-- if buffactive.embrava then 
		-- M_Haste = M_Haste + 205 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Embrava '))
	-- end
	-- if buffactive['Mighty Guard'] then 
		-- M_Haste = M_Haste + 150 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Mighty Guard '))
	-- end
	-- if state.Buff['Geo-Haste'] then 
		-- M_Haste = M_Haste + 358
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Geo '))
	-- end
	-- if state.Buff['Haste'] and not state.Buff['Haste II'] then 
		-- M_Haste = M_Haste + 150 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Haste 1 '))
	-- end
	-- if state.Buff['Haste'] and state.Buff['Haste II'] then 
		-- M_Haste = M_Haste + 307 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Haste 2 '))
	-- end
	
	-- if buffactive.march == 1 and state.Buff['Marches'] == 0 then 
		-- M_Haste = M_Haste + 144
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 1 March '))
	-- elseif buffactive.march == 1 and state.Buff['Marches'] ~= 0 then 
		-- M_Haste = M_Haste + state.Buff['Marches'] 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	-- end
	-- if buffactive.march == 2 and state.Buff['Marches'] == 0 then 
		-- M_Haste = M_Haste + 320
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	-- elseif buffactive.march == 2 and state.Buff['Marches'] ~= 0 then 
		-- M_Haste = M_Haste + state.Buff['Marches'] 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' 2 March '))
	-- end
	-- if buffactive['Slow'] then 
		-- M_Haste = M_Haste - 150 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Slow '))
	-- end
	-- if buffactive['Elegy'] then 
		-- M_Haste = M_Haste - 256 
		-- --add_to_chat(122, 'Total Haste = '.. M_Haste .. ( ' Elegy '))
	-- end
	
	-- -- magic haste cap
	-- if M_Haste > 448 then M_Haste = 448 end
	
	-- -- JA haste
	-- local JA_Haste = 0
	-- if buffactive['haste samba'] or info['Hsamba'] then JA_Haste = JA_Haste + 51 end

	-- --JA haste cap
	-- if JA_Haste > 256 then JA_Haste = 256 end
	
	-- -- gear haste
	-- local Gear_Haste = 256
	
	-- Total_haste = M_Haste + JA_Haste + Gear_Haste
	
	-- Total_Weapon_Delay = determine_Weapon_Delay()
	
	-- local Sub = ""
	-- if player.equipment.sub ~= "empty" then
		-- Sub = res.items:with('en', player.equipment.sub)
		-- if Sub ~= "" and Sub ~= nil then
			-- if Sub.category ~= "Weapon" then
				-- Job_DW = 0
				-- DW_needed = 0
			-- else
				-- Job_DW = determine_DW()
				-- DW_needed = math.floor((((Total_Weapon_Delay * 0.2) / Total_Weapon_Delay / ((1024 - Total_haste) / 1024 ) -1) * -1 * 100) - Job_DW)
			-- end
		-- end
	-- else
		-- Job_DW = 0
		-- DW_needed = 0
	-- end
	
	classes.CustomMeleeGroups:clear()
	-- Choose gearset based on DW needed
	if DW_needed < 5 then
		classes.CustomMeleeGroups:append('DW: 5-0')
		info.haste = 'DW: 5-0'
	elseif DW_needed > 4 and DW_needed < 12 then
		classes.CustomMeleeGroups:append('DW: 6-11')
		info.haste = 'DW: 6-11'
	elseif DW_needed > 11 and DW_needed < 22 then
		classes.CustomMeleeGroups:append('DW: 12-21')
		info.haste = 'DW: 12-21'
	elseif DW_needed > 21 and DW_needed < 37 then
		classes.CustomMeleeGroups:append('DW: 22-36')
		info.haste = 'DW: 22-36'
	elseif DW_needed > 36 then
		classes.CustomMeleeGroups:append('DW: 37+')
		info.haste = 'DW: 37+'
	end
	--add_to_chat(122,'Marches = '..tostring(state.Buff['Marches']) .. ' / geo = '..tostring(state.Buff['Geo-Haste']).. ' / haste = '..tostring(state.Buff['Haste']).. ' / haste2 = '..tostring(state.Buff['Haste II']))
	
	--add_to_chat(122, 'DW needed: '..DW_needed..' Haste: '..Total_haste..' / 1024  ....   Gearset: '..info.haste)
end

function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

function determine_Weapon_Delay()

	local Main = ""
	local Sub = ""
	-- TO DO
	--Weapon_info = T{weapon_delay = 0, dw = false}
	if player.equipment.main ~= "empty" then
		Main = res.items:with('en', player.equipment.main)
		if Main ~= nil then
			Weapon_Delay = Main.delay
		end
	end
	if player.equipment.sub ~= "empty" then
		Sub = res.items:with('en', player.equipment.sub)
		if Sub ~= nil  then 
			Weapon_Delay = Weapon_Delay + Sub.delay
		end
	end

	return Weapon_Delay
end

function determine_DW()
	-- sub job DW values
	-- nin = 25%
	-- dnc = 15%
	-- first we get the sub job trait values
	local sub_job_dw = 0
 	if player.sub_job:upper() == 'DNC' then sub_job_dw = 15
	elseif player.sub_job:upper() == 'NIN' then sub_job_dw = 25
	end
	
	if player.main_job:upper() == 'BLU' then
		-- here we look up job points spent on blue for the DW bonus
		local jp_boost = 0
		local jp = player.job_points['blu']['jp_spent']
		if jp < 100 then
			jp_boost = 0
		elseif jp >= 100 and jp < 1200 then
			jp_boost = 1
		elseif jp >= 1200 then
			jp_boost = 2
		end
		
		--here we look up spells currently equipped to check for DW trait
		local DW_Spells_Equipped_Level = 0
		local spells_set = T(windower.ffxi.get_mjob_data().spells):filter(function(id) return id ~= 512 end):map(function(id) return spells[id].english end)
		--table.vprint(spells_set)
		local spell_value = 0
		-- here we give each spell a value of 4 or 8 and add the values together
		for index, spell in pairs(spells_set) do
		--for spell in spells_set:it() do
			if spell == "Animating Wail" or spell == "Blazing Bound" or spell == "Quad. Continuum" or spell == "Delta Thrust" or spell == "Mortal Ray" or spell == "Barbed Crescent" then
			   spell_value = spell_value + 4
			elseif spell == "Molting Plumage" then 
				spell_value = spell_value + 8
			end
			--add_to_chat(122, '[Spell: '.. spell .. '] [Spell value: ' .. spell_value.. ']')
		end
		--add_to_chat(122, '[Spell value: ' .. spell_value.. ']')
		
		--here we determine the DW level equipped with job points
		DW_Spells_Equipped_Level = math.floor(spell_value / 8) + jp_boost
		
		--the we determine the actuall % value of DW equipped via blu spells 
		local main_job_dw = 0
		if DW_Spells_Equipped_Level == 0 then main_job_dw = 0
		elseif DW_Spells_Equipped_Level == 1 then main_job_dw = 10
		elseif DW_Spells_Equipped_Level == 2 then main_job_dw = 15
		elseif DW_Spells_Equipped_Level == 3 then main_job_dw = 25
		elseif DW_Spells_Equipped_Level == 4 then main_job_dw = 30
		elseif DW_Spells_Equipped_Level == 5 then main_job_dw = 35
		elseif DW_Spells_Equipped_Level == 6 then main_job_dw = 40
		end
	elseif player.main_job:upper() == 'NIN' then
		main_job_dw = 35
	end
	--add_to_chat(122, '[Sub dw: ' .. sub_job_dw .. '] [Main dw: ' .. main_job_dw .. ']')
	
	-- if the sub job DW is higher return that instead of blue mage spell DW
	if sub_job_dw > main_job_dw then
		return sub_job_dw
	else
		return main_job_dw
	end
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'gearinfo' then
		if tonumber(cmdParams[2]) ~= DW_needed then
			DW_needed = tonumber(cmdParams[2])
			send_command('gs c update')
		end
	   --add_to_chat(cmdParams[2])
    end
end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.OneirosRing then
        properties:append('${OneirosRing}')
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
	
	inform.CastingMode = ('\\cs(0,255,0)' .. ('\n [Casting: '..state.CastingMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = ('\\cs(0,255,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = ('\\cs(255,0,0)' .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] LOCKED ' )) .. '\\cr'
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

	-- if info.haste ~= 'None' then
		-- inform.haste = ('\\cs(213,43,196)' .. ('\n [Haste: '..Total_haste..'/1024] [DW: ' .. DW_needed .. '] ')) .. '\\cr'
	-- end
	
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
    send_command('gs r')
end)

function select_default_macro_book()
end