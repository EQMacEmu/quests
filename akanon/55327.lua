function event_spawn(e)
	eq.set_timer("requested",1800000);
end

function event_timer(e)
	if(e.timer == "requested" and not e.self:IsEngaged())then
		e.self:Say("Yes Mistress. Here is the requested part.");
		eq.set_timer("mistress",4000);		
	elseif(e.timer == "mistress")then
		e.self:Say("Yes Mistress.");
		eq.stop_timer(e.timer);
	end
end
