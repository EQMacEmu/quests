-- Templar Franchus

function event_spawn(e)
	eq.set_timer("command", 480000); -- Make him say speech every 8 mins
end

function event_timer(e)
	e.self:Say("Ok lads, remember what I taught you now. Thrust, block, slash...");
end
