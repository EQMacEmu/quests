function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware the cubes.  They have gotten a very hostile since the new arrivals.");
	end
end
