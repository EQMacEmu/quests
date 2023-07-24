function event_death_complete(e)
	eq.spawn2(212410, 0, 0, 1780, -336, 339, 0);	-- a_flaming_cauldron
	eq.spawn2(212415, 0, 0, 1837, -1040, 297, 128);	-- a_warder_of_Xuzl
	eq.spawn2(212415, 0, 0, 1880, -1091, 297, 192)
	eq.spawn2(212415, 0, 0, 1800, -1091, 297, 64);
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
	
		if ( e.self:GetY() < -914 ) then
			e.self:Emote("bellows in a deep voice, 'You shall not distract me from my conjurings!'");
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(2830, e.self:GetID()); -- Annul Self
		end
	end
end
