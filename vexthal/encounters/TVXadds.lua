local NORTH_TVX_TYPE = 158136;
local SOUTH_TVX_TYPE = 158465;
local VA_XAKRA_TYPE = 158006;
local NORTH_VA_XAKRA1_SPAWNID = 365859;
local NORTH_VA_XAKRA2_SPAWNID = 365582;
local SOUTH_VA_XAKRA1_SPAWNID = 366962;
local SOUTH_VA_XAKRA2_SPAWNID = 366429;
local ADD_SPAWNIDS = {
	["northWing"] = {
		367401,
		366394,
		365802,
		365441,
		365368,
		366065,
		366195,
		365571,
		365247,
		366513,
		366888,
		365589,
		367220,
		365873,
		365800,
		367095
	},
	["southWing"] = {
		365946,
		365881,
		366540,
		366257,
		367471,
		365472,
		366972,
		365351,
		365528,
		366213,
		366153,
		366995,
		367490,
		365238,
		365851,
		367481
	}
};

function CombatEvent(e)
	
	if ( not e.joined ) then
		eq.stop_timer("addtimer");
	else
		eq.set_timer("addtimer", 5000);
		MoveAdds(e);
	end
end

function MoveAdds(e)

	local npcList = eq.get_entity_list():GetNPCList();
	local myType = e.self:GetNPCTypeID();
	local mySpawnpointID = e.self:GetSpawnPointID();
	local spawnsList;
	
	if ( myType == NORTH_TVX_TYPE or mySpawnpointID == NORTH_VA_XAKRA1_SPAWNID or mySpawnpointID == NORTH_VA_XAKRA2_SPAWNID ) then
		spawnsList = ADD_SPAWNIDS["northWing"];
		
	elseif ( myType == SOUTH_TVX_TYPE or mySpawnpointID == SOUTH_VA_XAKRA1_SPAWNID or mySpawnpointID == SOUTH_VA_XAKRA2_SPAWNID ) then
		spawnsList = ADD_SPAWNIDS["southWing"];
	else
		return;
	end

	if ( myType == VA_XAKRA_TYPE ) then
	
		if ( mySpawnpointID == 365859 or mySpawnpointID == 365582 ) then
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(NORTH_TVX_TYPE)
				and eq.get_entity_list():GetMobByNpcTypeID(NORTH_TVX_TYPE):IsEngaged()
			) then
				return;
			end
		elseif ( mySpawnpointID == 366962 or mySpawnpointID == 366429 ) then
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(NORTH_TVX_TYPE)
				and eq.get_entity_list():GetMobByNpcTypeID(SOUTH_TVX_TYPE):IsEngaged()
			) then
				return;
			end
		end	
	end

	if ( npcList ) then
	
		local addsHashMap = {};
		for _, id in ipairs(spawnsList) do
			addsHashMap[id] = true;
		end
	
		for npc in npcList.entries do

			if ( npc.valid and addsHashMap[npc:GetSpawnPointID()] and not npc:IsEngaged() ) then
				npc:MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
			end
		end
	end
end

function TimerEvent(e)
	if ( e.timer == "addtimer" ) then
		MoveAdds(e);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("TVXadds", Event.combat, NORTH_TVX_TYPE, CombatEvent);
	eq.register_npc_event("TVXadds", Event.combat, SOUTH_TVX_TYPE, CombatEvent);
	eq.register_npc_event("TVXadds", Event.combat, VA_XAKRA_TYPE, CombatEvent);
	
	eq.register_npc_event("TVXadds", Event.timer, NORTH_TVX_TYPE, TimerEvent);
	eq.register_npc_event("TVXadds", Event.timer, SOUTH_TVX_TYPE, TimerEvent);
	eq.register_npc_event("TVXadds", Event.timer, VA_XAKRA_TYPE, TimerEvent);
end
