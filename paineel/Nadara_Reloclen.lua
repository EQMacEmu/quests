function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. " .. e.other:GetCleanName() .. ".  Fear not for your valuables.  I have known Marsa for many years and she has not once taken anyone's property.  She is. perhaps. the last honest person in this city.");
	end
end

--END of FILE Zone:paineel  ID:75099 -- Nadara_Reloclen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
