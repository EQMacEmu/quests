function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Tokk, perhaps you've heard of me? I'd be out in the forest aiding in the war if it weren't for some nasty wounds I took from the grunts. I'm working here as a merchant until they heal, then it's back to the fray. I'll be back out there soon, perhaps we'll raid a grimling camp together.");
	end
end
