function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". If you're the baking type, I've got some books that you may find useful.");
	end
end
