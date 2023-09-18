function event_waypoint_arrive(e)
	if(e.wp==2 or e.wp==4 or e.wp==6) then
		e.self:Say("Condition report soldier!");
		eq.signal(22066,1); -- NPC: Guard_Reskin
	elseif(e.wp==3 or e.wp==7) then
		e.self:Say("Condition report soldier!");
		eq.signal(22035,1); -- NPC: Guard_Tolus
	end
end
