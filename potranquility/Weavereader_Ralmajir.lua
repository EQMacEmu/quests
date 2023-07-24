function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You are welcome to observe. but please keep your voice down.  We need to maintain a peaceful atmosphere if we are to continue our reading.");
	end
end
