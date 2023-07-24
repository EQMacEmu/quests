function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I keep spells for those that deal in only the most powerful magics of teleportation and translocation.");
	end
end
