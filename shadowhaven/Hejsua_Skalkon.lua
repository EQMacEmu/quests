function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". I carry spells for those that follow the ways of the Beastlord. Should you need any of these scrolls, please let me know.");
	end
end
