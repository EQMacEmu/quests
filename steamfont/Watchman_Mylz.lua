function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! You may rest inside one of the windmills. I will be on guard. No need for you to worry.");
	end
end
