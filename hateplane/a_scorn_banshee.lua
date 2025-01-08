function event_death_complete(event)
	-- 5% chance to spawn a thought destroyer on scorn banshee death if kunark is active
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if ( math.random() < 0.05 ) then
			eq.spawn2(76387, 0, 0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
		end
	end
end
