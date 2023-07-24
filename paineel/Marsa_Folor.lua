function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. " .. e.other:GetCleanName() .. "!  Can't take your valuables with you?  Weighing you down. are they. " .. e.other:GetCleanName() .. "?  Leave them with me.  In my capable hands and in the hands of my capable staff. they will be safe from prying eyes and quick hands!");
	end
end

--END of FILE Zone:paineel  ID:75100 -- Marsa_Folor
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------