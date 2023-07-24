function event_spawn(e)
	eq.set_timer("pick_up", 100000);
end

function event_timer(e)
	if ( e.timer == "pick_up" and e.self:CheckGround() ) then
		e.self:Emote("picks up something from the ground.");
		eq.set_timer("pick_up", math.random(3, 150)*1000);
	end
end
