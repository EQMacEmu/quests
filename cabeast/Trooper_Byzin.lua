function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I have no time for conversation.  Go. and leave me to my duties.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
