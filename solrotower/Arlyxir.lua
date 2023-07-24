function event_death_complete(e)
	eq.spawn2(212411, 0, 0, 1607, 1891, 627, 0);	-- a_flaming_cauldron
	eq.spawn2(212416, 0, 0, 1726, 1165, 624, 128);	-- a_warder_of_Arlyxir
	eq.spawn2(212416, 0, 0, 1713, 1207, 633, 128);
	eq.spawn2(212416, 0, 0, 1738, 1207, 633, 128);
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
		eq.set_timer("heal", 750000);
	else
		eq.stop_timer("bounds");
		eq.stop_timer("heal");
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetY() < 1230 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(2830, e.self:GetID()); -- Annul Self
		end
		
	elseif ( e.timer == "heal" ) then
		e.self:Emote("is immolated in flames, and is reborn!");
		e.self:Heal();
		e.self:CastSpell(1281, e.self:GetTarget():GetID()); -- Searing Flames
	end
end
