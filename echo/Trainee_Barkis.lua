function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Argh, that Kelsitch is such a slave driver.  Nothing pleases him.  If Marshall Galeron wasn't watching I'd show Kelsitch just how accurate I can be.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end