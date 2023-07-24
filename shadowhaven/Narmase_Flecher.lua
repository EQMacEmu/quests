function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there. I have the supplies you will need if you are an aspiring Bowyer. Have a look.");
	end
end
