function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("We've been posted here to make sure the giants do not invade from the cobalt scar.");
	end
end
