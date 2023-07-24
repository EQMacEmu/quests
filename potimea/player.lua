local POTIMEA_CONTROLLER_TYPE = 219053;
local POTIMEB_CONTROLLER_TYPE = 223077;
local DIALS = { 2, 4, 1, 5, 3 };

local blocks = {};

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	
	if ( door_id >= 8 and door_id <= 12 ) then

		-- prevent spam clicks from sending multiple signals
		local now = os.time();
		local charID = e.self:CharacterID();
		if ( blocks[charID] and blocks[charID] > now ) then
			return;
		end

		local raid = e.self:GetRaid();
		
		if ( not e.self:GetGM() and e.self:GetLevel() < 65 ) then
			e.self:Message(13, "You lack the will to pass through this portal safely.");
			return;
		end
		if ( not e.self:GetGM() and (not raid.valid or raid:RaidCount() < 7) ) then
			e.self:Message(0, "You don't have sufficient power to affect things in the Plane of Time. Gather your forces to increase your strength.");
			return;
		end

		local qglobals = eq.get_qglobals(e.self);
		local instanceID = 0;
		if ( qglobals.time_instance ) then
			instanceID = tonumber(qglobals.time_instance) or 0;
		end
		
		door_id = door_id - 7;
		
		eq.signal(POTIMEA_CONTROLLER_TYPE, 3, 0, charID..";"..DIALS[door_id]..";"..raid:GetID()..";"..instanceID);
		
		blocks[charID] = now + 2;
	end
end
