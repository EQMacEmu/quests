function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("You need weapons, " .. e.other:GetCleanName() .. "?  I have a whole collection of acquired Fordel weapons for sale.  Not the best craftsmanship, but about as good as you'll find in the area.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end