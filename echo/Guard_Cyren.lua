function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetCleanName() .. ", to the Kingdom of Above.");
	end
end
