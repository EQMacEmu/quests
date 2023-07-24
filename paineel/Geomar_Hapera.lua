function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh. hello there. and welcome to my humble store.  We have everything you might need here. for just about anywhere you'd want to go.  Matter of fact. a party supplied themselves for a trip into Old Paineel just moments ago!");
	elseif(e.message:findi("old paineel")) then
		e.self:Say("Ah yes, the forgotten city, or so it seems sometimes.  Yes, 'tis where we used to live, until the hordes of elementals came through and destroyed it.  Much to be had down there, though.  Much indeed.");
	elseif(e.message:findi("had")) then
		e.self:Say("You must remember, our city in all its splendor was down there in that Hole!  Can you imagine the riches lost when we were forced to rebuild the city here?  And did you actually think we were going to live in that hut in Toxxulia forever? Hah!");
	end
end

--END of FILE Zone:paineel  ID:75080 -- Geomar_Hapera
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------