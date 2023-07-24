function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. "! I sure love working here for Grimthor, I meet a lot of interesting people! Be sure to grab a drink of your liking and relax at one of our comfortable tables.");
	end
end
