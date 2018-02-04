-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
 
-- Last Modified: 1/6/2014 7:32:14 AM
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file to go with this.
 
function get_sets()
        -- Load and initialize the include file.
        
		
		include('Mote-Include.lua')
        
end

function job_setup()
	state.Buff['Afflatus Solace'] = buffactive['afflatus solace'] or false
	
	-- Telchine_Head 	= 0
	-- Telchine_Body 	= 0.05
	-- Telchine_Hands	= 0
	-- Telchine_Legs 	= 0
	-- Telchine_Feet 	= 0.03
		
	custom_Enhancing_timers = {}
end

-- Define sets and vars used by this job file.
function user_setup()
		
		print('WHM.lua loaded')
		select_default_macro_book()
		state.UseCustomEnhancingTimers = true
		
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
         if spell.english == "Paralyna" and buffactive.Paralyzed then
                -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
                eventArgs.handled = true
        else
                classes.CustomClass = get_spell_class(spell, action, spellMap)
        end
        
        if spell.skill == 'HealingMagic' then
                gear.default.obi_back = "Refraction Cape"
        else
                gear.default.obi_back = "Toro Cape"
        end
		if spell.name == 'Spectral Jig' and buffactive['Sneak'] then
				windower.send_command('cancel 71')
				eventArgs.handled = true
				return
		end
end
 
 
function job_post_precast(spell, action, spellMap, eventArgs)
       -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
        if eventArgs.useMidcastGear then
                if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
                        equip(sets.buff['Divine Caress'])
                end
        end
        
        -- Ionis gives us an extra 3% fast cast, so we can drop Incantor Stone for Impatiens.
        --if (classes.CustomClass == 'CureSolace' or classes.CustomClass == 'CureMelee') and
        --        buffactive.ionis and areas.Adoulin[world.area:lower()] then
        --        equip({ammo="Impatiens"})
        --end
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
        if spell.action_type == 'Magic' then
                -- Default base equipment layer of fast recast.
                equip(sets.midcast.FastRecast)
        end
        
        classes.CustomClass = get_spell_class(spell, action, spellMap)
end
 
function job_post_midcast(spell, action, spellMap, eventArgs)
        -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
        if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
                equip(sets.buff['Divine Caress'])
        end
end
 
-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
        if not spell.interrupted then
                if state.Buff[spell.name] ~= nil then
                        state.Buff[spell.name] = true
                elseif spell.name == "Afflatus Misery" then
                        state.Buff['Afflatus Solace'] = false
                end
        end
		if spell.skill == 'Enhancing Magic' and not spell.interrupted then
			if spell.target then
				adjust_Enhancing_timers(spell, spellMap)
			end
		end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
 
