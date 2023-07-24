function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Keep an eye out on all fronts if you plan on venturing into the woods.  The Kromdul are said to have an outpost built there.");
	end
end