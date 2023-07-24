function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. My brother Joogl is a great bixie hunter.  No one can smash bixies like my brother.  He is the best.  He works for [Kizzie Mintopp].");
	elseif(e.message:findi("kizzie mintopp")) then
		e.self:Say("Kizzie owns the Herb Shop in Rivervale. She is the keeper of the [honey jum recipe].");
	elseif(e.message:findi("what honey jum recipe")) then
		e.self:Say("I do not know, but it tastes good on bixie crunchies.  Kizzie makes it with the honeycombs my brother collects from the bixies.");
	end
end

--Author:Shaznito
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
