function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Join the Pirates of Gunthak, wench, or die!!");
		eq.signal(69022,1); -- NPC: Euboea_Delewyn
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Foolish maiden!");
	end
end