function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why. hello there friend and welcome! New Tanaan has seen much excitement these past days. and we are only pleased to accommodate each and every adventurer and scholar who wishes our guidance. If you are a warden of the natural world. then perhaps my wisdom may hold some meaningful importance to you. Come and search my spells. friend. and purchase whatever might catch your eye should you have use or need of it.");
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
