function event_spawn(event)
	eq.set_timer("depop", 1200000);
end

function event_timer(event)

	if ( event.self:IsEngaged() ) then
		eq.set_timer("depop", 10000);				-- don't depop if aggro
	else
		eq.depop();
		eq.stop_timer("depop");
	end
end
