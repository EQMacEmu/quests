function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Move along stranger, I have no time to chatter with you.");
	end
end
