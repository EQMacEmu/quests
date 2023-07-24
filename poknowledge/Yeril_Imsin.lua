function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you, " .. e.other:GetCleanName() .. ". New Tanaan holds a wealth of knowledge and opportunities to further yourself in more ways than mere talent of the mind. If you are a craftsman of steel and armor and seek to further progress your trade, then you have come to the right place. My inventory is quite plentiful and holds the necessary elements for any blacksmith's trade. I am also willing to pay those [willing to help] me restock my supply of high quality ore.");
	elseif(e.message:findi("willing to help")) then
		e.self:Say("Excellent! Simply fill this crate with either four large bricks or four small bricks of unrefined ore from Norrath and return it to me. I will provide you with coin and refine the ore for sale to the smiths of New Tanaan.");
		e.other:SummonCursorItem(17814);--Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10953})) then--Large Shipment of High Quality Ore
		e.self:Say("Thank you " .. e.other:GetCleanName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,1636, 4);--Inhabitants of Tanaan
		e.other:QuestReward(e.self,0,0,0,44,0,5000);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10952})) then--Small Shipment of High Quality Ore
		e.self:Say("Thank you " .. e.other:GetCleanName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,1636, 4);--Inhabitants of Tanaan
		e.other:QuestReward(e.self,0,0,0,14,0,5000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
