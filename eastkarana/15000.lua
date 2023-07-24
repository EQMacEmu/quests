-- dark elf reaver - ranger/druid epic
function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(15044)) then
			e.self:Shout("Innoruuk claims your souls and this land!");
		end
		eq.depop(15178);
		eq.depop(15167);
		eq.depop(15170);
		eq.depop_with_timer(15043);
		eq.depop_with_timer(15042);
		eq.depop_with_timer(15044);	
		eq.depop(15153);
		eq.depop(15150);
		eq.depop();
	end
end
