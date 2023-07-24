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
				eq.spawn2(214084, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- Gindan Flayer
				eq.spawn2(214084, 0, 0, e.self:GetX(), e.self:GetY() - 10, e.self:GetZ(), 0);
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
		
		-- RZ script anti-cheat to prevent players from casting on third floor mobs from 2nd floor
		-- if we're a flayer in RZ area
		if ( e.self:GetZ() > 156 and e.self:GetX() > 0 ) then
			local t = e.self:GetTarget();
			-- if target is on 2nd floor near the safe room near zone-in
			if ( t and t.valid and t:GetZ() < 100 and t:GetX() < 600 ) then

				local types = { 214313, 214320, 214311 };	-- RZ script TZ, VZ, fake RZ
				for _, id in ipairs(types) do
					if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(id) ) then
						-- warp mob and player on top of boss
						local mob = eq.get_entity_list():GetMobByNpcTypeID(id);
						e.self:GMMove(mob:GetX(), mob:GetY(), mob:GetZ(), 0);
						if ( t:IsClient() ) then
							t:CastToClient():MovePC(214, mob:GetX(), mob:GetY(), mob:GetZ(), 0);
						end
						break;
					end
				end
			end
		end
	else
		eq.resume_timer("depop");
	end
end

function event_signal(e)
	-- Rallos event spawns.  doing this to not have to clone the NPC type
	if ( e.signal == e.self:GetID() ) then
		eq.set_timer("checkhp", 5000);
		eq.stop_timer("depop");
	end
end
