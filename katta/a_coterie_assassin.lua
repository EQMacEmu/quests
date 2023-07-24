function event_combat(e)
	if(e.joined) then
		if(math.random(100) < 25) then
			eq.spawn2(160230,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		end
		eq.depop_with_timer();
	end
end
