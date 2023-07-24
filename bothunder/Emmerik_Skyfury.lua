function event_combat(e)
	if ( e.joined ) then
		eq.zone_emote(0, "Emmerik gestures toward the sky calling meteors to his aid.");
		eq.set_timer("portals", 120000);
	else
		eq.stop_timer("portals");
	end
end

function event_death_complete(e)
	eq.spawn2(209157, 0, 0, -1065, -1733, 1727, 192); -- ##Askr_the_Lost
	eq.depop_all(209156); -- #Askr_the_Lost; not sure if this should be here
end

function event_timer(e)
	if ( e.timer == "portals" ) then
		eq.zone_emote(0, "Emmerik raises his arm high above his head.  Great bolts of energy surge through him and strike the portals.");
		eq.signal(209102, 1); -- A_celestial_portal
		
		if ( e.self:GetHPRatio() < 25 ) then
			eq.set_timer("portals", 60000);
			
		elseif ( e.self:GetHPRatio() < 50 ) then
			eq.set_timer("portals", 90000);
		end
	end
end
