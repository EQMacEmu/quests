function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". Are you a [Norrathian]?");
	elseif(e.message:findi("Norrathian")) then
		e.self:Say("My husband has told me many tales of the lands of Norrath. I wish to one day see them myself but apparently most people would not accept our family there. We are fortunate I suppose to be living in Katta Castellum where people do not judge each other by their appearances but instead by their integrity.");
	end
end
