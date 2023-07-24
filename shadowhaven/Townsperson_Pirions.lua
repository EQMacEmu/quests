function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A pleasure it is indeed to meet you, " .. e.other:GetCleanName() .. ". I welcome you to our hallowed town square. If you are curious about any of the town happenings this is the place to come when our meetings are in session.");
	end
end
