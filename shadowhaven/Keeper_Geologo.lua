function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi dere, " .. e.other:GetCleanName() .. ".  Got some bankin' business ya need to conduct eh? Well step right up!");
	end
end
