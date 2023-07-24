local killTimes = {};

function event_signal(e)
	local now = os.time();
	local dayAgoTime = now - 86400;
	
	killTimes[e.signal] = now;

	for i = 1, 4 do
		if ( not killTimes[i] ) then
			if ( e.signal == 4 ) then
				eq.debug("No Arbitor spawn; Ring "..i.." not completed");
			end
			return;
		end
		if ( killTimes[i] < dayAgoTime ) then
			if ( e.signal == 4 ) then
				eq.debug("No Arbitor spawn; Ring "..i.." not completed within 24 hours");
			end
			return;
		end
	end
	
	eq.unique_spawn(218375, 0, 0, 1530, -2739, 28, 192); -- A_Mystical_Arbitor_of_Earth
	eq.debug("Arbitor spawned");
	for i = 1, 4 do
		killTimes[i] = nil;
	end
	eq.depop_with_timer();
end
