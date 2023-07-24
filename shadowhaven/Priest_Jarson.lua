function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am Priest Jarson, I serve this house and offer my teachings to any willing to learn.");
		else
			e.self:Say(eq.ChooseRandom("Oh look, a talking lump of refuse.  How novel!","I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
		end
	end
end
