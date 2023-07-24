function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, my friend! I have many new exciting bags in stock, make sure you pick one up that is to your liking.");
	end
end
