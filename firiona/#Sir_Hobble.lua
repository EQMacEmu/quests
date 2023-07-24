function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("holds a cracked monocle up to his squinty eye. 'I say!! A talking bear!! Squire Fuzzmin, come and take a gander at this rare find. The wonders never cease in the land of Kunark!!'");
		eq.unique_spawn(84007,23,0,2884,-3028,-77,128);      -- Spawn Squire_Fuzzmin for Wurmslayer quest
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.depop(84007);
end
-- For Wurmslayer quest
-- Quest depends on Squire_Fuzzmin in Firiona for complete functionality
-- Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
