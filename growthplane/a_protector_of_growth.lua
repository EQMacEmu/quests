function event_spawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(127005) == false) then
		eq.set_timer("chance",1000);
	end
end

function event_timer(e)
	if(e.timer == "chance") then
		eq.stop_timer("chance");
		if(math.random(2) == 1) then
			eq.spawn2(127005,0,0,-1006,-196,45,0); -- NPC: #a_protector_of_growth
		end
	end
end
