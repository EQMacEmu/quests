function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("does not respond to your greeting.");
	end
end
