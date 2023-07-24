function event_spawn(e)
	eq.set_timer("fishing",math.random(90000,150000));
end

function event_timer(e)
	if(e.timer == "fishing") then
		eq.stop_timer("fishing");
		e.self:Say("growls and barks a little as it hooks and pulls up a fish.");
		eq.set_timer("fishing",math.random(90000,150000));
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You make too much noise furless one.  Quiet or all fish go away.  Maybe even vengeful ocean spirit come because you anger all his sea spirits.");
	end
end