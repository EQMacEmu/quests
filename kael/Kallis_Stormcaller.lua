function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Greetings, " .. e.other:Race() .. ".  Turn back while you can.  Beyond this point is the temple of our great lord, Rallos Zek.  The Vindicators who guard it will not let an infidel tread upon this holy ground.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("vindicator")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("The Vindicators are the most devout followers of Rallos.  A great number of them spend half of the season guarding the temple and the second half of the season destroying the foes of King Tormax.");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end
