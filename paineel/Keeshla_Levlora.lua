function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met. " .. e.other:GetCleanName() .. ".  I am Keeshla Levlora. a resident necromancer of this beautiful city.  If you are a practitioner of the dark arts under our lord Cazic-Thule. know that you are welcome here.");
	end
end

--END of FILE Zone:paineel  ID:75045 -- Keeshla_Levlora
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------