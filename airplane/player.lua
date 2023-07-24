function event_zone(e)
	local airplanekey ={20915,20914,20913,20917,20911,20912,20916,20918,20919};
	
	for i = 1, 9 do
		if(e.self:HasItem(airplanekey[i])) then
			e.self:NukeItem(airplanekey[i]);
		end
	end
end
