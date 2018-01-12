-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
include('organizer-lib.lua')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false

    custom_timers = {}
    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
         'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite',
                            'Queasyshroom','Power Attack','Ram Charge','Screwdriver','Sickle Slash',
                            'Smite of Rage','Spinal Cleave','Spiral Spin','Terror Touch'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
       'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
                            'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
                            'Whirl of Rage','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
                            'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
                            'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
       'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
                            'Sprout Smack'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
       'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
                            'Wild Oats'
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
	'Acrid Stream','Blastbomb','Sandspin','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
                            'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer','Subduction',
                            'Regurgitation','Charged Whisker','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb',
							'Retinal Glare','Rail Cannon','Diffusion Ray','Molting Plumage','Nectarous Deluge','Thunderbolt',
							'Crashing Thunder','Molting Plumage','Uproot','Blazing Bound','Searing Tempest','Blinding Fulgor',
							'Spectral Floe','Scouring Spate','Anvil Lightning','Silent Storm','Entomb','Tenebral Crush','Palling Salvo'
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
    blue_magic_maps.MagicAccuracy = S{ '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
                            'Blank Gaze','Blistering Roar','Blood Drain','Chaotic Eye',
                            'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
                            'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
                            'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
                            'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
                            'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
                            'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
         'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath',
                            'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
                            'Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
       'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
                            'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
         'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','White Wind',
                            'Wild Carrot','Restoral'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
                            'Droning Whirlwind','Gates of Hades','Harden Shell','Pyric Bulwark','Thunderbolt',
                            'Tourbillion','Mighty Guard'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc','HighAcc', 'Learning')
    state.HybridMode:options('Normal','Hybrid','DT')
    state.WeaponskillMode:options('Normal', 'Acc','HighAcc','Learning')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Cleave')

	gear.WaltzHands = { name="Herculean Gloves", augments={'Accuracy+14','"Waltz" potency +11%','AGI+8',}}
	gear.WaltzLegs = { name="Herculean Trousers", augments={'"Waltz" potency +11%',}}
	gear.WaltzFeet = { name="Herculean Boots", augments={'"Waltz" potency +10%','DEX+12',}}
	gear.WaltzHead = { name="Herculean Helm", augments={'Attack+17','"Waltz" potency +10%',}}

	gear.HercGlovesTP = { name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Accuracy+9','Attack+12',}}
	gear.HercGlovesWS =  { name="Herculean Gloves", augments={'CHR+1','AGI+5','Crit.hit rate+5','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
	gear.HercGlovesDT =  { name="Herculean Gloves", augments={'Accuracy+11 Attack+11','Damage taken-4%',}}

	gear.HighAccFeet = { name="Herculean Boots", augments={'Accuracy+19','Crit. hit damage +4%','Accuracy+18 Attack+18','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	gear.AccFeet = { name="Herculean Boots", augments={'Accuracy+19','Crit. hit damage +4%','Accuracy+18 Attack+18','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	gear.HercBootsTP = { name="Herculean Boots", augments={'Accuracy+15','"Triple Atk."+4','DEX+4',}}
	gear.HercBootsWS = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+15','"Waltz" potency +1%','Weapon skill damage +5%','Accuracy+10 Attack+10','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
 	gear.RefreshFeet = { name="Herculean Boots", augments={'Blood Pact Dmg.+2','"Mag.Atk.Bns."+10','"Refresh"+1',}}
	gear.HercFeetDT	={ name="Herculean Boots", augments={'Damage taken-4%','DEX+5','Attack+11',}}

	gear.HercLegsDT = { name="Herculean Trousers", augments={'Accuracy+9 Attack+9','Damage taken-2%','STR+1','Accuracy+11',}}

	gear.DmgAmalric = {name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}

    
    update_combat_form()
    select_default_macro_book()
end
	-- ! is alt, ^ is control --
	send_command('bind ^- input /ws "Chant du Cygne" <t>')
	send_command('bind !- input /ws "Requiescat" <t>')
	send_command('bind ^= input /ma "Nat. Meditation" <me>')
	send_command('bind != input /ma "Erratic Flutter" <me>')
	send_command('bind ^` input /ma "Occultation" <me>')
	send_command('bind !` input /ma "Dream Flower" <stnpc>')
	
	send_command('bind numpad7 input /ma "Sneak" <stpt>')
	send_command('bind numpad1 input /ma "Invisible" <stpt>')
	send_command('bind numpad0 input /ja "Spectral Jig" <me>')
	send_command('bind numpad. input /ws "Savage Blade" <t>')

	send_command('bind !f9 input /lockstyleset 6')
	send_command('bind f9 exec bind.txt')
	send_command('bind ^f9 gs c cycle WeaponskillMode')
	send_command('bind F11 gs c cycle IdleMode')
	send_command('bind F10 gs c cycle HybridMode')
	send_command('bind f12 gs c update user')


-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {}
    sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +1"}
    sets.buff.Convergence = {}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Enchainment = {}
    sets.buff.Efflux = {back="Rosmerta's Cape"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {}


 -- Waltz set (chr and vit)
	sets.precast.Waltz = {head=gear.WaltzHead,
		body="Passion Jacket",hands=gear.WaltzHands,ring1="Valseur's Ring",
		legs=gear.WaltzLegs,feet=gear.WaltzFeet}

        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
        head="Carmine Mask",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Dread Jupon",hands="leyline gloves",ring1="Prolix Ring",ring2="Rahab Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Amalric Nails"}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC,{body="Hashishin Mintan +1"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Cessance Earring",
        body="Abnoba Kaftan",hands=gear.HercGlovesWS,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Rosmerta's Cape",waist="Wanion Belt",legs="Carmine Cuisses +1",feet=gear.HercBootsWS}

    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
        head="Adhemar Bonnet",neck="Light Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Abnoba Kaftan",hands=gear.HercGlovesWS,ring1="Begrudging Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Light Belt",legs="Samnuha Tights",feet="Thereoid Greaves"}

   
    sets.precast.WS['Chant du Cygne'].Acc = {ammo="Jukukik Feather",
        head="Adhemar Bonnet",neck="Light Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Abnoba Kaftan",hands=gear.HercGlovesWS,ring1="Begrudging Ring",ring2="Ramuh Ring +1",
        back="Rosmerta's Cape",waist="Light Belt",legs="Samnuha Tights",feet=gear.AccFeet}

	sets.precast.WS['Chant du Cygne'].HighAcc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Light Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Herculean Vest",hands=gear.HercGlovesWS,ring1="Begrudging Ring",ring2="Ramuh Ring +1",
        back="Rosmerta's Cape",waist="Light Belt",legs="Carmine Cuisses +1",feet=gear.HighAccFeet}

 sets.precast.WS['Savage Blade'] = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Caro Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Herculean Vest",hands=gear.HercGlovesWS,ring1="Rajas Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.HighAccFeet}


   sets.precast.WS['Savage Blade'].Acc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Caro Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Herculean Vest",hands=gear.HercGlovesWS,ring1="Rajas Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.HighAccFeet}

	sets.precast.WS['Savage Blade'].HighAcc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Caro Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Herculean Vest",hands=gear.HercGlovesWS,ring1="Rajas Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Prosilio Belt +1",legs="Carmine Cuisses +1",feet=gear.HighAccFeet}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS)

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


    sets.precast.WS['Requiescat'] = { ammo="Falcon Eye",
	head="Carmine Mask",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Jhakri Robe +1",hands=gear.HercGlovesWS,ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back="Rosmerta's Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet=gear.HercBootsWS}

    
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
       
        back="Swith Cape +1"}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {ammo="Mavi Tathlum",
        head="Lithelimb Cap",neck="Caro Necklace",ear1="Telos Earring",ear2="Cessance Earring",
        body="Adhemar Jacket",hands=gear.HercGlovesTP,ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back="Cornflower Cape",waist="Olseni Belt",legs="Samnuha Tights",feet=gear.HercBootsTP}

    sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Mavi Tathlum",
        head="Carmine Mask",neck="Caro Necklace",ear1="Telos Earring",ear2="Cessance Earring",
        body="Adhemar Jacket",hands=gear.HercGlovesTP,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Cornflower Cape",waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.AccFeet}

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical)

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Jhakri Robe +1",hands=gear.DmgAmalric,ring1="Stikini Ring",ring2="Stikini Ring",
        back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    sets.midcast['Tenebral Crush'] = {ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Jhakri Robe +1",hands=gear.DmgAmalric,ring1="Stikini Ring",ring2="Stikini Ring",
        back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical)
    
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Pemphredo Tathlum",
        head="Herculean Helm",neck="Incanter's Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
       body="Jhakri Robe +1",hands=gear.DmgAmalric,ring1="Stikini Ring",ring2="Stikini Ring",
        back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum"}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy)
        
    sets.midcast['Blue Magic']['White Wind'] = {
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Mendicant's Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="K'ayres Ring",ring2="Kunaji Ring",
        back="Reiki Cloak",waist="Olseni Belt",legs="",feet="Medium's Sabots"}

    sets.midcast['Blue Magic'].Healing = {
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Mendicant's Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="K'ayres Ring",ring2="Kunaji Ring",
        back="Reiki Cloak",waist="Olseni Belt",legs="",feet="Medium's Sabots"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",
						head="Luhlaza Keffiyeh",body="Assim. Jubbah +1",back="Cornflower Cape",feet="Luhlaza Charuqs +1"}

    sets.midcast['Blue Magic'].Buff = {}
    
    sets.midcast.Occultation = {
							ammo="Mavi Tathlum",
							head="Luhlaza Keffiyeh",
							neck="Incanter's Torque",
							body="Assim. Jubbah +1",
							ring1="Stikini Ring",ring2="Stikini Ring",
							back="Cornflower Cape",
							feet="Luhlaza charuqs +1"
							}
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    

    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ring1="Stikini Ring",ring2="Stikini Ring",head="Luhlaza Keffiyeh",neck="Incanter's Torque",body="Assim. Jubbah +1",hands="Assimilator's Bazubands +1",ammo="Mavi Tathlum",back="Cornflower Cape",feet="Luhlaza Charuqs +1"
       }


    

    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Novia earring",ear2="Ethereal earring",
        body="Jhakri Robe +1",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet=gear.RefreshFeet}
    
    -- Idle sets
    sets.idle = {main="Sequence",sub="Colada",ammo="Staunch Tathlum",
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Novia earring",ear2="Ethereal earring",
        body="Jhakri Robe +1",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet=gear.RefreshFeet}

    sets.idle.Cleave = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Staunch Tathlum",
       head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Novia earring",ear2="Ethereal earring",
        body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet=gear.HercFeetDT}

    

    sets.idle.Town = {main="Sequence",sub="Colada",ammo="Impatiens",
        head="Gala Corsage",neck="Loricate Torque +1",ear1="Novia earring",ear2="Ethereal earring",
        body="Councilor's Garb",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
        back="Mecisto. Mantle",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet=gear.RefreshFeet}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning,{main="Immortal's Scimitar",sub="Genbu's Shield"})

    
   

   

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    sets.swords= {main="Sequence",sub="Colada"}

    -- Normal melee group. 
    -- Need 36% DW with capped magic haste.
    -- 19% MDT with ring, shellraV. 21% MDT without ring, shellraV. 26 MDT with normal shell.

    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal earring",ear2="Cessance Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercBootsTP}

    sets.engaged.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Brutal earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Windbuffet Belt +1",legs=gear.HercLegsDT,feet=gear.HercFeetDT}

    sets.engaged.PDT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Brutal earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs=gear.HercLegsDT,feet=gear.HercFeetDT}
		

 
  	-- Low Acc melee group.

    sets.engaged.Acc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Clotharius Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Ramuh Ring +1",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercBootsTP}

    sets.engaged.Acc.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs=gear.HercLegsDT,feet=gear.HercFeetDT}

    
	 -- High Acc melee group.
 
    sets.engaged.HighAcc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Telos Earring",ear2="Cessance Earring",
        body="Herculean Vest",hands="Herculean Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Rosmerta's Cape",waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.HercBootsTP}

    sets.engaged.HighAcc.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs=gear.HercLegsDT,feet=gear.HercFeetDT}

    


     -- Dual Wield melee group.

    sets.engaged.DW = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands=gear.HercGlovesTP,ring1="Hetairoi Ring",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercBootsTP}

   sets.engaged.DW.Hybrid = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Rosmerta's Cape",waist="Windbuffet Belt +1",
		legs="Samnuha Tights",feet=gear.HercFeetDT}


   sets.engaged.DW.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs=gear.HercLegsDT,feet=gear.HercFeetDT}

   


      -- Low Acc Dual Wield melee group.

    sets.engaged.DW.Acc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Clotharius Torque",ear1="Telos Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands=gear.HercGlovesTP,ring1="Ramuh Ring +1",ring2="Epona's Ring",
        back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.HercBootsTP}

     sets.engaged.DW.Acc.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs=gear.HercLegsDT,feet=gear.HercFeetDT}

    
      

 -- High Acc Dual Wield melee group.

    sets.engaged.DW.HighAcc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Telos Earring",ear2="Suppanomimi",
        body="Herculean Vest",hands=gear.HercGlovesTP,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Rosmerta's Cape",waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.HercBootsTP}

     sets.engaged.DW.HighAcc.DT = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +1",hands=gear.HercGlovesDT,
		ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",
		legs=gear.HercLegsDT,feet=gear.HercFeetDT}

    
     


    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


    sets.self_healing = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------


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
    
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    msg = msg .. ', Idle: ' .. state.IdleMode.value
    

  
    
    
   

    add_to_chat(122, msg)

    eventArgs.handled = true
