function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. "!  I thought I heard the clink of coins and now. here you stand!  Please feel free to browse through my stock.");
	end
end

--END of FILE Zone:paineel  ID:75106 -- Brettas_Norval
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------