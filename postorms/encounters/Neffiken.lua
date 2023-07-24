local NEFFIKEN_TYPE = 210251; -- Neffiken,_Lord_of_Kelek`Vor
local TREE_TYPES = {
	210479, -- a_maligned_ent
	210480, -- a_manipulated_ent
	210481, -- a_restrained_ent
};
local TRASH_GIANT_TYPES = {
	210038, -- an_irmin_fannsk
	210411, -- an_irmin_fannsk
	210015, -- an_irmin_her_megir
};
local DOLSHAK_TYPE = 210468;
local DOLSHAK_SPAWNID = 369224;

local killed = 0;
local trees = 0;
local neffikenActive = false;

function TrashDeathCompleteEvent(e)

	local elist = eq.get_entity_list();
	
	if ( not elist:IsMobSpawnedByNpcTypeID(NEFFIKEN_TYPE) ) then
		return;
	end
	
	killed = killed + 1;
	if ( killed < 34 ) then
		return;
	end
	
	for _, id in ipairs(TRASH_GIANT_TYPES) do
		if ( elist:IsMobSpawnedByNpcTypeID(id) ) then
			return;
		end
	end
	
	local neffiken = elist:GetNPCByNPCTypeID(NEFFIKEN_TYPE);

	if ( neffiken and neffiken.valid ) then
		neffiken:SetBodyType(1, false);   -- make targetable
		neffiken:SetSpecialAbility(24, 0); -- Will Not Aggro off
		neffiken:SetSpecialAbility(35, 0); -- No Harm from Players off
		eq.set_timer("untarget", 3600000, neffiken);
		neffikenActive = true;
		trees = 0;
		eq.debug("Neffiken active");
	end
end

-- this is actually how Sony does it; just depops them instantly if they spawn
function TrashSpawnEvent(e)
	if ( neffikenActive ) then
		eq.depop_with_timer();
	end
end

function NeffikenDeathEvent(e)
	neffikenActive = false;	
	eq.get_entity_list():GetSpawnByID(DOLSHAK_SPAWNID):SetTimer(math.random(900, 3600) * 1000);
	eq.debug("Neffiken killed");
end

function NeffikenSpawnEvent(e)
	neffikenActive = false;
	eq.depop_with_timer(DOLSHAK_TYPE);
	killed = 0;
end

function NeffikenTimerEvent(e)

	if ( e.timer == "trees" ) then
		if ( trees < 8 ) then
		
			local t, dist;
			local sx = e.self:GetX();
			local sy = e.self:GetY();
			local sz = e.self:GetZ();
			local x, y;
			local rng = math.random(5, 8);
			local spawned = 0;
			
			while trees < 8 do
			
				x = sx + math.random(-100, 100);
				y = sy - math.random(50, 100);
				dist = e.self:CalculateDistance(x, y, sz);
				
				-- the trees seemed to always spawn to the south of him and kinda in a semi-circle-like pattern
				if ( dist > 50 and dist < 100 ) then
					t = eq.ChooseRandom(TREE_TYPES[1], TREE_TYPES[2], TREE_TYPES[3]);
					eq.spawn2(t, 0, 0, x, y, sz + 5, 0);
					trees = trees + 1;
					spawned = spawned + 1;
					if ( spawned == rng ) then
						break;
					end
				end
			end
		end
	
	elseif ( e.timer == "untarget" ) then
		eq.stop_timer(e.timer);
		e.self:SetBodyType(11, false);   -- make untargetable
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
		killed = 0;
		neffikenActive = false;
		eq.debug("Neffiken inactive");
	end
end

function NeffikenCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("untarget");
		eq.set_timer("trees", 35000);
	else
		eq.resume_timer("untarget");
		eq.stop_timer("trees");
	end
end

function TreeSpawnEvent(e)
	eq.set_timer("depop", 170000);
end
function TreeTimerEvent(e)
	if ( e.timer == "depop" ) then
		trees = trees - 1;
		eq.depop();
	end
end
function TreeCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end
function TreeDeathEvent(e)
	trees = trees - 1;
end

function event_encounter_load(e)

	for _, id in ipairs(TRASH_GIANT_TYPES) do
		eq.register_npc_event("Neffiken", Event.death_complete, id, TrashDeathCompleteEvent);
		eq.register_npc_event("Neffiken", Event.spawn, id, TrashSpawnEvent);
	end
	for _, id in ipairs(TREE_TYPES) do
		eq.register_npc_event("Neffiken", Event.spawn, id, TreeSpawnEvent);
		eq.register_npc_event("Neffiken", Event.timer, id, TreeTimerEvent);
		eq.register_npc_event("Neffiken", Event.combat, id, TreeCombatEvent);
		eq.register_npc_event("Neffiken", Event.death, id, TreeDeathEvent);
	end

	eq.register_npc_event("Neffiken", Event.death, NEFFIKEN_TYPE, NeffikenDeathEvent);
	eq.register_npc_event("Neffiken", Event.spawn, NEFFIKEN_TYPE, NeffikenSpawnEvent);
	eq.register_npc_event("Neffiken", Event.timer, NEFFIKEN_TYPE, NeffikenTimerEvent);
	eq.register_npc_event("Neffiken", Event.combat, NEFFIKEN_TYPE, NeffikenCombatEvent);	
end
