function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Back to Cabilis with you!  You won't fare well in these parts.  If you are just a broodling, stay close to the gate so we can protect you.");
	end
end