function MoveGroup(zone, client, dist, x, y, z, h)
	local group = client:GetGroup();
	local raid = client:GetRaid();

	if ( group and group:GroupCount() > 0 ) then
		for i = 0, 5 do
			local member = group:GetMember(i):CastToClient();

			if ( member.valid ) then
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid ) then
						if ( member:GetPet():Charmed() ) then
							member:GetPet():BuffFadeByEffect(22); -- charm
						else
							member:GetPet():GMMove(x, y, z, 0);
						end
					end
					eq.get_entity_list():RemoveFromHateLists(member);
				end
			end
		end
		
	elseif ( raid and raid.valid ) then
		local raidGroupID = raid:GetGroup(client:GetName());
		local member;
		for i = 0, 71 do
			member = raid:GetMember(i);
			
			if ( member and member.valid and raid:GetGroup(member:GetName()) == raidGroupID ) then
			
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid ) then
						if ( member:GetPet():Charmed() ) then
							member:GetPet():BuffFadeByEffect(22); -- charm
						else
							member:GetPet():GMMove(x, y, z, 0);
						end
					end
					eq.get_entity_list():RemoveFromHateLists(member);
				end
			end
		end		
	else
		client:MovePC(zone, x, y, z, h*2);
		
		if ( client:GetPet().valid ) then
			if ( client:GetPet():Charmed() ) then
				client:GetPet():BuffFadeByEffect(22); -- charm
			else
				client:GetPet():GMMove(x, y, z, 0);
			end
		end
		eq.get_entity_list():RemoveFromHateLists(client);
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id == 1 and e.self:GetItemIDAt(0) == 28638 ) then -- Wind Etched Key
		MoveGroup(215, e.self, 100, -617, 5, 1450, 64);
	end	
end
