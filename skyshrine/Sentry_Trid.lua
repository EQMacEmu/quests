function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can you not see we have our duties to perform, begone.");
	end
end
