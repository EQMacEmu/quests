function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Be sure to speak to Kanthek if you're in need of any armor.");
	end
end
