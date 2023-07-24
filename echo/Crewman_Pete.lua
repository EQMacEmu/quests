function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Sorry, but I don't really have time ta chitchat right now. We're way behind schedule what with the underbulks breakin' through the main shaft 'n all.");
	end
end
