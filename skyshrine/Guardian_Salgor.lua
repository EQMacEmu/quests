function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Perhaps when my shift is over we can talk.  But not now I am sorry.");
	end
end
