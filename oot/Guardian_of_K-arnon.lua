function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Harm the oracle and die.  I have nothing else to say.");
	end
end