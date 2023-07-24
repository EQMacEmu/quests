function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Yargin and I am the residing guildmaster for those that heed the call of the wilderness and dedicate their life to preserving it in all its beauty.");
	end
end
