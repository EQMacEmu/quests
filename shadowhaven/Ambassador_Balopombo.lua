function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, do you mean to pay a visit to the Stout Quarter? If so, be warned that this town hall is always monitored and guarded heavily.");
	end
end
