function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Just because the Dain ordered us to let you offlanders into our city does not mean I have to speak with ye. Now move along.");
	end
end
