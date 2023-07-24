-- Tallon Zek south wing

local PLANAR_PROJECTION_TYPE = 214323;

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_spawn(e)
	e.self:CastToNPC():SetCastRateDetrimental(75);	-- note: Tallon Zek's cast rate should average about 3.5 seconds between each barb
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("shadowstep", 20000);
	end
end

function event_timer(e)

	if ( e.timer == "shadowstep" ) then
	
		if ( not e.self:IsEngaged() ) then
			eq.stop_timer(e.timer);
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());		
		else
			e.self:GMMove(math.random(-725, -505), math.random(-2100, -1820), 207.6);
			e.self:WipeHateList();
		end
	end
end

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end
