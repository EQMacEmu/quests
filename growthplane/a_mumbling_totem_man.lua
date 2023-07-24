function event_waypoint_arrive(e)
	if(e.wp == 1 and e.self:GetGrid() == 12) then
		e.self:Emote("mumbles and clicks to itself as it stares at the huge totem.");
	elseif (e.wp == 1 and e.self:GetGrid() == 13) then
		e.self:Emote("clicks to itself as it circles the ancient totem.");
	end
end