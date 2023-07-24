function event_waypoint_arrive(e)

	if ( e.wp == (e.self:GetWaypointMax() - 2) ) then
		eq.signal(211073, e.self:GetID()); -- Guard_Change_Shouter
		
	elseif ( e.wp == (e.self:GetWaypointMax() - 1) ) then	
		e.self:RemoveWaypoints();
		e.self:SaveGuardSpot();
	end
end

function event_signal(e)
	if ( e.signal == e.self:GetID() ) then
		eq.set_timer("move", 60000);
	end
end

function event_timer(e)
	if ( e.timer == "check" ) then
		if ( e.self:GetX() > 0 ) then
			eq.depop();
		end
	
	elseif ( e.timer == "move" ) then
		eq.stop_timer(e.timer);
		eq.set_timer("check", 5000);
		
		e.self:MoveTo(80, 0, 7.5, -1, true);
		
	elseif ( e.timer == "failsafe" ) then
		-- force move if 1 full game day passes.  Not sure why they don't move sometimes (zone idle?)
		eq.set_timer("check", 5000);
		e.self:MoveTo(80, 0, 7.5, -1, true);		
	end
end
