function event_death_complete(e)
	if(math.random(100) < 3) then
		eq.spawn2(176100,77,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end
