-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()


    state.IdleMode:options('Normal','PDT','MDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None')

	gear.fc_back = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+10',}}
    gear.cure_back = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+12',}}

    select_default_macro_book()
	send_command('exec whm.txt')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.Melee = {}
	
    -- sets.buff.Sublimation = {waist="EMBLA SASH"}
    -- sets.buff.DTSublimation = {waist="EMBLA SASH"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = 
	{	
		main="ORANYAN",				--7 
		sub="CLERISY STRAP",		--2
		ammo="IMPATIENS",			
		head=gear.vanya_hood_fc,	--10
		neck="ORUNMILA'S TORQUE",	--5
		ear1="MALIGNANCE EARRING",	--4
		ear2="LOQUAC. EARRING",		--2
		body="INYANGA JUBBAH +2",	--14 
		hands="GENDEWITHA GAGES",	--7
		ring1="PROLIX RING",		--2
		ring2="LEBECHE RING",
		back="OGAPEPO CAPE",			
		waist="WITFUL BELT",		--3
		legs=gear.chironic_fc_legs,	--6
		feet="REGAL PUMPS +1"		--~5
	}								--TOTAL: ~67
	--############################ Try removing these and seeing if FC still applies to each spell or whatever #####################
    sets.precast.FC.DT = sets.precast.FC
	sets.precast.FC['Enhancing Magic'] = sets.precast.FC    
	sets.precast.FC.Stoneskin = sets.precast.FC    
	sets.precast.FC['Healing Magic'] = sets.precast.FC
	sets.precast.FC.StatusRemoval = sets.precast.FC
    sets.precast.FC.Cure = sets.precast.FC
    sets.precast.FC.Curaga = sets.precast.FC
	sets.precast.FC.CureSolace = sets.precast.FC
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="DAYBREAK",sub="GENBU'S SHIELD"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="PIETY BLIAUT +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.Dagan = {}
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}
    sets.precast.WS['Flash Nova'] = {}
    sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {ring2="SHNEDDICK RING"}
    sets.latent_refresh = {waist="FUCHO-NO-OBI"}
	sets.latent_refresh_grip = {sub="ONEIROS GRIP"}
	sets.TPEat = {}
	sets.DayIdle = {waist="LYCOPODIUM SASH"}
	sets.NightIdle = {}
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Cure_Received = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Self_Refresh = {back="GRAPEVINE CAPE",waist="GISHDUBAR SASH",feet="INSPIRITED BOOTS"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = 
	{	
		main="GRIOAVOLR",
		sub="GIUOCO GRIP",
		ammo="INCANTOR STONE",
		head=gear.vanya_hood_fc,
		neck="ORUNMILA'S TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="MENDI. EARRING",
		body="INYANGA JUBBAH +2",
		hands="FANATIC GLOVES",
		ring1="NAJI'S LOOP",
		ring2="PROLIX RING",
		back=gear.fc_back,
		waist="WITFUL BELT",
		legs="VANYA SLOPS",
		feet="UMBANI BOOTS"
	}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
    sets.midcast.FastRecast = 
	{	
		main="ORANYAN",				--7
		sub="CLERISY STRAP",		--2
		ammo="INCANTOR STONE",		--2	
		head=gear.vanya_hood_fc,	--10
		neck="ORUNMILA'S TORQUE",	--5
		ear1="MALIGNANCE EARRING",	--4
		ear2="LOQUAC. EARRING",		--2
		body="INYANGA JUBBAH +2",	--14
		hands="GENDEWITHA GAGES",	--7
		ring1="PROLIX RING",		--2
		ring2="NAJI'S LOOP",		--1
		back=gear.fc_back,			--10
		waist="EMBLA SASH",			--3
		legs=gear.chironic_fc_legs,	--6
		feet="REGAL PUMPS +1"		--~5
	}								--Total: ~80
	---------------
    -- Cure sets --
	---------------
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = 
	{	
		main="QUELLER ROD",			--15	Enmity -15  
		sub="GENBU'S SHIELD",		--3		
		ammo="ESPER STONE +1",		--		Enmity -5
		head="THEO. CAP +1",		--10	Enmity -4 
		neck="ORUNMILA'S TORQUE",	--		Enmity -3
		ear1="GLORIOUS EARRING",	-- 		Enmity -5	(II)2
		ear2="HALASZ EARRING",		--		Enmity -3
		body="VANYA ROBE",			--7		Enmity -6
		hands="EBERS MITTS",		--		Enmity -9
		ring1="LEBECHE RING",		--3		Enmity -5
		ring2="NAJI'S LOOP",		--1		Enmity -1	(II)1 		
		back=gear.cure_back,		--10
		waist="WITFUL BELT",						
		legs="EBERS PANTALOONS",	
		feet="VANYA CLOGS"			--12	Enmity -6
	}								--Potency 61/50		Enmity -62/50
	
	sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="EBERS BLIAUT +1"}) 
									--Potency 54/50		Enmity -56/50

	sets.midcast.LightWeatherCure = 
	{	
		main="IRIDAL STAFF",		--10 
		sub="ELETTA GRIP",			--		Enmity -3	
		ammo="ESPER STONE +1",		--		Enmity -5
		head="THEO. CAP +1",		--10	Enmity -4
		neck="ORUNMILA'S TORQUE",	--		Enmity -3		
		ear1="GLORIOUS EARRING",	--		Enmity -5 	(II)2
		ear2="HALASZ EARRING",		--		Enmity -3 					
		body="VANYA ROBE",			--7		Enmity -6
		hands="EBERS MITTS",		--		Enmity -9		
		ring1="LEBECHE RING",		--3		Enmity -5
		ring2="NAJI'S LOOP",		--1		Enmity -1 	(II)1		
		back=gear.cure_back,		--10
		waist="KORIN OBI",						
		legs="EBERS PANTALOONS",	
		feet="VANYA CLOGS",			--12	Enmity -6
	}								--Potency 53/50 	Enmity -50/50

	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.LightWeatherCure, {ear2="MENDI. EARRING",body="EBERS BLIAUT +1"})
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure, {waist="KORIN OBI"})
	sets.midcast.LightDayCure = sets.midcast.LightDayCureSolace
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.LightWeatherCuraga = sets.midcast.LightWeatherCure
	sets.midcast.LightDayCuraga = sets.midcast.LightDayCure
	sets.midcast.Cure.DT = sets.midcast.Cure 

	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})

	sets.midcast.Cursna = 
	{	
		main="DIVINITY", 
		sub="QUELLER ROD",
		ammo="INCANTOR STONE",
		head=gear.vanya_hood_cure,
		neck="COLOSSUS'S TORQUE",
		ear1="LOQUAC. EARRING",
		ear2="MALIGNANCE EARRING",
		body="EBERS BLIAUT +1",
		hands="FANATIC GLOVES",
		ring1="HAOMA'S RING",
		ring2="EPHEDRA RING",
		back= gear.fc_back,
		waist="BISHOP'S SASH",
		legs="THEO. PANT. +1",
		feet="VANYA CLOGS"
	}

	sets.midcast.StatusRemoval = 
	{	
		main="ORANYAN",
		sub="CLEMENCY GRIP",			
		ammo="INCANTOR STONE",
		head="EBERS CAP +1",
		neck="ORUNMILA'S TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="LOQUAC. EARRING",
		body="INYANGA JUBBAH +2",
		hands="GENDEWITHA GAGES",
		ring1="NAJI'S LOOP",
		ring2="PROLIX RING",
		back=gear.fc_back,
		waist="EMBLA SASH",
		legs="EBERS PANTALOONS",
		feet="REGAL PUMPS +1"
	}

	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="CLERIC'S TORQUE"})

	sets.midcast['Enhancing Magic'] = 
	{	
		main="ORANYAN",
		sub="ELETTA GRIP",
		ammo="INCANTOR STONE",
		head="TELCHINE CAP",
		neck="ORUNMILA'S TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="MIMIR EARRING",
		body="TELCHINE CHAS.",
		hands="TELCHINE GLOVES",
		ring1="LEBECHE RING",
		ring2="PROLIX RING",
		back=gear.fc_back,
		waist="EMBLA SASH",
		legs="TELCHINE BRACONI",
		feet="TELCHINE PIGACHES"
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="NODENS GORGET",ear2="EARTHCRY EARRING",waist="SIEGEL SASH",legs="SHEDIR SERAWEELS"})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="EBERS DUCKBILLS"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {legs="SHEDIR SERAWEELS"})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {	head="INYANGA TIARA +2",body="PIETY BLIAUT +1",hands="EBERS MITTS",legs="THEO. PANT. +1",})
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	
	sets.midcast.BarElement = 
	{	
		main="BENEFICUS", 			--15
		sub="GENBU'S SHIELD",
		ammo="IMPATIENS",
		head="EBERS CAP +1", 		
		neck="COLOSSUS'S TORQUE", 	--~7
		ear1="MENDI. EARRING",
		ear2="MIMIR EARRING", 		--10
		body="EBERS BLIAUT +1",
		hands="EBERS MITTS",
		ring1="STIKINI RING +1", 	--8
		ring2="PROLIX RING",
		back="MENDING CAPE",		--8 --+5 with refractive crystlas
		waist="EMBLA SASH", 		
		legs="PIETY PANTALN. +1", 	--22
		feet="EBERS DUCKBILLS" 		--22
	} 								-- TOTAL: 512 with Light Arts????

	sets.midcast.Impact = {}
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}
	
	sets.midcast['Divine Magic'] = 
	{	
		main="DAYBREAK", 			
		sub="GENBU'S SHIELD",
		ammo="INCANTOR STONE",
		head="KAABNAX HAT", 		
		neck="QUANPUR NECKLACE",
		ear1="MALIGNANCE EARRING",
		ear2="HECATE'S EARRING",
		body="VANYA ROBE",
		hands="CHIRONIC GLOVES",
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back="TORO CAPE",
		waist="ESCHAN STONE",
		legs=gear.chironic_enfeeble_legs,
		feet="CHIRONIC SLIPPERS"
	} 	
	
	sets.midcast.Holy = sets.midcast['Divine Magic']	

	sets.midcast['Dark Magic'] = {}
    sets.midcast.Drain = {}
    sets.midcast.Drain.Resistant = {}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}
	
	sets.midcast['Enfeebling Magic'] = 
	{	
		main="ORANYAN",
		sub="ELETTA GRIP",
		ammo="PLUMOSE SACHET",
		head="INYANGA TIARA +2",
		neck="ARTEMIS'S MEDAL",
		ear1="MALIGNANCE EARRING",
		ear2="VOR EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back=gear.fc_back,
		waist="ESCHAN STONE",
		legs=gear.chironic_enfeeble_legs,
		feet="INYAN. CRACKOWS +2"
	} 		
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'] 
 	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="DAYBREAK",sub="GENBU'S SHIELD"})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.cure_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.cure_back})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="HOMILIARY",
		head="INYANGA TIARA +2",
		neck="NUNA GORGET",
		ear1="MOONSHADE EARRING",
		ear2="INFUSED EARRING",
		body="THEO. BLIAUT +1",
		hands="INYAN. DASTANAS +2",  
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back=gear.cure_back,
		waist="CARRIER'S SASH",
		legs="ASSID. PANTS +1",
		feet="INYAN. CRACKOWS +2"
	}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {	
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="HOMILIARY",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MOONSHADE EARRING",
		ear2="INFUSED EARRING",
		body="THEO. BLIAUT +1",
		hands="INYAN. DASTANAS +2",  
		ring1="INYANGA RING",
		ring2="PAGUROIDEA RING",
		back=gear.cure_back,
		waist="POROUS ROPE",
		legs="ASSID. PANTS +1",
		feet="INYAN. CRACKOWS +2"}

	sets.idle.PDT = {
		main="EARTH STAFF",
		sub="ELETTA GRIP",	
		ammo="IMPATIENS",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="SHNEDDICK RING",
		back=gear.cure_back,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}
		
	sets.idle.MDT = {}

    -- Defense sets

	sets.defense.PDT = 
	{
		main="EARTH STAFF",
		sub="ELETTA GRIP",	
		ammo="IMPATIENS",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="SHNEDDICK RING",
		back=gear.cure_back,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}

	sets.defense.MDT = 
	{
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",
		ammo="IMPATIENS",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="SHNEDDICK RING",
		back=gear.cure_back,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}

    sets.defense.MEVA = 
	{
		main="IRIDAL STAFF",
		sub="ELETTA GRIP",
		ammo="IMPATIENS",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="SHNEDDICK RING",
		back=gear.cure_back,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {	
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="HOMILIARY",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MOONSHADE EARRING",
		ear2="INFUSED EARRING",
		body="THEO. BLIAUT +1",
		hands="INYAN. DASTANAS +2",  
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back=gear.cure_back,
		waist="POROUS ROPE",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
		}

    sets.engaged.Acc = {}
	sets.engaged.DW = {}
    sets.engaged.DW.Acc = {}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="EBERS MITTS",back="MENDING CAPE"}

	sets.HPDown = 
	{
		head="CLERIC'S CAP",
		neck="ORUNMILA'S TORQUE",
		ear1="MENDI. EARRING",
		ear2="HALASZ EARRING",
		body="COUNCILOR'S GARB",
		hands="CLERIC'S MITTS",
		ring1="LEBECHE RING",
		ring2="PROLIX RING",
		back="SWITH CAPE",
		waist="CARRIER'S SASH",
		legs="SHEDIR SERAWEELS",
		feet="CHELONA BOOTS"
	}

	sets.HPCure = 
		{}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 019')
end
