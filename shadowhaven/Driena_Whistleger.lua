function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm not feeling too well, " .. e.other:GetCleanName() .. "...");
	end
end
