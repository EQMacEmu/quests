function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings offlander. I see you are exploring our beloved Keep. By order of the Dain all offlanders that have been friendly to our people are permitted to explore all parts of Icewell Keep save this door I guard. Enjoy your stay.");
	elseif(e.message:findi("door")) then
		e.self:Say("Why this door behind me which I stand in front of course. You didn't by chance fall on the ice and hit your head I hope good " .. e.other:Race() .. ". By order of the Dain, none are permitted to see or go beyond this entrance.");
	elseif(e.message:findi("beyond")) then
		e.self:Say("Why beyond this door lies the most wonderous. . . oh wait, I can't tell you that " .. e.other:Race() .. ". All I can tell you is that the door has also been magically sealed by our Grand Historian. Please move along now and enjoy the rest of the Keep.");
	end
end
