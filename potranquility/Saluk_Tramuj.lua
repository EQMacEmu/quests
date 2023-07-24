function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Excuse me. I am trying to finish my meal.");
	end
end
