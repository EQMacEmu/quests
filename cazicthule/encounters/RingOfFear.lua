local GOVERNOR_TYPE = 48129;		-- using 'InterpreterZero' for this, but can be anything that's always up
local HIGH_PRIEST_TYPE = 48093;
local WARDER_TYPE = 48099;
local GUARD_KHATARUSS_TYPE = 48395;
local GUARD_THRASCISS_TYPE = 48397;
local GUARD_SCITHISS_TYPE = 48396;
local TAHIA_TYPE = 48057;
local UNSTABLE_RIFT_TYPE = 48403;
local JUSTICAR_TYPE = 48001;
local FAKE_DREAD_TYPE = 48404;
local FAKE_FEAR_TYPE = 48405;
local FAKE_FRIGHT_TYPE = 48406;
local FAKE_TERROR_TYPE = 48407;
local REAL_DREAD_TYPE = 48391;
local REAL_FEAR_TYPE = 48394;
local REAL_FRIGHT_TYPE = 48392;
local REAL_TERROR_TYPE = 48393;
local AMYGDALAN_KNIGHT_TYPE = 48388;
local GORGON_TYPE = 48375;
local SHIVERBACK_TYPE = 48377;
local SPINECHILLER_TYPE = 48378;
local TENTACLE_TYPE = 48380;
local DESPAWNERS = { REAL_DREAD_TYPE, REAL_FEAR_TYPE, REAL_FRIGHT_TYPE, REAL_TERROR_TYPE, AMYGDALAN_KNIGHT_TYPE, 
					GORGON_TYPE, SHIVERBACK_TYPE, SPINECHILLER_TYPE, TENTACLE_TYPE };
local TAHIA_SPAWNID = 326900;
local JUSTICAR_SPAWNIDS = { [326896] = 1, [326897] = 1, [326898] = 1, [326899] = 1 };

local MOVES = {
	{ x = 550, y = 1035, z = -93, h = 0, pause = 52000 },
	{ x = 550, y = 1130, z = -93, h = 64, pause = 52000 },
	{ x = 625, y = 1130, z = -93, h = 128, pause = 52000 },
	{ x = 625, y = 1035, z = -93, h = 192, pause = 52000 },
	{ x = 591, y = 1035, z = -93, h = 0, pause = 52000 },
};

local SPHERE_SPAWN = { x = 587, y = 1091, z = -75, h = 128 };
local guardSpawn, fakeCazic, currentMove, wave, doFear, runes, spawnBoss, warder;

function GovernorSignalEvent(e)
	
	if ( e.signal == 1 ) then
	
		local tahia = eq.get_entity_list():GetNPCByNPCTypeID(TAHIA_TYPE);
		if ( tahia.valid ) then
			tahia:SetAppearance(0);	-- stand
			tahia:MoveTo(570, 1000, -94, 0, true);
			eq.set_timer("pause1", 18000, tahia);
			eq.set_timer("pause1", 63000);
		end
	end
end

