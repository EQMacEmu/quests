function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Some cracked old bone's, two zombie flesh, and a salt minnow make up the rest. Throw inside a skull and mix, and I would have a delightful dish. But with no eye's I have no sight to make Kurn's delicious delight. And if I could I would not eat without a tongue behind my teeth.");
	end
end

function event_trade(e)
	local item_lib = require("items"); --Handin: a Glowing Skull
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12401})) then
		e.self:Emote("The cook's bone's crack as he reaches out to take the skull from your hand's. A voice in your mind say's, Thank you. Now I can leave this dreadful place. Please take this as I no longer have any use for it. The cook places the skull back in your hand's before collapsing into a lifeless pile of bone's.");
		e.other:QuestReward(e.self,0,0,0,0,1115); --Summon: The Skull of Torture
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
