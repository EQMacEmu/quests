function event_combat(e)

	if ( e.joined ) then
		eq.get_entity_list():MessageClose(e.self, true, 75, 0, "Storm clouds begin to gather over your head.");
		eq.set_timer("cast", 5500);
	end
end

function event_timer(e)

	if ( e.timer == "cast" ) then
	
		local chance = 50;
		if ( e.self:GetZ() > 0 ) then
			chance = 75;	-- tower traps seem to trigger more?
		end
		
		if ( math.random(100) > chance ) then
			eq.get_entity_list():MessageClose(e.self, true, 75, 0, "The storm clouds pass harmlessly.");
		else
			eq.spawn2(209160, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- a_storm_cloud
			eq.signal(209160, eq.ChooseRandom(1024, 1025, 1026)); -- Thunderclap, Static Pulse, Thunder Call
		end
	
		eq.depop_with_timer();
	end
end
