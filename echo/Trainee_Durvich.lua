function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I just can't seem to get the handle of these little knives.  My hands are too big, give me a good sword and I'll show you how skilled I can be with a blade.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end