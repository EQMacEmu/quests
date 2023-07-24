function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. If you are an upcoming alchemist perhaps you could make use of some of my fine herbs.");
	end
end
