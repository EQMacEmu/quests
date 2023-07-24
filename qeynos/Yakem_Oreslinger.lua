--Quest: Restock High Quality Ore (South Qeynos)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend " .. e.other:GetCleanName() .. "! I am a provider of the highest quality steel ore known to Norrath! This ore is in such demand that I often run low and find it difficult to restock my supplies. If you're [looking for a job] I will gladly pay you for some of your time.");
	elseif(e.message:findi("looking")) then
		e.self:Say("I need you to take this crate and fill it with either Small Bracks of Unrefined Ore or Large Bricks of Unrefined Ore then return it to me so that I may refine it and sell it. The unrefined ore that I require is often mined by the goblins in the ruins of Permafrost Keep.");
		e.other:SummonCursorItem(17814); 	--Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10952})) then 		--Small Shipment of High Quality Ore
		e.other:Faction(e.self,121,4); 	-- Qeynos Citizen
		e.self:Say("Thank you! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:QuestReward(e.self,0,0,0,14,0,5000);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10953})) then 	--Large Shipment of High Quality Ore
		e.self:Say("Thank you! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,121,4); 	-- Qeynos Citizen
		e.other:QuestReward(e.self,0,0,0,44,0,3500);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
