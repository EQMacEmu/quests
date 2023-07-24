function event_signal(e)
	if(e.signal == 1) then
		eq.set_timer("depop",120000);
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end