function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances towards you, looking you up and down then continues about their duty. It is apparent to you that this guard does not wish to speak with you.");
	end
end
