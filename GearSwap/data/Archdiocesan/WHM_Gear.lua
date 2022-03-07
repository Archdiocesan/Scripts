-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()

    state.IdleMode:options('Normal','PDT','MDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Melee')

	gear.cape_fastcast = { name="ALAUNUS'S CAPE", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+10',}}
    gear.cape_cure = { name="ALAUNUS'S CAPE", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+12',}}

    select_default_macro_book()
	send_command('exec whm.txt')
end

function init_gear_sets()
 
	sets.weapons.Melee = {main="DAYBREAK",sub="GENBU'S SHIELD"}
	
-------------------	
    -- Precast Sets
-------------------
    sets.precast.FC = {	
		main=gear.grioavolr_fastcast,	--11  
		sub="CLERISY STRAP",			--2
		ammo="IMPATIENS",			
		head=gear.vanya_hood_fastcast,	--10
		neck="ORUNMILA'S TORQUE",		--5
		ear1="MALIGNANCE EARRING",		--4
		ear2="LOQUAC. EARRING",			--2
		body="INYANGA JUBBAH +2",		--14 
		hands="GENDEWITHA GAGES",		--7
		ring1="PROLIX RING",			--2
		ring2="LEBECHE RING",
		back="OGAPEPO CAPE",			
		waist="WITFUL BELT",			--3
		legs="PINGA PANTS",				--11 -- used to be chiron legs fastcast
		feet="REGAL PUMPS +1" }			--~5
										--TOTAL: ~76
										
	sets.precast.FC.DT = sets.precast.FC
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="DAYBREAK",sub="GENBU'S SHIELD"})

    sets.precast.JA.Benediction = {body="PIETY BLIAUT +1"}

-------------------
    -- Weaponskill sets
-------------------

    sets.precast.WS = {}
    sets.precast.WS['Mystic Boon'] = {}

-------------------
    -- Midcast Sets
-------------------

    sets.Kiting = {ring2="SHNEDDICK RING"}
    sets.latent_refresh = {waist="FUCHO-NO-OBI"}
	sets.latent_refresh_grip = {sub="ONEIROS GRIP"}
	sets.DayIdle = {waist="LYCOPODIUM SASH"}
	sets.NightIdle = {}
	
	sets.Self_Healing = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Cure_Received = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Self_Refresh = {back="GRAPEVINE CAPE",waist="GISHDUBAR SASH",feet="INSPIRITED BOOTS"}
	
	sets.ConserveMP = 	{	
		main=gear.grioavolr_fastcast,
		sub="GIUOCO GRIP",
		ammo="STAUNCH TATHLUM",
		head=gear.vanya_hood_fastcast,
		neck="ORUNMILA'S TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="MENDI. EARRING",
		body="INYANGA JUBBAH +2",
		hands="FANATIC GLOVES",
		ring1="NAJI'S LOOP",
		ring2="PROLIX RING",
		back=gear.cape_fastcast,
		waist="WITFUL BELT",
		legs="VANYA SLOPS",
		feet="UMBANI BOOTS" }
		
	sets.midcast.Teleport = sets.ConserveMP
	
    sets.MagicBurst = {}
	
    sets.midcast.FastRecast = {	
		main=gear.grioavolr_fastcast,	--11
		sub="CLERISY STRAP",			--2
		ammo="INCANTOR STONE",			--2	
		head=gear.vanya_hood_fastcast,	--10
		neck="ORUNMILA'S TORQUE",		--5
		ear1="MALIGNANCE EARRING",		--4
		ear2="LOQUAC. EARRING",			--2
		body="INYANGA JUBBAH +2",		--14
		hands="GENDEWITHA GAGES",		--7
		ring1="PROLIX RING",			--2
		ring2="NAJI'S LOOP",			--1
		back=gear.cape_fastcast,		--10
		waist="EMBLA SASH",				--3
		legs="PINGA PANTS",				--11
		feet="REGAL PUMPS +1" }			--~5
										--Total: ~89
-------------------
    -- Cure sets
