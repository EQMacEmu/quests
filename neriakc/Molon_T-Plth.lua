function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey! What's up? If you want some real fun. go downstairs at the Maiden's Fancy.");
	elseif(e.message:findi("downstair")) then
		e.self:Say("Downstairs, you will find the finest in entertainment. A gentleman's paradise. Just have your coins handy.");
	end
end

--END of FILE Zone:neriakc  ID:42040 -- Molon_T`Plth
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
