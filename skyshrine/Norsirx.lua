function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler. I do not receive many visitors to my quarters here, besides the occasional unfortunate treasure seeker that often will make for a good snack.");
	end
end
