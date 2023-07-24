function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have no time to talk right now. I must keep watch for hostiles.");
	end
end
