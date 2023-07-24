function event_death_complete(e)
	local which = math.random(3);
	
	if  (which == 1) then
		eq.spawn2(80005, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
	elseif (which == 2) then
		eq.spawn2(80005, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(80005, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
	end
end
