function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". If it's a smooth drink with some bite that you're after, you need to try a Jawdropper Honey Ale.");
	end
end
