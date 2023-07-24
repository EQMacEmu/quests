-- Vallon Zek (level 73) north wing

function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)

	if ( e.hp_event == 50 ) then
	
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
		
		eq.signal(214317, 1);
		e.self:Emote("fades into the shadows as five figures take shape around you.");
		eq.depop_with_timer();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
	else
		eq.stop_timer("bounds");
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
		if ( e.self:GetY() < 1750 and e.self:GetX() < 0 ) then
			e.self:GMMove(-625, 1980, 204.5, 64);
		end
	end
end
