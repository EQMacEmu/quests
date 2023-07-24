function event_enter_zone(e)
	if ( e.self:GetY() < -500 and e.self:GetY() > -1000 and e.self:GetX() < -150 and e.self:GetX() > -500 ) then
		-- move player out of trial areas if they log in from camping there
		e.self:MovePC(206, 270, 518, -48, 90*2);
	end
end

function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 7 ) then
		local qglobals = eq.get_qglobals(e.self);
		if ( qglobals.poi_door ) then
			e.door:ForceOpen(e.self);
		end
		
	elseif ( id == 145 ) then
		local qglobals = eq.get_qglobals(e.self);
		if ( qglobals.zebuxoruk == "2" and e.self:HasItem(29165) ) then
			eq.set_global("time", "1", 5, "F");
			e.self:SetZoneFlag(219);
			e.self:SetZoneFlag(223);
			e.self:Message(15, "You have received a character flag!");
			e.self:Message(257, "The ages begin to tear through your body.  You wake to find yourself in another time.");
			e.self:MovePC(219, 223, 140, 11, 94);
		end
	end
end
