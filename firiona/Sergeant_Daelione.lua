function event_waypoint_arrive(e)
	if(e.wp == 16) then
		e.self:Shout("We march Onward!");
	end
end

function event_death_complete(e)
	eq.unique_spawn(84017,0,0,2490,-518,-24,135); -- NPC: Vekis
end