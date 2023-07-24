function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Listen, I do not have time to chat right now.  I am a very busy man.");
	end
end
