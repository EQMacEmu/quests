function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("All hail " .. e.other:GetCleanName() .. ", who wishes an audience with our glorious kings.");
	end
end
