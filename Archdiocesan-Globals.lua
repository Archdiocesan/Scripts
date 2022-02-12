state.AutoBuffMode 		  = M{['description'] = 'Auto Buff Mode','Off','Auto'}
state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical','Resist'} 
state.RuneElement 		  = M{['description'] = 'Rune Element','Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Lux','Tenebrae'}
state.ElementalMode 	  = M{['description'] = 'Elemental Mode', 'Fire','Water','Lightning','Earth','Wind','Ice','Dark','Light'}
state.AutoSambaMode 	  = M{['description']= 'Auto Samba Mode', 'Off', 'Haste Samba', 'Aspir Samba', 'Drain Samba II'} -- try on THF/DNC
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.AutoSubMode 		 	= M(true, 'Auto Sublimation Mode')
state.Capacity 			  	= M(false, 'Capacity Mode') --Try out
state.AutoTankMode 		  	= M(false, 'Auto Tank Mode') --RUN?
state.AutoRuneMode 		  	= M(false, 'Auto Rune Mode') --Wut this do
state.AutoFoodMode		 	= M(false, 'Auto Food Mode')
state.AutoCleanupMode  	 	= M(false, 'Auto Cleanup Mode') --auto cleanup on startup
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
state.RngHelper		 	 	= M(false, 'RngHelper')	--COR?
state.RngHelperQuickDraw 	= M(false, 'RngHelperQuickDraw')
state.UseCustomTimers 	 	= M(false, 'Use Custom Timers')	
state.AutoEngageMode 		= M(false, 'Auto Engage Mode') ---OOOH???????
state.AutoWSMode		 	= M(false, 'Auto Weaponskill Mode')
	autowstp = 1000
	rangedautowstp = 1000
state.AutoNukeMode 		 	= M(false, 'Auto Nuke Mode')
	autonuke = 'Stone'
