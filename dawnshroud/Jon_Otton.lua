function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ". Don't mind us. We're just passing through. We decided to rest before we head on.  My brother Wils may have something you're interested in. Ask him about [forest ravagers].");
		eq.signal(174073,1);
	end
end
