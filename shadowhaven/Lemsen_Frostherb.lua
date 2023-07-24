function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there, " .. e.other:GetCleanName() .. ". If you are in need of any Alchemy supplies, please have a look at my goods.");
	end
end