function GovernorTimerEvent(e)
	if ( e.timer == "pause1" ) then
		eq.stop_timer("pause1");
		eq.zone_emote(7, "The walls of the temple begin to crack as the ground beneath your feet shakes violently.");
		eq.set_timer("pause2", 47000);
		
	elseif ( e.timer == "pause2" ) then
		eq.stop_timer("pause2");
		eq.set_timer("pause3", 47000);
		
		local npcList = eq.get_entity_list():GetNPCList();
		if ( npcList ) then
		
			for npc in npcList.entries do

				if ( npc.valid and JUSTICAR_SPAWNIDS[npc:GetSpawnPointID()] ) then
					npc:Emote("looks panicked as planar forces shoot through its body.");
					npc:CastSpell(2127, npc:GetID());	-- Tragedy at Cazic Thule
					eq.set_timer("die", 15100, npc);
				end
			end
		end

	elseif ( e.timer == "pause3" ) then
		eq.stop_timer("pause3");
		eq.set_timer("pause4", 10000);
		local mob = eq.spawn2(UNSTABLE_RIFT_TYPE, 0, 0, SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z + 5, SPHERE_SPAWN.h);
		mob:Emote("glows, and then dissipates");
		eq.zone_emote(7, "A piercing, disembodied scream echoes from deep within the temple. Your body begins to tremble uncontrollably with fear.");
		mob:CastSpell(2128, mob:GetID());	-- spell:Avatar of Fear
		warder = eq.spawn2(WARDER_TYPE, 0, 0, 575, 875, -66.2, 21);
		
	elseif ( e.timer == "pause4" ) then
		eq.stop_timer("pause4");
		eq.depop_all(UNSTABLE_RIFT_TYPE);
		fakeCazic = eq.spawn2(FAKE_FEAR_TYPE, 0, 0, SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z, SPHERE_SPAWN.h);
		eq.set_timer("pause1", 3000, fakeCazic);		
	end
end

function JusticarTimerEvent(e)
	if ( e.timer == "die" ) then
		eq.depop_with_timer();
	end
end

function TahiaTimerEvent(e)
	if ( e.timer == "pause1" ) then
		eq.stop_timer("pause1");
		e.self:Say("Brave adventurers, I am Tahia Felwah, and I owe you my life. I was to be a sacrifice to the faceless. Listen to my words carefully. There isn't much time now.");
		eq.set_timer("pause2", 47000);
		
	elseif ( e.timer == "pause2" ) then
		eq.stop_timer("pause2");
		e.self:Say("You have interrupted a complicated ritual and soon the rift to the Faceless will become unstable. I must collect three runes of the Faceless for my research. I have been appointed to uncover the source of these lizards' newfound power. If I fail, their kind will surely spread across the land and threaten the balance of Norrath.");
		eq.set_timer("pause3", 47000);
		
	elseif ( e.timer == "pause3" ) then
		eq.stop_timer("pause3");
		e.self:Say("This failed ritual presents a unique opportunity to gather the runes I desperately need. Recover the runes from the fallen minions of the faceless. When your need is greatest, hand me a rune and I will replenish you and your companions.");
		eq.set_timer("pause4", 47000);
		
	elseif ( e.timer == "pause4" ) then
		eq.stop_timer("pause4");
		e.self:Say("Prepare yourselves! You must repel the denizens of Fear itself! Good luck, brave souls. I will remain here until my task is fulfilled.");
		e.self:SetAppearance(1);	-- sit
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off 
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(1, false);	-- make targetable
		
	elseif ( e.timer == "lie" ) then
		eq.stop_timer("lie");
		e.self:SetAppearance(3);
		
	elseif ( e.timer == "rejuv" ) then
		eq.stop_timer("rejuv");
		e.self:CastSpell(2093, e.self:GetID());	-- Greater Rejuvenation
		e.self:SetAppearance(1);
	
	elseif ( e.timer == "depop" ) then
		e.self:Say("My rescuers, you have recovered the runes I need and my magic has been depleted. I shall take my leave now. May your forces stand against the corruption of the temple.");
		eq.depop_with_timer();
	end
end

function TahiaTradeEvent(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 8234}, 0) ) then -- Rune of the Faceless
		e.self:SetAppearance(0);
		e.self:Say("Wonderful! This is precisely what I am seeking. May my magic heal your mind and body.");
		eq.set_timer("rejuv", 1000);
		runes = runes + 1;
		
		if ( runes > 2 ) then
			eq.set_timer("depop", 10000);
		end
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function HighPriestSpawnEvent(e)

	local elist = eq.get_entity_list();
	
	for id in pairs(JUSTICAR_SPAWNIDS) do
		elist:GetSpawnByID(id):SetTimer(1);
	end
	elist:GetSpawnByID(TAHIA_SPAWNID):SetTimer(1);
	guardSpawn = false;
