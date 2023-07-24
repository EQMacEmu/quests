-- special gemstone for paladin quest spell divine might
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, welcome!  Buy some gems or sell some gems.  I have flawless merchandise.  I have the finest miners scouring Kunark for its precious gems.  Kunark has many rare minerals.  The gnomes even say some of the rocks are from high up in the sky.  From an orb floating so far away we cannot see it.  Bah!!  Those gnomes are insane.");
		e.self:DoAnim(48);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10033})) then --fire emerald
		e.self:Emote("examines the fire emerald, reaches into his pouch and hands you another. 'There you go, it doesn't look special but it is. If you don't believe me I'll take another look at it. Just remember this special fire emerald only has one purpose!'");
		e.other:QuestReward(e.self,0,0,0,0,10013); --A Special Fire Emerald
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
