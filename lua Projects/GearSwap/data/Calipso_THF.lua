-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
-- Initialization function for this job file.

include('organizer-lib.lua')
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	
	include('Mote-TreasureHunter')

	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  	state.OffenseMode:options('Normal','LowAcc', 'MaxAcc')
	state.HybridMode:options('Normal','DT','PDT')
	
	state.WeaponskillMode:options('Normal', 'Acc')
	state.DualWield:options('None','DWFull','FullBuffs')
 	 select_default_macro_book()

	send_command('bind F11 gs c cycle DualWield')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind F10 gs c cycle HybridMode')
	send_command('bind ^f9 gs c cycle WeaponskillMode')
	send_command('bind !f9 input /lockstyleset 9')
	
	send_command('bind != input /ja "Haste Samba" <me>')
	
	send_command('bind numpad0 input /ja "Spectral Jig" <me>')
	
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	
	send_command('bind f12 gs c update user')
	send_command('bind !f12 gs c reset defense')

		-- Additional local binds

	send_command('bind ^= gs c cycle treasuremode')

	gear.HercGlovesTP = { name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+4','Attack+11',}}
	gear.HercGlovesWS =  { name="Herculean Gloves", augments={'Weapon skill damage +4%','STR+8','Accuracy+5',}}
	gear.HercGlovesDT = { name="Herculean Gloves", augments={'Accuracy+11 Attack+11','Damage taken-4%',}}

	
	gear.HercBootsTP = { name="Herculean Boots", augments={'Accuracy+15','"Triple Atk."+4','DEX+4',}}
	gear.HercBootsWS = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+15','"Waltz" potency +1%','Weapon skill damage +5%','Accuracy+10 Attack+10','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	gear.HercBootsDT = { name="Herculean Boots", augments={'Damage taken-4%','DEX+5','Attack+11',}}

	gear.HercLegsWS = { name="Herculean Trousers", augments={'Attack+25','Weapon skill damage +4%','DEX+9','Accuracy+8',}}
	gear.HercLegsDT = { name="Herculean Trousers", augments={'Rng.Acc.+7','Damage taken-2%','STR+10','Accuracy+8',}}

	gear.MeleeCape = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.WSCape = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

	
end
-- Called when this job file is unloaded (eg: job change)
function job_file_unload()
	send_command('unbind ^`')
	send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Special sets (required by rules)
	--------------------------------------
	sets.midcast.Capacity = {rring="Capacity Ring"}

	sets.TreasureHunter = {hands="Plun. Armlets +1",waist="chaac belt",feet="Raider's Poulaines +2"}
	sets.ExtraRegen = {head="Oce. Headpiece +1",neck="Wiglen Gorget",ear1="Novia earring",ear2="Ethereal earring",
		body="Kheper jacket",hands="Floral Gauntlets",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Solemnity Cape",legs="Desultor Tassets",feet="Skadi's Jambeaux +1"}


	sets.buff['Sneak Attack'] = {}

	sets.buff['Trick Attack'] = {}

	-- Actions we want to use to tag TH.
	sets.precast.Step = set_combine(sets.TreasureHunter, 
			{ammo="Falcon Eye",
		head="Adhemar Bonnet",
		neck="Maskirova Torque",ear1="Telos Earring",ear2="Steelflash Earring",
		body="Adhemar Jacket",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Canny Cape",waist="Olseni Belt",legs=""})

	sets.precast.Flourish1 = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter


	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {}
	sets.precast.JA['Accomplice'] = {}
	sets.precast.JA['Flee'] = {}
	sets.precast.JA['Hide'] = {body="Adhemar Jacket"}
	sets.precast.JA['Conspirator'] = {} -- {}
	sets.precast.JA['Steal'] = {"Asn. Bonnet +2"}
	sets.precast.JA['Despoil'] = {}
	sets.precast.JA['Perfect Dodge'] = {hands="Plun. Armlets +1"}
	sets.precast.JA['Feint'] = {} -- {}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {body="Passion Jacket",feet="Rawhide Boots"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {head="Meghanada Visor +1",ear2="Loquacious Earring",
		body="Adhemar Jacket",hands="Herculean Gloves",
		legs="Samnuha Tights",feet="Herculean Boots"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC)

	
	-- Ranged snapshot gear
	sets.precast.RA = {}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Clotharius Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Meg. Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.WSCape,waist="Wanion Belt",legs=gear.HercLegsWS,feet=gear.HercBootsWS}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Falcon Eye"})

	

	sets.precast.WS['Dancing Edge'] = {
		head="Adhemar Bonnet",
		neck="Nefarious Collar",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Abnoba Kaftan",gear.HercGlovesWS,ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}

	

	
	sets.precast.WS["Evisceration"] = {ammo="Yetshila",head="Adhemar Bonnet",neck="Nefarious Collar",
		ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Abnoba Kaftan",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.MeleeCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}


	sets.precast.WS["Rudra's Storm"] = {ammo="Ginsen",head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
						body="Meg. Cuirie +1",
						hands="Meg. Gloves +1",back=gear.WSCape,
 						ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Wanion Belt",
 						legs="Lustratio Subligar",feet=gear.HercBootsWS}


	sets.precast.WS["Rudra's Storm"].Acc = {ammo="Ginsen",head="Adhemar Bonnet",neck="Caro Necklace",ear1="Telos Earring",ear2="Cessance Earring",
						body="Meg. Cuirie +1",
						hands="Meg. Gloves +1",back=gear.WSCape,
 						ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",
 						legs="Lustratio Subligar",feet=gear.HercBootsWS}


	sets.precast.WS["Rudra's Storm"].SA =  {ammo="Yetshila",head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
 					body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}

	sets.precast.WS["Rudra's Storm"].TA = {ammo="Yetshila",head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
					body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}

	sets.precast.WS["Rudra's Storm"].SATA = {ammo="Yetshila",head="Adhemar Bonnet",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
					body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}

	
	sets.precast.WS['Mandalic Stab'] =  {ammo="Ginsen",head="Adhemar Bonnet",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
						body="Meg. Cuirie +1",
						hands="Meg. Gloves +1",back=gear.WSCape,
 						ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Wanion Belt",
 						legs="Lustratio Subligar",feet=gear.HercBootsWS}

	sets.precast.WS['Mandalic Stab'].SA =  {ammo="Yetshila",head="Adhemar Bonnet",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
					body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}

	sets.precast.WS['Mandalic Stab'].TA =  {ammo="Yetshila",head="Adhemar Bonnet",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
					body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.WSCape,waist="Wanion Belt",legs="Lustratio Subligar",feet=gear.HercBootsWS}
	

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {hands="Plun. Armlets +1",waist="chaac belt", feet="Raider's Poulaines +2"})

	sets.stuff = {"Assassin's Bonnet +2"}

	sets.stuff2 = {"Asn. Bonnet +2"}
	

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	sets.midcast.FastRecast = {
		head="Meghanada Visor +1",ear2="Loquacious Earring",
		body="Adhemar Jacket",hands="Herculean Gloves",
		legs="Samnuha Tights",feet="Herculean Boots"}
		
	-- Specific spells
	sets.midcast.Utsusemi = {
		head="Meghanada Visor +1",ear2="Loquacious Earring",
		body="Adhemar Jacket",hands="Herculean Gloves",
		legs="Samnuha Tights",feet="Herculean Boots"}

	-- Ranged gear
	sets.midcast.RA = {}

	sets.midcast.RA.Acc = {}
		
	sets.midcast.RA.TH = set_combine(sets.midcast.RA, sets.TreasureHunter)

	sets.midcast.RA.TH.Acc = set_combine(sets.midcast.RA.Acc, sets.TreasureHunter)
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Novia earring",ear2="Ethereal earring",
		body="Meg. Cuirie +1",hands="Floral Gauntlets",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Skadi's Jambeaux +1"}



	sets.idle.Town = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Gala Corsage",neck="Wiglen Gorget",
		ear1="Novia earring",ear2="Ethereal earring",
		body="Councilor's Garb",hands=gear.HercGlovesTP,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Toutatis's Cape",waist="Reiki Yotai",legs="Meg. Chausses +1",feet="Skd. Jambeaux +1"}
	
	
	sets.ExtraRegen = {ammo="Staunch Tathlum",head="Oce. Headpiece +1",neck="Wiglen Gorget",ear1="Novia earring",ear2="Ethereal earring",
		body="Kheper jacket",hands="Floral Gauntlets",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Skadi's Jambeaux +1"}

	--------------------------------------
	-- Melee sets
	--------------------------------------
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	
	-- Normal melee group, no Dual Wield
	
	sets.engaged.FullBuffs = {main="Vajra",sub="Skinflayer",ammo="Ginsen",
    		head="Adhemar Bonnet",
    		body="Herculean Vest",hands=gear.HercGlovesTP,
    		legs="Samnuha Tights",feet=gear.HercBootsTP,neck="Clotharius Torque",waist="Windbuffet Belt +1",
		ear1="Telos Earring",ear2="Brutal Earring",ring1="Rajas Ring",ring2="Epona's Ring",back=gear.MeleeCape}
	
	sets.engaged.FullBuffs.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
		body="Meg. Cuirie +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs="Meg. Chausses +1",feet=gear.HercBootsDT}

	sets.engaged.FullBuffs.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
		body="Herculean Vest",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Windbuffet Belt +1",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}

	sets.engaged.FullBuffs.LowAcc = {main="Vajra",sub="Skinflayer",ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Clotharius Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Meg. Cuirie +1", hands=gear.HercGlovesTP,
		ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.MeleeCape,waist="Olseni Belt",
		legs="Samnuha Tights",feet=gear.HercBootsTP}

	sets.engaged.FullBuffs.LowAcc.PDT = {main="Vajra",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
		body="Meg. Cuirie +1",hands=gear.HercGlovesTP,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs="Meg. Chausses +1",feet=gear.HercBootsTP}

	sets.engaged.FullBuffs.LowAcc.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Herculean Vest",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Windbuffet Belt +1",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}

	sets.engaged.FullBuffs.MaxAcc = {main="Vajra",sub="Skinflayer",ammo="Falcon Eye",
		head="Adhemar Bonnet",
		neck="Maskirova Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Meg. Cuirie +1",hands=gear.HercGlovesTP,
		back=gear.MeleeCape,waist="Olseni Belt",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		legs="Meg. Chausses +1",
		feet=gear.HercBootsTP}
	
	sets.engaged.FullBuffs.MaxAcc.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Meg. Cuirie +1",head="Meghanada Visor +1",
		hands=gear.HercGlovesTP,
		back="Solemnity Cape",waist="Flume Belt",
		ring1="Dark Ring",ring2="Defending Ring",
		legs="Meg. Chausses +1",
		feet=gear.HercBootsTP}

	sets.engaged.FullBuffs.MaxAcc.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Herculean Vest",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Olseni Belt",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}


        -- Haste One, 6% DW

	
	sets.engaged = {main="Vajra",sub="Skinflayer",ammo="Ginsen",
		head="Skulker's Bonnet +1",
		neck="Clotharius Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket", hands=gear.HercGlovesTP,
		ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.MeleeCape,waist="Windbuffet Belt +1",
		legs="Samnuha Tights",feet=gear.HercBootsTP}

	sets.engaged.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Meg. Cuirie +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs="Meg. Chausses +1",feet=gear.HercBootsDT}

	sets.engaged.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhmear Jacket",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Windbuffet Belt",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}


	sets.engaged.LowAcc = {main="Vajra",sub="Skinflayer",ammo="Ginsen",
		head="Skulker's Bonnet +1",
		neck="Clotharius Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket", hands=gear.HercGlovesTP,
		ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.MeleeCape,waist="Olseni Belt",
		legs="Samnuha Tights",feet=gear.HercBootsTP}


	sets.engaged.LowAcc.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Meg. Cuirie +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs="Meg. Chausses +1",
		feet=gear.HercBootsDT}

	sets.engaged.LowAcc.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhmear Jacket",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Windbuffet Belt",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}

	sets.engaged.MaxAcc = {main="Vajra",sub="Skinflayer",ammo="Falcon Eye",
		head="Skulker's Bonnet +1",
		neck="Maskirova Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket",hands=gear.HercGlovesTP,
		back=gear.MeleeCape,waist="Olseni Belt",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		legs="Meg. Chausses +1",
		feet=gear.HercBootsTP}

	
	sets.engaged.MaxAcc.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Meg. Cuirie +1",
		hands=gear.HercGlovesDT,
		back="Solemnity Cape",waist="Flume Belt",
		ring1="Dark Ring",ring2="Defending Ring",
		legs="Meg. Chausses +1",
		feet=gear.HercBootsDT}

	sets.engaged.MaxAcc.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Skulker's Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhmear Jacket",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Olseni Belt",
		legs=gear.HercLegsDT,feet=gear.HercBootsDT}

	-- Haste Two, 25% DW in gear for trusts


	sets.engaged.DWFull ={main="Vajra",sub="Skinflayer",ammo="Ginsen",
         	head="Skulker's Bonnet +1",
    		body="Adhemar Jacket",hands="Floral Gauntlets",
    		legs="Samnuha Tights",ear1="Eabani Earring",ear2="Suppanomimi",
		ring1="Rajas Ring",ring2="Epona's Ring",
    		feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5',}},
    		neck="Clotharius Torque",waist="Reiki Yotai",
   		back=gear.MeleeCape}

	sets.engaged.DWFull.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",
		head="Meghanada Visor +1",body="Meg. Cuirie +1",
         	hands=gear.HercGlovesDT,
    		legs="Meg. Chausses +1",
    		feet=gear.HercBootsDT,
    		neck="Loricate Torque +1",waist="Flume Belt",ear1="Eabani Earring",ear2="Suppanomimi",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}

	sets.engaged.DWFull.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Skulker's Bonnet +1",body="Adhemar Jacket",
         	hands=gear.HercGlovesDT,
    		legs=gear.HercLegsDT,
    		feet=gear.HercBootsDT,
    		neck="Loricate Torque +1",waist="Reiki Yotai",ear1="Eabani Earring",ear2="Suppanomimi",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}

	sets.engaged.LowAcc.DWFull ={main="Vajra",sub="Skinflayer",ammo="Ginsen",
         	head="Skulker's Bonnet +1",
    		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    		hands="Floral Gauntlets",
    		legs="Samnuha Tights",ear1="Eabani Earring",ear2="Suppanomimi",
		ring1="Ramuh Ring +1",ring2="Epona's Ring",
    		feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5',}},
    		neck="Clotharius Torque",waist="Reiki Yotai",
       		back=gear.MeleeCape}

	sets.engaged.LowAcc.DWFull.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Meghanada Visor +1",body="Meg. Cuirie +1",
         	hands=gear.HercGlovesDT,
    		legs="Meg. Chausses +1",
    		feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5',}},
    		neck="Loricate Torque +1",waist="Flume Belt",ear1="Telos Earring",ear2="Brutal Earring",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}

	sets.engaged.LowAcc.DWFull.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Skulker's Bonnet +1",body="Adhemar Jacket",
         	hands=gear.HercGlovesDT,
    		legs=gear.HercLegsDT,
    		feet=gear.HercBootsDT,
    		neck="Loricate Torque +1",waist="Reiki Yotai",ear1="Eabani Earring",ear2="Suppanomimi",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}
	

