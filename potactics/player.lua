function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id >= 14 and id <= 17 ) then	-- top floor doors to RZ room
		
		local elist = eq.get_entity_list();
		if ( e.self:GetGM()
			or elist:IsMobSpawnedByNpcTypeID(214311)	-- Rallos_Zek
			or elist:IsMobSpawnedByNpcTypeID(214312)	-- Rallos_Zek_the_Warlord
			or elist:IsMobSpawnedByNpcTypeID(214313)	-- script Tallon Zek
			or elist:IsMobSpawnedByNpcTypeID(214320)	-- script Vallon Zek
		) then
			e.door:ForceOpen(e.self);
		end
		
	elseif ( id == 2 or id == 3 ) then	-- Vallon doors
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214316)
			and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214317)
		) then
		
			e.self:MovePC(214, 279, 182, 5, 128*2);
			if ( e.self:GetPet().valid and not e.self:GetPet():Charmed() ) then
				e.self:GetPet():GMMove(279, 182, 5, 128*2);
			end
		else
			e.self:Message(0, "The doors are held shut by magical forces.");
		end
	
	elseif ( id == 4 or id == 5 ) then	-- Tallon doors
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214026) ) then
		
			e.self:MovePC(214, 279, 182, 5, 128*2);
			if ( e.self:GetPet().valid and not e.self:GetPet():Charmed() ) then
				e.self:GetPet():GMMove(279, 182, 5, 128*2);
			end
		else
			e.self:Message(0, "The doors are held shut by magical forces.");
		end
	
	elseif ( id == 24 ) then	-- pit teleporter
		
		local rz = eq.get_entity_list():GetMobByNpcTypeID(214312);	-- Rallos_Zek_the_Warlord
		if ( rz and rz.valid and rz:IsEngaged() ) then
			e.self:MovePC(214, rz:GetX(), rz:GetY(), rz:GetZ(), rz:GetHeading());
			return;
		end

		e.self:MovePC(203, -4, -191, -628, 149);	-- potranquility
		
	elseif ( id == 25 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214053) ) then	-- Glykus_Helmir teleporter
		e.self:MovePC(203, -4, -191, -628, 149);	-- potranquility
		
	elseif ( id == 26 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214054) ) then	-- Tagrin_Maldric teleporter
		e.self:MovePC(203, -4, -191, -628, 149);	-- potranquility
	end
end