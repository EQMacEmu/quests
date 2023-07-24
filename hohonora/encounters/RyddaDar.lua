local FLAG_LIMIT = 72;
local TRYDAN1_TYPE = 211051; -- Trydan_Faye
local TRYDAN2_TYPE = 211117; -- #Trydan_Faye
local RYDDA_TYPE = 211107; -- Rydda`Dar
local CUSTODIAN_TYPE = 211078; -- A_Custodian_of_Marr

local TRYDAN_SPAWNID = 360859;
local ROOM_SPAWNIDS = { 360860, 361050, 361051, 361052 };

local custodianId = 0;	-- keeping track of entity IDs so I don't clone the NPC type for each trial
local flags = 0;
local rid, gid, cid;

function ClientCanFlag(mob)
	if ( mob:IsClient() ) then
		local client = mob:CastToClient();
		
		local raid = client:GetRaid();
		local group = client:GetGroup();
		
		if ( rid and raid.valid and raid:GetID() == rid ) then
			return true;
		elseif ( gid and group.valid and group:GetID() == gid ) then
			return true;
		elseif ( cid and client:GetID() == cid ) then
			return true;
		end
	end
	return false;
end


function Trydan1Say(e)
	if ( e.message:findi("hail") ) then 
		e.self:Say("Hello my friend. I can see that you've journeyed far to come before me. You've passed your first task, but you have many more [Trials] to face before you can enter the Temple of Marr.");
		
	elseif ( e.message:findi("trials") ) then 
		e.self:Say("There are three other Trials you must undergo before you can prove yourself worthy. When you're [ready] we'll begin the first Trial.");

	elseif ( e.message:findi("ready") ) then
		flags = 0;
		local mob = eq.spawn2(CUSTODIAN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		custodianId = mob:GetID();
		eq.set_timer("depop", 10000, mob);
		eq.depop_with_timer();
	end
end

function Trydan2Spawn(e)
	eq.set_timer("depop", 600000);
	e.self:Say("Congratulations on your victory my friends. You've passed this trial. There are two others that you must complete before you can step into the Temple of Marr.");
end

function Trydan2Timer(e)
	eq.depop();
end

function Trydan2Say(e)
	if ( e.message:findi("hail") and ClientCanFlag(e.other) and flags < FLAG_LIMIT ) then
	
		local qglobals = eq.get_qglobals(e.other);
		local hasFlag = false;
		if ( qglobals.hohtrials and qglobals.hohtrials:sub(1, 1) == "1" ) then
			hasFlag = true;
		end
		
		if ( not hasFlag ) then
			local newGlobal = qglobals.hohtrials or "000";
			newGlobal = "1"..newGlobal:sub(2, 3);
			eq.set_global("hohtrials", newGlobal, 5, "F");
			flags = flags + 1;
			e.other:Message(0, "An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Trydan Faye.");
		else
			e.other:Message(0, "You have already received credit for completing this trial.");
		end
	end
end

function CustodianDeath(e)
	if ( custodianId ~= e.self:GetID() ) then
		return;
	end
	
	custodianId = 0;
	
	local elist = eq.get_entity_list();
	for _, id in ipairs(ROOM_SPAWNIDS) do
		elist:GetSpawnByID(id):Disable();
	end

	eq.spawn2(RYDDA_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	eq.debug("Rydda`Dar trial started");
end

function CustodianTimer(e)

	if ( custodianId ~= e.self:GetID() ) then
		return;
	end

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetY() > 2300 or e.self:GetY() < 1750 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "depop" ) then
		custodianId = 0;
		eq.update_spawn_timer(TRYDAN_SPAWNID, 1000);
		eq.depop();
	end
end

function EnableSpawns()
	local elist = eq.get_entity_list();
	local spawn;
	for _, id in ipairs(ROOM_SPAWNIDS) do
		spawn = elist:GetSpawnByID(id)
		eq.update_spawn_timer(id, 600000);
		spawn:Enable();
	end
end

function RyddaDeathComplete(e)
	EnableSpawns();
	
	local client = e.killer:CastToClient();
	if ( not client.valid ) then
		return;
	end
	
	local raid = client:GetRaid();
	local group = client:GetGroup();
	
	if ( raid.valid ) then
		rid = raid:GetID();
	elseif ( group.valid ) then
		gid = group:GetID();
	else
		cid = client:GetID();
	end
	eq.debug("Flagger NPC will acknowledge "..client:GetName().."'s raid/group; Raid ID == "..(rid or "(nil)")..";  Group ID == "..(gid or "(nil)"), 1);

	eq.spawn2(TRYDAN2_TYPE, 0, 0, -1725, 2040, -111.4, 0);

	eq.debug("Rydda`Dar trial success");
end

function AttackerSpawn(e)
	eq.set_timer("depop", 10000);
end

function RyddaSpawn(e)
	eq.set_timer("depop", 56000);
end

function RyddaTimer(e)
	
	if ( e.timer == "bounds" ) then
		if ( e.self:GetY() > 2300 or e.self:GetY() < 1750 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "depop" ) then
		eq.update_spawn_timer(TRYDAN_SPAWNID, 10800000);
		eq.debug("Rydda`Dar trial failed");
		EnableSpawns();
		eq.depop();
	end
end

function AttackerCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
		eq.set_timer("bounds", 6000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("bounds");
	end
end

function event_encounter_load(e)
	
	eq.register_npc_event("RyddaDar", Event.say, TRYDAN1_TYPE, Trydan1Say);
	eq.register_npc_event("RyddaDar", Event.say, TRYDAN2_TYPE, Trydan2Say);
	eq.register_npc_event("RyddaDar", Event.spawn, TRYDAN2_TYPE, Trydan2Spawn);
	eq.register_npc_event("RyddaDar", Event.timer, TRYDAN2_TYPE, Trydan2Timer);

	eq.register_npc_event("RyddaDar", Event.death, CUSTODIAN_TYPE, CustodianDeath);
	eq.register_npc_event("RyddaDar", Event.timer, CUSTODIAN_TYPE, CustodianTimer);
	eq.register_npc_event("RyddaDar", Event.combat, CUSTODIAN_TYPE, AttackerCombat);
	
	eq.register_npc_event("RyddaDar", Event.death_complete, RYDDA_TYPE, RyddaDeathComplete);
	eq.register_npc_event("RyddaDar", Event.spawn, RYDDA_TYPE, RyddaSpawn);
	eq.register_npc_event("RyddaDar", Event.timer, RYDDA_TYPE, RyddaTimer);
	eq.register_npc_event("RyddaDar", Event.combat, RYDDA_TYPE, AttackerCombat);
end