end

function HighPriestCombatEvent(e)

	eq.get_entity_list():GetNPCByNPCTypeID(TAHIA_TYPE):SetAppearance(3);
	
	if ( not guardSpawn and e.joined ) then

		local mob;
		mob = eq.unique_spawn(GUARD_KHATARUSS_TYPE, 0, 0, 595, 960, -84, 0);
		if ( mob ) then
			mob:CastToNPC():MoveTo(594, 1020, -94, 0, true);
			mob:SetRunning(true);
		end
		mob = eq.unique_spawn(GUARD_THRASCISS_TYPE, 0, 0, 595, 932, -65, 0);
		if ( mob ) then
			mob:CastToNPC():MoveTo(594, 1020, -94, 0, true);
			mob:SetRunning(true);
		end
		mob = eq.unique_spawn(GUARD_SCITHISS_TYPE, 0, 0, 595, 916, -60, 0);
		if ( mob ) then
			mob:CastToNPC():MoveTo(594, 1020, -94, 0, true);
			mob:SetRunning(true);
		end
	elseif ( not e.joined ) then
		eq.depop(GUARD_KHATARUSS_TYPE);
		eq.depop(GUARD_THRASCISS_TYPE);
		eq.depop(GUARD_SCITHISS_TYPE);
	end
end

function HighPriestTimerEvent(e)
	if ( e.timer == "guards" ) then
		guardSpawn = false;
		eq.stop_timer("guards");
	end
end

function HighPriestDeathEvent(e)
	eq.signal(GOVERNOR_TYPE, 1);
end

function GuardDeath(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(HIGH_PRIEST_TYPE) ) then
		guardSpawn = true;
		eq.set_timer("guards", 1800000, eq.get_entity_list():GetMobByNpcTypeID(HIGH_PRIEST_TYPE));
	end
end

function FearAvatarTimerEvent(e)
	if ( e.timer == "movenext" ) then

		currentMove = currentMove + 1;

		if ( not MOVES[currentMove] ) then
			currentMove = 1;
			wave = wave + 1;
		end

		local coords = MOVES[currentMove];
		local pause = coords.pause;
		if ( wave == -1 ) then
			pause = 5000;
		end
		
		if ( wave > 0 and currentMove == 1 ) then
		
			SpawnWave();
			
			if ( wave == 2 or wave == 5 or wave == 8 or wave == 11 ) then
				eq.set_timer("boss", 9000);
				
				if ( wave ~= 11 ) then
					eq.stop_timer("movenext");
					return;
				end
			end
		end

		e.self:MoveTo(coords.x, coords.y, coords.z, coords.h, true);
		eq.set_timer("movenext", pause);
		
	elseif ( e.timer == "boss" ) then
		eq.stop_timer("boss");
		
		if ( wave == 2 or wave == 5 or wave == 8 ) then
			e.self:MoveTo(SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z, SPHERE_SPAWN.h, true);
			currentMove = 4;
			spawnBoss = true;
			return;
		elseif ( wave == 11 ) then
			ActivateAvatar(FAKE_DREAD_TYPE, REAL_DREAD_TYPE);
		end
	
	elseif ( e.timer == "pause1" ) then
		eq.stop_timer("pause1");
		eq.set_timer("pause2", 60000);
		-- make avatar of fear walk animate here; dunno how
		
	elseif ( e.timer == "pause2" ) then
		eq.stop_timer("pause2");
		e.self:Shout("Minions of fear, hear me now! The temple of the great Cazic-Thule has been defiled. I summon you to assist me in its cleansing!");
		currentMove = 4;
		wave = -1;
		runes = 0;
		doFear = false;
		eq.set_timer("movenext", 100);
	end
end

