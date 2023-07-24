function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How's it going " .. e.other:GetCleanName() .. ", just watering my plants. How can I help?");
	end
end
