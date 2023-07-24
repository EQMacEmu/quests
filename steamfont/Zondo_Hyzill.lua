function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Glad to meet you. Our Cargo Clockwork is marvelous, no?");
	end
end