end



-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
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
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

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



-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 7)
    else
        set_macro_page(1, 7)
    end
end




function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.name == 'Mighty Guard' then
		adjust_timers(spell, spellMap)
	elseif spell.name == 'Barrier Tusk' then
		adjust_timers(spell, spellMap)
	elseif spell.name == 'Cocoon' then
		adjust_timers(spell, spellMap)
	elseif string.find(spell.name,'Nat.') then
		adjust_timers(spell, spellMap)
	end
end

function adjust_timers(spell, spellMap)
    local current_time = os.time()
    local temp_timer_list = {}
    local dur = calculate_duration(spell, spellName, spellMap)
         custom_timers[spell.name..' ['..spell.target.name..']'] = nil
         send_command('timers delete "'..spell.name..' ['..spell.target.name..']"')
         custom_timers[spell.name..' ['..spell.target.name..']'] = current_time + dur
         send_command('@wait 1;timers create "'..spell.name..' ['..spell.target.name..']" '..dur..' down')
end

function calculate_duration(spell, spellName, spellMap)

    local mult = 1.00
	
	if spell.name == 'Mighty Guard' and player.equipment.feet == "Luhlaza Charuqs +1" then mult = mult + 0.75 end

	local base = 0

	
	if spell.name == 'Mighty Guard' then base = base + 180 end
	if spell.name == 'Barrier Tusk' then base = base + 180 end
	if spell.name == 'Cocoon' then base = base + 90 end
	if spell.name == 'Nat. Meditation' then base = base + 90 end
	

	
			
    local totalDuration = math.floor(mult*base)

	---print(totalDuration)

    return totalDuration
end

function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end


windower.raw_register_event('zone change', reset_timers)
windower.raw_register_event('job change',reset_timers)