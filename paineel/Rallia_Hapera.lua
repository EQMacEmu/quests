function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ".  Thank you for coming in and looking at our wares.  We should have just about everything you need if you wish to take a trip.");
	end
end

--END of FILE Zone:paineel  ID:75079 -- Rallia_Hapera
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------