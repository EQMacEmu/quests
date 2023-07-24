function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("The Shak Dratha forces grow more powerful every day. We must protect our home at all costs. I have seen them do many [horrible things] while hunting in the thickets.");
	elseif(e.message:findi("horrible thing")) then
		e.self:Say("While I was gathering hopper pelts from the thickets, I spotted a shak dratha seeker perform a strange ritual over a wounded Loda Kai brigand. I could have sworn I saw his very soul ripped from his own body as he lay there wounded. The Loda Kai may be our enemies, but some evil actions are beyond others.");
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
