function event_spawn(e)
	eq.set_timer("depop",150000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.unique_spawn(105021,0,0,-5,-670,8,64); -- NPC: Venril_Sathir
		eq.unique_spawn(105004,0,0,5,-670,8,192); -- NPC: Rile_Sathir
		eq.depop();
	end
end
