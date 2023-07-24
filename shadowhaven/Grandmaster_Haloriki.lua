function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Grandmaster Haloriki of House Midst. I am the resident guildmaster of this quarter in charge of training all new recruits that wish to serve the Midst.");
	end
end