function customize_idle_set(idleSet)
        if player.mpp < 90 and state.IdleMode == "Normal" and state.Defense.Active == false then
                idleSet = set_combine(idleSet, sets.Owleyes)
        end
       
        return idleSet
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
        if state.Buff[buff] ~= nil then
                state.Buff[buff] = gain
        end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
 
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
        if cmdParams[1] == 'user' and not areas.Cities[world.area] then
                local needsArts = player.sub_job:lower() == 'sch' and
                        not buffactive['Light Arts'] and not buffactive['Addendum: White'] and
                        not buffactive['Dark Arts'] and not buffactive['Addendum: Black']
                       
                if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
                        if needsArts then
                                windower.send_command('input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
                        else
                                windower.send_command('input /ja "Afflatus Solace" <me>')
                        end
                end
        end
end
 
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
        if stateField == 'OffenseMode' then
                if newValue == 'Normal' then
                        disable('main','sub')
                else
                        enable('main','sub')
                end
        elseif stateField == 'Reset' then
                if state.OffenseMode == 'None' then
                        enable('main','sub')
                end
        end
end
 
 
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
        local defenseString = ''
        if state.Defense.Active then
                local defMode = state.Defense.PhysicalMode
                if state.Defense.Type == 'Magical' then
                        defMode = state.Defense.MagicalMode
                end
 
                defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
        end
 
        add_to_chat(122,'Casting ['..state.CastingMode..'], Idle ['..state.IdleMode..'], '..defenseString..
                'Kiting: '..on_off_names[state.Kiting])
 
        eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
function get_spell_class(spell, action, spellMap)
        if spell.action_type == 'Magic' then
                if spell.skill == "EnfeeblingMagic" then
                        if spell.type == "WhiteMagic" then
                                return "MndEnfeebles"
                        else
                                return "IntEnfeebles"
                        end
                else
                        if spellMap == 'Cure' and state.Buff['Afflatus Solace'] then
                                return "CureSolace"
                        elseif (spellMap == 'Cure' or spellMap == "Curaga") and player.status == 'Engaged' and player.equipment.main == 'Mondaha Cudgel' then
                                return "CureMelee"
                        end
                end
        end
       
        return nil
end

function adjust_Enhancing_timers(spell, spellMap)

	if state.UseCustomEnhancingTimers == false then
        return
    end
    
    local current_time = os.time()
    
    -- custom_timers contains a table of song names, with the os time when they
    -- will expire.
    
    -- Eliminate songs that have already expired from our local list.
    local temp_Enhancing_timer_list = {}
	
	for spell_name,expires in pairs(custom_Enhancing_timers) do
        if expires < current_time then
            temp_Enhancing_timer_list[spell_name] = true
        end
    end
    for spell_name,expires in pairs(temp_Enhancing_timer_list) do
        custom_Enhancing_timers[spell_name] = nil
    end
	--
	
	local mult = 1
	local dur = 0
	local added_time = 0
	if player.equipment.head == "Telchine Cap" then mult = mult + 		Telchine_Head 	end
	if player.equipment.body == "Telchine Chas." then mult = mult + 	Telchine_Body 	end
	if player.equipment.hands == "Telchine Gloves" then mult = mult + 	Telchine_Hands	end
	if player.equipment.hands == "Dynasty Mitts" then mult = mult + 	0.05	end
	if player.equipment.legs == "Telchine Braconi" then mult = mult + 	Telchine_Legs 	end
	if player.equipment.feet == "Telchine Pigaches" then mult = mult + 	Telchine_Feet 	end
	
	if spell.duration == nil or spell.duration == 0 then
		return
	end
	
	dur = math.floor(mult * spell.duration)
	added_time = (dur - spell.duration)
	
	local spellTarget = ""
	local sendSpellTarget = ""
	if spell.target.type == "SELF" then
		spellTarget =  spell.name..' [Self]'
	else
		spellTarget =  spell.name..' ['..spell.target.name..']'
	end
	
    if custom_Enhancing_timers[spellTarget] then
        -- Buffs always overwrite themselves         
        if custom_Enhancing_timers[spellTarget] < (current_time + dur) then
            send_command('timers delete "'..spellTarget..'"')
            custom_Enhancing_timers[spellTarget] = current_time + dur
            send_command('timers create "'..spellTarget..'" '..dur..' down '..spell.name)
        end
	else
		custom_Enhancing_timers[spellTarget] = current_time + dur
		send_command('timers create "'..spellTarget..'" '..dur..' down '..spell.name)
	end

end

function select_default_macro_book()

		set_macro_page(8, 9)
		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F8 input /ma "erase" <stal>')
		send_command('bind ^F8 input /ma "sacrifice" <stal>')
		send_command('bind F9 input /ma "cure IV" <stal>')
        send_command('bind ^F9 input /ma "curaga III" <stal>')
		send_command('bind F10 input /ma "cure V" <stal>')
		send_command('bind ^F10 input /ma "curaga IV" <stal>')
		send_command('bind F11 input /ma "cure VI" <stal>')
        send_command('bind ^F11 input /ma "curaga V" <stal>')
end
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        elseif spell.skill == "Divine Magic" then
            return "DivineMagic"
        end
    end
end