local PLANAR_PROJECTION_TYPE = 218398;

function event_spawn(e)
	eq.set_timer("depop", 3000000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
	else
		eq.stop_timer("drophate");
		
		-- this is to mimic certain behavior Sony's servers had/has.  NPCs aggroed a long time sometimes warp home or
		-- some distance away in the direction of home and heal somewhat when they hate list wipe.  The exact logic to this
		-- behavior is unknown.  Bosses with the tank hate list drop mechanic need this in order to not trivialize the
		-- encounter using mem blur.  This is a crude solution that works well enough
		local ratio = e.self:GetHPRatio();
		if ( ratio < 50 or math.random(100) > ratio ) then
			e.self:GMMove(e.self:GetGuardPointX(), e.self:GetGuardPointY(), e.self:GetGuardPointZ(), e.self:GetSpawnPointH());
			e.self:SetHP(e.self:GetHP() + math.floor(e.self:GetMaxHP() * 0.3));
		end
	end
end

function event_timer(e)
	if ( e.timer == "drophate") then

		if ( math.random() < 0.05 ) then -- averages to once every 20 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
	
	elseif ( e.timer == "depop" ) then
		eq.debug("Arbitor depop");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end
