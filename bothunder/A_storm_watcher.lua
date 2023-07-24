function event_signal(e)
	local client = eq.get_entity_list():GetClientByID(e.signal);
	
	if ( client and client.valid ) then
		if ( e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < 150 ) then
			e.self:AddToHateList(client, 1);
		end
	end
end
