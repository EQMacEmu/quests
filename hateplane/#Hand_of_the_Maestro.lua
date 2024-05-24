function event_death_complete(event)
	-- spawn a Very Unpleasant Hand
	if(is_the_scars_of_velious_enabled()) then
		eq.spawn2(76388, 0, 0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
	end
end