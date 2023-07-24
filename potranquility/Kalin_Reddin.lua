function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks more interested in finishing his dinner than talking to you.");
	end
end
