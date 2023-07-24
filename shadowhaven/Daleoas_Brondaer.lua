function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my house, " .. e.other:GetCleanName() .. ".  It's quite bland right now. All that I need is a little bit of furniture and one other thing... oh yeah, a wife!  If you know a nice lady, make sure you send her my way.  Meanwhile I think I will wait for one to come knocking on my door.");
	end
end
