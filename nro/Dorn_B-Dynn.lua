function event_say(e)
	if(e.message:findi("attend to business")) then
		e.self:Say("So, business is your mission! I have never met you. Who sent you?");
	elseif(e.message:findi("shelter")) then
		e.self:Say("Then look elsewhere! You are lucky your head still sits upon your shoulders. The dervish cutthroats are not fond of strangers. Now, leave!");
	elseif(e.message:findi("Zimbittle sent me")) then
		e.self:Say("I do not know if I could trust you. You certainly do not look as though you are from Grobb, although your stench does hint of that place. If you are truly sent by Zimbittle, what is the passwrod?");
	elseif(e.message:findi("Mukk")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("So you were sent by Zimbittle. Take this note Kraagia of Da Bashers in Grobb. Do not lose the note. If it were to fall into the wrong hands of [Goonda], this whole plan could be disrupted. Now, leave, I can no longer tolerate you foul stench!");
			e.other:SummonCursorItem(18886); -- Item: A Sealed Letter
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");
		end
	elseif(e.message:findi("Goonda")) then
		e.self:Say("In the western planes of Karana, you will find Goonda. He seems to be the Ogre shaman in charge out there.");
	end
end
