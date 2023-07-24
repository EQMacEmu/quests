local FLAG_LIMIT = 72;
local RHALIQ1_TYPE = 211050; -- Rhaliq_Trell
local RHALIQ2_TYPE = 211106; -- #Rhaliq_Trell
local CUSTODIAN_TYPE = 211078; -- A_Custodian_of_Marr 

local VILLAGERS = {
	{ 211093, 638, 1400 }, -- a_barbarian_villager
	{ 211090, 588, 1300 }, -- a_dwarven_villager
	{ 211087, 588, 1500 }, -- a_gnome_villager 
	{ 211088, 588, 1450 }, -- a_halfelf_villager
	{ 211091, 588, 1350 }, -- a_halfling_villager
	{ 211092, 588, 1400 }, -- a_human_villager
	{ 211089, 638, 1350 }, -- a_woodelf_villager
};
local ATTACKERS = {
	{ 211105,  930, 1968, 64, 4  }, -- Granmuck_Reiga
	{ 211104, 1220, 1906, 128, 14 }, -- Fligg_Starp
	{ 211103, 1371, 1906, 128, 22 }, -- Trann_Berk
	{ 211102, 1293, 2110, 128, 26 }, -- Shott_Tarbs
	{ 211101, 1293, 1968, 128, 5  }, -- Ruark_Barr
	{ 211100, 1474, 1201, 192, 14 }, -- Zullkata_Reeps
	{ 211096, 1474, 1539, 192, 12 }, -- Maeryn_Malladry
	{ 211095, 1293, 1374, 192, 26 }, -- Thullias_Rhidron
	{ 211094, 1130, 1552, 128, 4  }, -- Herot_Terkins
	{ 211099, 1293, 1968, 128, 14 }, -- Mirezvakla_Ry`Ten
	{ 211098, 1293, 1756, 128, 21 }, -- Yarezka_Tri`Lok
	{ 211097,  773, 1374, 192, 26 }, -- Merken_Lysonn
};

local RHALIQ_SPAWNID = 360971;
local ROOM_SPAWNIDS = {
	360972, 360973, 360974, 360975, 360976, 360977, 360978, 360979, 
	360980, 360981, 360982, 360983, 360984, 360985
};

local custodianId = 0;
local attackersKilled = 0;
local eventFailed = false;
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


function Rhaliq1Say(e)
	if ( e.message:findi("hail") ) then 
		e.self:Emote("nods in your direction and says 'The trials have only just begun. When you're [ready] to be tested we shall begin.");
		
	elseif ( e.message:findi("ready") ) then
		e.self:Say("Good luck to you my friend...");
		attackersKilled = 0;
		eventFailed = false;
		flags = 0;
		local mob = eq.spawn2(CUSTODIAN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		custodianId = mob:GetID();
		eq.set_timer("depop", 10000, mob);
		eq.depop_with_timer();
	end
end

function Rhaliq2Spawn(e)
	eq.set_timer("depop", 600000);
end

function Rhaliq2Timer(e)
	eq.depop();
end

function Rhaliq2Say(e)
	if ( e.message:findi("hail") and ClientCanFlag(e.other) and flags < FLAG_LIMIT ) then
	
		local qglobals = eq.get_qglobals(e.other);
		local hasFlag = false;
		if ( qglobals.hohtrials and qglobals.hohtrials:sub(2, 2) == "1" ) then
			hasFlag = true;
		end
		
		if ( not hasFlag ) then
			local newGlobal = qglobals.hohtrials or "000";
			newGlobal = newGlobal:sub(1, 1).."1"..newGlobal:sub(3, 3);
			eq.set_global("hohtrials", newGlobal, 5, "F");
			flags = flags + 1;
			e.other:Message(0, "An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Rhaliq Trell.");
		else
			e.other:Message(0, "You have already received credit for completing this trial.");
		end
	end
end

function CustodianDeathComplete(e)

	--if ( custodianId ~= e.self:GetID() ) then
	if ( e.self:GetX() < 0 ) then
		return;
	end
	
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
	
	custodianId = 0;
	StartEvent();
end

function CustodianTimer(e)

	if ( custodianId ~= e.self:GetID() ) then
		return;
	end

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetX() > 900 or e.self:GetX() < 350 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "depop" ) then	
		custodianId = 0;
		eq.update_spawn_timer(RHALIQ_SPAWNID, 1000);
		eq.depop();
	end
