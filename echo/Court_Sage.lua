function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, " .. e.other:GetCleanName() .. ", I'm a little busy right now.  Perhaps I can chat with you later.");
	end
end
