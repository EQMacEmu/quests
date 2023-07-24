function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Iceshard Manor, home of the Iceshard brothers, Klaggen and Vorken.");
	end
end
