function event_combat(e)
	if ( e.joined ) then
		e.self:Emote("erupts from a pile of bloody flesh.");

		local x = e.other:GetX();
		local y = e.other:GetY();
		local z = e.other:GetZ();
		
		for i = 2, 6 do
			eq.spawn2(200254, 0, 0, x+math.random(-5, 5), y+math.random(-5, 5), z + 3, 0);
		end
		
		eq.depop_with_timer();
	end
end
