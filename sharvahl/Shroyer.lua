function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("is covered in flour as you approach her. She looks exhausted, but somehow manages to run around the kitchen at full speed. She says, 'I'm sorry, " .. e.other:GetCleanName() .. ", but I haven't time to chat right now. The king's banquet is in three days and I'm out of rockhopper meat!");
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
