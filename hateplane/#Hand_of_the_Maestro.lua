function event_death_complete(event)
	-- spawn a Very Unpleasant Hand
	eq.spawn2(76388, 0, 0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
end