state.DisplayMode = M(false, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
-- displayx = 4
-- displayy = 1063
-- displayfont = 'Arial'
-- displaysize = 9
-- displaybold = false
-- displaybg = 0
-- displaystroke = 1
-- displaytransparancy = 192
-- state.DisplayColors = {
    -- h='\\cs(255, 0, 0)', -- Red for active booleans and non-default modals
    -- w='\\cs(255,255,255)', -- White for labels and default modals
    -- n='\\cs(192,192,192)', -- White for labels and default modals
    -- s='\\cs(96,96,96)' -- Gray for inactive booleans
	-- }
	
function check_cleanup()
	if state.AutoCleanupMode.value then
		if player.inventory['Bead Pouch'] then
			send_command('input /item "Bead Pouch" <me>')
			tickdelay = os.clock() + 2.4
			return true
		elseif player.inventory['Silt Pouch'] then
			send_command('input /item "Silt Pouch" <me>')
			tickdelay = os.clock() + 2.4
			return true
			--#################################################################try the use of these instead of move to sack
			-- if player.inventory['Frayed Sack (Pel)'] then send_command('put "Frayed Sack (Pel)" satchel all') moveditem = true end
			-- if player.inventory['Frayed Sack (Tau)'] then send_command('put "Frayed Sack (Tau)" satchel all') moveditem = true end
			-- if player.inventory['Frayed Sack (Fer)'] then send_command('put "Frayed Sack (Fer)" satchel all') moveditem = true end
			-- if player.inventory['Beitetsu Parcel'] then send_command('put "Beitetsu Parcel" satchel all') moveditem = true end
			-- if player.inventory['Beitetsu Box'] then send_command('put "Beitetsu Box" satchel all') moveditem = true end
			-- if player.inventory['Pluton Case'] then send_command('put "Pluton Case" satchel all') moveditem = true end
			-- if player.inventory['Pluton Box'] then send_command('put "Pluton Box" satchel all') moveditem = true end
			-- if player.inventory['Boulder Case'] then send_command('put "Boulder Case" satchel all') moveditem = true end
			-- if player.inventory['Boulder Box'] then send_command('put "Boulder Box" satchel all') moveditem = true end		
		end

		local items = windower.ffxi.get_items()
		local moveditem = false
		if items.count_sack < items.max_sack then

			if player.inventory['Pellucid Stone'] then send_command('put "Pellucid Stone" sack all') moveditem = true end
			if player.inventory['Taupe Stone'] then send_command('put "Taupe Stone" sack all') moveditem = true end
			if player.inventory['Fern Stone'] then send_command('put "Fern Stone" sack all') moveditem = true end
			
			if player.inventory['Beitetsu'] then send_command('put Beitetsu sack all') moveditem = true end
			if player.inventory['Pluton'] then send_command('put Pluton sack all') moveditem = true end
			if player.inventory['Riftborn Boulder'] then send_command('put "Riftborn Boulder" sack all') moveditem = true end
			
			if player.inventory['Alexandrite'] then send_command('put "Alexandrite" sack all') moveditem = true end
			if player.inventory['H-P Bayld'] then send_command('put "H-P Bayld" sack all') moveditem = true end
	
			if player.inventory['T. Whiteshell'] then send_command('put "T. Whiteshell" sack all') moveditem = true end
			if player.inventory['O. Bronzepiece'] then send_command('put "O. Bronzepiece" sack all') moveditem = true end
			if player.inventory['1 Byne Bill'] then send_command('put "1 Byne Bill" sack all') moveditem = true end
			
			if player.inventory['Lustreless Hide'] then send_command('put "Lustreless Hide" sack all') moveditem = true end
			if player.inventory['Lustreless Scale'] then send_command('put "Lustreless Scale" sack all') moveditem = true end

			if player.inventory["Beastmen's Seal"] then send_command ("put Beastmen's Seal sack all") moveditem = true end
			if player.inventory["Kindred's Seal"] then send_command ("put Kindred's Seal sack all") moveditem = true end
			if player.inventory["Kindred's Crest"] then send_command ("put Kindred's Crest sack all") moveditem = true end
			if player.inventory["H. Kindred Crest"] then send_command ('put "H. Kindred Crest" sack all') moveditem = true end
			if player.inventory["S. Kindred Crest"] then send_command ('put "S. Kindred Crest" sack all') moveditem = true end
			
			if player.inventory["Copper Voucher"] then send_command ('put "Copper Voucher" sack all') moveditem = true end
			if player.inventory["Silver Voucher"] then send_command ('put "Silver Voucher" sack all') moveditem = true end
			if player.inventory['S. Astral Detritus'] then send_command('put "S. Astral Detritus" sack all') moveditem = true end
			
			if player.inventory["Wind Crystal"] then send_command ('put "Wind Crystal" sack all') moveditem = true end
			if player.inventory["Earth Crystal"] then send_command ('put "Earth Crystal" sack all') moveditem = true end
			if player.inventory["Water Crystal"] then send_command ('put "Water Crystal" sack all') moveditem = true end
			if player.inventory["Fire Crystal"] then send_command ('put "Fire Crystal" sack all') moveditem = true end
			if player.inventory["Ice Crystal"] then send_command ('put "Ice Crystal" sack all') moveditem = true end
			if player.inventory["Lightng. Crystal"] then send_command ('put "Lightng. Crystal" sack all') moveditem = true end
			if player.inventory["Light Crystal"] then send_command ('put "Light Crystal" sack all') moveditem = true end
			if player.inventory["Dark Crystal"] then send_command ('put "Dark Crystal" sack all') moveditem = true end
			
			if player.inventory["Echad Ring"] then send_command ('put "Echad Ring" satchel all') moveditem = true end
			if player.inventory["Dim. Ring (Holla)"] then send_command ('put "Dim. Ring (Holla)" satchel all') moveditem = true end
			if player.inventory["Dim. Ring (Dem)"] then send_command ('put "Dim. Ring (Dem)" satchel all') moveditem = true end
			if player.inventory["Dim. Ring (Mea)"] then send_command ('put "Dim. Ring (Mea)" satchel all') moveditem = true end
			if player.inventory["Nexus Cape"] then send_command ('put "Nexus Cape" satchel all') moveditem = true end
		end
		
		if not state.Capacity.value then
			if player.inventory['Mecisto. Mantle'] then send_command('put "Mecisto. Mantle" satchel') moveditem = true end
			if player.inventory['Endorsement Ring'] then send_command('put "Endorsement Ring" satchel')  moveditem = true end
			if player.inventory['Trizek Ring'] then send_command('put "Trizek Ring" satchel')  moveditem = true end
			if player.inventory['Capacity Ring'] then send_command('put "Capacity Ring" satchel') moveditem = true end
			if player.inventory['Vocation Ring'] then send_command('put "Vocation Ring" satchel')  moveditem = true end
			if player.inventory['Facility Ring'] then send_command('put "Facility Ring" satchel') moveditem = true end
			if player.inventory['Guide Beret'] then send_command('put "Guide Beret" satchel') moveditem = true end
			if player.inventory['Empress Band'] then send_command('put "Empress Band" satchel') moveditem = true end			
		end
		
		if moveditem then tickdelay = os.clock() + 2.3 return true end

		-- local shard_name = {'C. Ygg. Shard ','Z. Ygg. Shard ','A. Ygg. Shard ','P. Ygg. Shard '}
		
		-- for sni, snv in ipairs(shard_name) do
			-- local shard_count = {'I','II','III','IV','V'}
			-- for sci, scv in ipairs(shard_count) do
				-- if player.inventory[snv..''..scv] then
					-- send_command('wait 3.0;input /item "'..snv..''..scv..'" <me>')
					-- tickdelay = os.clock() + 2
					-- return true
				-- end
			-- end
		-- end
		
		return false
	else
		return false
	end
end

--	You may wish to "hook" into existing functions, to add functionality without losing access to updates or fixes I make, for example, instead of copying and editing
--	status_change(), you can instead use the function user_status_change() in the same manner, which is called by status_change() if it exists, most of the important 
--  gearswap functions work like this in my files, and if it's unique to a specific job, user_job_status_change() would be appropriate instead.
--
--  Variables and tables can be easily redefined just by defining them in one of the later loaded files: autofood = 'Miso Ramen' for example.
--  States can be redefined as well: state.HybridMode:options('Normal','PDT') though most of these are already redefined in the gear files for editing there.
--	Commands can be added easily with: user_self_command(commandArgs, eventArgs) or user_job_self_command(commandArgs, eventArgs)

--######################ooh useful autotarget --like auto trading stuff to pops and shiii
function target_change(new)

	if state.RngHelper.value then
		send_command('gs rh clear')
	end

	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if state.AutoCleanupMode.value and math.sqrt(target.distance) < 7 then
			if target.name == "Runje Desaali" and bayld_items then 
				for i in pairs(bayld_items) do
					if player.inventory[bayld_items[i]] then
						windower.chat.input('/item "'..bayld_items[i]..'" <t>')
						windower.chat.input:schedule(2,'/targetnpc')
						return
					end
				end
			elseif target.name == "Sturdy Pyxis" and player.inventory['Forbidden Key'] then
				windower.chat.input('/item "Forbidden Key" <t>') return
			end
		end
	end
	
	if user_job_target_change then
		if user_job_target_change(target) then return end
	end
	
	if user_target_change then
		if user_job_target_change(target) then return end
	end
end

function user_default_zone_change(new_id,old_id)
	tickdelay = os.clock() + 10
	-- state.AutoBuffMode:reset() 
	-- state.AutoSubMode:reset()
	-- state.AutoWSMode:reset()
	state.AutoTrustMode:reset()
	state.AutoTankMode:reset()
	state.AutoRuneMode:reset()
	state.AutoFoodMode:reset()
	state.AutoNukeMode:reset()
	if state.CraftingMode.value ~= 'None' then
		enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
		state.CraftingMode:reset()
	end
	send_command('gs rh disable')
	state.RngHelper:reset()
	useItem = false
	useItemName = ''
	useItemSlot = ''
	lastincombat = false
	being_attacked = false
	
	if world.area:contains('Abyssea') or data.areas.proc:contains(world.area) then
		state.SkipProcWeapons:set('False')
	else
		state.SkipProcWeapons:reset()
	end
	
	if state.DisplayMode.value then update_job_states()	end

	-- if world.area:contains('Adoulin') then 
	-- send_command('config FrameRateDivisor 2;input /echo FPS 30')    
	-- else
	-- send_command('config FrameRateDivisor 1; input /echo FPS 60') end
	
	end
--################### TEST ME WITH gs showswaps
StunAbility = 	  S{"Breakga","Hell Scissors","Meteor", "Kaustra", "Amnesic Blast","Cruel Joke","Seismostomp","Torpid Glare","Danse Macabre", "Gates of Hades","Just Desserts","Sakra Storm","Acheron Flame","No Quarter","Denounce","Naakual's Vengeance","Pestilent Penance","Infernal Deliverance","Malevolent Blessing","Empty Salvation","Winds of Oblivion","Bewitching Lantern","Quenching Hammer","Dread Spikes","Yama's Judgment","??? Needles","10000 Needles","4000 Needles","Slimy Proposal","Ruthlessness","Stalking Prey","Level 3 Petrify","Chymous Reek","Crowning Flatus","Gnash 'n Guttle","Infected Illusion","Dynastic Gravitas","Fulminous Fury","Tartaric Sigil",}			   
PhysicalAbility = S{"Ripper Fang","Chomp Rush","Scythe Tail","Cyclotail","Delta Thrust","Spike Flail","Head Butt","Tortoise Stomp","Painful Whip","Recoil Dive","Gnash","Deathgnash","Seismic Tail","Big Scissors","Megascissors","Drill Branch","Pinecone Bomb","Predator Claws","Mountain Buster","Spinning Dive","Chaotic Strike","Volt Strike","Rush","Flaming Crush","Double Punch","Death Scissors","Velkkan Pygmachia","Barreling Smash","Merciless Mauling","Galumph","Velkkan Ambush","Cross Reaver","Seismostomp","Pentapeck","Swooping Frenzy","From The Skies","Wild Horn","Amnesic Blast","Incensed Pummel","Asuran Claws","Eclipse Bite","Crescent Fang","Moonlit Charge","Bone Crunch","Throat Stab","Hell Scissors","Impalement","Deadly Hold","Empty Thrash","View Sync","Carousel","Vanity Dive","Quadratic Continuum","??? Needles","10000 Needles","4000 Needles","2000 Needles","1000 Needles","Rhinowrecker","Sub-zero Smash","Benthic Typhoon","Diabolic Claw","Barbed Crescent","Jet Stream","Megalith Throw",
"Durance Whip" }			   
 MagicalAbility = S{"Stone III","Stone IV","Stone V","Stone VI","Stonega III","Stonega IV","Stonega V","Stoneja","Quake","Quake II","Water III","Water IV","Water V","Water VI","Waterga III","Waterga IV","Waterga V","Waterja","Flood","Flood II","Fire III", "Fire IV", "Fire V", "Fire VI","Firaga III","Firaga IV","Firaga V","Firaja","Flare","Flare II","Blizzard III","Blizzard IV","Blizzard V","Blizzard VI","Blizzaga III","Blizzaga IV","Blizzaga V","Blizzaja","Freeze","Freeze II","Aero III","Aero IV","Aero V","Aero VI","Aeroga III","Aeroga IV","Aeroga V","Aeroja","Tornado","Tornado II","Inferno","Thunder III","Thunder IV", "Thunder V","Thunder VI","Thundaga III","Thundaga IV","Thundaga V","Thundaja","Burst","Burst II","Earthen Fury","Geocrush", "Wind Blade","Tidal Wave","Grand Fall","Aerial Blast","Judgment Bolt","Meteor Strike","Thunderspark","Thunderstorm","Heavenly Strike","Whirling Inferno","Foul Breath","Tetsudo Tremor","Palsynyxis","Leeching Current","Meteor","Comet","Venom Shower","Marine Mayhem","Tidal Guillotine","Leafstorm","Ecliptic Meteor","Spirit Absorption","Stygian Release","Atramentous Libations","Dragon Breath","Searing Light","Everyone's Grudge","Everyone's Rancor","Pain Sync","Backdraft","Radiant Breath","Chaos Breath","Dark Orb","Spectral Floe","Zero Hour","Interference","Flank Opening","Hellish Crescendo","Malign Invocation","Shadow Wreck","Stygian Cyclone",
					"HP ? Holy","Petaline Tempest","Moonlight Veil"}
ResistAbility = S{"Death","Frond Fatale","Atropine Spore","Deracinator","Cruel Joke","Paralyga","Break","Breakga","Bad Breath","Sweet Breath","Torpefying Charge","Sleep","Sleepga","Sleepga II","Bindga","Torpid Glare","Danse Macabre","Stalking Prey","Hemocladis","Mayhem Lantern","Absoloute Terror","Fulmination","Chilling Roar","Maiden's Virelai","Entice","Psyche Suction","Scream","Fatal Scream","Tepal Twist","Bloom Fouette","Petalback Spin","Potted Plant","Tiiimbeeer","Level 3 Petrify","Afflicting Gaze","Beleaguerment","Besieger's Bane","Deathly Diminuendo","Enthrall","Shah Mat","Infected Illusion","Impact","Slimy Proposal","Spinning Fin","Nosferatu's Kiss","Ululation","Malevolent Blessing",
					"Mewing Lullaby","Moonlight Veil"}
AoEAbility = S{"Frond Fatale","Atropine Spore","Deracinator","Cruel Joke","Paralyga","Breakga","Bad Breath","Sweet Breath","Torpefying Charge","Sleepga","Sleepga II","Bindga","Torpid Glare","Stalking Prey","Hemocladis","Mayhem Lantern","Cyclotail","Tortoise Stomp","Recoil Dive","Seismic Tail","Megascissors","Merciless Mauling","Galumph","Seismostomp","Swooping Frenzy","Wild Horn","Stonega III","Stonega IV","Stonega V","Stoneja","Earthen Fury","Zero Hour","Waterga III","Waterga IV","Waterga V","Waterja","Tidal Wave","Spike Flail","Firaga III","Firaga IV","Firaga V","Firaja","Inferno","Blizzaga III","Blizzaga IV","Blizzaga V","Blizzaja","Level 3 Petrify","Aeroga III","Aeroga IV","Aeroga V","Aeroja","Aerial Blast","Grand Fall","Thundaga III","Thundaga IV","Thundaga V","Thundaja","Judgment Bolt","Thunderspark","Whirling Inferno","Foul Breath","Tetsudo Tremor","Leeching Current","Meteor","Venom Shower","Marine Mayhem","Tidal Guillotine","Leafstorm","Fulmination","Ecliptic Meteor","Atramentous Libations","Dragon Breath","Searing Light","Empty Thrash","View Sync","Carousel","Vanity Dive","Chilling Roar","Scream","Fatal Scream","Tepal Twist","Bloom Fouette","Petalback Spin","Potted Plant","Tiiimbeeer","Rhinowrecker","Dark Orb","Spectral Floe","Interference","Beleaguerment","Besieger's Bane","Deathly Diminuendo","Enthrall","Flank Opening","Malign Invocation","Shadow Wreck","Shah Mat","Stygian Cyclone","HP ? Holy","Moonlight Veil"}

NotifyBuffs = S{'doom','petrification'}

bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

--[[ List of all Bayld Items.
bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu','Zoquittihuitz',
'Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers','Chocaliztli Boots','Maochinoli',
'Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg','Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Otomi Helm',
'Otomi Gloves','Kaabnax Hat','Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers',
'Uk\'uxkaj Cap'}
]]

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Place for settings and custom functions to work across one characters, all jobs.
latency = .75

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]

-- send_command('bind ^@!f12 gs reload') --Reloads gearswap.
-- send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
-- send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
-- send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
-- send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
-- send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
-- send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
-- send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
-- send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
-- send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
-- send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
-- send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
-- send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
-- send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
-- send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
-- send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
-- send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
-- send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
-- send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
-- send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
-- send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
-- send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
-- send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
-- send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
-- send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
-- send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
-- send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
-- send_command('bind ^@!pause gs org') --Runs organizer.
-- send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
-- send_command('bind ^r gs c weapons Default') --Requips weapons and gear.
-- send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
-- send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
-- send_command('bind !t input /target <bt>') --Targets the battle target.
-- send_command('bind ^o fillmode') --Lets you see through walls.
-- send_command('bind @m gs c mount Omega')

