function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("chuckles and goes back to studying.");
	end
end
