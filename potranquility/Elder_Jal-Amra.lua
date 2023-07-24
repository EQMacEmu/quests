function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("greets you with a nod and quietly says. 'Welcome to our study. Please refrain from venturing in beyond this lobby. The elders are involved in maintaining a deep meditative state. They must not be disturbed. If an elder wishes to speak to you. one of their aids will fetch you.'");
	end
end
