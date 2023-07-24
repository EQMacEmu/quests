function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. Students progressing along a Shamanistic path will find some of my scrolls valuable.");
	end
end
