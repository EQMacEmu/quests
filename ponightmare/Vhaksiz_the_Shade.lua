local x, y, z;

function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	z = e.self:GetZ();
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("leashcheck", 3000);
	else
		eq.stop_timer("leashcheck");
	end
end

function event_timer(e)
	if ( e.timer == "leashcheck" ) then
		if ( e.self:CalculateDistance(x, y, z) > 155 ) then
			e.self:WipeHateList();
			e.self:GMMove(x, y, z, e.self:GetSpawnPointH());
			e.self:CastSpell(2830, e.self:GetID());
		end
	end
end
