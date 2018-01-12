-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-SelfCommands_with_color.lua')
	include('Sebs-Bard.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
	state.SingingMode = M{['description']='Singing Style', 'Etra_Length', 'Full_AF3','MaxLength'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	state.Buff.Reive = buffactive["Reive Mark"] or false
	
    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
	custom_Enhancing_timers = {}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.CastingMode:set('Resistant')
	
	state.PhysicalDefense     = M(false, 'Physical Defense')
	state.MagicalDefense      = M(false, 'Magical Defense')
	
	state.Pianissimo	      = M(false, 'Pianissimo All Songs')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Legato Dagger', 'Eminent Dagger'}
    pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers for Songs')
	state.UseCustomEnhancingTimers = M(true, 'Use Custom Timers for Enhancing Magic')
	gear.FC_staff = {name = "Marin Staff"}
    
    -- Additional local binds
	send_command('bind @F12 gs c cycle SingingMode')
	send_command('bind !F12 gs c toggle Pianissimo')
	send_command('bind ^f12 gs c cycle CastingMode')
    send_command('bind ^F11 gs c cycle ExtraSongsMode')
    --send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	
	--gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
	
	 -- Precast sets to enhance JAs
	gear.Staff.PDT = "Terra's Staff"
	--gear.default.fastcast_staff = "Marin Staff"
	--gear.default.recast_staff = "Marin Staff"
    
	QCLinos = { name="Linos", augments={'Mag. Acc.+15','Occ. quickens spellcasting +4%','DEX+1',}}
	FCLinos = { name="Linos", augments={'Mag. Acc.+15','"Fast Cast"+4','MND+2',}}
	TPLinos = { name="Linos", augments={'Attack+4','Haste+3','AGI+4',}}
	
	Ipetam_Refresh = { name="Ipetam", augments={'"Refresh"+1',}}
	
	Telchine_Head_TP		={ name="Telchine Cap", augments={'Attack+10','"Dbl.Atk."+2','AGI+4',}}
	Telchine_Head_Enh		={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +5',}}
	Telchine_Legs_TP		={ name="Telchine Braconi", augments={'Accuracy+15 Attack+15','"Dbl.Atk."+3','Weapon skill damage +2%',}}
	Telchine_Legs_Enh		={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +7',}}
	Telchine_Feet_Macc		={ name="Telchine Pigaches", augments={'Mag. Acc.+25','"Fast Cast"+5','CHR+9',}}
	Telchine_Feet_Enh		={ name="Telchine Pigaches", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +4',}}
	
    sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +1"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

    -- Fast cast sets for spells
    sets.precast.FC = {
		main=gear.FastcastStaff,sub={name="Vivid Strap",priority=-1},range = FCLinos,
		head="Nahtirah Hat",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2='Veneficium Ring',
		back="Swith Cape +1",waist="Witful belt",legs="Artsieq Hose",feet=Telchine_Feet_Macc}
		
		-- Corresponding Staff = 	14% FC
		-- else =					2% FC
		-- Linos (fastCast) =		4% FC		
		-- Vivid Strap = 			1% FC
		-- Nahtirah Hat = 			11% FC
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Anhur Robe = 			10% FC
		-- Gendewitha Gages +1 = 	7% FC
		-- Prolix Ring = 			2% FC
		-- Swith Cape +1 =			4% FC
		-- Witful Belt = 			3% FC
		-- Artsieq Hose = 			5% FC
		-- Telchine Pigaches = 		5% FC
		
		-- Total =					58~70% depending on spell element
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		range = QCLinos,
		head="Fili Calot",neck="Aoidos' Matinee",
		body="Sha'ir Manteel",
		back="Ogapepo Cape",waist="Witful belt",legs="Gendewitha Spats +1"})
		
		-- Corresponding Staff = 	14% FC			-- Fili Calot 		=		-13% SScT
		-- Vivid Strap = 			1% FC           -- Aoidos' Matinee =		-3% SScT
		-- Loquacious Earring = 	2% FC           -- Sha'ir Manteel = 		-12% SSct
		-- Enchanter Earring +1 =	2% FC           -- Gendewitha Gages +1 = 	-5% SScT augment
		-- Gendewitha Gages +1 = 	7% FC           -- Gendewitha Spats +1 =	-5% SScT + 
		-- Prolix Ring = 			2% FC           --							-4% SScT augment
		-- Witful Belt = 			3% FC           -- Telchine Pigaches =		-6% SScT
		-- Telchine Pigaches = 		5% FC           
		                                            -- Total =					-48% SScT
		-- Total =					36% FC 
		----------------------------------------------------------------------------------------
		-- Total + FC = 			84% 
			
	sets.precast.FC.BardSongPianissimo = set_combine(sets.precast.FC.BardSong, {body='Dalmatica'})
	
	sets.precast.FC.BardSongNoStaff = set_combine(sets.precast.FC.BardSong, {range = FCLinos, back="Swith Cape +1"})
				
		-- staff =					2% FC		-- Aoidos' Calot +2 =		-12% SScT
		-- Vivid Strap = 			1% FC       -- Aoidos' Matinee =		-3% SScT
		-- Linos (fastCast) =		4% FC       -- Sha'ir Manteel = 		-12% SSct
		-- Loquacious Earring = 	2% FC       -- Gendewitha Gages +1 = 	-5% SScT augment
		-- Enchanter Earring +1 =	2% FC       -- Gendewitha Spats +1 =	-5% SScT + 
		-- Gendewitha Gages +1 = 	7% FC       --							-4% SScT augment
		-- Prolix Ring = 			2% FC       -- Telchine Pigaches =		-6% SScT
		-- Swith Cape +1 =			4% FC       
		-- Witful Belt = 			3% FC       -- Total =					-47% SScT
		-- Telchine Pigaches = 		5% FC
		
		-- Total =					32% FC 
		----------------------------------------------------------------------------------------
		-- Total + FC = 			79%
	
	sets.precast.FC.BardSongPianissimoNoStaff = set_combine(sets.precast.FC.BardSongNoStaff, {range = QCLinos, back="Ogapepo Cape"})
	
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		range = QCLinos,
		main={name="Apaisante",priority = 2},sub={name="Genbu's Shield",priority = -1},
		body="Heka's Kalasiris",
		back="Ogapepo Cape",legs="Nabu's Shalwar"})
		
		-- Nahtirah Hat = 			11% FC		Apaisante			-10% CScT
		-- Loquacious Earring = 	2% FC       Genbu's Shield		-8% CScT
		-- Enchanter Earring +1 =	2% FC       Heka's Kalasiris =	-15% CScT
		-- Gendewitha Gages +1 = 	7% FC       Nabu's Shalwar = 	-15% CScT
		-- Prolix Ring = 			2% FC       
		-- Witful Belt = 			3% FC       Total = 				-48% CScT
		-- Telchine Pigaches = 		5% FC
		
		-- Total =					32% FC 
		---------------------------------------------------------------------------
		-- Total + FC =			80%

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {hands="Carapacho Cuffs",waist="Siegel Sash"})
		
		-- else =					2% FC			Siegel Sash = 			8% EMcT
		-- Linos (fastCast) =		4% FC		    Carapacho Cuffs = 		15% SScT
		-- Vivid Strap = 			1% FC           
		-- Nahtirah Hat = 			11% FC          Total = 				23% EMcT
		-- Loquacious Earring = 	2% FC
		-- Enchanter Earring +1 =	2% FC
		-- Anhur Robe = 			10% FC
		-- Prolix Ring = 			2% FC
		-- Swith Cape +1 =			4% FC
		-- Artsieq Hose = 			5% FC
		-- Telchine Pigaches = 		5% FC
		
		-- Total = 					48% FC
		-----------------------------------------------------------
		-- Total + FC =				71%
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
		-- Siegel Sash = 		-8% EMcT
		-- Total + FC (55%) =	61~75% depending on spell element

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
        

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {range="Gjallarhorn",
		head="Brioso Roundlet +1",neck="Nuna Gorget +1",ear2="Enchanter Earring +1",
		body="Bihu Justaucorps +1",hands="Bihu Cuffs +1",ring1="Carbuncle Ring +1",ring2="Carbuncle Ring +1",
		back="Swith Cape +1",legs="Bihu Cannions +1",feet="Brioso Slippers +1"}
    
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo= TPLinos,
		head=Telchine_Head_TP,neck="Nefarious Collar +1",ear1="Brutal Earring",ear2='Pixie Earring',
		body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}
   
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = {ammo= TPLinos,
		head=Telchine_Head_TP,neck="Nefarious Collar +1",ear1="Brutal Earring",ear2='Pixie Earring',
		body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}

	sets.precast.WS['Exenterator'] = {ammo= TPLinos,
		head=Telchine_Head_TP,neck="Moepapa Medal",ear1="Brutal Earring",ear2='Pixie Earring',
		body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}
	
	sets.precast.WS["Rudra's Storm"] = {ammo= TPLinos,
		head=Telchine_Head_TP,neck="Moepapa Medal",ear1="Brutal Earring",ear2='Pixie Earring',
		body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Ramuh Ring",
		back="Kayapa Cape",waist="Fotia Belt",legs="Byakko's Haidate",feet="Battlecast Gaiters"}

	sets.precast.WS['Mordant Rime'] = {range="Gjallarhorn",
		head=Telchine_Head_TP,neck="Nuna Gorget +1",ear1="Brutal Earring",ear2='Enchanter Earring +1',
		body="Bihu Justaucorps +1",hands="Bihu Cuffs +1",ring1="Carbuncle Ring +1",ring2="Carbuncle Ring +1",
		back="Atheling Mantle",waist="Fotia Belt",legs="Bihu Cannions +1",feet=Telchine_Feet_Macc}
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {
		main=gear.RecastStaff,sub={name="Arbuda Grip",priority = -1},range= TPLinos,
		head="Nahtirah Hat",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Anhur Robe",hands="Telchine Gloves",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Sailfi Belt",legs="Artsieq Hose",feet=Telchine_Feet_Macc}
				
	sets.midcast['Enfeebling Magic'] = {
		main={name="Lehbrailg +2",priority = 2},sub={name="Mephitis Grip",priority = 1},ammo= QCLinos,
		head="Bihu Roundlet +1",neck="Weike Torque",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Ischemia Chasuble",hands="Lurid Mitts",ring1="Sangoma Ring",ring2="Perception Ring",
		back="Rhapsode's Cape",waist="Ovate Rope",legs="Bihu Cannions +1",feet=Telchine_Feet_Macc}
				
		
	sets.midcast['Dia'] = set_combine(sets.midcast['Enfeebling Magic'] ,{waist="Tarutaru sash"})
        
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
    sets.midcast['Foe Lullaby'] 		= {hands="Brioso Cuffs"}
	sets.midcast['Foe Lullaby II'] 		= {hands="Brioso Cuffs"}
	sets.midcast['Horde Lullaby'] 		= {neck="Barcarolle Medal",hands="Brioso Cuffs"}
	sets.midcast['Horde Lullaby II'] 	= {neck="Barcarolle Medal",hands="Brioso Cuffs"}
	sets.midcast["Sentinel's Scherzo"]	= {feet="Fili Cothurnes"}
	sets.midcast['Magic Finale'] 		= {}
	sets.midcast['Pinning Nocturne'] 	= {}
	sets.midcast.Ballad 				= {legs="Fili Rhingrave"}
	sets.midcast.Madrigal 				= {head="Fili Calot"}
	sets.midcast.March 					= {hands="Fili Manchettes +1"}
	sets.midcast.Minuet 				= {body="Fili Hongreline"}
	sets.midcast.Minne 					= {}
	sets.midcast.Elegy 					= {}
	sets.midcast.Etude 					= {}
	sets.midcast.Prelude 				= {}
	sets.midcast.Requiem 				= {}
	sets.midcast.Mambo 					= {}
	sets.midcast.Threnody 				= {}
	sets.midcast.Hymnus 				= {}
	sets.midcast.Mazurka 				= {}
	sets.midcast.Paeon					= {head="Brioso Roundlet +1"}
	sets.midcast.Virelai 				= {}
	sets.midcast.Carol 					= {head="Fili Calot",
											body="Fili Hongreline",hands="Fili Manchettes +1",
											legs="Fili Rhingrave",feet="Fili Cothurnes"}
    
     -- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffectLength = {
			main={name="Legato Dagger",priority = 2},sub={name="Genbu's Shield",priority = 1},range='Gjallarhorn',
			head="Fili Calot",neck="Aoidos' Matinee",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
			body="Fili Hongreline",hands="Fili Manchettes +1",ring1="Prolix Ring",
			back="Swith Cape +1",waist="Sailfi Belt",legs="Fili Rhingrave",feet="Brioso Slippers +1"}
			
	sets.midcast.SongEffectFullAF = set_combine(sets.midcast.SongEffectLength, {feet="Fili Cothurnes"})
	sets.midcast.SongEffectMaxLength = set_combine(sets.midcast.SongEffectLength, {legs="Mdk. Shalwar +1"})

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
			main={name="Legato Dagger",priority = 2},sub={name="Genbu's Shield",priority = 1},range='Gjallarhorn',
			head="Bihu Roundlet +1",neck="Aoidos' Matinee",ear1="Gwati Earring",ear2="Enchanter Earring +1",
			body="Aoidos' Hongreline +2",hands="Fili Manchettes +1",ring1="Sangoma Ring",ring2="Perception Ring",
			back="Rhapsode's Cape",waist="Ovate Rope",legs="Bihu Cannions +1",feet="Brioso Slippers +1"}
			
	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {
			main={name="Lehbrailg +2",priority=2},sub={name="Mephitis Grip",priority=1},range='Gjallarhorn',
			head="Bihu Roundlet +1",neck="Piper's Torque",ear1="Gwati Earring",ear2="Enchanter Earring +1",
			body="Brioso Justaucorps +1",hands="Fili Manchettes +1",ring1="Carbuncle Ring +1",ring2="Carbuncle Ring +1",
			back="Rhapsode's Cape",waist="Ovate Rope",legs="Bihu Cannions +1",feet=Telchine_Feet_Macc}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
			main=gear.RecastStaff,sub={name="Arbuda Grip",priority=-1},range='Gjallarhorn',
			head="Nahtirah Hat",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
			body="Anhur Robe",hands="Telchine Gloves",ring1="Prolix Ring",
			back="Swith Cape +1",waist="Sailfi Belt",legs="Fili Rhingrave",feet=Telchine_Feet_Macc}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {
			main=gear.RecastStaff,sub={name="Arbuda Grip",priority=-1},range=info.ExtraSongInstrument,
			head="Nahtirah Hat",neck="Piper's Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
			body="Anhur Robe",hands="Telchine Gloves",ring1="Prolix Ring",ring2="Perception Ring",
			back="Swith Cape +1",waist="Sailfi Belt",legs="Artsieq Hose",feet=Telchine_Feet_Macc}

    -- Other general spells and classes.
   sets.midcast.Cure = {
			main={name="Arka IV",priority=2},sub={name='Curatio Grip',priority=1}, range= FCLinos,
			head="Nahtirah Hat",neck="Colossus's Torque",ear1='Healing Earring',ear2='Beatific Earring',
			body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
			back="Swith Cape +1",waist="Bishop's Sash",legs="Nabu's Shalwar",feet=Telchine_Feet_Macc}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {hands="Buremte Gloves"})
        
    sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
			main=gear.RecastStaff,sub={name='Curatio Grip',priority=-1},
			neck="Colossus's Torque",ear1='Healing Earring',
			ring1="Ephedra Ring",ring2="Sirona's Ring",
			waist="Bishop's Sash",legs="Nabu's Shalwar",feet="Gendewitha Galoshes"})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
			main=gear.RecastStaff,sub={name="Fulcio Grip",priority=-1},
			head=Telchine_Head_Enh,neck="Colossus's Torque",
			body="Telchine Chasuble",hands="Telchine Gloves",
			back="Merciful Cape",waist="Olympus Sash",legs=Telchine_Legs_Enh,feet=Telchine_Feet_Enh})
			
	sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
				
    sets.midcast.Stoneskin = {
			main=gear.RecastStaff,sub={name="Fulcio Grip",priority=-1}, range= TPLinos,
			head="Nahtirah Hat",neck="Stone Gorget",ear1='Earthcry Earring',ear2="Enchanter Earring +1",
			body="Anhur Robe",hands="Telchine Gloves",ring1="Prolix Ring",
			back="Swith Cape +1",waist="Siegel Sash",legs="Haven Hose",feet=Telchine_Feet_Enh}
        
    sets.midcast.Protect = {ring1="Sheltered Ring"}
 
	sets.midcast.Shell = {ring1="Sheltered Ring"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = set_combine(sets.idle.Weak, {
			main=gear.Staff.HMP,range="Oneiros Harp",
			neck="Eidolon Pendant",
			body="Ischemia Chasuble",ring1="Angha Ring",
			legs="Assiduity Pants +1"})
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {--main={name=gear.Staff.PDT,priority=2}
			main=Ipetam_Refresh,sub={name="Genbu's Shield",priority=-1},range="Oneiros Harp",
			head="Wivre hairpin",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Moonshade Earring",
			body="Ischemia Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
			back="Cheviot Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

	sets.idle.Town = {
			main=Ipetam_Refresh,sub={name="Genbu's Shield",priority=-1},range="Gjallarhorn",
			head="Shaded Spectacles",neck="Piper's Torque",ear1="Ethereal Earring",ear2="Moonshade Earring",
			body="Sha'ir Manteel",hands="Buremte Gloves",ring1="Carbuncle Ring +1",ring2="Carbuncle Ring +1",
			back="Rhapsode's Cape",waist="Ovate Rope",legs="Artsieq Hose",feet="Gendewitha Galoshes"}
   
	sets.idle.Weak = {
			main=gear.Staff.PDT,sub={name="Mephitis Grip",priority=-1},range="Oneiros Harp",
			head="Bihu Roundlet +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Moonshade Earring",
			body="Bihu Justaucorps +1",hands="Bihu Cuffs +1",ring1 = gear.DarkRing.physical, ring2 = gear.DarkRing.dt,
			back="Cheviot Cape",waist="Tarutaru sash",legs="Assiduity Pants +1",feet="Bihu Slippers"}
   
   
	-- Defense sets

	sets.defense.PDT = {
			main=gear.Staff.PDT,sub={name="Mephitis Grip",priority=-1},range="Oneiros Harp",
			head="Bihu Roundlet +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Suppanomimi",
			body="Bihu Justaucorps +1",hands="Bihu Cuffs +1",ring1 = gear.DarkRing.physical, ring2 = gear.DarkRing.dt,
			back="Cheviot Cape",waist="Flume Belt",legs="Bihu Cannions +1",feet="Battlecast Gaiters"}

	sets.defense.MDT = {
			main=gear.Staff.PDT,sub={name="Mephitis Grip",priority=-1},range="Oneiros Harp",
			head="Nahtirah Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Lifestorm Earring",
			body="Bihu Justaucorps +1",hands="Bihu Cuffs +1",ring1='Shadow Ring',ring2=gear.DarkRing.dt,
			back="Engulfer Cape +1",waist="Flume Belt",legs="Bokwus Slops",feet="Brioso Slippers +1"}

	sets.Kiting = {feet="Fili Cothurnes"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
			main="Izhiikoh", sub="Genbu's Shield",range=TPLinos,
			head=Telchine_Head_TP,neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
			body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}

	-- Sets with weapons defined.
	sets.engaged.Dagger = {
			main="Izhiikoh", sub="Genbu's Shield",range=TPLinos,
			head=Telchine_Head_TP,neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
			body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}
	
	sets.engaged.DWDagger = {
			range=TPLinos,
			head=Telchine_Head_TP,neck="Asperity Necklace",ear1="Steelflash Earring",ear2='Bladeborn Earring',
			body="Bihu Justaucorps +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Oneiros Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs=Telchine_Legs_TP,feet="Battlecast Gaiters"}
			
	sets.buff.Reive = {neck="Arciela's Grace +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
		gear.FC_staff.name = elements.fastcast_staff_of[spell.element]
        if gear.FC_staff.name and (player.inventory[gear.FC_staff.name] or player.wardrobe[gear.FC_staff.name]) then
			if state.Buff['Pianissimo'] then	
				equip(sets.precast.FC.BardSongPianissimo)
			else
				equip(sets.precast.FC.BardSong)
			end
		else
			if state.Buff['Pianissimo'] then	
				equip(sets.precast.FC.BardSongPianissimoNoStaff)
			elseif not state.Buff['Pianissimo'] then
				equip(sets.precast.FC.BardSongNoStaff)
			end
		end
		get_casting_style(spell, action, spellMap, eventArgs)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
		elseif spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.CureSelf)
			end
		end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            equip(sets.midcast.Daurdabla)
        end

        state.ExtraSongsMode:reset()
    end
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and not spell.interrupted then
        if spell.target and spell.target.type == 'SELF' then
            adjust_timers(spell, spellMap)
        end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(field, newValue, oldValue)

	if field == "Physical Defense" then
		if state.PhysicalDefense.value == true then
			state.DefenseMode.current = 'Physical'
			state.DefenseMode:set('Physical')
			state.MagicalDefense = M(false)
		end
	elseif field == "Magical Defense" then
		if state.MagicalDefense.value == true then
			state.DefenseMode.current = 'Magical'
			state.DefenseMode:set('Magical')
			state.PhysicalDefense = M(false)
		end
	end
	if field == "Magical Defense" or field == "Physical Defense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
	
    if field == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','ammo')
        else
            enable('main','sub','ammo')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
	if buff == 'Goldsmithing Imagery' and gain then
		 send_command('timers create "'..buff..'" 480 down abilities/00121.png')
	end
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    pick_tp_weapon()
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	if state.Buff.Reive then
		idleSet = set_combine(idleSet, sets.buff.Reive)
	end
	
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function get_casting_style(spell, action, spellMap, eventArgs)
	--'None','PianissimoAll', 'TenutoBallad' 
	local song_buffsSpellMap = S{'Minuet', 'Minne', 'March', 'Madrigal', 'Prelude', 'Mambo', 'Mazurka', 'Etude', 'Ballad', 'Paeon', 'Carol'}
	local song_buffsSpellName = S{"Fowl Aubade", "Herb Pastoral", "Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte", "Goddess's Hymnus", "Maiden's Virelai", "Sentinel's Scherzo"}
	--print(tostring(state.Buff[spell.english])..' -- '..spell.english)
	if not (buffactive['Amnesia'] or buffactive['impairment']) and song_buffsSpellMap:contains(spellMap) or song_buffsSpellName:contains(spell.name) then 
		if state.Pianissimo.value == true and ((spell.target.type == 'PLAYER' or spell.target.type == 'SELF' and not spell.target.charmed) or npcs.Trust:contains(spell.target.name)) then
			if not state.Buff['Pianissimo'] then
				cancel_spell()
				send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
				eventArgs.cancel = true
				return
			end
		else
			if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or npcs.Trust:contains(spell.target.name)) then
				if not state.Buff['Pianissimo'] then
					cancel_spell()
					send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
					eventArgs.cancel = true
					return
				end
			end
		end
	elseif (buffactive['Amnesia'] or buffactive['impairment']) then 
		if spell.target.type == 'PLAYER' then
			cancel_spell()
			send_command('@input /ma "'..spell.name..'" <me>')
			add_to_chat(200,'***** Job Abilities not available. Redirecting spell to SELF *****')
			eventArgs.cancel = true
			return
		end
	end
end

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        return 'DaurdablaDummy'
	end
    if state.SingingMode.value == 'Etra_Length' then
        return 'SongEffectLength'
	elseif state.SingingMode.value == 'Full_AF3' then 
		return 'SongEffectFullAF'
	elseif state.SingingMode.value == 'MaxLength' then 
		return 'SongEffectMaxLength'
    end
end


-- Function to create custom buff-remaining timers with the Timers plugin,
-- keeping only the actual valid songs rather than spamming the default
-- buff remaining timers.
function adjust_timers(spell, spellMap, target)
    if state.UseCustomTimers.value == false then
        return
    end
	
    local current_time = os.time()
    -- custom_timers contains a table of song names, with the os time when they
    -- will expire.
    
    -- Eliminate songs that have already expired from our local list.
    local temp_timer_list = {}
    for song_name,expires in pairs(custom_timers) do
        if expires < current_time then
            temp_timer_list[song_name] = true
        end
    end
    for song_name,expires in pairs(temp_timer_list) do
        custom_timers[song_name] = nil
    end
    
    local dur = calculate_duration(spell.name, spellMap)
    if custom_timers[spell.name] then
        -- Songs always overwrite themselves now, unless the new song has
        -- less duration than the old one (ie: old one was NT version, new
        -- one has less duration than what's remaining).
        
        -- If new song will outlast the one in our list, replace it.
        if custom_timers[spell.name] < (current_time + dur) then
            send_command('timers delete "'..spell.name..'"')
            custom_timers[spell.name] = current_time + dur
            send_command('wait 0.2;timers create "'..spell.name..'" '..(dur-0.2)..' down "'..spell.name..'"')
        end
    else
		custom_timers[spell.name] = current_time + dur
		send_command('timers create "'..spell.name..'" '..dur..' down "'..spell.name..'"')
        -- Figure out how many songs we can maintain.
        local maxsongs = 2
        if player.equipment.range == info.ExtraSongInstrument then
            maxsongs = maxsongs + info.ExtraSongs
        end
        if buffactive['Clarion Call'] then
            maxsongs = maxsongs + 1
        end
        -- If we have more songs active than is currently apparent, we can still overwrite
        -- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
        if maxsongs < table.length(custom_timers) then
            maxsongs = table.length(custom_timers)
        end
        
        -- Create or update new song timers.
        if table.length(custom_timers) < maxsongs then
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.name..'" '..dur..' down "'..spell.name..'"')
        else
            local rep,repsong
            for song_name,expires in pairs(custom_timers) do
                if current_time + dur > expires then
                    if not rep or rep > expires then
                        rep = expires
                        repsong = song_name
                    end
                end
            end
            if repsong then
                custom_timers[repsong] = nil
                send_command('timers delete "'..repsong..'"')
                custom_timers[spell.name] = current_time + dur
                send_command('wait 0.2;timers create "'..spell.name..'" '..(dur-0.2)..' down "'..spell.name..'"')
            end
        end
    end
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
    local mult = 1
    if player.equipment.range == 'Daurdabla' then mult = mult + 0.25 end -- change to 0.25 with 90 Daur and 0.3 for daurd 95
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
	if player.equipment.range == "Eminent Flute" then mult = mult + 0.2 end
	
	if spellMap == 'Minuet' and player.equipment.range == "Apollo's Flute" then mult = mult + 0.3 end
	if spellMap == 'March' and player.equipment.range == 'Langeleik' then mult = mult + 0.3 end
	if spellMap == 'Paeon' and player.equipment.range == "Oneiros Harp" then mult = mult + 0.3 end
	if spellMap == 'Minne' and player.equipment.range == "Syrinx" then mult = mult + 0.3 end
	if spellMap == 'Etude' and player.equipment.range == "Langeleik" then mult = mult + 0.3 end
	if spellMap == 'Madrigal' and player.equipment.range == "Cantabank's Horn" then mult = mult + 0.3 end
	if spellMap == 'Mambo' and player.equipment.range == "Vihuela" then mult = mult + 0.3 end
	if spellMap == 'Mazurka' and player.equipment.range == "Vihuela" then mult = mult + 0.3 end
    
    if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if player.equipment.body == "Fili Hongreline" then mult = mult + 0.11 end
	if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.12 end
    if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
    
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 end
	if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot" then mult = mult + 0.1 end
	if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline" then mult = mult + 0.1 end
	if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == 'Ad. Mnchtte. +2' then mult = mult + 0.1 end
	if spellMap == 'March' and player.equipment.hands == 'Fili Manchettes' then mult = mult + 0.1 end
	if spellMap == 'March' and player.equipment.hands == 'Fili Manchettes +1' then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 end
	if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave" then mult = mult + 0.1 end
	if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1" then mult = mult + 0.1 end
    if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes" then mult = mult + 0.1 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1" then mult = mult + 0.1 end
    
    if buffactive.Troubadour then
        mult = mult*2
    end
    if spellName == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end
    
    local totalDuration = math.floor(mult*120)

    return totalDuration
end


-- Examine equipment to determine what our current TP weapon is.
function pick_tp_weapon()
    if brd_daggers:contains(player.equipment.main) then
        state.CombatWeapon:set('Dagger')
        
        if S{'NIN','DNC'}:contains(player.sub_job) and brd_daggers:contains(player.equipment.sub) then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    else
        state.CombatWeapon:reset()
        state.CombatForm:reset()
    end
end

-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 8)
	
	--send_command('bind !F12 gs c cycle SingingMode')
	
	if player.sub_job:upper() == 'WHM' then		
		send_command('bind ^` input /ma "Blink" <me>')
        send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F9 input /ma "Haste" <stal>')
		send_command('bind ^F9 input /ma "erase" <stal>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')

	elseif player.sub_job:upper() == 'RDM' then
		send_command('bind ^f12 gs c cycle CastingMode')
		--send_command('bind f11 gs c cycle daurdabla')
		
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind !` input /ma "Stoneskin" <me>')
		
		send_command('bind F7 input /ma "Haste" <stal>')
		send_command('bind F8 input /ma "Refresh" <stal>')
		send_command('bind F9 input /ma "Phalanx" <me>')
		send_command('bind F10 input /ma "cure III" <stal>')
		send_command('bind F11 input /ma "cure IV" <stal>')
		
	end
end

windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
