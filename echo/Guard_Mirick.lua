function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Proceed on back to King Gromklin's throne room.  But mind your manners or I'll have to teach you a lesson.");
	end
end