-------------------
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {	
		main="QUELLER ROD",			--15	Enmity -15  
		sub="GENBU'S SHIELD",		--3		
		ammo="ESPER STONE +1",		--		Enmity -5
		head="THEO. CAP +1",		--10	Enmity -4 
		neck="ORUNMILA'S TORQUE",	--		Enmity -3
		ear1="GLORIOUS EARRING",	-- 		Enmity -5	(II)2
		ear2="HALASZ EARRING",		--		Enmity -3
		body="VANYA ROBE",			--7		Enmity -6
		hands="THEOPHANY MITTS +3",	--		Enmity -6	(II)2
		ring1="LEBECHE RING",		--3		Enmity -5
		ring2="NAJI'S LOOP",		--1		Enmity -1	(II)1 		
		back=gear.cape_cure,		--10
		waist="WITFUL BELT",						
		legs="EBERS PANTALOONS",	
		feet="VANYA CLOGS" }		--12	Enmity -6
									--Potency 61/50		Enmity -62/50
	
	sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="EBERS BLIAUT +1"}) 
									--Potency 54/50		Enmity -56/50

	sets.midcast.LightWeatherCure = {	
		main="IRIDAL STAFF",		--10 
		sub="ELETTA GRIP",			--		Enmity -3	
		ammo="ESPER STONE +1",		--		Enmity -5
		head="THEO. CAP +1",		--10	Enmity -4
		neck="ORUNMILA'S TORQUE",	--		Enmity -3		
		ear1="GLORIOUS EARRING",	--		Enmity -5 	(II)2
		ear2="HALASZ EARRING",		--		Enmity -3 					
		body="VANYA ROBE",			--7		Enmity -6
		hands="THEOPHANY MITTS +3",	--		Enmity -6	(II)2
		ring1="LEBECHE RING",		--3		Enmity -5
		ring2="NAJI'S LOOP",		--1		Enmity -1 	(II)1		
		back=gear.cape_cure,		--10
		waist="KORIN OBI",						
		legs="EBERS PANTALOONS",	
		feet="VANYA CLOGS",	}		--12	Enmity -6
									--Potency 53/50 	Enmity -50/50

	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.LightWeatherCure, {ear2="MENDI. EARRING",body="EBERS BLIAUT +1"})
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure, {waist="KORIN OBI"})
	sets.midcast.LightDayCure = sets.midcast.LightDayCureSolace
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.LightWeatherCuraga = sets.midcast.LightWeatherCure
	sets.midcast.LightDayCuraga = sets.midcast.LightDayCure
	sets.midcast.Cure.DT = sets.midcast.Cure 

	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	-- sets.midcast.MeleeCure = {}
	-- sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
	-- sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	-- sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	-- sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	-- sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="KORIN OBI"})
	-- sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	-- sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	-- sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	-- sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	-- sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	-- sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})
	-- sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="KORIN OBI"})

	sets.midcast.Cursna = {	
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
		back= gear.cape_fastcast,
		waist="BISHOP'S SASH",
		legs="THEO. PANT. +1",
		feet="VANYA CLOGS" }

	sets.midcast.StatusRemoval = {	
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
		back=gear.cape_fastcast,
		waist="EMBLA SASH",
		legs="EBERS PANTALOONS",
		feet="REGAL PUMPS +1" }

	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="CLERIC'S TORQUE"})

	sets.midcast['Enhancing Magic'] = {	
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
		back=gear.cape_fastcast,
		waist="EMBLA SASH",
		legs="TELCHINE BRACONI",
		feet="TELCHINE PIGACHES" }

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="NODENS GORGET",ear2="EARTHCRY EARRING",waist="SIEGEL SASH",legs="SHEDIR SERAWEELS"})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="EBERS DUCKBILLS"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="CHIRONIC HAT",legs="SHEDIR SERAWEELS"})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {	head="INYANGA TIARA +2",body="PIETY BLIAUT +1",hands="EBERS MITTS",legs="THEO. PANT. +1",})
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ear2="BRACHYURA EARRING"})
	
	sets.midcast.BarElement = {	
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
		back="FI FOLLET CAPE",		--8 
		waist="EMBLA SASH", 		
		legs="PIETY PANTALN. +1", 	--22
		feet="EBERS DUCKBILLS" }	--22
									-- TOTAL: 512 with Light Arts????
	sets.midcast.Impact = {}
	sets.midcast['Divine Magic'] = {	
		main="DAYBREAK", 			
		sub="GENBU'S SHIELD",
		ammo="GHASTLY TATHLUM +1",
		head="CHIRONIC HAT", 		
		neck="SAEVUS PENDANT +1",
		ear1="MALIGNANCE EARRING",
		ear2="FRIOMISI EARRING",
		body="VANYA ROBE",
		hands="CHIRONIC GLOVES",
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back="TORO CAPE",
		waist="KORIN OBI",
		legs=gear.chiron_legs_enfeeble,
		feet="CHIRONIC SLIPPERS" } 	
	
	sets.midcast.Holy = sets.midcast['Divine Magic']	
	
	sets.midcast['Elemental Magic'] = sets.midcast.Holy

	sets.midcast['Dark Magic'] = {}
    sets.midcast.Aspir = {}
	sets.midcast.Stun = {}
	
	sets.midcast['Enfeebling Magic'] = {	
		main="ORANYAN",
		sub="ELETTA GRIP",
		ammo="PLUMOSE SACHET",
		head="INYANGA TIARA +2",
		neck="ERRA PENDANT",
		ear1="MALIGNANCE EARRING",
		ear2="VOR EARRING",
		body="INYANGA JUBBAH +2",
		hands="THEOPHANY MITTS +3",
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back=gear.cape_fastcast,
		waist="ESCHAN STONE",
		legs=gear.chiron_legs_enfeeble,
		feet="INYAN. CRACKOWS +2" } 		
	
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
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.cape_cure})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.cape_cure})


