function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Warsliks Woods is a place best left to the goblins and giants.  We have not been able to assault them both in this terrain.");
	end
end