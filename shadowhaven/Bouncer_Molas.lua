function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Grimthor's " .. e.other:GetCleanName() .. ". If you're one of those hard drinkers that likes to have a few drinks then raise a ruckus, be sure you keep in mind how big I am.");
	end
end
