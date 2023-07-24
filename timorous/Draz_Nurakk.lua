function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_death_complete(e)
	eq.spawn2(96010,0,0,1985,-9170,10,0);
	eq.spawn2(96010,0,0,1986,-9204,10,0);
	eq.spawn2(96010,0,0,1958,-9204,10,0);
	eq.spawn2(96010,0,0,1975,-9218,10,0);
	eq.spawn2(96010,0,0,2009,-9214,11,0);
	eq.spawn2(96010,0,0,2004,-9181,10,0);
end
