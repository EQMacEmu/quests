function event_spawn(e)
	eq.set_timer("despawn",600000);
	e.self:SetRunning(true);
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_death_complete(e)
	eq.stop_timer("despawn");
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(15044)) then
			e.self:Shout("Innoruuk claims your souls and this land!");
		end
		eq.depop(15150);
		eq.depop(15000);
		eq.depop(15178);
		eq.depop(15167);
		eq.depop(15170);
		eq.depop_with_timer(15043);
		eq.depop_with_timer(15042);
		eq.depop_with_timer(15044);	
		eq.depop();
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