end

function AttackerDeath(e)
	attackersKilled = attackersKilled + 1;
	if ( attackersKilled >= 12 ) then
		attackersKilled = 0;
		EventSuccess();
	end
end

function AttackerSpawn(e)
	eq.set_timer("depop", 72000);
end

function AttackerTimer(e)
	
	if ( e.timer == "move" ) then
		e.self:SetRunning(true);
		e.self:MoveTo(math.random(625, 665), math.random(1350, 1400), -113, -1, true);
		
	elseif ( e.timer == "depop" ) then
		FailEvent();
		eq.depop();
	end
	eq.stop_timer(e.timer);
end

function CustodianCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
		eq.set_timer("bounds", 6000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("bounds");
	end
end

function AttackerCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function StartEvent()
	for _, t in ipairs(VILLAGERS) do
		eq.spawn2(t[1], 0, 0, t[2], t[3], -106, 64);
	end
	
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(ROOM_SPAWNIDS) do
		elist:GetSpawnByID(id):Disable();
	end
	
	local mob, z, h;
	for i, t in ipairs(ATTACKERS) do
		if ( i == 1 ) then
			z = -64; -- Granmuck_Reiga spawns on stairs
		else
			z = -106;
		end
		mob = eq.spawn2(t[1], 0, 0, t[2], t[3], z, t[4]);
		eq.set_timer("move", t[5] * 1000, mob);
	end
	
	eq.debug("Villagers trial started");
end

function EnableSpawns()
	for _, t in ipairs(VILLAGERS) do
		eq.depop_all(t[1]);
	end
	
	local elist = eq.get_entity_list();
	local spawn;
	for _, id in ipairs(ROOM_SPAWNIDS) do
		spawn = elist:GetSpawnByID(id)
		eq.update_spawn_timer(id, 600000);
		spawn:Enable();
	end
end

function FailEvent()
	if ( eventFailed ) then
		return;
	end
	eventFailed = true;
	
	EnableSpawns();
	
	local elist = eq.get_entity_list();
	local mob;
	for _, t in ipairs(ATTACKERS) do
		
		mob = elist:GetNPCByNPCTypeID(t[1]);
		if ( mob and mob.valid and mob:GetHP() > 0 ) then
			mob:Depop();
		end
	end
	
	eq.update_spawn_timer(RHALIQ_SPAWNID, 10800000);
	eq.debug("Villagers trial failed");
end

function EventSuccess()
	EnableSpawns();

	eq.spawn2(RHALIQ2_TYPE, 0, 0, 456, 1374, -110.4, 65);
	eq.debug("Villagers trial success");
end

function event_encounter_load(e)
	
	eq.register_npc_event("Villagers", Event.say, RHALIQ1_TYPE, Rhaliq1Say);
	eq.register_npc_event("Villagers", Event.say, RHALIQ2_TYPE, Rhaliq2Say);
	eq.register_npc_event("Villagers", Event.spawn, RHALIQ2_TYPE, Rhaliq2Spawn);
	eq.register_npc_event("Villagers", Event.timer, RHALIQ2_TYPE, Rhaliq2Timer);

	eq.register_npc_event("Villagers", Event.death_complete, CUSTODIAN_TYPE, CustodianDeathComplete);
	eq.register_npc_event("Villagers", Event.timer, CUSTODIAN_TYPE, CustodianTimer);
	eq.register_npc_event("Villagers", Event.combat, CUSTODIAN_TYPE, CustodianCombat);
	
	for _, t in ipairs(ATTACKERS) do
		eq.register_npc_event("Villagers", Event.death_complete, t[1], AttackerDeath);
		eq.register_npc_event("Villagers", Event.timer, t[1], AttackerTimer);
		eq.register_npc_event("Villagers", Event.spawn, t[1], AttackerSpawn);
		eq.register_npc_event("Villagers", Event.combat, t[1], AttackerCombat);
	end
end
