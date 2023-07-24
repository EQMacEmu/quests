function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.spawn2(172183,2,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end