local POTIMEB_CONTROLLER_TYPE = 223077;
local GOD_TYPES = {
	[16] = 223000, -- Vallon
	[17] = 223001, -- Tallon
	[18] = 223007, -- Innoruuk
	[19] = 223004, -- Cazic Thule
	[20] = 223006, -- Rallos Zek
	[21] = 223005, -- Bertoxxulous
	[22] = 223002, -- Terris Thule
	[23] = 223003, -- Saryrn
};
local TELEPORT_LOCS = {
	[17] = { 214, -210, 10, -35, 0 },		-- potactics
	[18] = { 76, 0, 0, 4, 0 },				-- hateplane
	[19] = { 72, 1029, -773, 108, 0 },		-- fearplane
	[20] = { 214, -210, 10, -35, 0 },		-- potactics
	[21] = { 205, -1750, -1245, -59, 0 },	-- podisease
	[22] = { 204, 1668, 282, 212, 0 },		-- ponightmare
	[23] = { 207, -341, 1706, -491, 0 },	-- potorment
};

function event_enter_zone(e)
	if ( not e.self:GetGM() ) then
		if ( e.self:GetX() < 500 or e.self:GetY() > 500 ) then
			-- client not in graveyard
			eq.signal(POTIMEB_CONTROLLER_TYPE, 8, 0, tostring(e.self:GetID()));
		end
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	
	-- god portals
	if ( door_id >= 17 and door_id <= 23 ) then
	
		if ( GOD_TYPES[door_id] ) then
			local elist = eq.get_entity_list();
			
			if ( door_id == 17 ) then
				if ( not elist:IsMobSpawnedByNpcTypeID(GOD_TYPES[17]) and not elist:IsMobSpawnedByNpcTypeID(GOD_TYPES[16]) ) then
					e.self:MovePC(unpack(TELEPORT_LOCS[door_id]));
					return;
				end
			else
				if ( not elist:IsMobSpawnedByNpcTypeID(GOD_TYPES[door_id]) ) then
					e.self:MovePC(unpack(TELEPORT_LOCS[door_id]));
					return;
				end
			end
			e.self:Message(0, "Faint energy swirls slowly through the portal, but nothing happens.");
		end

	-- clock doors and dials
	elseif ( door_id < 52 or door_id == 62 ) then
		eq.signal(POTIMEB_CONTROLLER_TYPE, 4, 0, door_id..";"..e.self:CharacterID());
	end	
end

function event_say(e)
	if ( e.self:GetGM() ) then
		if ( e.message == "shutdown instance now" ) then
			eq.signal(POTIMEB_CONTROLLER_TYPE, 9, 0, "1");
		
		elseif ( e.message == "shutdown instance" ) then
			eq.signal(POTIMEB_CONTROLLER_TYPE, 9, 0, "2");
		
		elseif ( e.message:find("set raid id to %d+") ) then
			local _, _, id = e.message:find("set raid id to (%d+)")
			if ( id ) then
				eq.signal(POTIMEB_CONTROLLER_TYPE, 9, 0, "3;"..id);
			end
			
		elseif ( e.message == "skip phase 1" ) then
			eq.signal(POTIMEB_CONTROLLER_TYPE, 9, 0, "4");
			
		elseif ( e.message == "zone status" ) then
			eq.signal(POTIMEB_CONTROLLER_TYPE, 9, 0, "5");
		end
	end
end
