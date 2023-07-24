function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Tabart. I help Junun here secure supplies for the store. You will see me out and about every once in a while asking adventurers for this or that. Check back now and then, I may have something new to sell.");
	end
end
