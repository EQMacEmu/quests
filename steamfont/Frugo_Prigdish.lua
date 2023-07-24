function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I hope the walk out to the windmills was not too dangerous. You must be careful not to be snatched up by the slavers around these parts.");
	end
end
