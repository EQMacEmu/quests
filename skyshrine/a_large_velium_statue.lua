function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("there is no response from this huge statue.");
	end
end
