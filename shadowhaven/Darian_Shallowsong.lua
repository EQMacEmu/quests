function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", it seems that you have caught me relaxing a bit on my off time at the tavern here. No matter, though if you are a bard in need of assistance, just let me know and we will get right to work.");
	end
end
