function event_spawn(e)
	eq.set_timer("zonereset",7200000);
end

function event_timer(e)
	eq.stop_timer("zonereset");
	eq.repop_zone();
end
