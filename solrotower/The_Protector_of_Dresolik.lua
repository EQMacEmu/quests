function event_death_complete(e)
	eq.spawn2(212414, 0, 0, 166, 1449, -68, 0);	-- a_flaming_cauldron
	eq.spawn2(212419, 0, 0, 976, 1918, -158, 64);	-- a_warder_of_Dresolik
	eq.spawn2(212419, 0, 0, 1007, 1982, -158, 0);
	eq.spawn2(212419, 0, 0, 1041, 1918, -158, 192);
end

function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetX() > 978 or e.self:GetX() < 558 ) then
		
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
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
