function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to see you " .. e.other:GetCleanName() .. "! If you are a smith perhaps you should check out what Hardam has to offer.");
	end
end
