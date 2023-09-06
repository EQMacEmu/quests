function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can you not see I'm trying to teach my pet to sit.  Now go away before you distract it further!");
	end
end
