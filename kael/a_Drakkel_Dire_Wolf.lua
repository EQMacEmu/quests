function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs at you hungrily.");
	end
end
