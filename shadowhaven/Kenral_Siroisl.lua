function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". If you are one that calls upon the elements, then you might find these spell scrolls useful.");
	end
end
