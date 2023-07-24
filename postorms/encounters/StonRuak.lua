local STONRUAK_TYPE = 210471; -- Ston`Ruak,_Ancient_of_the_Trees
local TOTEM_TYPES = {
	210458, -- an_earthen_spirit
	210463, -- a_Koka`Vor_advisor
	210464, -- a_Koka`Vor_bark_spirit
};
local TRASH_TYPES = {
	210087, -- a_Koka`Vor_senvar
	210088, -- a_Koka`Vor_krovian
};
local TRASH2_TYPES = {
	210466, -- a_Koka`Vor_Elder
	210465, -- a_Koka`Vor_Chieftain
};
local PHASE2_LOCS = {
	{ -232, 717, -368.5, 107 },
	{ 164, 1337, -368.5, 38 },
	{ -171, 694, -374, 166 },
	{ -174, 622, -374, 231 },
	{ -207, 699, -368.5, 127 },
	{ 270, 1355, -368.5, 204 },
	{ 214, 1434, -368.5, 127 },
	{ 211, 1371, -368.5, 219 },
};
local killed = 0;
local adds = 0;
local phase2 = false;
local stonruakUp = false;

function TrashDeathCompleteEvent(e)

	killed = killed + 1;
	eq.debug("stonruak guards killed == "..killed);
	if ( killed < 38 ) then
		return;
	end
	
	local elist = eq.get_entity_list();
	for _, id in ipairs(TRASH_TYPES) do
		if ( elist:IsMobSpawnedByNpcTypeID(id) ) then
			return;
		end
	end
	
	phase2 = true;
	local loc;
	for i = 1, 8 do
		loc = PHASE2_LOCS[i];
		eq.spawn2(eq.ChooseRandom(TRASH2_TYPES[1], TRASH2_TYPES[2]), 0, 0, loc[1], loc[2], loc[3], loc[4]);
	end
	eq.debug("Stonruak event phase 2 spawned");
end

function Trash2DeathCompleteEvent(e)

	local elist = eq.get_entity_list();
	
	if ( elist:IsMobSpawnedByNpcTypeID(TRASH2_TYPES[1]) or elist:IsMobSpawnedByNpcTypeID(TRASH2_TYPES[2]) ) then
		return;
	end
	
	eq.unique_spawn(STONRUAK_TYPE, 0, 0, -206, 669, -368, 167);
	eq.debug("Stonruak spawned");
end

-- this is actually how Sony does it; just depops them instantly if they spawn
function TrashSpawnEvent(e)
	if ( phase2 or stonruakUp ) then
		eq.depop_with_timer();
	end
end

function StonruakDeathEvent(e)
	stonruakUp = false;
	eq.debug("Stonruak killed");
end

function StonruakSpawnEvent(e)
	stonruakUp = true;
	killed = 0;
	adds = 0;
end

function StonruakTimerEvent(e)

	if ( e.timer == "adds" ) then
		if ( adds < 8 ) then
		
			local t;
			local sx = e.self:GetX();
			local sy = e.self:GetY();
			local sz = e.self:GetZ();
			local x, y;
			local rng = math.random(5, 8);
			local spawned = 0;
			
			for i = adds+1, 8 do
			
				x = sx + math.random(-30, 30);
				y = sy - math.random(-30, 30);
				
				t = eq.ChooseRandom(TOTEM_TYPES[1], TOTEM_TYPES[2], TOTEM_TYPES[3]);
				eq.spawn2(t, 0, 0, x, y, sz + 5, 0);				
				spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			adds = adds + spawned;
		end
	end
end

function StonruakCombatEvent(e)
	if ( e.joined ) then
		eq.set_timer("adds", 35000);
	else
		eq.stop_timer("adds");
	end
end

function TotemSpawnEvent(e)
	eq.set_timer("depop", 170000);
end
function TotemTimerEvent(e)
	if ( e.timer == "depop" ) then
		adds = adds - 1;
		eq.depop();
	end
end
function TotemCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end
function TotemDeathEvent(e)
	adds = adds - 1;
end

function event_encounter_load(e)

	for _, id in ipairs(TRASH_TYPES) do
		eq.register_npc_event("StonRuak", Event.death_complete, id, TrashDeathCompleteEvent);
		eq.register_npc_event("StonRuak", Event.spawn, id, TrashSpawnEvent);
	end
	for _, id in ipairs(TRASH2_TYPES) do
		eq.register_npc_event("StonRuak", Event.death_complete, id, Trash2DeathCompleteEvent);
	end
	for _, id in ipairs(TOTEM_TYPES) do
		eq.register_npc_event("StonRuak", Event.spawn, id, TotemSpawnEvent);
		eq.register_npc_event("StonRuak", Event.timer, id, TotemTimerEvent);
		eq.register_npc_event("StonRuak", Event.combat, id, TotemCombatEvent);
		eq.register_npc_event("StonRuak", Event.death, id, TotemDeathEvent);
	end

	eq.register_npc_event("StonRuak", Event.death, STONRUAK_TYPE, StonruakDeathEvent);
	eq.register_npc_event("StonRuak", Event.spawn, STONRUAK_TYPE, StonruakSpawnEvent);
	eq.register_npc_event("StonRuak", Event.timer, STONRUAK_TYPE, StonruakTimerEvent);
	eq.register_npc_event("StonRuak", Event.combat, STONRUAK_TYPE, StonruakCombatEvent);
end
