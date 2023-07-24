function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Don't look at me. I'm as lost as you look.");
	end
end
