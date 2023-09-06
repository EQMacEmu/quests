function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:Race() .. ", I do not have time to speak to you today.  I'm sorry.");
	end
end
