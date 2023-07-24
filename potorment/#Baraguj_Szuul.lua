function event_spawn(e)
	eq.set_timer("depop", 43200000);
end

function event_timer(e)
	eq.depop();
end
