function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id == 4 ) then
	
		local qglobals = eq.get_qglobals(e.self);
		local karana = tonumber(qglobals.karana or 0);
		local mavuin = tonumber(qglobals.mavuin or 0);

		if ( karana >= 3 or qglobals.zebuxoruk ) then
			return;
		end
		
		if ( karana < 2 or mavuin < 3 ) then
			e.self:Message(13, "The shrine calls forth unto your soul in search of a mystic symbol but finds none, you may not pass forth unto this planar location.");
		else
			eq.set_global("karana", "3", 5, "F");
			e.self:Message(15, "An aura of soft light gleams around you as the shrine reacts to your Talisman of Thunderous Foyer and sends you forth into the mighty Bastion of Thunder.");
			e.self:Message(15, "You have received a character flag!");			

			if ( e.self:HasZoneFlag(209) == false ) then
				e.self:SetZoneFlag(209);
			end
		end

	end
end
