function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Be careful around here. " .. e.other:GetCleanName() .. ". Injured broodlings are no use to anyone. Many of these structures are yet unstable and could fall at any time. If you're a mystic, I can teach you how to [protect] yourself.");
	elseif(e.message:findi("oxyn sent me")) then
		e.self:Say("It is good to see that more able bodies are passing through the doors of the Temple of Terror. We should be able to rebuild much faster now, once we are able to [collect some more bundles]. For those that are interested in helping, there is [payment] to be had.");
	elseif(e.message:findi("collect some more bundle")) then
		e.self:Say("There are many bundles to be collected. There are only four that I require at this very instant. I need a bundle that contains Bargynn's Digger, Sythrax's building plans, a sapphire, and your banded helm. Another must contain some venomous parchment, warlord drawing pen, a ruby, and your banded guantlets. There is one that must have a recruitment letter, an exiled iksar head, a fire emerald, and your banded leggings. And the final bundle I require must contain some watchman's spectacles, nectar of isolation, a star ruby, and your banded tunic. Now, hurry and return these, or I'll be asking for someone to bring me your head.");
	elseif(e.message:findi("payment")) then
		e.self:Say("Payment will be in the form of equipment. All funds are currently being spent on the rebuilding.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3056, item2 = 10032, item3 = 14777, item4 = 14778})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4989,2000); --scaled mystic breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3062, item2 = 10035, item3 = 14773, item4 = 14774})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4985,1000); --scaled mystic gauntlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3063, item2 = 10033, item3 = 14775, item4 = 14776})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4987,1000); --scaled mystic greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3053, item2 = 10034, item3 = 14771, item4 = 14772})) then
		e.self:Say("You have succeeded! Take this as payment and begin getting the next bundle.  The more supplies we have the faster we can rebuild");
		e.other:QuestReward(e.self,0,0,0,0,4990,1000); --scaled mystic helm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