-------------------
    -- Resting / Idle / Defense sets
-------------------
	sets.resting = sets.idle

	sets.idle = {	
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="HOMILIARY",
		head="INYANGA TIARA +2",
		neck="SANCTITY NECKLACE",
		ear1="MOONSHADE EARRING",
		ear2="INFUSED EARRING",
		body="THEO. BLIAUT +1",
		hands="INYAN. DASTANAS +2",  
		ring1="INYANGA RING",
		ring2="PAGUROIDEA RING",
		back=gear.cape_cure,
		waist="POROUS ROPE",
		legs="ASSID. PANTS +1",
		feet="INYAN. CRACKOWS +2"}
		-- feet="HIPPO. SOCKS +1"}

	sets.idle.PDT = {
		main="EARTH STAFF",
		sub="ELETTA GRIP",	
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2", --AYANMO set here
		neck="TWILIGHT TORQUE",
		ear1="INFUSED EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="DEFENDING RING",
		ring2="GELATINOUS RING +1",
		back=gear.cape_cure,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2" }
		
	sets.idle.MDT = {
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",	
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2",
		neck="WARDER'S CHARM +1",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="DEFENDING RING",
		back=gear.cape_cure,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2" }

	sets.defense.PDT = {
		main="EARTH STAFF",
		sub="ELETTA GRIP",	
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2", --AYANMO set here
		neck="TWILIGHT TORQUE",
		ear1="INFUSED EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="DEFENDING RING",
		ring2="GELATINOUS RING +1",
		back=gear.cape_cure,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2" }

	sets.defense.MDT = {
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",	
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="DEFENDING RING",
		back=gear.cape_cure,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2" }

    sets.defense.MEVA = {
		main="IRIDAL STAFF",
		sub="ELETTA GRIP",	
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2",
		neck="WARDER'S CHARM +1",
		ear1="MALIGNANCE EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="DEFENDING RING",
		back=gear.cape_cure,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2" }
		
-------------------
		-- Engaged sets
-------------------
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {	
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="ETHEREAL EARRING",
		ear2="INFUSED EARRING",
		body="THEO. BLIAUT +1",
		hands="INYAN. DASTANAS +2",  
		ring1="INYANGA RING",
		ring2="STIKINI RING +1",
		back=gear.cape_cure,
		waist="POROUS ROPE",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
		}

    sets.buff['Divine Caress'] = {hands="EBERS MITTS",back="MENDING CAPE"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
	sets.HPDown = {
		head="CLERIC'S CAP",
		neck="ORUNMILA'S TORQUE",
		ear1="MENDI. EARRING",
		ear2="HALASZ EARRING",
		body=empty,
		hands=empty,
		ring1="LEBECHE RING",
		ring2="PROLIX RING",
		back="SWITH CAPE",
		waist="CARRIER'S SASH",
		legs="SHEDIR SERAWEELS",
		feet=empty }

	sets.HPCure = sets.midcast.LightWeatherCureSolace

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 002')
end
