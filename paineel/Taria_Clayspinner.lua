function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ".  I make the finest statuettes in all the land.  Each one depicts a power on Norrath.  I have some of the most realistic and lifelike statues.  I only take [special orders] as they are rather time-consuming to make.");
	elseif(e.message:findi("what special orders")) then
		e.self:Say("Well, if you must know, many priests and devout worshipers of Cazic-Thule purchase my statues and pray over them.  I have made many other statuettes of the gods just to practice, on the off chance that a worshiper of another faith might care to order one from me.");
	end
end

--END of FILE Zone:paineel  ID:75098 -- Taria_Clayspinner
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------