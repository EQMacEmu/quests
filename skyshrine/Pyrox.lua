function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler. I'm the keeper of possessions for the Skyshrine. Any friend of the shrine can safely store their belongings with me.");
	end
end
