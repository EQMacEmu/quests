-- Vallon Zek (level 64, 'real one')

local PLANAR_PROJECTION_TYPE = 214324;

local wave = 0;

function event_spawn(e)
	eq.set_next_hp_event(50);
	eq.set_timer("depop", 120000);
end

function event_signal(e)
	wave = e.signal;
end

function event_hp(e)

	if ( e.hp_event == 50 ) then
	
		if ( wave == 4 ) then
			return;
		end
	
		local x, y;
		local rng = math.random(1, 5); -- so the real one isn't always named 'Vallon_Zek000'
		
		for i = 1, 5 do
			x = math.random(-645, -565);
			y = math.random(1940, 2020);
			if ( i == rng ) then
				eq.spawn2(214317, 0, 0, x, y, 204.5, 64);	-- real one
			else
				eq.spawn2(eq.ChooseRandom(214318, 214319), 0, 0, x, y, 204.5, 64);	-- fakes
			end
		end
		
		eq.signal(214317, wave + 1);
		e.self:Emote("fades into the shadows as five figures take shape around you.");
		eq.depop();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
		eq.pause_timer("depop");
	else
		eq.stop_timer("bounds");
		eq.resume_timer("depop");
	end
end

function event_timer(e)

	if ( e.timer == "depop" ) then
		eq.depop();
		eq.spawn_from_spawn2(369265);
		
	elseif ( e.timer == "bounds" ) then
		if ( e.self:GetY() < 1750 ) then
			e.self:GMMove(-625, 1980, 204.5, 64);
		end
	end
end

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end
