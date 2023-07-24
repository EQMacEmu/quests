local DOOR1_IDS = { 369453, 369454, 369455, 369456, 369469, 369470, 369474, 369475, 369476, 369479, 
					369458, 369459, 369480, 369481, 369468, 369471, 369472, 369473,	369464, 369465, 
					369477, 369478, 369457, 369460, 369461, 369462, 369463, 369466, 369467 };
					
local DOOR2_IDS = { 369426, 369427, 369451, 369452, 369430, 369433, 369429, 369431, 369436, 369450, 
					369428, 369432, 369434, 369438, 369439, 369440, 369441, 369446, 369447, 369448, 
					369449, 369442, 369443, 369444, 369445 };

function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id == 2 or door_id == 3 ) then
	
		local elist = eq.get_entity_list();
		
		for _, id in ipairs(DOOR1_IDS) do
			if ( elist:GetSpawnByID(id):GetNPC().valid ) then
				if ( not e.self:GetGM() ) then
					e.self:Message(0, "As you attempt to move the wall of stone it is clear that it is being held in place by a powerful force.");
					return;
				end
			end
		end
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(3):ForceOpen(e.self);
	
	elseif ( door_id == 4 or door_id == 5 ) then
	
		local elist = eq.get_entity_list();
		local shut = false;
		
		for _, id in ipairs(DOOR2_IDS) do
			if ( elist:GetSpawnByID(id):GetNPC().valid ) then
				shut = true;
				break;
			end
		end
		
		if ( not shut and (elist:IsMobSpawnedByNpcTypeID(222035) or elist:IsMobSpawnedByNpcTypeID(222036) or 
			elist:IsMobSpawnedByNpcTypeID(222037) or elist:IsMobSpawnedByNpcTypeID(222038))
		) then
			shut = true;		
		end
	
		if ( shut ) then
			e.self:Message(0, "The massive wall of rock, dirt and stone seems to be impenetrable.  It is obviously held in place by a magical force.");
			if ( not e.self:GetGM() ) then
				return;
			end
		end
		eq.get_entity_list():GetDoorsByDoorID(4):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(5):ForceOpen(e.self);
	end
end