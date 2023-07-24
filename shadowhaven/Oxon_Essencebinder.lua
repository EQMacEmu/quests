function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, stranger. If you're in need of any given pottery sketch then you came to the right place.");
	end
end
