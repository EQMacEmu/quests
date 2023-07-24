function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am currently quite busy with my studies " .. e.other:GetCleanName() .. ", however, if you need any of my scrolls, just let me know.");
	end
end
