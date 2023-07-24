function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I am afraid this tent is reserved for long time traders of the Haven. If you would like a place to sell your wares, try the Bazaar.");
	end
end
