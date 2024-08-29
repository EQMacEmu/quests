function event_death_complete(event)
	if(eq.is_current_expansion_the_ruins_of_kunark()) then
		eq.spawn2(76382,0,0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
	end
end

	-- spawn Hand of the Maestro only during kunark