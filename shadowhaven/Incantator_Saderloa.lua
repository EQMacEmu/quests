function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's an honor to meet you, " .. e.other:GetCleanName() .. ". If your powers lie within the practice of the arcane arts then you will surely find sanctuary in our Quarter.");
	end
end
