function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("King Tormax must be stopped, no matter what the cost.");
	end
end
