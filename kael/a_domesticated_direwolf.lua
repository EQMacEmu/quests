function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs at you and wags its tail.");
	end
end
