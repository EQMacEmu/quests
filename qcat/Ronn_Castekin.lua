function event_death_complete(e)
	e.self:Say("Argh!.. Mer.. o..na.. it's.. not.. your fault.. arhhh...");
end

function event_waypoint_arrive(e)
	if((e.wp > 19 and e.wp < 40) or (e.wp > 100 and e.wp < 120)) then
		e.self:SetRunning(true);
	else
		e.self:SetRunning(false);
	end
end
