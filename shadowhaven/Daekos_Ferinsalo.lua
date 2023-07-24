function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". If you are a Cleric that is experienced in the ways of lifegiving, perhaps you could use some of these spells?");
	end
end
