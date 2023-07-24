function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ", how about you get lost!");
	end
end
