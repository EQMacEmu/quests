function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("growls at you like a fierce cave bear.");
	elseif(e.message:findi("velketor")) then
		e.self:Emote("licks his lips hungrily.");
	end
end
