function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Move along.");
	end
end
