-- Part of quest for Veeshan's Peak key
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetingss, " .. e.other:GetCleanName() .. ".  Unlesss you bring closssure to my ssearch, leave me while I contemplate thingss.");
	elseif(e.message:findi("search")) then
		e.self:Say("My sssearch. I have been ssent out by my massster to find an item. A burnished wooden sstaff. I know not why and I do not quessstion. I know not where thiss item is found. I musst have one though. Ssssss. If you can find one for me I will give you a trinket.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6353})) then
		e.self:Say("Sssss. Thisss is what I need. You have my thanksss. Please, take thiss. I know not what it iss for but maybe you will find a ussse for it.");
		e.other:QuestReward(e.self,0,0,0,0,19958,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
