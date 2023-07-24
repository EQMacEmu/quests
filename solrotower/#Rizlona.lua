function event_death_complete(e)
	eq.spawn2(212413, 0, 0, -980, 2717, -908, 0);	-- a_flaming_cauldron
	eq.spawn2(212418, 0, 0, -1087, 2022, -902, 128);	-- a_warder_of_Rizonla
	eq.spawn2(212418, 0, 0, -1118, 2022, -902, 128);
	eq.spawn2(212418, 0, 0, -1102, 1975, -914, 128);
end

function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetY() < 2047 or e.self:GetY() > 2538 ) then
		
			e.self:GMMove(-1103, 2384, -905, 128);
			e.self:SetGuardSpot(-1103, 2384, -905, 128);
			e.self:WipeHateList();
			e.self:CastSpell(2830, e.self:GetID()); -- Annul Self
		end
		
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
		eq.set_timer("bounds", 6000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("bounds");
	end
end
