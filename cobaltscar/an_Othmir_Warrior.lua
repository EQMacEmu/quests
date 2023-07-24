function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, strange one! I am on watch duty so I'm afraid I have not the time to converse. Perhaps when my shift is over we can exchange words over a bowl of spicy clam chowder.");
	end
end