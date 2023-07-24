function event_spawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(160097)) then
		eq.set_timer("depop_servant", 10000);
	end
end

function event_combat(e)
	e.self:Emote("locks behind you.. You get the feeling you are not alone.");
	eq.set_timer("servant",5000);
end

function event_timer(e)
	if(e.timer == "servant") then
		eq.stop_timer("servant");
		eq.stop_timer("depop_servant");
		eq.unique_spawn(160097, 0, 0, -719, 288, 35, 0);
		eq.depop_with_timer();
	elseif(e.timer == "depop_servant") then
		eq.stop_timer("depop_servant");
		eq.depop(160097);
	end
end
