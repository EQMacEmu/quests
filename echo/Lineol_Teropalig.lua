function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Would you happen to be a dark priest?  I am willing to teach all I know of pain, life and death to those who are inclined to learn.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end