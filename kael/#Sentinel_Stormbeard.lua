function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("silenty watches you.");
	end
end
