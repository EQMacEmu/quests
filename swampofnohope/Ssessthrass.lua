-- Necromancer Epic NPC -- Ssessthrass
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("I do not wisssh to be bothered.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20644})) then
		e.self:Say("Sssso, Emkel ssssent you to retrieve the manisi herb? I do not have the herb. The ssssarnak guard the herb. Apparently it is ssssacred to them. Only memberssss of their royal family are allowed to partake of it. They live deep in Chardok. They are hoarding what little of the precious herb there is. If you have an army, perhapssss you can bring me the herb and I can prepare it for Emkel. Bring back this ssssymbol as well.");
		e.other:QuestReward(e.self,0,0,0,0,20645,500);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20654, item2 = 20645})) then
		e.self:Emote("looks at you and bows. 'You are truly a fearsome sssshadow weaver! Or you have powerful alliessss,' he adds a moment later. Ssessthrass pulls the manisi herb apart and hands a piece to you. 'Emkel will be most pleased with us both!'");
		e.other:QuestReward(e.self,0,0,0,0,20650,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
