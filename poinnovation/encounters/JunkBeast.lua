--[[

Junk Beast has spawn behavior that must be scripted to replicate as the hardcoded spawning
mechanisms do not function as Sony's does.

Junk Beast has two possible spawns:

From a random location in the northern central north/south patrol route or in a box region
where the north/south route bisects, in the northern region of the zone.

If he spawns in the north/south patrol route, he doesn't stay there.  He instead moves to
the short patrol route near the mech dragon room and patrols that.  He never goes back to
his spawn area.

If he spawns in the box, he roams almost the entire zone circuit, minus the zone-in area.
The spawn point is random inside this box.

]]

local NPC_TYPES = {
	206060, -- #Junk_Beast
	206036, -- an_erratic_model
	206047, -- a_busted_power_carrier
	206028, -- a_defective_clockwork
	206020 -- a_scrounging_clockwork
};

function SpawnEvent(e)

	local id = e.self:CastToNPC():GetSpawnPointID();
	
	if ( id == 345196 ) then -- from a random waypoint spawn using grid 4
		eq.set_timer("type1", 3000);

	elseif ( id > 700000 ) then -- this spawn is from a roambox random spawn; these spawn IDs are > 700000
		eq.set_timer("type2", 3000);
	end
end

function TimerEvent(e)
	-- have to use a timer because grids stupidly don't load until after spawn event when zone first boots
	
	if ( e.timer == "type1" ) then
		eq.stop_timer("type1");
		
		e.self:AssignWaypoints(2);
		e.self:CastToNPC():UpdateWaypoint(4);
		e.self:CastToNPC():MoveTo(-690, 962, -44.5, -1, true);
		
	elseif ( e.timer == "type2" ) then
		eq.stop_timer("type2");
		
		e.self:AssignWaypoints(9);
		if ( math.random(1, 2) == 1 ) then
			e.self:CastToNPC():UpdateWaypoint(17);
		else	
			e.self:CastToNPC():UpdateWaypoint(153);
		end		
	end
end

function event_encounter_load(e)
	for i, id in ipairs(NPC_TYPES) do
		eq.register_npc_event("JunkBeast", Event.spawn, id, SpawnEvent);
		eq.register_npc_event("JunkBeast", Event.timer, id, TimerEvent);
	end
end
