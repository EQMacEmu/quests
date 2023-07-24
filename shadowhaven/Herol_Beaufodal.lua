function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I have spell scrolls for only the most experienced Spiritweavers.");
	end
end
