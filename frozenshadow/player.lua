function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id == 2 or door_id == 166 ) then -- first floor
		if ( not e.self:KeyRingCheck(20033) and e.self:HasItem(20033) ) then
			e.self:KeyRingAdd(20033);
		end
		if( e.self:KeyRingCheck(20033) ) then
			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 660, 100, 40, 0);
		end
	elseif ( door_id == 4 or door_id == 167 ) then -- second floor
		if ( not e.self:KeyRingCheck(20034) and e.self:HasItem(20034) ) then
			e.self:KeyRingAdd(20034);
		end
		if( e.self:KeyRingCheck(20034) ) then
			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 670, 750, 75, 0);
		end
	elseif ( door_id == 16 or door_id == 165 ) then -- third floor
		if ( not e.self:KeyRingCheck(20035) and e.self:HasItem(20035) ) then
			e.self:KeyRingAdd(20035);
		end
		if ( e.self:KeyRingCheck(20035) )  then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 170, 755, 175, 0);
		end
	elseif ( door_id == 27 or door_id == 169 ) then -- forth floor
		if ( not e.self:KeyRingCheck(20036) and e.self:HasItem(20036) ) then
			e.self:KeyRingAdd(20036);
		end
		if( e.self:KeyRingCheck(20036)  ) then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -150, 160, 217, 0);
		end
	elseif ( door_id == 34 or door_id == 168 ) then -- fifth floor
		if ( not e.self:KeyRingCheck(20037) and e.self:HasItem(20037)  ) then
			e.self:KeyRingAdd(20037);
		end
		if( e.self:KeyRingCheck(20037) ) then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -320, 725, 12, 0);
		end
	elseif ( door_id == 154 ) then -- sixth floor
		if ( not e.self:KeyRingCheck(20038) and e.self:HasItem(20038)  ) then
			e.self:KeyRingAdd(20038);
		end
		if( e.self:KeyRingCheck(20038) ) then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 10, 65, 310, 0);
		end
	elseif ( door_id == 1 ) then -- seventh floor
		if ( not e.self:KeyRingCheck(20039) and e.self:HasItem(20039) ) then
			e.self:KeyRingAdd(20039);
		end
		if( e.self:KeyRingCheck(20039) ) then
 			MoveGroup(e.self:GetGroup(),e.self, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 20, 250, 355, 0);
		end
	end
end

function MoveGroup(frozen_group, player, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
	if ( frozen_group.valid ) then
		local frozen_count = frozen_group:GroupCount();

		for i = 0, frozen_count - 1, 1 do
			local client_v = frozen_group:GetMember(i):CastToClient();
		
			if (client_v.valid) then
				-- check the distance and port them up if close enough
				if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
					-- port the player up
					client_v:MovePC(111, tgt_x, tgt_y, tgt_z, tgt_h); -- Zone: erudsxing2
				end
			end
		end
	else
		player:MovePC(111, tgt_x, tgt_y, tgt_z, tgt_h); -- Zone: erudsxing2
	end
end
