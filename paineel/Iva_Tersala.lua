function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ".  I have some of the finest baked goods in Paineel.  It's the best home cooking you have had. ever.  That be my word.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Hush!  You must not invoke Her name here.  All of the citizens of Paineel are devout followers of Cazic-Thule or they should be!  Speak no more of any other god here, unless you have a wish to die.");
	end
end

--END of FILE Zone:paineel  ID:75104 -- Iva_Tersala
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------