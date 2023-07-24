function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me be. I'm trying to get some rest.");
	end
end
