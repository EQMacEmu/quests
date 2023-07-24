function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ", welcome to my inn. If you are interested in a room I am afraid they are all accounted for at the moment, but I would advise you to check back later to see if there are any vacancies.");
		else
			e.self:Say(eq.ChooseRandom("Oh look, a talking lump of refuse.  How novel!","I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
		end
	end
end
