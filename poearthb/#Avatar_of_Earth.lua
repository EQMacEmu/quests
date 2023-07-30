local PLANAR_PROJECTION_TYPE = 222041; -- Essence_of_Earth

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_spawn(e)
	eq.set_timer("depop", 2100000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.debug("Avatar of Earth depop");
		eq.depop();
	end
end
