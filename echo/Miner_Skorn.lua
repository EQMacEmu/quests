function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up from his digging, 'Eh, quitin' time yet?");
	end
end