function FearAvatarWaypointArrived(e)

	if ( doFear ) then
		-- waypoint after leaving bubble
		
		if ( wave == 2 ) then
			fakeCazic:Shout("Lord Cazic, grant me the power to enstill fear in our enemies!");
		elseif ( wave == 5 ) then
			fakeCazic:Shout("Lord Cazic, empower me with the might to destroy the unbelievers!");
		elseif ( wave == 8 ) then
			fakeCazic:Shout("Lord Cazic, may your temple run red with the blood of the infidels!");
		end
		
		fakeCazic:CastSpell(2128, e.self:GetID()); -- spell:Avatar of Fear
		doFear = false;
	end
	
	if ( spawnBoss ) then
		-- fear avatar entered bubble

		spawnBoss = false;
		eq.set_timer("movenext", 1000);
		
		local elist = eq.get_entity_list();
		
		if ( wave == 2 ) then
		
			fakeCazic:Shout("In the name of the fearful one, I call forth from the abyss... DREAD!");
			local npc = eq.spawn2(FAKE_DREAD_TYPE, 0, 0, SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z, SPHERE_SPAWN.h):CastToNPC();
			npc:MoveTo(655, 1090, -89, 192, true);
			
		elseif ( wave == 5 ) then
		
			fakeCazic:Shout("In the name of the fearful one, I call forth from the abyss... FRIGHT!");
			local npc = eq.spawn2(FAKE_FRIGHT_TYPE, 0, 0, SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z, SPHERE_SPAWN.h):CastToNPC();
			npc:MoveTo(589, 1160, -89, 128, true);
		
		elseif ( wave == 8 ) then
		
			fakeCazic:Shout("In the name of the fearful one, I call forth from the abyss... TERROR!");
			local npc = eq.spawn2(FAKE_TERROR_TYPE, 0, 0, SPHERE_SPAWN.x, SPHERE_SPAWN.y, SPHERE_SPAWN.z, SPHERE_SPAWN.h):CastToNPC();
			npc:MoveTo(522, 1090, -89, 64, true);
		end
		
		doFear = true;
	end
end

function SpawnWave()
	fakeCazic:Shout("In the name of the faceless, I command you, the minions of fear, ARISE!");

	local roll = math.random(1, 100);
	if ( roll <= 12 ) then
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 547, 1135, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1090, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1135, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 590, 1150, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 530, 1090, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1050, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 547, 1050, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 590, 1035, -93, 128);
	elseif ( roll <= 23 ) then
		eq.spawn2(TENTACLE_TYPE, 0, 0, 566, 1088, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 587, 1114, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 608, 1091, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 590, 1092, -97, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 588, 1067, -93, 128);
	elseif ( roll <= 34 ) then
		eq.spawn2(TENTACLE_TYPE, 0, 0, 608, 1090, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 565, 1090, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 600, 1107, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 580, 1073, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 600, 1073, -92, 128);
	elseif ( roll <= 52 ) then
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 623, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 590, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 638, 1093, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 552, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 537, 1097, -93, 128);
	elseif ( roll <= 56 ) then
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 590, 1150, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 565, 1015, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 610, 1015, -93, 128);
	elseif ( roll <= 74 ) then
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 580, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 595, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 565, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 610, 1055, -91.7, 128);
	elseif ( roll <= 78 ) then
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 645, 1090, -93, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 540, 1090, -93, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 590, 1150, -93, 128);
	elseif ( roll <= 96 ) then
		eq.spawn2(GORGON_TYPE, 0, 0, 629, 1132, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 543, 1132, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 546, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 590, 1025, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 632, 1050, -93, 128);
	else
		eq.spawn2(GORGON_TYPE, 0, 0, 630, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 547, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 590, 1035, -93, 128);
	end
end

function ActivateAvatar(fakeId, realId)
	local npc = eq.get_entity_list():GetNPCByNPCTypeID(fakeId);

	if ( npc ) then
		eq.spawn2(realId, 0, 0, npc:GetX(), npc:GetY(), npc:GetZ(), npc:GetHeading());
		eq.depop(fakeId);
	end
end

