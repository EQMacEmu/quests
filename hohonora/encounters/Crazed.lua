local FLAG_LIMIT = 72;
local ALEKSON1_TYPE = 211060; -- Alekson_Garn
local ALEKSON2_TYPE = 211108; -- #Alekson_Garn
local CUSTODIAN_TYPE = 211078; -- A_Custodian_of_Marr 

local MIRANDA_TYPE = 211082; -- Miranda_Climmes
local YDIRA_TYPE = 211083; -- Ydira_Merok

local CRAZED1_TYPE = 211074; -- a_crazed_norrathian lvl63
local CRAZED2_TYPE = 211118; -- a_crazed_norrathian lvl62
local VAGRANT_TYPE = 211077; -- a_recuso_vagrant 
local STRAGGLER_TYPE = 211076; -- a_recuso_straggler 
local DRIFTER_TYPE = 211075; -- a_recuso_drifter 
local ADVOCENT_TYPE = 211084; -- Advocent_Joran 
local HALGOZ_TYPE = 211086; -- Halgoz_Rellinic 
local FREEGAN_TYPE = 211085; -- Freegan_Haun 

local ALEKSON_SPAWNID = 361021;
local ROOM_SPAWNIDS = {
	360839, 360840, 360841, 360842, 
	361029, 
	360837, 360838, 360843, 361030, 361031,
	361027, 361032, 361033, 361034, 361035, 361036
};
	
local TRASH = {
	{
		{ CRAZED1_TYPE, 0, 0, -2484, -1699 },
		{ CRAZED2_TYPE, 0, 0, -2463, -1786 },
		{ CRAZED2_TYPE, 0, 0, -2400, -1764 },
		{ CRAZED2_TYPE, -2914, -1728, -2573, -1723 },
		{ CRAZED2_TYPE, -2798, -1728, -2440, -1729 },
		{ CRAZED1_TYPE, -2704, -1728, -2383, -1708 },
	},
	{
		{ DRIFTER_TYPE, -2958, -1552, -3141, -1698 },
		{ DRIFTER_TYPE, -3173, -1736, -3122, -1753 },
		{ STRAGGLER_TYPE, -3376, -1933, -3223, -1764 },
		{ STRAGGLER_TYPE, -3376, -1552, -3188, -1707 },
		{ VAGRANT_TYPE, -2958, -1933, -3144, -1735 },
	},
	{
		{ STRAGGLER_TYPE, -3364, -1309, -3174, -1151 },
		{ STRAGGLER_TYPE, -3364, -960, -3159, -1115 },
		{ VAGRANT_TYPE, -2998, -960, -3131, -1131 },
		{ DRIFTER_TYPE, -2998, -1309, -3109, -1128 },
		{ DRIFTER_TYPE, -3177, -1172, -3156, -1168 },
	},
};

local BOSSES = {
	{ ADVOCENT_TYPE, -2462, -1724, 0, 0 },
	{ HALGOZ_TYPE, -3163, -1734, -3144, -1735 },
	{ FREEGAN_TYPE, -3169, -982, -3159, -1115 },
};

local custodianId = 0;
local bossKills = 0;
local eventFailed = false;
local flags = 0;
local trashIDs = { {}, {}, {} };
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


function Alekson1Say(e)
	if ( e.message:findi("hail") ) then 
		e.self:Say("Greetings young "..e.other:GetName()..". I can see by the look in your eyes that you're [ready] to begin the Trials.");

	elseif ( e.message:findi("ready") ) then
		e.self:Say("Good luck my friend. You'll need it.");
		bossKills = 0;
		eventFailed = false;
		flags = 0;
		local mob = eq.spawn2(CUSTODIAN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		custodianId = mob:GetID();
		eq.set_timer("depop", 10000, mob);
		eq.depop_with_timer();
	end
end

function Alekson2Spawn(e)
	eq.set_timer("depop", 600000);
end

function Alekson2Timer(e)
	eq.depop();
end

function Alekson2Say(e)
	if ( e.message:findi("hail") and ClientCanFlag(e.other) and flags < FLAG_LIMIT ) then
	
		local qglobals = eq.get_qglobals(e.other);
		local hasFlag = false;
		if ( qglobals.hohtrials and qglobals.hohtrials:sub(3, 3) == "1" ) then
			hasFlag = true;
		end
		
		if ( not hasFlag ) then
			local newGlobal = qglobals.hohtrials or "000";
			newGlobal = newGlobal:sub(1, 2).."1";
			eq.set_global("hohtrials", newGlobal, 5, "F");
			flags = flags + 1;
			e.other:Message(0, "An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Alekson Garn.");
		else
			e.other:Message(0, "You have already received credit for completing this trial.");
		end
	end
end

function CustodianDeathComplete(e)

	--if ( custodianId ~= e.self:GetID() ) then
	if ( e.self:GetY() > 0 ) then
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
	StartEvent(e.self:GetX(), e.self:GetY());
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

function CustodianTimer(e)

	if ( custodianId ~= e.self:GetID() ) then
		return;
	end
	
	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetX() > -2200 or e.self:GetX() < -2800 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "depop" ) then	
		custodianId = 0;
		eq.update_spawn_timer(ALEKSON_SPAWNID, 1000);
		eq.depop();
	end
