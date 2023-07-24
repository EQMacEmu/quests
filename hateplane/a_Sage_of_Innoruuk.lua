function event_signal(event)

	if ( event.signal == 1 ) then
	
		entityList = eq.get_entity_list();
		local evangelist = entityList:GetNPCByNPCTypeID(76026);		-- an_Evangelist_of_Hate
		
		if ( evangelist:CalculateDistance(event.self:GetX(), event.self:GetY(), event.self:GetZ()) < 60 ) then
			event.self:Shout("All praise Innoruuk, our lord and creator!");
		end
	end
end
