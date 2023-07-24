function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'd watch out for the cubes. They've been getting hostile lately.");
	end
end
