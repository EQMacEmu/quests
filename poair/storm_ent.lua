function event_combat(e)
	if ( e.joined ) then
	
		local x, y, mob;
		
		if ( e.self:GetY() > -500 ) then
			for i = 1, 6 do
				x, y = math.random(-600, -250), math.random(-700, -550);
				mob = eq.spawn2(215426, 0, 0, x, y, 110, 0); -- A_Marauding_Stormrider
				mob:CastToNPC():MoveTo(-455, -272, 80, -1, true);
				mob:SetRunning(true);
			end
		else
			for i = 1, 6 do
				x, y = math.random(-550, -400), math.random(-850, -500);
				mob = eq.spawn2(215426, 0, 0, x, y, 108, 0); -- A_Marauding_Stormrider
				mob:CastToNPC():MoveTo(-821, -701, 138, -1, true);
				mob:SetRunning(true);
			end		
		end
		
		eq.depop_with_timer();
	end
end