sets.engaged.MaxAcc.DWFull ={main="Vajra",sub="Skinflayer",ammo="Ginsen",
         	head="Skulker's Bonnet +1",
    		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    		hands="Floral Gauntlets",
    		legs="Samnuha Tights",ear1="Eabani Earring",ear2="Suppanomimi",
		ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
    		feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5',}},
    		neck="Clotharius Torque",waist="Reiki Yotai",
       		back=gear.MeleeCape}

	sets.engaged.MaxAcc.DWFull.PDT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Meghanada Visor +1",body="Meg. Cuirie +1",
         	hands=gear.HercGlovesDT,
    		legs="Meg. Chausses +1",
    		feet={ name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5',}},
    		neck="Loricate Torque +1",waist="Flume Belt",ear1="Telos Earring",ear2="Brutal Earring",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}

	sets.engaged.MaxAcc.DWFull.DT = {main="Vajra",sub="Skinflayer",ammo="Staunch Tathlum",head="Skulker's Bonnet +1",body="Adhemar Jacket",
         	hands=gear.HercGlovesDT,
    		legs=gear.HercLegsDT,
    		feet=gear.HercBootsDT,
    		neck="Loricate Torque +1",waist="Reiki Yotai",ear1="Eabani Earring",ear2="Suppanomimi",
    		left_ring={ name="Dark Ring", augments={'Spell interruption rate down -4%','Magic dmg. taken -5%','Phys. dmg. taken -3%',}},
    		right_ring="Defending Ring",
    		back="Solemnity Cape"}
	



	



end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
function customize_idle_set(idleSet)
	if player.hpp < 97 then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end

	return idleSet
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

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
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

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end




function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    if state.DualWield.value ~= 'Normal' then
        msg = msg .. '/' .. state.DualWield.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

  
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end
-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    determine_haste_group()
end

function determine_haste_group()
    
    classes.CustomMeleeGroups:clear()
    
    if state.DualWield.value == 'DWFull' then
        classes.CustomMeleeGroups:append('DWFull')
    elseif state.DualWield.value == 'FullBuffs' then
        classes.CustomMeleeGroups:append('FullBuffs')
   
    end
end