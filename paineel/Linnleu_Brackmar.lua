function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ".  My wares are few but valuable. including books of research into the less widely known arts of necromancy.  Perhaps you should have a look.");
	end
end

--END of FILE Zone:paineel  ID:75082 -- Linnleu_Brackmar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------