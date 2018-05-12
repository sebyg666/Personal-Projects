-------------------------------------------------------------------------------------------------------------------
-- Tables and functions for commonly-referenced gear that job files may need, but
-- doesn't belong in the global Mote-Include file since they'd get clobbered on each
-- update.
-- Creates the 'gear' table for reference in other files.
--
-- Note: Function and table definitions should be added to user, but references to
-- the contained tables via functions (such as for the obi function, below) use only
-- the 'gear' table.
-------------------------------------------------------------------------------------------------------------------

print('Mystryman_Globals.lua Loaded')

hide_window = false
Notification_color = 200
text_color = 160
warning_text = 167

Ring_lock = S{"Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring"}
Tele_Ring = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)"}
Ear_lock = S{"Reraise Earring"}
Bar_Status = S{'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barsilencra','Barvira','Barpetra','Baramnesra',
						'Barsleep','Barpoison','Barparalyze','Barblind','Barsilence','Barvirus','Barpetrify','Baramnesia'}
-------------------------------------------------------------------------------------------------------------------
-- Modify the sets table.  Any gear sets that are added to the sets table need to
-- be defined within this function, because sets isn't available until after the
-- include is complete.  It is called at the end of basic initialization in Mote-Include.
-------------------------------------------------------------------------------------------------------------------

