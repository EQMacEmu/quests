function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks you up and down and mumbles to himself. Much too thin is this one to be put to work. Leave before you hurt yourself and we have to feed you to the critters in the pit.");
	elseif(e.message:findi("oxyn sent me")) then
		e.self:Say("Exsssscellent! More broodlings have arrived to help rebuild our homes. Ours is the one of the first to be completed. We need more [rare supplies to be collected] so that more homes can be completed. You, Vorszaaku, will venture out and return what we request. If you succeed you will receive a [payment].");
	elseif(e.message:findi("collect more rare supplies")) then
		e.self:Say("This is good newssss. You will need to return one of four bundles to me. So that I may redistribute the supplies to the builders. The first bundle must contain a frenzied gnawer tail, froglok treated planks, a sapphire, and your banded sleeves. The second should have a giant hammer, some worn charbone, one star ruby, and your banded cloak. A third bundle should contain spirit caller beads, a rhino hoof, an emerald of fire, and your banded boots. And the final bundle should have no less than a coercion implant, gooey adhesive, a ruby, and your banded bracer. These supplies will increase the production of our broodlings.");
	elseif(e.message:findi("payment")) then
		e.self:Say("The payment is armor that we have been given by the Hierophants to distribute among those who help in the rebuilding. They feel that the duties you complete for us will benefit the Temple of Terror.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3064, item2 = 10033, item3 = 14767, item4 = 14768})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4984,1000); --scaled mystic boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3061, item2 = 10035, item3 = 14769, item4 = 14770})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4988,1000); --scaled mystic bracers
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3058, item2 = 10032, item3 = 14765, item4 = 14766})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4991,1000); --scaled mystic cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3060, item2 = 10034, item3 = 14763, item4 = 14764})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4986,1000); --scaled mystic vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
