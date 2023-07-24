function event_waypoint_arrive(e)
	if(e.wp > 0 and e.self:GetWaypointPause() > 1) then
		e.self:Emote("nibbles on a small mushroom at its feet.");
	end
end

function event_waypoint_depart(e)
	if(e.wp > 0 and e.self:GetWaypointPause() > 1) then
		e.self:Emote("finishes feeding and moves on.");
	end
end

