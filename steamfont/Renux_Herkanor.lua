-- Rogue Epic NPC -- Renux_Herkanor

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("BOO! I'm sure you didn't expect to see me here, but you've left quite a trail. Why did you go to all the trouble to get this scrap of parchment? What can be so important about it that Father would risk all for it? No matter, Hanns will figure it out. Now, will you tell me where to find Stanos?");
	elseif(e.message:findi("highpass hold")) then
		e.self:Say("Excellent. Stanos shall meet his end, and soon. You, however, will not live another day. Can't have you warning him, now can I?");
		eq.attack(e.other:GetName());
	end
end

function event_death_complete(e)
	e.self:Say("Tell Hanns I tried, and will love him always. Tell Father I will save a seat in hell for him!");
end

--END of FILE  Zone:steamfont  ID:56172 -- Renux_Herkanor

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
