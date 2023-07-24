local LEZOM1_TYPE = 216020; -- Fishlord_Lezom
local LEZOM2_TYPE = 216284; -- Fishlord_Lezom
local CRAIYK1_TYPE = 216019; -- Fishlord_Craiyk
local CRAIYK2_TYPE = 216283; -- Fishlord_Craiyk
local FEROCIOUS_TYPE = 216268; -- a_ferocious_anglerfish
local FIERCE_TYPE = 216270; -- a_fierce_anglerfish
local FURIOUS_TYPE = 216269; -- a_furious_anglerfish
local REEF_TYPE = 216271; -- a_reef_anglerfish

local SPAWNS = {
	[FEROCIOUS_TYPE] = { -- 3, 6
		[5] = { 216273, 3 }, -- a_stringy_anglerfish
		[10] = { 216276, 3 }, -- a_dark_anglerfish
		[15] = { 216279, 3 }, -- a_prismatic_anglerfish
		[25] = { 216267, 3 }, -- a_master_anglerfish
	},
	[FIERCE_TYPE] = { -- 1, 4
		[5] = { 216272, 1 }, -- a_hungry_anglerfish
		[10] = { 216277, 1 }, -- a_wicked_anglerfish
		[15] = { 216280, 1 }, -- a_superior_anglerfish
		[25] = { 216281, 1 }, -- a_king_anglerfish
	},
	[FURIOUS_TYPE] = { -- 2, 5
		[5] = { 216274, 2 }, -- a_toughened_anglerfish
		[10] = { 216275, 2 }, -- a_foul_anglerfish
		[15] = { 216278, 2 }, -- a_prime_anglerfish
		[25] = { 216282, 2 }, -- a_supreme_anglerfish
	},
};
local GRIDS = {
	[1] = {
		{ 58, 351, -367, 128, 25 },
		{ 67, 352, -360, -1, 0 },
		{ 75, 322, -361, -1, 0 },
		{ 76, 273, -361, -1, 0 },
		{ 94, 217, -359, -1, 60 },
	},
	[2] = {
		{ 62, 296, -367, 128, 25 },
		{ 94, 217, -359, -1, 60 },
	},
	[3] = {
		{ 143, 52, -367, 0, 25 },
		{ 155, 73, -360, -1, 0 },
		{ 154, 87, -362, -1, 0 },
		{ 145, 109, -362, -1, 0 },
		{ 94, 217, -359, -1, 60 },
	},
	[4] = {
		{ -240, 332, -368, 128, 25 },
		{ -247, 327.5, -361, -1, 0 },
		{ -251, 276, -362, -1, 0 },
		{ -265, 200, -363, -1, 0 },
		{ -269, 157, -362, -1, 60 },
	},
	[5] = {
		{ -250, 235, -368, 128, 25 },
		{ -260, 229, -358, -1, 0 },
		{ -266, 196, -362, -1, 0 },
		{ -269, 157, -362, -1, 60 },
	},
	[6] = {
		{ -293, 77, -368, 0, 25 },
		{ -270, 69, -358, -1, 0 },
		{ -269, 157, -362, -1, 60 },
	},
};
local LORD_SPAWNIDS = {		-- these are the spawnids for the '1' types; '2' types are scripted spawns but using '2' types for keys
	[LEZOM2_TYPE] = 365505,
	[CRAIYK2_TYPE] = 365489,
};
local TRASH_SPAWNIDS = {
	[LEZOM2_TYPE] = { 369521, 369522, 369523, 369524 },
	[CRAIYK2_TYPE] = { 369525, 369526, 369527, 369528 },
};

local killsTable = {
	[LEZOM2_TYPE] = { FEROCIOUS_TYPE = 0, FIERCE_TYPE = 0, FURIOUS_TYPE = 0 },
	[CRAIYK2_TYPE] = { FEROCIOUS_TYPE = 0, FIERCE_TYPE = 0, FURIOUS_TYPE = 0 }
};

function FishlordSay(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Be like the water "..e.other:GetName()..". The water spirits have fortold of your coming. I am a fishlord, summoner of the dwellers of the deep.");
	elseif ( e.message:findi("dwellers") ) then
		e.self:Say("These are great creatures that dwell in the nether reaches of this reef. For 100 platinum I will summon them forth.");
	end
end

function FishlordTrade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {platinum = 100}, 0) ) then
	
		local npcType = e.self:GetNPCTypeID();
		local x, y, z;
		if ( npcType == LEZOM1_TYPE ) then
			npcType = LEZOM2_TYPE;
			x, y, z = 94, 217, -359;
		else
			npcType = CRAIYK2_TYPE;
			x, y, z = -269, 157, -362;
		end

		killsTable[npcType][FEROCIOUS_TYPE] = 0;
		killsTable[npcType][FIERCE_TYPE] = 0;
		killsTable[npcType][FURIOUS_TYPE] = 0;		
		
		e.self:Say("Very well, I will summon forth the creatures of the deep. They do not like being disturbed so you must protect me from harm. I am very vulnerable when summoning the dwellers of the deep.  If death claims me the summoning will be finished. During the course of the summoning many powerful dwellers will appear. You must watch for them.");
		eq.spawn2(npcType, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):CastToNPC():MoveTo(x, y, z, -1, true);
		eq.depop_with_timer();
		eq.get_entity_list():GetSpawnByID(LORD_SPAWNIDS[npcType]):Disable();
	end
