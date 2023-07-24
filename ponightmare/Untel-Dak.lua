function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("boundscheck", 3000);
	else
		eq.stop_timer("boundscheck");
	end
end

function event_timer(e)

	if ( e.timer == "boundscheck" ) then
		if ( e.self:GetY() > -1550 ) then
			e.self:WipeHateList();
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
	end
end
