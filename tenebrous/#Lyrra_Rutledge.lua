function event_spawn(e)
	eq.set_timer("sit",1000);
end

function event_timer(e)
	e.self:SetAppearance(1);
	eq.stop_timer("sit");
end
