function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Halt.  I wouldn't proceed any further " .. e.other:GetCleanName() .. ".  An underbulk swarm has broken through the cavern walls and it's not safe down there.");
	end
end
