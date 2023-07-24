function event_death_complete(e)
	local npc = eq.spawn2(163389, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end
