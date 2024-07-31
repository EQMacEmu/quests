local waypointid = 0;
local waypointid2 = 0;

function event_spawn(e)
	if(e.self:GetGrid() == 105) then
		waypointid = math.random(33);
		waypointid2 = math.random(33);
	end
end

function event_waypoint_depart(e)
	if(e.self:GetGrid() == 105 and (e.wp == waypointid or e.wp == waypointid2)) then
		eq.stop();
		eq.start(193);
	elseif(e.self:GetGrid() == 193 and e.wp == 64) then
		waypointid = math.random(33);
		waypointid2 = math.random(33);
		eq.stop();
		eq.start(105);
	elseif(e.self:GetGrid() == 112 and e.wp == 1) then
		local passtogrid = math.random(3);
		if(passtogrid == 1) then
			eq.stop();
			eq.start(194);
		end
	elseif(e.self:GetGrid() == 194 and e.wp == 1) then
		local passtogrid = math.random(2);
		if(passtogrid == 1) then
			eq.stop();
			eq.start(112);
		end
	end
end