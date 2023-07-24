function event_death_complete(e)
	eq.unique_spawn(174036,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
end
