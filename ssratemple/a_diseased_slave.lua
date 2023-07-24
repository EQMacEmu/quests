function event_spawn(e)
	eq.set_timer("cough",math.random(1800000,10800000));
end

function event_timer(e)
	if(e.timer == "cough") then
		e.self:Emote("coughs.");
		eq.set_timer("cough",math.random(1800000,10800000));
	end
end