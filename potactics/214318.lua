-- Vallon Zek fake 1

function event_spawn(e)
	eq.set_timer("depop", 120000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
		eq.pause_timer("depop");
	else
		eq.stop_timer("bounds");
		eq.resume_timer("depop");
	end
end

function event_timer(e)

	if ( e.timer == "depop" ) then
		eq.depop();
		
	elseif ( e.timer == "bounds" ) then
		if ( e.self:GetY() < 1750 and e.self:GetX() < 0 ) then
			e.self:GMMove(-625, 1980, 204.5, 64);
		end
	end
end
