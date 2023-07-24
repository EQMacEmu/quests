function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come in! Come in! Enjoy the sights of the Blind Fish Tavern! We serve the finest alcohol in Neriak!");
	elseif(e.message:findi("shadow temper")) then
		e.self:Say("Ha ha ha! You think you're good enough to craft adamantite or brew shadow temper for the smiths, eh? Well, I'll give you the benefit of the doubt. You'll need to brew Neriak nectar with non-Teir'Dal elven blood, and two drops of the deepest shadows.");
		e.self:DoAnim(52);
	end
end

--END of FILE Zone:neriakb  ID:41043 -- Marenkor_To`Biath
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------