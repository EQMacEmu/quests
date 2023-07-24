function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day. " .. e.other:GetCleanName() .. ".  Feel free to look through my inventory of spells. but if you touch anything without first buying it I. will have your skin pulled from your flesh. Slowly.");
	end
end

--END of FILE Zone:paineel  ID:75085 -- Leovre_Kieqmarn
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------