function DespawnerSpawnEvent(e)
	eq.set_timer("depop", 74000);
end

function DespawnerTimerEvent(e)
	-- event fails if NPC is left unaggro
	eq.depop_all(FAKE_DREAD_TYPE);
	eq.depop_all(FAKE_FEAR_TYPE);
	eq.depop_all(FAKE_FRIGHT_TYPE);
	eq.depop_all(FAKE_TERROR_TYPE);
	eq.depop_with_timer(TAHIA_TYPE);
	if ( warder and warder.valid ) then
		warder:Depop();
		warder = nil;
	end	
	eq.depop(GUARD_KHATARUSS_TYPE);
	eq.depop(GUARD_THRASCISS_TYPE);
	eq.depop(GUARD_SCITHISS_TYPE);
	eq.depop();
end

function DespawnerCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("RingOfFear", Event.timer, GOVERNOR_TYPE, GovernorTimerEvent);
	eq.register_npc_event("RingOfFear", Event.signal, GOVERNOR_TYPE, GovernorSignalEvent);

	eq.register_npc_event("RingOfFear", Event.timer, JUSTICAR_TYPE, JusticarTimerEvent);

	eq.register_npc_event("RingOfFear", Event.timer, TAHIA_TYPE, TahiaTimerEvent);
	eq.register_npc_event("RingOfFear", Event.trade, TAHIA_TYPE, TahiaTradeEvent);
	eq.register_npc_event("RingOfFear", Event.spawn, TAHIA_TYPE, function(e) eq.set_timer("lie", 2000); end);

	eq.register_npc_event("RingOfFear", Event.combat, HIGH_PRIEST_TYPE, HighPriestCombatEvent);
	eq.register_npc_event("RingOfFear", Event.timer, HIGH_PRIEST_TYPE, HighPriestTimerEvent);
	eq.register_npc_event("RingOfFear", Event.spawn, HIGH_PRIEST_TYPE, HighPriestSpawnEvent);
	eq.register_npc_event("RingOfFear", Event.death, HIGH_PRIEST_TYPE, HighPriestDeathEvent);
	
	eq.register_npc_event("RingOfFear", Event.timer, FAKE_FEAR_TYPE, FearAvatarTimerEvent);
	eq.register_npc_event("RingOfFear", Event.waypoint_arrive, FAKE_FEAR_TYPE, FearAvatarWaypointArrived);
	
	eq.register_npc_event("RingOfFear", Event.death, REAL_DREAD_TYPE, function() ActivateAvatar(FAKE_FRIGHT_TYPE, REAL_FRIGHT_TYPE); end);
	eq.register_npc_event("RingOfFear", Event.death, REAL_FRIGHT_TYPE, function() ActivateAvatar(FAKE_TERROR_TYPE, REAL_TERROR_TYPE); end);
	eq.register_npc_event("RingOfFear", Event.death, REAL_TERROR_TYPE, function() ActivateAvatar(FAKE_FEAR_TYPE, REAL_FEAR_TYPE); end);
	eq.register_npc_event("RingOfFear", Event.death, REAL_FEAR_TYPE, function() eq.depop_all(TAHIA_TYPE); end);

	eq.register_npc_event("RingOfFear", Event.death, GUARD_KHATARUSS_TYPE, GuardDeath);
	eq.register_npc_event("RingOfFear", Event.death, GUARD_THRASCISS_TYPE, GuardDeath);
	eq.register_npc_event("RingOfFear", Event.death, GUARD_SCITHISS_TYPE, GuardDeath);

	for _, typeId in ipairs(DESPAWNERS) do
		eq.register_npc_event("RingOfFear", Event.spawn, typeId, DespawnerSpawnEvent);
		eq.register_npc_event("RingOfFear", Event.timer, typeId, DespawnerTimerEvent);
		eq.register_npc_event("RingOfFear", Event.combat, typeId, DespawnerCombatEvent);
	end
end
