function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop(157069);
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		eq.get_entity_list():GetMobByNpcTypeID(157069):AddToHateList(e.other,1);
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_death(e)
	eq.signal(157069,1);
end