function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's an honor to meet you, " .. e.other:GetCleanName() .. ".  I welcome you to our sacred quarter.");
	end
end
