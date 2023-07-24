function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Did you hear?  Underbulks came swarming through the walls while some dwarves were digging down there.  I don't think they all made it out.");
	end
end
