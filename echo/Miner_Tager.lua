function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("grumbles something incoherent while he continues to dig.");
	end
end
