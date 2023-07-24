function event_combat(e)
	e.self:Emote("around you erupt with activity!");
	
	local typeid = 207300; -- A_parylyx_hookcaster
	if ( math.random(10) == 1 ) then
		typeid = 207320; -- A_parylyx_widow
	end
	eq.spawn2(typeid, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); 
	eq.depop_with_timer();
end