end

function AttackerDeath(e)

	local id = e.self:GetID();
	local boss, mob;
	
	for room = 1, #trashIDs do
		for i, v in ipairs(trashIDs[room]) do
			if ( v == id ) then
				table.remove(trashIDs[room], i);
				if ( #trashIDs[room] == 0 ) then
					boss = BOSSES[room];
					mob = eq.unique_spawn(boss[1], 0, 0, boss[2], boss[3], -112.625, 0);
					if ( boss[4] ~= 0 ) then
						mob:SetRunning(true);
						mob:CastToNPC():MoveTo(boss[4], boss[5], -112.625, -1, true);
					end
				end
				return;
			end
		end	
	end
end

function BossDeath(e)
	bossKills = bossKills + 1;
	
	if ( bossKills == 3 ) then
		EventSuccess();
	end
end

function AttackerSpawn(e)
	eq.set_timer("depop", 50000);
end

function AttackerTimer(e)

	if ( e.timer == "depop" ) then
		FailEvent();
		eq.depop();
	end
end

function AttackerCombat(e)

	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function StartEvent(x, y)

	eq.spawn2(MIRANDA_TYPE, 0, 0, -3160, -1719, -112.625, 141);
	eq.spawn2(YDIRA_TYPE, 0, 0, -3158, -1138, -112.625, 77);
	
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(ROOM_SPAWNIDS) do
		elist:GetSpawnByID(id):Disable();
	end
	
	local mob, h, mobx, moby;
	for room, t1 in ipairs(TRASH) do
		for i, t2 in ipairs(t1) do
			if ( t2[2] == 0 and x ) then
				mobx = x;
				moby = y;
			else
				mobx = t2[2];
				moby = t2[3];
			end
			mob = eq.spawn2(t2[1], 0, 0, mobx, moby, -112.625, 0);
			table.insert(trashIDs[room], mob:GetID());
			mob:SetRunning(true);
			mob:CastToNPC():MoveTo(t2[4], t2[5], -112.625, -1, true);
		end
	end
	
	eq.debug("Crazed Norathians trial started");
end

function EnableSpawns()
	eq.depop_all(MIRANDA_TYPE);
	eq.depop_all(YDIRA_TYPE);
	
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
	
	for i, t1 in ipairs(TRASH) do
		for room, t2 in ipairs(t1) do
			mob = elist:GetNPCByNPCTypeID(t2[1]);
			if ( mob and mob.valid and mob:GetHP() > 0 ) then
				mob:Depop();
			end
		end
	end
	
	for _, t in ipairs(BOSSES) do
		
		mob = elist:GetNPCByNPCTypeID(t[1]);
		if ( mob and mob.valid and mob:GetHP() > 0 ) then
			mob:Depop();
		end
	end

	local i;
	for room = 1, #trashIDs do
		i = #trashIDs[room];
		while ( i > 0 ) do
			table.remove(trashIDs[room], i);
			i = i - 1;
		end
	end
	
	eq.update_spawn_timer(ALEKSON_SPAWNID, 10800000);
	eq.zone_emote(0, "A woman screams in anguish as she's forcibly taken away by a band of crazed norrathians.");
	eq.debug("Crazed Norathians trial failed");
end

function EventSuccess()
	EnableSpawns();

	local mob = eq.spawn2(ALEKSON2_TYPE, 0, 0, -2330, -1724, -110.4, 192);
	mob:Say("Congratulations my friends. You've passed the trial I laid before you.");

	eq.debug("Crazed Norrathians trial success");
end

function event_encounter_load(e)
	
	eq.register_npc_event("Crazed", Event.say, ALEKSON1_TYPE, Alekson1Say);
	eq.register_npc_event("Crazed", Event.say, ALEKSON2_TYPE, Alekson2Say);
	eq.register_npc_event("Crazed", Event.spawn, ALEKSON2_TYPE, Alekson2Spawn);
	eq.register_npc_event("Crazed", Event.timer, ALEKSON2_TYPE, Alekson2Timer);

	eq.register_npc_event("Crazed", Event.death_complete, CUSTODIAN_TYPE, CustodianDeathComplete);
	eq.register_npc_event("Crazed", Event.timer, CUSTODIAN_TYPE, CustodianTimer);
	eq.register_npc_event("Crazed", Event.combat, CUSTODIAN_TYPE, CustodianCombat);


	local t = { CRAZED1_TYPE, CRAZED2_TYPE, VAGRANT_TYPE, STRAGGLER_TYPE, DRIFTER_TYPE, ADVOCENT_TYPE, HALGOZ_TYPE, FREEGAN_TYPE };
	for i, typeid in ipairs(t) do
		
		eq.register_npc_event("Crazed", Event.timer, typeid, AttackerTimer);
		eq.register_npc_event("Crazed", Event.spawn, typeid, AttackerSpawn);
		eq.register_npc_event("Crazed", Event.combat, typeid, AttackerCombat);
		
		if ( i < 6 ) then
			eq.register_npc_event("Crazed", Event.death, typeid, AttackerDeath);
		else
			eq.register_npc_event("Crazed", Event.death_complete, typeid, BossDeath);
		end
	end
end
