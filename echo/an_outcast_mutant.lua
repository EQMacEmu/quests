function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?  I've had enough of your kind.  If you won't help me at least let me die in peace.");
	end
end
