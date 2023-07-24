function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I would be careful wandering the maze. Many have gotten lost and never come out the other end.");
	end
end