function define_global_sets()
	-- Special gear info that may be useful across jobs.

	-- Staffs
	gear.Staff = {}
	gear.Staff.HMP = 'Boonwell Staff'
	gear.Staff.PDT = "Terra's Staff"
	
	-- Dark Rings
	gear.DarkRing = {}
	gear.DarkRing.physical = {name="Dark Ring",augments={'Phys. dmg. taken -5%','Breath dmg. taken -6%'}}
	gear.DarkRing.dt = {name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%'}}
	
	-- Default items for utility gear values.
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = "Caudata Belt"
	gear.default.obi_waist = "Eschan Stone"
	gear.default.obi_back = "Toro Cape"
	gear.default.obi_ring = "Strendu Ring"
	gear.default.fastcast_staff = "Grioavolr"
	gear.default.recast_staff = "Grioavolr"
end

-------------------------------------------------------------------------------------------------------------------
-- Functions to set user-specified binds, generally on load and unload.
-- Kept separate from the main include so as to not get clobbered when the main is updated.
-------------------------------------------------------------------------------------------------------------------

-- Function to bind GearSwap binds when loading a GS script.
function binds_on_load()
	-- ctrl = ^
	-- alt = !
	-- windows key = @
	
	
	-- send_command('bind f9 gs c cycle OffenseMode')
	-- send_command('bind ^f9 gs c cycle DefenseMode')
	-- send_command('bind !f9 gs c cycle WeaponskillMode')
	-- send_command('bind f10 gs c activate PhysicalDefense')
	-- send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
	-- send_command('bind !f10 gs c toggle kiting')
	-- send_command('bind f11 gs c activate MagicalDefense')
	-- send_command('bind ^f11 gs c cycle CastingMode')
	-- send_command('bind !f11 gs c set CastingMode Dire')
	-- send_command('bind f12 gs c update user')
	-- send_command('bind ^f12 gs c cycle IdleMode')
	-- send_command('bind !f12 gs c reset defense')
	-- send_command('bind [ gs c toggle PhysicalDefense')
	-- send_command('bind ] gs c toggle MagicalDefense')
	
	-- send_command('bind ^- gs c toggle selectnpctargets')
	-- send_command('bind ^= gs c cycle pctargetmode')
	
	send_command('bind ^[ gs c cycle OffenseMode')
	send_command('bind ^] gs c cycle DefenseMode')
	-- send_command('bind !] gs c cycle WeaponskillMode')
	send_command('bind [ gs c toggle PhysicalDefense')
	send_command('bind ] gs c toggle MagicalDefense')
	send_command('bind f12 gs c update user')
	send_command('bind @f12 gs c toggle kiting')
	--send_command('bind !f12 gs c reset defense')

	-- send_command('wait 2; input //gs lo; wait 3; input //gs c update user; input //gs validate')
	-- Find plugin trackers
	--send_command('track clear;wait 0.3;track add Inv: ${INVENTORY:$FREESPACE};wait 0.3;track add Echos: ${ALL:Echo Drops}')
	
end

-- Function to re-bind Spellcast binds when unloading GearSwap.
function binds_on_unload()
	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')
	
	send_command('unbind -')
	send_command('unbind ^-')
    send_command('unbind !-')
	send_command('unbind @-')
	
	send_command('unbind =')
	send_command('unbind ^=')
    send_command('unbind !=')
	send_command('unbind @=')
	
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
end


-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
	--local SCH_JA = S{'Penury','Celerity','Accession','Rapture','Altruism','Tranquility','Perpetuance','Parsimony','Alacrity','Manifestation','Ebullience','Focalization','Equanimity','Immanence'}
	--if not midaction() then
		if spell.type == 'WeaponSkill' then
			-- Abort WS if TP < 1000
			if player.tp < 950 then
				add_to_chat(123,('[Abort WS: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> TP: '..player.tp..' / 3000'):color(text_color) .. (']'):color(warning_text))
				eventArgs.cancel = true
				return
			end
		elseif spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 1 and not spellMap == 'Cure' then
                add_to_chat(123,('[Abort Spell: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Waiting on recast ['..math.floor(spell_recasts[spell.recast_id] / 60)..' s]'):color(text_color) .. (']'):color(warning_text))
                eventArgs.cancel = true
                return
            end
        -- elseif spell.action_type == 'Ability' then
            -- local abil_recasts = windower.ffxi.get_ability_recasts()
            -- if abil_recasts[spell.recast_id] > 0 and not SCH_JA:contains(spell.en) then
                -- add_to_chat(123,('[Abort Ability: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Waiting on recast ['..math.floor(abil_recasts[spell.recast_id] / 60)..' s]'):color(text_color) .. (']'):color(warning_text))
                -- eventArgs.cancel = true
                -- return
            -- end
		end
		
	-- else
		-- add_to_chat(123,('[Abort Action: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Action in progress'):color(text_color) .. (']'):color(warning_text))
		-- eventArgs.cancel = true
	-- end
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
	refine_waltz(spell, action, spellMap, eventArgs)
end

-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
	-- Default base equipment layer of fast recast.
	if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
		equip(sets.midcast.FastRecast)
	end
end

function user_buff_change(buff, gain, eventArgs)
	-- Create a timer when we gain weakness.  Remove it when weakness is gone.
	if buff:lower() == 'weakness' then
		if gain then
			send_command('timers create "Weakness" 300 up abilities/00255.png')
		else
			send_command('timers delete "Weakness"')
		end
	end
end

function gearinfo(cmdParams, eventArgs)
	 if cmdParams[1] == 'hide' then
		if hide_window then
			hide_window = false
		else
			hide_window = true
		end
	end	
    if cmdParams[1] == 'gearinfo' then
		if type(tonumber(cmdParams[2])) == 'number' then
			if tonumber(cmdParams[2]) ~= DW_needed then
				DW_needed = tonumber(cmdParams[2])
				DW = true
			end
		elseif type(cmdParams[2]) == 'string' then
			if cmdParams[2] == 'false' then
				DW_needed = 0
				DW = false
			end
		end
		if type(tonumber(cmdParams[3])) == 'number' then
			if tonumber(cmdParams[3]) ~= Haste then
				Haste = tonumber(cmdParams[3])
			end
		end
		if type(cmdParams[4]) == 'string' then
			if cmdParams[4] == 'true' then
				moving = true
			elseif cmdParams[4] == 'false' then
				moving = false
			end
		end
		
		if not midaction() and not pet_midaction() then
			--send_command('gs c update')
			job_update()
		end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Test function to use to avoid modifying Mote-SelfCommands.
-------------------------------------------------------------------------------------------------------------------

function user_test(params)

end

