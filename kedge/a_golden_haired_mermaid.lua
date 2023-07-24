function event_spawn(e)
	eq.set_timer("depop",900000);
end

function event_timer(e)
	eq.depop_with_timer();
end