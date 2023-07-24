function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Hello, Milea. It is unfortunate for you that your friends have led me right to you. Soon you will join Nerissa in the afterlife. Do you have any last words?");
		eq.signal(15118,1,4000);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I thought you would never ask.");
		eq.attack_npc_type(15118);
	end
end
