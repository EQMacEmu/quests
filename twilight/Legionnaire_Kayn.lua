function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stands still, on watch for danger.");
	elseif(e.message:findi("armor")) then
		e.self:Say("You must have been speaking to Derron, a mightier cleric ye couldn't find. Except for Donal the Wise of course. So tell me are ye also a cleric like Derron?");
	elseif(e.message:findi("cleric")) then
		e.self:Say("Ah then you must want the mask, cloak, gauntlets, talisman, girdle, and hammer that I be holdin'.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("To get the cloak you must bring me a sky jewel, a mark of credence, a light etched fire opal, and a polished stone statuette.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To get the gauntlets you must bring me a meteor jewel, a mark of piety, and a light etched opal.");
	elseif(e.message:findi("girdle")) then
		e.self:Say("To get the girdle you must bring me a sun jewel, a mark of grace, a light etched diamond, and a dark eyed iris.");
	elseif(e.message:findi("hammer")) then
		e.self:Say("To get the hammer you must bring me a moon jewel, a mark of salvation, a light etched emerald, and the writ of distance.");
	elseif(e.message:findi("mask")) then
		e.self:Say("To get the mask you must bring me a cloud jewel, a mark of hope, and a light etched star ruby.");
	elseif(e.message:findi("talisman")) then
		e.self:Say("To get the talisman you must bring me an astral jewel, a mark of affirmation, and a light etched peridot.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4850,item3 = 4858,item4 = 4859},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3744,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4860,item3 = 4868},1,text)) then -- gaunts
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3745,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4878,item3 = 4879,item4 = 4880},1,text)) then -- girdle
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3747,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4888,item3 = 4889,item4 = 4890},1,text)) then -- hammer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3748,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4848,item3 = 4849},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3743,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4869,item3 = 4870},1,text)) then -- talisman
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3746,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
