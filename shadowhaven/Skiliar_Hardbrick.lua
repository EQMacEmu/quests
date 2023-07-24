function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo there " .. e.other:GetCleanName() .. ", you will have to excuse me I'm usually not in this bad of a mood, but my boy has to learn some discipline one way or another. He thinks he's stronger than he is and wanders off by himself in dangerous lands all da time.");
	end
end
