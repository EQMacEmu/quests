function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:Race() .. ".  It may be wise to speak with Herald Ziglark before traveling further into the shrine.");
	end
end
