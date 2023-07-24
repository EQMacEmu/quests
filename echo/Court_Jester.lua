function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Above or Below?  Does it truly matter?  We rule all either way.");
	end
end