end

function ToggleSpawns(t, state)
	local elist = eq.get_entity_list();

	for _, id in ipairs(TRASH_SPAWNIDS[t]) do
		if ( state ) then
			elist:GetSpawnByID(id):Enable();
		else
			elist:GetSpawnByID(id):Disable(false);
		end
	end
end

function WaypointArrive(e)
	e.self:Say("Listen, oh spirits of water! I summon forth the dwellers of the deep.' He then begins to hum softly closing his eyes and seemingly settling into a deep focus. Suddenly he shouts a mystical chant saying, 'XAX XAX tomae tomae XAX podiggle podiggle XAX AZKHAZKKKY!");
	e.self:SetRunspeed(0.0);
	e.self:SetWalkspeed(0.0);
	
	ToggleSpawns(e.self:GetNPCTypeID(), true);
end

function TrashDeathComplete(e)
	local npcType = e.self:GetNPCTypeID();
	local spawnID = e.self:GetSpawnPointID();
	local lordType = LEZOM2_TYPE;
	
	for _, id in ipairs(TRASH_SPAWNIDS[CRAIYK2_TYPE]) do
		if ( id == spawnID ) then
			lordType = CRAIYK2_TYPE;
			break;
		end
	end
	
	local kills = killsTable[lordType][npcType] + 1;
	killsTable[lordType][npcType] = kills;
	--eq.debug("kills == "..kills, 3);
	
	local t = SPAWNS[npcType][kills];

	if ( t and eq.get_entity_list():IsMobSpawnedByNpcTypeID(lordType) ) then
		local gridNum = t[2];
		if ( lordType == CRAIYK2_TYPE ) then
			gridNum = gridNum + 3;
		end
		
		local loc = GRIDS[gridNum][1];
		local npc = eq.spawn2(t[1], 0, 0, loc[1], loc[2], loc[3], loc[4]):CastToNPC();
		npc:SetWanderType(6);
		npc:SetPauseType(1);
		for _, wp in ipairs(GRIDS[gridNum]) do
			npc:AddWaypoint(wp[1], wp[2], wp[3], wp[4], wp[5], false);
		end
		
		if ( kills == 25 ) then
			eq.get_entity_list():GetMobByNpcTypeID(lordType):Say("I sense a creature of immense power has been summoned forth. My job here is finished. You all have done very well for mortals.");
			EndEvent(lordType);
			eq.depop(lordType);
		else
			eq.get_entity_list():GetMobByNpcTypeID(lordType):Say("A dweller of some power comes, prepare yourself.");
		end
	end
end

function FishlordDeathComplete(e)
	EndEvent(e.self:GetNPCTypeID());
end

function EndEvent(typ)
	ToggleSpawns(typ, false);
	eq.get_entity_list():GetSpawnByID(LORD_SPAWNIDS[typ]):Enable();
	eq.update_spawn_timer(LORD_SPAWNIDS[typ], 1500000);
end

function TrashSpawn(e)
	eq.set_timer("depop", 180000);
end

function TrashCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function TrashTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop_with_timer();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Fishlords", Event.say, LEZOM1_TYPE, FishlordSay);
	eq.register_npc_event("Fishlords", Event.trade, LEZOM1_TYPE, FishlordTrade);
	eq.register_npc_event("Fishlords", Event.say, CRAIYK1_TYPE, FishlordSay);
	eq.register_npc_event("Fishlords", Event.trade, CRAIYK1_TYPE, FishlordTrade);
	eq.register_npc_event("Fishlords", Event.death_complete, LEZOM2_TYPE, FishlordDeathComplete);
	eq.register_npc_event("Fishlords", Event.death_complete, CRAIYK2_TYPE, FishlordDeathComplete);
	eq.register_npc_event("Fishlords", Event.waypoint_arrive, LEZOM2_TYPE, WaypointArrive);
	eq.register_npc_event("Fishlords", Event.waypoint_arrive, CRAIYK2_TYPE, WaypointArrive);
	eq.register_npc_event("Fishlords", Event.death_complete, FEROCIOUS_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fishlords", Event.death_complete, FIERCE_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fishlords", Event.death_complete, FURIOUS_TYPE, TrashDeathComplete);

	local trash = { FEROCIOUS_TYPE, FIERCE_TYPE, FURIOUS_TYPE, REEF_TYPE };
	for _, id in ipairs(trash) do
		eq.register_npc_event("Fishlords", Event.spawn, id, TrashSpawn);
		eq.register_npc_event("Fishlords", Event.combat, id, TrashCombat);
		eq.register_npc_event("Fishlords", Event.timer, id, TrashTimer);
	end
end
