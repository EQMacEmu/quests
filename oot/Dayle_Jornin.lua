function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Join the Pirates of Gunthak, wench, or die!!");
		eq.signal(69022,1); -- NPC: Euboea_Delewyn
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Foolish maiden!");
		eq.attack_npc_type(69022); --Euboea_Delewyn
	end
end