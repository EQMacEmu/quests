rand = 0;

function event_waypoint_arrive(e)
	rand = math.random(1,2);
	if(e.wp > 0 and e.self:GetWaypointPause() > 1) then
		if(rand == 1) then
			e.self:Emote("nibbles on a small mushroom at its feet.");
		else
			e.self:Emote("peers around the cavern.  You get the distinct impression it knows you're here.");
		end
	end
end

function event_waypoint_depart(e)
	if(e.wp > 0 and e.self:GetWaypointPause() > 1) then
		if(rand == 1) then
			e.self:Emote("finishes feeding and moves on.");
		else
			e.self:Emote("gives up on what ever it was looking for and goes back into the caves.");
		end
	end
	rand = 0;
end

