function event_death_complete(e)
	eq.spawn2(212407, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);	-- #Rizlona
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
	else
		eq.stop_timer("bounds");
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetY() < 2047 or e.self:GetY() > 2538 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(2830, e.self:GetID()); -- Annul Self
		end
	end
end
