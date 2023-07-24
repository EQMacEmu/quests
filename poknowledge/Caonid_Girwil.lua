function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("narrows his wild. blazing eyes upon you. The troll sniffs the air about you. studying you with great care and intent. Eventually. a gruff. hoarse hiss escapes the troll's throat as it backs away. seemingly disinterested and unimpressed. 'How puny you people are now. How spoiled and depraved of true turmoil. chaos. and petty desires for mere wealth. I've hunted down food more impressive and intimidating than you. How disgusting you are. Weakling.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
