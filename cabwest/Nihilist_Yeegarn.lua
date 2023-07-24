function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Looking for a good read?  You should visit the guild houses.  They have tomes which have been scribed for sale.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
