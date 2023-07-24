function event_death_complete(e)
	eq.spawn2(119035,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(119035,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
