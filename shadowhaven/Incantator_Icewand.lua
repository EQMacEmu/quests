function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  You are headed towards the library of the Midst a place of great power for it has been said many times that knowledge is power.  Here you will find information on almost all practices of magic, I encourage you to stay as long as you like.");
	end
end
