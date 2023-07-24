function event_death_complete(e)
  -- spawn 3 young sharks for Barnacle Breastplate quest combine
	eq.spawn2(24121,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(24121,0,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(24121,0,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
end
