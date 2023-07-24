function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local adUp = eq.get_entity_list():IsMobSpawnedByNpcTypeID(208074); -- #Aerin`Dar

	-- HoH zone-in
	if ( door_id == 3 ) then
	
		local qglobals = eq.get_qglobals(e.self);

		if ( qglobals.aerindar and qglobals.aerindar == "2" ) then
			return;
		end
		
		if ( not qglobals.aerindar ) then
			e.self:Message(13, "You lack the will to pass through this portal safely.");
		else
			eq.set_global("aerindar", "2", 5, "F");
			e.self:Message(15, "You have received a character flag!");
			
			if ( qglobals.cl_aerindar ) then
				eq.delete_global("cl_aerindar");
			end

			if ( e.self:HasZoneFlag(211) == false ) then
				e.self:SetZoneFlag(211);
			end
		end
		
	-- dragon orb teleporter
	elseif ( door_id == 6 and adUp ) then
	
		e.self:MovePC(208, 352, 2172, 33, 0);
		if ( e.self:GetPet().valid and not e.self:GetPet():Charmed() ) then
			e.self:GetPet():GMMove(352, 2172, 33, 0);
		end
		
	-- switches to open the glass door
	elseif ( door_id == 8 or door_id == 9 ) then
		
		if ( e.self:GetItemIDAt(0) == 25596 ) then -- A Crystalline Globe in cursor
			local door = eq.get_entity_list():GetDoorsByDoorID(2);
			door:ForceOpen(e.self);
			e.door:ForceOpen(e.self);
		end
		
	-- Aerin`Dar's round floor door
	elseif ( door_id == 11 and not adUp ) then
		e.door:ForceOpen(e.self);			
	end
end
