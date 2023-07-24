function event_zone(e)
	if ( e.zone_id == 200 and e.self:HasZoneFlag(200) == false and eq.get_qglobals(e.self).grummus ) then
		e.self:SetZoneFlag(200);
	end
end
