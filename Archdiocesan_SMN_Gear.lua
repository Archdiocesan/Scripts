-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
	state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Gridarvor','Daybreak')
	
	gear.perp_staff = {name="GRIDARVOR"}

	gear.mag_jse_back = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','Haste+10','Phys. dmg. taken-10%',}}
	gear.phys_jse_back = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	
	select_default_macro_book()
	send_command('exec smn.txt')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast Sets
    --------------------------------------
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="GLYPHIC HORN +1"}
	
    sets.precast.JA['Elemental Siphon'] = 
	{	
		main="ESPIRITUS",			
		sub="VOX GRIP",														
		ammo="ESPER STONE +1",		--Elemental Siphon +20
		head="BAAYAMI HAT",			
		neck="CALLER'S PENDANT",		
		ear1="LODURR EARRING",		
		ear2="SMN. EARRING",		
		body="BAAYAMI ROBE",	   
		hands="BAAYAMI CUFFS",		
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",	
		back="CONVEYANCE CAPE",		--Elemental Siphon +40
		waist="LUCIDITY SASH",		
		legs="BAAYAMI SLOPS",		
		feet="BECK. PIGACHES"		--Elemental Siphon +50
	}				
	
    sets.precast.JA['Mana Cede'] = {hands="BECKONER'S BRACERS"}

    sets.precast.BloodPactWard = 
	{	
		main="ESPIRITUS",			
		sub="VOX GRIP",						
		ammo="SANCUS SACHET +1", 	--Blood pact ability delay II -7 
		head="BECKONER'S HORN +1", 	--Avatar's Favor +3 				
		neck="CALLER'S PENDANT",	
		ear1="SMN. EARRING",								
		ear2="LODURR EARRING",		
		body="BAAYAMI ROBE",		--Blood pact ability delay -6		 
		hands="BAAYAMI CUFFS",		--Blood pact ability delay -6
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",	
		back="CONVEYANCE CAPE",
		waist="LUCIDITY SASH",		--Blood pact ability delay -7		
		feet="BAAYAMI SABOTS"		
	}								

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    sets.precast.FC = 
	{									--Fast Cast
		main="ORANYAN",					--7 
		sub="CLERISY STRAP",			--2
		ammo="IMPATIENS",				
		head="PSYCLOTH TIARA",			--10 
		neck="ORUNMILA'S TORQUE",		--5
		ear1="MALIGNANCE EARRING",		--4
		ear2="LOQUAC. EARRING",			--2
		body="INYANGA JUBBAH +2",		--14
		hands=gear.merlinic_fc_hands,	--6
		ring1="PROLIX RING",			--2
		ring2="LEBECHE RING",			
		back="OGAPEPO CAPE",			
		waist="WITFUL BELT",			--3	
		legs="PSYCLOTH LAPPAS",			--7
		feet=gear.merlinic_fc_feet		--10
	}
	
    sets.precast.FC.Cure = sets.precast.FC
    sets.precast.FC['Enhancing Magic'] = sets.precast.FC
    sets.precast.FC.Stoneskin = sets.precast.FC   
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="DAYBREAK",sub="GENBU'S SHIELD"})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
	{	
		head="TALI'AH TURBAN +1",	
		neck="SHULMANU COLLAR",		
		ear1="ETHEREAL EARRING",	
		ear2="INFUSED EARRING",
		body="TALI'AH MANTEEL +1",	
		hands="TALI'AH GAGES +1",	
		ring1="VARAR RING",			
		ring2="VARAR RING +1",
		back=gear.mag_jse_back,			
		waist="KLOUSKAP SASH",		
		legs="TALI'AH SERA. +2",	
		feet="TALI'AH CRACKOWS +1"
	}		

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Spirit Taker'] = 
	{	
		head="INYANGA TIARA +2",	--MND 30
		neck="NUNA GORGET",			--MND 8
		ear1="ETHEREAL EARRING",	
		ear2="INFUSED EARRING",
		body="INYANGA JUBBAH +2",	--MND 40
		hands="INYAN. DASTANAS +2",	--MND 44
		ring1="LEVIA. RING",		--MND 8
		ring2="VARAR RING +1",
		back="PAHTLI CAPE",			--MND 8
		waist="POROUS ROPE",		--MND 7
		legs="INYANGA SHALWAR +2",	--MND 35
		feet="INYAN. CRACKOWS +2"	--MND 30
	}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = 
	{	
		main="ORANYAN",							--7
		sub="CLERISY STRAP",					--2
		head="PSYCLOTH TIARA",					--10 --TALI'AH TURBAN haste 8
		neck="ORUNMILA'S TORQUE",				--5
		ear1="MALIGNANCE EARRING",			    --4
		ear2="LOQUAC. EARRING",					--2
		body="INYANGA JUBBAH +2",				--13
		hands=gear.merlinic_fc_hands,			--6 
		ring1="PROLIX RING",					--2
		ring2="NAJI'S LOOP",					--1
		back=gear.mag_jse_back,					--10
		waist="WITFUL BELT",					--3 
		legs="PSYCLOTH LAPPAS",					--7
		feet=gear.merlinic_fc_feet				--10
	}
	
    sets.midcast.Cure = --############################################
	{	
		main="DAYBREAK",			--Cure Potency 30
		sub="GENBU'S SHIELD",		--Cure Potency 3		
		head=gear.vanya_hood_cure,	--Cure potency 10 
		neck="COLOSSUS'S TORQUE",	
		ear1="MENDI. EARRING",		--Cure potency 5
		ear2="HALASZ EARRING",  
		body="VANYA ROBE",			
		hands="INYAN. DASTANAS +2",	
		ring1="SIRONA'S RING",				
		ring2="NAJI'S LOOP",		
		back="VATES CAPE +1",		
		waist="BISHOP'S SASH",		
		legs="VANYA SLOPS",			
		feet="VANYA CLOGS"			--Cure potency 12		
	}	
	
	sets.Self_Healing = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Cure_Received = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Self_Refresh = {back="GRAPEVINE CAPE",waist="GISHDUBAR SASH",feet="INSPIRITED BOOTS"}
	
	sets.midcast.Cursna = set_combine(sets.midcast.Cure, {ring1="HAOMA'S RING",ring2="EPHEDRA RING",waist="BISHOP'S SASH"}) 
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="ORANYAN",sub="CLERISY STRAP"})

	sets.midcast['Summoning Magic'] = 
	{	
		ammo="IMPATIENS",			
		body="BAAYAMI ROBE",		
		ring1="LEBECHE RING",
		back="OGAPEPO CAPE",
		waist="WITFUL BELT"
	}
	
	sets.midcast['Elemental Magic'] = 
	{
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="PLUMOSE SACHET",
		head="HELIOS BAND",	
		neck="QUANPUR NECKLACE",		
		ear1="HECATE'S EARRING",
		ear2="MALIGNANCE EARRING",	
		body="INYANGA JUBBAH +2",
		hands=gear.merlinic_fc_hands, 
		ring1="TALI'AH RING",		
		ring2="STIKINI RING +1",	
		back="TORO CAPE",			
		waist="ESCHAN STONE",		
		legs="MERLINIC SHALWAR",		
		feet=gear.merlinic_nuke_feet
	}	

	sets.midcast['Enfeebling Magic'] = 
	{	
		main="ORANYAN",
		sub="ELETTA GRIP",
		ammo="PLUMOSE SACHET",
		head="INYANGA TIARA +2",	
		neck="ARTEMIS'S MEDAL",		
		ear1="VOR EARRING",
		ear2="MALIGNANCE EARRING",	
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2", 
		ring1="INYANGA RING",		
		ring2="STIKINI RING +1",	
		back=gear.mag_jse_back,			
		waist="POROUS ROPE",		
		legs="PSYCLOTH LAPPAS",		
		feet="INYAN. CRACKOWS +2"
	}	

	sets.midcast.Stun = sets.midcast['Enfeebling Magic']
	sets.midcast['Enfeebling Magic'].Resistant = sets.midcast['Enfeebling Magic']
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = 
	{	
		main="ORANYAN",			
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
		head="TELCHINE CAP",
		neck="COLOSSUS'S TORQUE",	
		ear1="MIMIR EARRING",	
		ear2="MENDI. EARRING",		
		body="TELCHINE CHAS.",		
		hands="TELCHINE GLOVES",	
		ring1="PROLIX RING",
		ring2="STIKINI RING +1",
		back="SWITH CAPE",			
		waist="EMBLA SASH",		
		legs="TELCHINE BRACONI",
		feet="TELCHINE PIGACHES"
	}	
	
	-- sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="NODENS GORGET",ear2="EARTHCRY EARRING",waist="SIEGEL SASH",legs="SHEDIR SERAWEELS"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {hands="INYAN. DASTANAS +2",waist="OLYMPUS SASH",legs="SHEDIR SERAWEELS",feet="REGAL PUMPS +1"})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = 
	{	
		main="ESPIRITUS", 			
		sub="VOX GRIP",				
		ammo="SANCUS SACHET +1",	
		head="BAAYAMI HAT",			
		neck="CALLER'S PENDANT",
		ear1="LODURR EARRING",		
		ear2="SMN. EARRING",		
		body="BAAYAMI ROBE",		
		hands="BAAYAMI CUFFS",		
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",	
		back="CONVEYANCE CAPE",		
		waist="LUCIDITY SASH",		
		legs="BAAYAMI SLOPS",		
		feet="BAAYAMI SABOTS"		
	}	

	sets.midcast.Pet.DebuffBloodPactWard = 
	{	
		main="GRIOAVOLR",			
		sub="VOX GRIP",
		ammo="SANCUS SACHET +1",
		head="TALI'AH TURBAN +1",
		neck="ADAD AMULET",
		ear1="KYRENE'S EARRING",
		ear2="LUGALBANDA EARRING",
		body="CON. DOUBLET +2",		
		hands="TALI'AH GAGES +1",	
		ring1="TALI'AH RING",
		ring2="STIKINI RING +1",
		back=gear.mag_jse_back,
		waist="LUCIDITY SASH",
		legs="TALI'AH SERA. +2",
		feet="TALI'AH CRACKOWS +1"	
	}
 
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = 
	{	
		main="KERAUNOS",						--10+6
		sub="ELAN STRAP +1",					--5
		ammo="SANCUS SACHET +1",				--15
		head="HELIOS BAND",						--7+8
		neck="SHULMANU COLLAR",					--+5
		ear1="LUGALBANDA EARRING",				--10	
		ear2="KYRENE'S EARRING",				--1+3 
		body="CON. DOUBLET +2",					--14		
		hands="HELIOS GLOVES",					--7+8
		ring1="VARAR RING +1",					--4
		ring2="VARAR RING",						--3
		back=gear.phys_jse_back,				--5
		waist="KLOUSKAP SASH",			
		legs="APOGEE SLACKS +1",				--21+4 
		feet="HELIOS BOOTS"						--7+8
	}
	
    -- sets.midcast.Pet.PhysicalBloodPactRage.Acc = {feet="Convo. Pigaches +1"}

    sets.midcast.Pet.MagicalBloodPactRage = 
	{	
		main="GRIOAVOLR",					--9	MAB 141 
		sub="ELAN STRAP +1",				--5
		ammo="SANCUS SACHET +1",			--15
		head="APOGEE CROWN +1",				
		neck="ADAD AMULET",					--MAB 10
		ear1="GELOS EARRING",				--5
		ear2="LUGALBANDA EARRING",			--10
		body="APO. DALMATICA +1",			--8	MAB 35 
		hands=gear.merlinic_magpact_hands,	--15	MAB 37
		ring1="VARAR RING +1",				--4
		ring2="VARAR RING",					--3
		back=gear.mag_jse_back,				--5 
		waist="LUCIDITY SASH",				
		legs="ENTICER'S PANTS",				--12
		feet="APOGEE PUMPS +1"				--14 MAB 35
	}
 
 -- sets.midcast.Pet.MagicalBloodPactRage.Acc = {head="C. Palug Crown",feet="Con. Pigaches +1"}
	
	sets.midcast.Pet['Flaming Crush'] = 
	{	--play with phys set?
		main="GRIOAVOLR",			
		sub="ELAN STRAP +1",		
		ammo="SANCUS SACHET +1",
		head="APOGEE CROWN +1",
		neck="ADAD AMULET",
		ear1="GELOS EARRING",		
		ear2="LUGALBANDA EARRING",
		body="APO. DALMATICA +1",	
		hands=gear.merlinic_magpact_hands,
		ring1="VARAR RING +1",
		ring2="VARAR RING",
		back=gear.phys_jse_back,
		waist="KLOUSKAP SASH",
		legs="APOGEE SLACKS +1",
		feet="APOGEE PUMPS +1"		
	}	
		
	sets.midcast.Pet['Flaming Crush'].Acc = sets.midcast.Pet['Flaming Crush']

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="GLYPHIC SPATS +1"} 
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) 
    
	sets.midcast.Pet['Elemental Magic'].Resistant = {}
	
	sets.midcast.Pet['Impact'] = sets.midcast.Pet.BloodPactWard
	
	-- sets.midcast.Pet["Wind's Blessing"] =
	
	sets.midcast.Pet.HealingPacts = 
	{	
		main="ESPIRITUS", 			
		sub="VOX GRIP",				
		ammo="SANCUS SACHET +1",	
		head="APOGEE CROWN +1",				 
		neck="ADAD AMULET",	
		ear1="LODURR EARRING",		
		ear2="ETHEREAL EARRING",		
		body="APO. DALMATICA +1",	
		hands="TELCHINE GLOVES",	
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",		
		back=gear.phys_jse_back,		
		waist="POROUS ROPE",
		legs="APOGEE SLACKS +1",
		feet="APOGEE PUMPS +1"
	}		

	sets.midcast.Pet["Healing Ruby II"] = sets.midcast.Pet.HealingPacts
	sets.midcast.Pet["Whispering Wind"] = sets.midcast.Pet.HealingPacts
	sets.midcast.Pet["Spring Water"] = sets.midcast.Pet.HealingPacts
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="ENTICER'S PANTS"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="ENTICER'S PANTS"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = 
	{
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="IMPATIENS", 
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="LUGALBANDA EARRING",
		ear2="LODURR EARRING",		
        body="VANYA ROBE",
		hands="INYAN. DASTANAS +2",
		ring1="SHNEDDICK RING",
		ring2="INYANGA RING",
        back=gear.mag_jse_back,
		waist="POROUS ROPE",
		legs="INYANGA SHALWAR +2",
		feet="HIPPOMENES SOCKS"
	}	
    
    -- Idle sets
    sets.idle = 
	{
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="IMPATIENS",
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="LUGALBANDA EARRING",
		ear2="LODURR EARRING",		
        body="VANYA ROBE",
		hands="INYAN. DASTANAS +2",
		ring1="SHNEDDICK RING",
		ring2="INYANGA RING",
        back=gear.mag_jse_back,
		waist="POROUS ROPE",
		legs="INYANGA SHALWAR +2",
		feet="HIPPOMENES SOCKS"
	}	
	
    sets.idle.PDT = 
	{	
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="IMPATIENS",
		head="BAAYAMI HAT",
		neck="TWILIGHT TORQUE",
		ear1="VOR EARRING",
		ear2="LODURR EARRING",
		body="VANYA ROBE",
		hands="BAAYAMI CUFFS",
		ring1="TALI'AH RING",
		ring2="PAGUROIDEA RING",
		back=gear.mag_jse_back,
		waist="KLOUSKAP SASH",
		legs="INYANGA SHALWAR +2",
		feet="BAAYAMI SABOTS"
	}

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- Can make do without either the head or the body, and use +refresh items in those slots.
	
    sets.idle.Avatar = 
	{
		main="GRIDARVOR", 				
		sub="ONEIROS GRIP", 			
		ammo="SANCUS SACHET +1",		
        head="BECKONER'S HORN +1",	 	
		neck="CALLER'S PENDANT",		
		ear1="MOONSHADE EARRING", 		
		ear2="INFUSED EARRING",	 		
        body="APO. DALMATICA +1", 		
		hands="ASTERIA MITTS",			
		ring1="SHNEDDICK RING",			
		ring2="STIKINI RING +1", 		
        back=gear.phys_jse_back,		
		waist="LUCIDITY SASH",								
		legs="MERLINIC SHALWAR",		
		feet="BAAYAMI SABOTS"			
	}		 

   sets.idle.PDT.Avatar = 
   {	
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
        head="GLYPHIC HORN +1",
		neck="TWILIGHT TORQUE",
		ear1="VOR EARRING",
		ear2="LODURR EARRING",
		body="VANYA ROBE",
		hands="BAAYAMI CUFFS",
		ring1="TALI'AH RING",
		ring2="PAGUROIDEA RING",
        back=gear.mag_jse_back,
		waist="KLOUSKAP SASH",
		legs="BAAYAMI SLOPS",
		feet="BAAYAMI SABOTS"
	}

    sets.idle.Spirit = 
	{
		main="GRIDARVOR", 				
		sub="ONEIROS GRIP", 			
		ammo="SANCUS SACHET +1",		
        head="BECKONER'S HORN +1",	 	
		neck="TWILIGHT TORQUE",		
		ear1="MOONSHADE EARRING", 		
		ear2="INFUSED EARRING",	 		
        body="APO. DALMATICA +1", 		
		hands="ASTERIA MITTS",			
		ring1="SHNEDDICK RING",			
		ring2="STIKINI RING +1", 		
        back=gear.phys_jse_back,		
		waist="LUCIDITY SASH",							
		legs="MERLINIC SHALWAR",		
		feet="BAAYAMI SABOTS"		 	
	}
	
    sets.idle.PDT.Spirit = 
	{
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
        head="GLYPHIC HORN +1",
		neck="TWILIGHT TORQUE",
		ear1="VOR EARRING",
		ear2="LODURR EARRING",
		body="VANYA ROBE",
		hands="BAAYAMI CUFFS",
		ring1="TALI'AH RING",
		ring2="PAGUROIDEA RING",
        back=gear.mag_jse_back,
		waist="KLOUSKAP SASH",
		legs="BAAYAMI SLOPS",
		feet="BAAYAMI SABOTS"
	}
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracers halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
	sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
	
	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}

    -- Defense sets
     sets.defense.PDT = 
	 {	
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
        head="BAAYAMI HAT",
		neck="TWILIGHT TORQUE",
		ear1="VOR EARRING",
		ear2="LODURR EARRING",
		body="CON. DOUBLET +2",
		hands="BAAYAMI CUFFS",
		ring1="TALI'AH RING",
		ring2="PAGUROIDEA RING",
     	back=gear.mag_jse_back,
		waist="KLOUSKAP SASH",
		legs="BAAYAMI SLOPS",
		feet="BAAYAMI SABOTS"
	}			
	
    sets.defense.MDT = 
	{	
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="INFUSED EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="PURITY RING",
		ring2="INYANGA RING",
        back=gear.mag_jse_back,
		waist="POROUS ROPE",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}
	
    sets.defense.MEVA = 
	{	
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",
		ammo="SANCUS SACHET +1",
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="MALIGNANCE EARRING",
		ear2="INFUSED EARRING",
		body="INYANGA JUBBAH +2",
		hands="BAAYAMI CUFFS",
		ring1="PURITY RING",
		ring2="INYANGA RING",
        back=gear.mag_jse_back,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}
	
    sets.Kiting = {ring1="SHNEDDICK RING"}
    sets.latent_refresh = {waist="FUCHO-NO-OBI"}
	sets.latent_refresh_grip = {sub="ONEIROS GRIP"}
	-- sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {waist="LYCOPODIUM SASH"}
	sets.NightIdle = {}

	-- sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
	-- body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	-- back="Swith Cape",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="SACRIFICE TORQUE"}

	-- Weapons sets
	sets.weapons.Gridarvor = {main="GRIDARVOR", sub="ELAN STRAP +1"}
	sets.weapons.Daybreak = {main="DAYBREAK", sub="GENBU'S SHIELD"}
	
    sets.buff.Sublimation = {waist="EMBLA SASH"}
    sets.buff.DTSublimation = {waist="EMBLA SASH"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = 
	{
		main="GRIDARVOR",				
		sub="ELETTA GRIP",				
		ammo="SANCUS SACHET +1",		
        head="BECKONER'S HORN +1",		
		neck="TWILIGHT TORQUE",		
		ear1="ETHEREAL EARRING",		
		ear2="INFUSED EARRING",			
		body="INYANGA JUBBAH +2",		
		hands="INYAN. DASTANAS +2",		
		ring1="PAGUROIDEA RING",			
		ring2="STIKINI RING +1",		
        back=gear.mag_jse_back,		
		waist="LUCIDITY SASH",			
		legs="MERLINIC SHALWAR",		
		feet="BAAYAMI SABOTS"
	}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
	if player.sub_job == 'WHM' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'SCH' then
        set_macro_page(3, 1)
    else
        set_macro_page(2,1)
    end
	
	function user_job_lockstyle()
	windower.chat.input('/lockstyleset 020')
end

end

