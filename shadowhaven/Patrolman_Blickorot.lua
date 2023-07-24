function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to House Stout " .. e.other:GetCleanName() .. "!");
	end
end
