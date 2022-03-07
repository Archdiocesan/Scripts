function user_job_setup()
	state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Gridarvor','Daybreak')
	
	gear.cape_mag = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','Haste+10','Phys. dmg. taken-10%',}} -- change macc to Eva/Meva
	gear.cape_phys = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}} --change pet dt to mdt
	
	select_default_macro_book()
end

function init_gear_sets()

	sets.weapons.Gridarvor = {main="GRIDARVOR", sub="ELAN STRAP +1"}
	sets.weapons.Daybreak = {main="DAYBREAK", sub="GENBU'S SHIELD"}
	
    sets.buff.Sublimation = {waist="EMBLA SASH"}
    sets.buff.DTSublimation = {waist="EMBLA SASH"}
	sets.buff.Sleep = {neck="SACRIFICE TORQUE"}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlin_feet_treasure})
	
    --------------------------------------
    -- Precast Sets
    --------------------------------------
	sets.precast.JA['Astral Flow'] = {head="GLYPHIC HORN +1"}

	sets.precast.JA['Elemental Siphon'] = {	
		main="ESPIRITUS",			
		sub="VOX GRIP",														
		ammo="ESPER STONE +1",	
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
		feet="BECK. PIGACHES" }

	sets.precast.BloodPactWard = {	
		main="ESPIRITUS",			
		sub="VOX GRIP",						
		ammo="EPITAPH", 			--BP Delay II -5 
		head="BECKONER'S HORN +1", 	--Avatar's Favor +3 				
		neck="CALLER'S PENDANT",	
		ear1="SMN. EARRING",										
		ear2="LODURR EARRING",		
		body="CON. DOUBLET +3",		--BP Delay -15
		hands="BAAYAMI CUFFS",		
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",	
		back="CONVEYANCE CAPE",		
		waist="LUCIDITY SASH",
		feet="BAAYAMI SABOTS" }							
 
	sets.precast.BloodPactRage = sets.precast.BloodPactWard
    sets.precast.JA['Mana Cede'] = {hands="BECKONER'S BRACERS"}

	sets.precast.FC = {
		main=gear.grioavolr_fastcast,		--11 
		sub="CLERISY STRAP",				--2
		ammo="IMPATIENS",				
		head="PSYCLOTH TIARA",				--10 
		neck="ORUNMILA'S TORQUE",			--5
		ear1="MALIGNANCE EARRING",			--4
		ear2="LOQUAC. EARRING",				--2
		body="INYANGA JUBBAH +2",			--14
		hands=gear.merlin_hands_fastcast,	--6
		ring1="PROLIX RING",				--2
		ring2="LEBECHE RING",			
		back="OGAPEPO CAPE",			
		waist="WITFUL BELT",				--3	
		legs="PSYCLOTH LAPPAS",				--7
		feet=gear.merlin_feet_fastcast }	--10

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="DAYBREAK",sub="GENBU'S SHIELD"})

    sets.precast.WS = {	
		head="TALI'AH TURBAN +1",	
		neck="SHULMANU COLLAR",		
		ear1="ETHEREAL EARRING",	
		ear2="INFUSED EARRING",
		body="TALI'AH MANTEEL +1",	
		hands="TALI'AH GAGES +1",	
		ring1="VARAR RING",			
		ring2="VARAR RING +1",
		back=gear.cape_mag,			
		waist="KLOUSKAP SASH",		
		legs="TALI'AH SERA. +2",	
		feet="TALI'AH CRACKOWS +1" }

	sets.precast.WS['Spirit Taker'] = {}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {	
		main=gear.grioavolr_fastcast,							
		sub="CLERISY STRAP",					
		head="PSYCLOTH TIARA",					
		neck="ORUNMILA'S TORQUE",				
		ear1="MALIGNANCE EARRING",			    
		ear2="LOQUAC. EARRING",					
		body="INYANGA JUBBAH +2",				
		hands=gear.merlin_hands_fastcast,			
		ring1="PROLIX RING",					
		ring2="NAJI'S LOOP",					
		back=gear.cape_mag,					
		waist="WITFUL BELT",					
		legs="PSYCLOTH LAPPAS",					
		feet=gear.merlin_feet_fastcast }
	
    sets.midcast.Cure = { --### Take another look at this for max cure potency	
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
		feet="VANYA CLOGS" }			--Cure potency 12		

	sets.Self_Healing = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Cure_Received = {ring2="ASKLEPIAN RING",waist="GISHDUBAR SASH"}
	sets.Self_Refresh = {back="GRAPEVINE CAPE",waist="GISHDUBAR SASH",feet="INSPIRITED BOOTS"}
	
	sets.midcast['Summoning Magic'] = {	
		ammo="IMPATIENS",			
		body="BAAYAMI ROBE",		
		ring1="LEBECHE RING",
		back="OGAPEPO CAPE",
		waist="WITFUL BELT"	}
	
	sets.midcast['Elemental Magic'] = {
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="GHASTLY TATHLUM +1",
		head="MERLINIC HOOD",	
		neck="SAEVUS PENDANT +1",		
		ear1="FRIOMISI EARRING",
		ear2="MALIGNANCE EARRING",	
		body="MERLINIC JUBBAH",
		hands=gear.merlin_hands_nuke, 
		ring1="TALI'AH RING",		
		ring2="STIKINI RING +1",	
		back="TORO CAPE",			
		waist="ESCHAN STONE",		
		legs=gear.merlin_legs_nuke,		
		feet=gear.merlin_feet_nuke }	

	sets.midcast['Enfeebling Magic'] = {	
		main="ORANYAN",
		sub="ELETTA GRIP",
		ammo="PLUMOSE SACHET",
		head="INYANGA TIARA +2",	
		neck="ERRA PENDANT",		
		ear1="VOR EARRING",
		ear2="MALIGNANCE EARRING",	
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2", 
		ring1="INYANGA RING",		
		ring2="STIKINI RING +1",	
		back="AURIST'S CAPE +1",			
		waist="POROUS ROPE",		
		legs="PSYCLOTH LAPPAS",		
		feet="INYAN. CRACKOWS +2" }	

	sets.midcast.Stun = sets.midcast['Enfeebling Magic']
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {	
		main="ORANYAN",			
		sub="ELETTA GRIP",
		ammo="EPITAPH",
		head="TELCHINE CAP",
		neck="COLOSSUS'S TORQUE",	
		ear1="MIMIR EARRING",	
		ear2="MENDI. EARRING",		
		body="TELCHINE CHAS.",		
		hands="TELCHINE GLOVES",	
		ring1="PROLIX RING",
		ring2="STIKINI RING +1",
		back="FI FOLLET CAPE",			
		waist="EMBLA SASH",		
		legs="TELCHINE BRACONI",
		feet="TELCHINE PIGACHES" }	
	
	-- sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="NODENS GORGET",ear2="EARTHCRY EARRING",waist="SIEGEL SASH",legs="SHEDIR SERAWEELS"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {hands="INYAN. DASTANAS +2",waist="OLYMPUS SASH",legs="SHEDIR SERAWEELS",feet="REGAL PUMPS +1"})

    --------------------------------------
    -- Blood Pacts
    --------------------------------------
    
    sets.midcast.Pet.BloodPactWard = {	
		main="ESPIRITUS", 			
		sub="VOX GRIP",				
		ammo="EPITAPH",	
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
		feet="BAAYAMI SABOTS" }	

	sets.midcast.Pet['Impact'] = sets.midcast.Pet.BloodPactWard
	
	sets.midcast.Pet.DebuffBloodPactWard = {	
		main=gear.grioavolr_smn,			
		sub="VOX GRIP",
		ammo="EPITAPH",
		head="TALI'AH TURBAN +1",
		neck="ADAD AMULET",
		ear1="KYRENE'S EARRING",
		ear2="LUGALBANDA EARRING",
		body="CON. DOUBLET +3",		
		hands="TALI'AH GAGES +1",	
		ring1="TALI'AH RING",
		ring2="STIKINI RING +1",
		back=gear.cape_mag,
		waist="LUCIDITY SASH",
		legs="TALI'AH SERA. +2",
		feet="TALI'AH CRACKOWS +1" }
   
    sets.midcast.Pet.PhysicalBloodPactRage = {	
		main="KERAUNOS",			--10+6
		sub="ELAN STRAP +1",		--5
		ammo="EPITAPH",				--15
		head="HELIOS BAND",			--7+8
		neck="SHULMANU COLLAR",		--+5
		ear1="LUGALBANDA EARRING",	--10	
		ear2="KYRENE'S EARRING",	--1+3 
		body="CON. DOUBLET +3",		--14		
		hands="HELIOS GLOVES",		--7+8
		ring1="VARAR RING +1",		--4
		ring2="VARAR RING",			--3
		back=gear.cape_phys,		--5
		waist="KLOUSKAP SASH",			
		legs="APOGEE SLACKS +1",	--21+4 
		feet="HELIOS BOOTS"	}		--7+8

    sets.midcast.Pet.MagicalBloodPactRage = {	
		main=gear.grioavolr_smn,			--9		MAB 141 
		sub="ELAN STRAP +1",				--5
		ammo="EPITAPH",						--15
		head="APOGEE CROWN +1",				
		neck="ADAD AMULET",					--		MAB 10
		ear1="GELOS EARRING",				--5
		ear2="LUGALBANDA EARRING",			--10
		body="APO. DALMATICA +1",			--8		MAB 35 
		hands=gear.merlin_hands_bloodpact,	--15	MAB 37
		ring1="VARAR RING +1",				--4
		ring2="VARAR RING",					--3
		back=gear.cape_mag,					--5 
		waist="LUCIDITY SASH",				
		legs="ENTICER'S PANTS",				--12
		feet="APOGEE PUMPS +1" }			--14 	MAB 35

	
	sets.midcast.Pet['Elemental Magic'] = sets.midcast.Pet.MagicalBloodPactRage

	sets.midcast.Pet['Flaming Crush'] = {	
		main=gear.grioavolr_smn,			
		sub="ELAN STRAP +1",		
		ammo="EPITAPH",
		head="APOGEE CROWN +1",
		neck="ADAD AMULET",
		ear1="GELOS EARRING",		
		ear2="LUGALBANDA EARRING",
		body="APO. DALMATICA +1",	
		hands=gear.merlinic_magpact_hands,
		ring1="VARAR RING +1",
		ring2="VARAR RING",
		back=gear.cape_phys,
		waist="KLOUSKAP SASH",
		legs="APOGEE SLACKS +1",
		feet="APOGEE PUMPS +1" }	
	
	-- sets.midcast.Pet["Wind's Blessing"] = {Pet: MND gear]
	
	sets.midcast.Pet.HealingPacts = 	{	
		main="ESPIRITUS", 			
		sub="VOX GRIP",				
		ammo="EPITAPH",	
		head="APOGEE CROWN +1",				 
		neck="ADAD AMULET",	
		ear1="LODURR EARRING",		
		ear2="ETHEREAL EARRING",		
		body="APO. DALMATICA +1",	
		hands="TELCHINE GLOVES",	
		ring1="EVOKER'S RING",		
		ring2="STIKINI RING +1",		
		back=gear.cape_phys,		
		waist="POROUS ROPE",
		legs="APOGEE SLACKS +1",
		feet="APOGEE PUMPS +1"}		

	sets.midcast.Pet["Healing Ruby II"] = sets.midcast.Pet.HealingPacts
	sets.midcast.Pet["Whispering Wind"] = sets.midcast.Pet.HealingPacts
	sets.midcast.Pet["Spring Water"] = sets.midcast.Pet.HealingPacts
	
    --------------------------------------
    -- Resting / Idle / Defense
    --------------------------------------
    sets.resting = {
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="STAUNCH TATHLUM",
        head="BECKONER'S HORN +1",
		neck="SANCTITY NECKLACE",
		ear1="MOONSHADE EARRING", 
		ear2="INFUSED EARRING",		
        body="APO. DALMATICA +1",
		hands="ASTERIA MITTS +1",
		ring1="STIKINI RING +1",
		ring2="PAGUROIDEA RING",
        back=gear.cape_mag,
		waist="CARRIER'S SASH",
		legs="ASSID. PANTS +1", 
		feet="BAAYAMI SABOTS"}		
    
    sets.idle = {
		main="DAYBREAK",
		sub="GENBU'S SHIELD",
		ammo="STAUNCH TATHLUM",
        head="BECKONER'S HORN +1",
		neck="SANCTITY NECKLACE",
		ear1="MOONSHADE EARRING", 
		ear2="INFUSED EARRING",		
        body="APO. DALMATICA +1",
		hands="ASTERIA MITTS +1",
		ring1="STIKINI RING +1",
		-- ring2="PAGUROIDEA RING",
		ring2="WARP RING",
        back=gear.cape_mag,
		waist="CARRIER'S SASH",
		legs="ASSID. PANTS +1", 
		-- feet="BAAYAMI SABOTS"
		feet="HIPPO. SOCKS +1"
}	
	
    sets.idle.Avatar = { --replace Evans Earring with Infused Earring when Merlinic Shalwar Perp -9/Fern Stones
		main="GRIDARVOR",
		sub="ONEIROS GRIP",
		ammo="EPITAPH",
        head="BECKONER'S HORN +1",
		neck="CALLER'S PENDANT",
		ear1="MOONSHADE EARRING", 
		ear2="EVANS EARRING",				
        body="CON. DOUBLET +3",
		hands="ASTERIA MITTS +1",
		ring1="STIKINI RING +1",
		ring2="WARP RING",
        back=gear.cape_phys,
		waist="CARRIER'S SASH",
		legs=gear.merlin_legs_perp,
		feet="BAAYAMI SABOTS"
		-- feet="HIPPO. SOCKS +1"
}
	
	sets.idle.Avatar.Favor = {}        
	sets.idle.Avatar.Engaged = {}
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
	
	sets.idle.PDT = {	
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="STAUNCH TATHLUM",
		head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="INFUSED EARRING",
		ear2="ETHEREAL EARRING",
		body="CON. DOUBLET +3",
		hands="ASTERIA MITTS +1",
		ring1="DEFENDING RING",
		ring2="GELATINOUS RING +1",
		back=gear.cape_mag,
		waist="KLOUSKAP SASH",
		legs="INYANGA SHALWAR +2",
		gear.merlin_feet_treasure
		}
	
   sets.idle.PDT.Avatar = {	
		main="GRIDARVOR",
		sub="ELETTA GRIP",
		ammo="EPITAPH",
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="INFUSED EARRING", 
		ear2="EVANS EARRING",		--Ethereal Earring		
        body="CON. DOUBLET +3",
		hands="ASTERIA MITTS +1",
		ring1="DEFENDING RING",
		ring2="GELATINOUS RING +1",
        back=gear.cape_mag,
		waist="KLOUSKAP SASH",
		legs=gear.merlin_legs_perp,
		feet=gear.merlin_feet_treasure
		}

    sets.idle.PDT.Spirit = set_combine(sets.idle.PDT.Avatar, {main="EARTH STAFF",feet=gear.merlin_feet_treasure})
	sets.idle.Spirit =  set_combine(sets.idle.Avatar, {main="EARTH STAFF",subfeet=gear.merlin_feet_treasure})
    sets.perp = {}
	sets.perp.Day = {}
    sets.perp.Weather = {}	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
	sets.perp.staff_and_grip = {}

    sets.defense.PDT = {
		main="EARTH STAFF",
		sub="ELETTA GRIP",
		ammo="STAUNCH TATHLUM",
        head="BAAYAMI HAT",
		neck="WARDER'S CHARM +1",
		ear1="INFUSED EARRING",
		ear2="ETHEREAL EARRING",
		body="CON. DOUBLET +3",
		hands="BAAYAMI CUFFS",
		ring1="DEFENDING RING",
		ring2="GELATINOUS RING +1",
		back=gear.cape_mag,
		waist="KLOUSKAP SASH",
		legs="BAAYAMI SLOPS",
		feet=gear.merlin_feet_treasure }			
	
    sets.defense.MDT = {	
		main="CHTONIC STAFF",
		sub="ELETTA GRIP",
		ammo="STAUNCH TATHLUM",
        head="INYANGA TIARA +2",
		neck="TWILIGHT TORQUE",
		ear1="LUGALBANDA EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="INYAN. DASTANAS +2",
		ring1="DEFENDING RING",
		ring2="PURITY RING",
        back=gear.cape_phys,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"
	}
	
    sets.defense.MEVA = {	
		main="IRIDAL STAFF",
		sub="ELETTA GRIP",
		ammo="STAUNCH TATHLUM",
        head="INYANGA TIARA +2",
		neck="WARDER'S CHARM +1",
		ear1="LUGALBANDA EARRING",
		ear2="ETHEREAL EARRING",
		body="INYANGA JUBBAH +2",
		hands="BAAYAMI CUFFS",
		ring1="DEFENDING RING",
		ring2="PURITY RING",
        back=gear.cape_phys,
		waist="CARRIER'S SASH",
		legs="INYANGA SHALWAR +2",
		feet="INYAN. CRACKOWS +2"}
	
    sets.Kiting = {ring2="SHNEDDICK RING"}
    sets.latent_refresh = {waist="FUCHO-NO-OBI"}
	sets.latent_refresh_grip = {sub="ONEIROS GRIP"}
	sets.DayIdle = {waist="LYCOPODIUM SASH"}
	sets.NightIdle = {}

	sets.HPDown = {
		head="APOGEE CROWN +1",
		ear1="MENDI. EARRING",
		ear2="HALASZ EARRING",
		body="APO. DALMATICA +1",
		hands=empty,
		ring1=empty,
		ring2="LEBECHE RING",
		back="SWITH CAPE",
		waist="FUCHO-NO-OBI",
		legs="APOGEE SLACKS +1",
		feet="APOGEE PUMPS +1"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
	sets.engaged = {
		main="GRIDARVOR",				
		sub="ELETTA GRIP",				
		ammo="EPITAPH",		
        head="BECKONER'S HORN +1",		
		neck="TWILIGHT TORQUE",		
		ear1="ETHEREAL EARRING",		
		ear2="INFUSED EARRING",			
		body="INYANGA JUBBAH +2",		
		hands="INYAN. DASTANAS +2",		
		ring1="DEFENDING RING",		
		ring2="GELATINOUS RING +1",			
        back=gear.cape_mag,		
		waist="LUCIDITY SASH",			
		legs=gear.merlin_legs_perp,		
		feet="BAAYAMI SABOTS"}
	
end

function select_default_macro_book(reset)
    if reset == 'reset' then -- lost pet, or tried to use pact when pet is gone
    end
    
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
	windower.chat.input('/lockstyleset 001')
end


end

send_command('exec smn.txt')