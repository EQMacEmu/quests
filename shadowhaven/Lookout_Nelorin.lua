function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetCleanName() .. "! It's nice to see that you are here in our quarter. You are safe here, so there is no need to worry.");
	end
end
