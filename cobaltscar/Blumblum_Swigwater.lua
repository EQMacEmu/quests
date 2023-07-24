function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am very busy.  Thank you for taking the time to speak to me, stranger, but I have no time for talk right now.  I'm afraid that your business cannot be urgent enough.");
	end
end