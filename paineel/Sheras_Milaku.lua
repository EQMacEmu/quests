function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ".  Feel free to peruse my wares but waste not my time with idle browsing if you do not intend to purchase something.");
	end
end

--END of FILE Zone:paineel  ID:75107 -- Sheras_Milaku
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------