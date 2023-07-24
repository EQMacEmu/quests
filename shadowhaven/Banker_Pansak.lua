function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Thank you for visiting the Midst Quarter today, " .. e.other:GetCleanName() .. ". It is a pleasure to have you banking with us.");
		else
			e.self:Say(eq.ChooseRandom("Oh look, a talking lump of refuse.  How novel!","I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
		end
	end
end
