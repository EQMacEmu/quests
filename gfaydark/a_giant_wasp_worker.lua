function event_waypoint_depart(e)
	if(e.gridid == 37 and e.wp == 68) then
		e.self:GMMove(166,1928,18);
	elseif(e.gridid == 38 and e.wp == 74) then
		e.self:SetCurrentWP(55);
	end	
end
