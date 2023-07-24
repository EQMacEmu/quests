function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to House Midst " .. e.other:GetCleanName() .. ". Make sure you see all of the magnificent architecture that our quarter has to offer.");
	end
end
