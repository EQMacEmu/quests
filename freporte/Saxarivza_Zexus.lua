function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations, " .. e.other:GetCleanName() .. "! I am here as a favor to my brother, High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [devoted to Innoruuk]?");
	elseif(e.message:findi("devoted to innoruuk")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you, " .. e.other:GetCleanName() .. ". It will inform Perrir of who sent you.");
			e.other:SummonCursorItem(18148) -- Note of Recommendation
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
			e.other:SummonCursorItem(18148) -- Note of Recommendation
		end
	end
end
