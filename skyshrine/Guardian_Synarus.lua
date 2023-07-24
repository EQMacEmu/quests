function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("scowls at you and goes back to watching the door.");
	end
end
