--Zone:  Shar Vahl  ID: 155208  -- Cook_Mylis
function event_say(e)
	if(e.message:findi("spicy fish stew")) then
		e.self:Say("Ohhh, I love fish stew and it's fairly simple to make. If you're looking to make a large pot of it, you'll want to be sure that you have enough ingredients ready from the start. Gather up a flask of water, a jug of sauce, some spices and two wetfang steaks. Cook them in an oven in a large stewing pot. For being so foul, those wetfangs sure taste good. Throw all of that in to simmer for a bit and you're ready to go.");
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
