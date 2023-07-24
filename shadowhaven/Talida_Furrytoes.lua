function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! Have a look at what I have, perhaps you will see something to your liking.");
	end
end
