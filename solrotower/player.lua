function event_click_door(e)
	local door_id = e.door:GetDoorID();

	if ( door_id == 44 or door_id == 45 ) then
	
		local qglobals = eq.get_qglobals(e.self);
		local pass = true;
		
		if ( not qglobals.sol_room or qglobals.sol_room ~= "11111" ) then
			e.self:Message(0, "The lava runes scorch your skin as you run your hand across them.");
			pass = false;
		elseif ( not qglobals.zeks or qglobals.zeks ~= "7" ) then
			e.self:Message(0, "The runes of lava begin to radiate, the knowledge of passing through slips through your mind but is lost.  The lack of experience and a warring spirit prevents your passage.");
			pass = false;
		end
		
		if ( not pass ) then
			e.self:Message(13, "You lack the will to pass through this portal safely.");
			return;
		end
		
		e.self:MovePC(212, 0, -847, 244, 128);
		if ( e.self:GetPet().valid and not e.self:GetPet():Charmed() ) then
			e.self:GetPet():GMMove(0, -847, 244, 128);
		end

	elseif ( door_id == 6 ) then -- Rizlona
	
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212413) ) then
			local qglobals = eq.get_qglobals(e.self);
			local newGlobal = qglobals.sol_room or "00000";
			newGlobal = newGlobal:sub(1, 3).."1"..newGlobal:sub(5, 5);
			eq.set_global("sol_room", newGlobal, 5, "F");
			e.self:Message(0, "As you place your hand on the burning cauldron, you feel relaxed as a short tune slips into your thoughts.");
			e.self:Message(15, "You have received a character flag!");
		else
			e.self:Message(0, "You become disoriented as you pass through the portal of flames.");
		end
		
	elseif ( door_id == 7 ) then -- Arlyxir
	
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212411) ) then
			local qglobals = eq.get_qglobals(e.self);
			local newGlobal = qglobals.sol_room or "00000";
			newGlobal = newGlobal:sub(1, 1).."1"..newGlobal:sub(3, 5);
			eq.set_global("sol_room", newGlobal, 5, "F");
			e.self:Message(0, "As you place your hand on the burning cauldron, you feel a wealth of knowledge enter your mind.");
			e.self:Message(15, "You have received a character flag!");
		else
			e.self:Message(0, "You become disoriented as you pass through the portal of flames.");
		end
	
	elseif ( door_id == 10 ) then -- Dresolik

		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212414) ) then
			local qglobals = eq.get_qglobals(e.self);
			local newGlobal = qglobals.sol_room or "00000";
			newGlobal = newGlobal:sub(1, 2).."1"..newGlobal:sub(4, 5);
			eq.set_global("sol_room", newGlobal, 5, "F");
			e.self:Message(0, "As you place your hand on the burning cauldron, you feel a bolt of energy surge through your arm.");
			e.self:Message(15, "You have received a character flag!");
		else
			e.self:Message(0, "You become disoriented as you pass through the portal of flames.");
		end

	elseif ( door_id == 11 ) then -- Jiva

		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212412) ) then
			local qglobals = eq.get_qglobals(e.self);
			local newGlobal = qglobals.sol_room or "00000";
			newGlobal = newGlobal:sub(1, 4).."1";
			eq.set_global("sol_room", newGlobal, 5, "F");
			e.self:Message(0, "As you place your hand on the burning cauldron, you feel your body fill with strength.");
			e.self:Message(15, "You have received a character flag!");
		else
			e.self:Message(0, "You become disoriented as you pass through the portal of flames.");
		end

	elseif ( door_id == 12 ) then -- Xuzl

		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212410) ) then
			local qglobals = eq.get_qglobals(e.self);
			local newGlobal = qglobals.sol_room or "00000";
			newGlobal = "1"..newGlobal:sub(2, 5);
			eq.set_global("sol_room", newGlobal, 5, "F");
			e.self:Message(0, "As you place your hand on the burning cauldron, you feel arcane wisdom pulsing in your mind.");
			e.self:Message(15, "You have received a character flag!");
		else
			e.self:Message(0, "You become disoriented as you pass through the portal of flames.");
		end

	elseif ( door_id == 38 or door_id == 39 ) then
		-- floor doors in Solusek's chamber
		
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(212420) or e.self:GetGM() ) then -- A_Planar_Projection
			eq.get_entity_list():GetDoorsByDoorID(38):ForceOpen(e.self);
			eq.get_entity_list():GetDoorsByDoorID(39):ForceOpen(e.self);
		end
	end
end

function event_zone(e)
	if ( e.zone_id == 217 and e.self:HasZoneFlag(217) == false and eq.get_qglobals(e.self).pofire and eq.get_qglobals(e.self).pofire == "2" ) then
		e.self:SetZoneFlag(217);
	end
end
