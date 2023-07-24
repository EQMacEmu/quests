function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I may only carry basic supplies, but try surviving long in these caverns without them.  You need what I have to offer eventually.  Everyone always does.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end