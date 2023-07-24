function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	eq.depop();
end
