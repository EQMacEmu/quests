------------------------------------------------------------------------------------------------------------------
-- Tindo Frugrin (ID:56116)
-- Zone:   Steamfont (steamfont)
-- Quest:  Telescope Lenses
-- Author: a_sewer_rat
------------------------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings! It is good to see a new face out here. I am Tindo Frugrin, observer for the Eldritch Collective.");
	elseif(e.message:findi("lens")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("I was hoping you were not the one they sent. I have a slight problem. My brother Bidl Frugrin is holding the lens. He went to Kelethin for a little observation. He has been there for quite some time. I fear he has found the local tavern. He will no doubt spend the day in the forest and every night at the tavern.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end
	end
end

--END of FILE Zone:steamfont  ID:56116 -- Tindo_Frugrin

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
