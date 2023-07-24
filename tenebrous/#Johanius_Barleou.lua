function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Greetings traveler! You seem like a brave individual for having dared the Tenebrous Mountains without a patrol of Validus Custodus to defend you! I am need of some assistance in an [urgent matter]!");
		else
			e.self:Say("You are a brave individual but unfortunately I cannot trust that you will use what I have to offer to its fullest potential against the foes of Katta Castellum. Perhaps when you have established a stronger reputation as a vampyre slayer I will aid you further.");
		end
	elseif(e.other:GetFaction(e.self) < 6 and e.message:findi("urgent matter")) then
		e.self:Say("My sister and my beloved Lyrra have been captured by the vile blood suckers are being held in the largest of their dark settlements. I can not face that number of blood suckers alone. Are you prepared to slay the wicked undead?");
	elseif(e.other:GetFaction(e.self) < 6  and e.self:GetGrid() == 0 and e.message:findi("prepared to slay")) then
		e.self:Say("Excellent, I commend you in advance for your courage. Let us make haste lest something awful happen to my loved ones!");
		eq.start(6);
	end
end
