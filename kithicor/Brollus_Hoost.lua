function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend.");
	end
end