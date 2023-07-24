function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". It's nice to meet you. I am one of the watchguards here that guard the guildmeeting hall.");
	end
end
