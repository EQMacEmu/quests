function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What be it you want! Go away before I eat you for dinner!");
	elseif(e.message:findi("wenden sent me")) then
		e.self:Say("Oh, old Wenden? I guess you be wanting some ore. Well, you can't have none! Not unless you get me a new monocle. No. No. No. Don't even try to talk, you either bring me a new monocle that will fit or no ore for you");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20678})) then
		e.self:Say("Eh, you actually found one! Thank you, " .. e.other:GetCleanName() .. ". Here is a block of ore for you. Just don't let the other giants know.");
		e.other:QuestReward(e.self,0,0,0,0,20666,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
