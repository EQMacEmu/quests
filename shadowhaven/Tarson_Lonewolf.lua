function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am very well seasoned in the ways of the Spiritcaller. If you or a friend is in need of guidance, please let me know.");
	end
end
