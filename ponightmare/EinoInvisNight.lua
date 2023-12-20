local EINO_TYPE = 204467; -- Aid_Eino

function event_spawn(e)
	eq.debug("EinoInvisNight spawn", 2);
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
	eq.enable_proximity_say();

	eq.set_timer("timecheck", 10000);
end

function event_timer(e)

	if ( e.timer == "timecheck" ) then
		local zoneTime = eq.get_zone_time()["zone_hour"];
		if ( zoneTime > 6 and zoneTime < 20 ) then
			eq.depop_with_timer();
			eq.debug("EinoInvisNight despawn", 2);
		end
	end
end

function event_proximity_say(e)
	
	if ( e.message:findi("Quellious be my guide") ) then
		eq.unique_spawn(EINO_TYPE, 8, 0, 1686, -527, 217.194, 37);
		eq.depop_with_timer();
	end
end    
