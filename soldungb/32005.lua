function event_signal(e)
	if(e.signal == 1) then
		eq.set_timer("Zordak", math.random(1000,86400000)) -- 1 seconds to 24 hours.
	end
end

function event_timer(e)
	if(e.timer == "Zordak") then
		eq.unique_spawn(32003, 0, 0, -825, -1448, 89, 0);
		eq.stop_timer("Zordak");
	end
end