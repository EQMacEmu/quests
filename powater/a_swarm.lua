function event_combat(e)
	
	if ( e.joined ) then
		
		local typ;
		if ( e.self:GetZ() > -200 ) then
			-- a_young_barracuda, a_young_piranha, a_young_sea_turtle, a_young_swordfish, a_little_frog
			typ = eq.ChooseRandom(216255, 216252, 216250, 216249, 216264);
		else
			typ = eq.ChooseRandom(216254, 216253, 216251); -- a_young_deepwater_kraken, a_young_hraquis, a_young_regrua
		end
		
		local roll = math.random(2, 4);
		for i = 1, roll do
			eq.spawn2(typ, 0, 0, e.self:GetX() + math.random(-5, 5), e.self:GetY() + math.random(-5, 5), e.self:GetZ(), 0);
		end
		eq.depop_with_timer();
	end
end
