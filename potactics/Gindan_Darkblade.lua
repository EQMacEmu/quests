function event_spawn(e)
	if ( e.self:GetSpawnPointID() == 0 ) then -- 0 means script spawned
		eq.set_timer("depop", 360000);
		e.self:SetSpecialAbility(49, 1);	-- corpse camp
	end
end

function event_timer(e)

	if ( e.timer == "checkhp" ) then
	
		if ( e.self:GetHPRatio() < 50 ) then
			if ( math.random(100) < 25 ) then	-- some of these seem to not split?
				eq.stop_timer(e.timer);
			else
				eq.spawn2(214032, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- Gindan_Darkblade
				eq.spawn2(214032, 0, 0, e.self:GetX(), e.self:GetY() - 10, e.self:GetZ(), 0);
				eq.depop_with_timer();
			end
		end
		
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
		if ( e.self:GetSpawnPointID() > 0 ) then
			eq.set_timer("checkhp", 5000);
		end
	else
		eq.resume_timer("depop");
		eq.stop_timer("checkhp");
	end
end
