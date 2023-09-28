function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! Be careful out in Toxxulia Forest! There are many venomous creatures out here. If things get too scary for you, run back to us and we shall take care of the threat.");
	end
end
--END of FILE Zone:tox  ID:38124 -- Sentinel_Drom


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
