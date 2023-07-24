function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ".  Only those that call upon the dark arts of necromancy may glean use  from the spells which I carry.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end