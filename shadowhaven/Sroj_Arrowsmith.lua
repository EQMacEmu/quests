function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to you as well, friend. I have many arrow supplies in stock currently. Please let me know how I can be of assistance.");
	end
end
