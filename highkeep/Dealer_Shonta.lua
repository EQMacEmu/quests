function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! I am sorry but this table has a hundred platinum minimum. Maybe you should start on the copper tables.");
	end
end
