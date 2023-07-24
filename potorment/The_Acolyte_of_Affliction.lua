function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("adds", 50000);
	else
		eq.stop_timer("adds");
	end
end

function event_timer(e)

	if ( e.timer == "adds" ) then
	
		local x = math.random(5, 10);
		for i = 1, x do
			eq.spawn2(207295, 0, 0, math.random(-32, 32), math.random(-175, -153), 194, 0); -- A_construct_seedling 
		end
	end
end

function event_death_complete(e)
	eq.depop_all(207295); -- A_construct_seedling
end
