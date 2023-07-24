function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("groans, 'I'm sorry, but I can't talk right now. I'm not feeling too well.");
	end
end
