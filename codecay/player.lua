function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 7 ) then
	
		local qglobals = eq.get_qglobals(e.self);
		if ( qglobals.bertox_key ) then
		
			e.self:MovePC(200, 0, -16, -290, 128*2);
			
			if ( e.self:GetPet().valid ) then
				if ( e.self:GetPet():Charmed() ) then
					e.self:GetPet():BuffFadeByEffect(22); -- charm
				else
					e.self:GetPet():GMMove(0, -16, -290, 0);
				end
			end
			eq.get_entity_list():RemoveFromHateLists(e.self);

		end
	end
end
