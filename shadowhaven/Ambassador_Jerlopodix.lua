function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to see you, " .. e.other:GetCleanName() .. ".  I'm new to the council so I must listen very closely. Lardalon is a great teacher and leader, I only hope I can make him proud.");
	end
end
