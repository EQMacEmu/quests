function event_signal(e)

	if ( e.signal == 1 ) then
	
		e.self:SetAppearance(3);
		eq.set_timer("depop", 3600000);

	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end
