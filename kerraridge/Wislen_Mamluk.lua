function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("hail")) then
			e.self:Say("Why you bother Wislen?  Wislen trying to get fishies.  Leave Wislen alone to get [fish]. please.");
		elseif(e.message:findi("fish")) then
			e.self:Say("Fish.  Wislen fish.  Wislen is mamluk. not just fisher.  Mamluk is warrior but they also helps provide for all Kerran.  This is hadi place in life.  We happy doing this.  Please. let Wislen fish now.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

--END of FILE Zone:kerraridge  ID:74021 -- Wislen_Mamluk
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------