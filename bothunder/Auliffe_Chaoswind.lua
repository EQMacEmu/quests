function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("leash", 30000);
	else
		eq.stop_timer("leash");
	end
end

function event_timer(e)

	if ( e.timer == "leash" ) then

		if ( e.self:GetZ() < 1400 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
	end
end
