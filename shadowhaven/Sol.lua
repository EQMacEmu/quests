function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("takes a huge swig of his ale and burps right in your face.");
	end
end
