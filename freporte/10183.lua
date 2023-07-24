function event_waypoint_arrive(e)
	if(e.wp == 3) then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45);
	elseif(e.wp == 4) then
		eq.clear_proximity();
	end
end
 
function event_enter(e)
	e.self:Emote("'s spirit moves you to another land ...");
	eq.SelfCast(2279);
end
