function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, fellow citizen! Welcome to the Office of the People. What can I do for you?");
	end
end