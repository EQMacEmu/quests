function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("makes a strange gurgling sound and nods at you.");
	end
end