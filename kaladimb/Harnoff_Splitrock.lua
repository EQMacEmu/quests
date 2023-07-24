--Quest: Restock High Quality Ore (North Kaladim)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetins to ya friend Dwarf! I've got some of the finest quality steel ores in all the lands! It's a bit troublesome ta keep a large enough supply of it though, it bein sought after by every smith ya know. If you're needin some cash or ore how bout you [run an errand] fer me?");
	elseif(e.message:findi("errand")) then
		e.self:Say("I was hopin you'd be up fer the job! Take this here crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore and I'll pay ya when ye return.");
		e.other:SummonCursorItem(17814); 	--Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10952})) then 		--Small Shipment of High Quality Ore
		e.self:Say("Thank you! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,290,5); 	--Merchants of Kaladim
		e.other:Faction(e.self,312,1); 	--Storm Guard
		e.other:Faction(e.self,322,-1); 	--Miners Guild 628
		e.other:Faction(e.self,293,1); 	--Miners Guild 249
		e.other:Faction(e.self,274,1); 	--Kazon Stormhammer
		e.other:QuestReward(e.self,0,0,0,14,0,5000);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10953})) then 	--Large Shipment of High Quality Ore
		e.self:Say("Thank you! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,274,5); 	--Kazon Stormhammer
		e.other:Faction(e.self,290,1); 	--Merchants of Kaladim
		e.other:Faction(e.self,322,-1);	--Miners Guild 628
		e.other:Faction(e.self,293,1); 	--Miners Guild 249
		e.other:Faction(e.self,312,1); 	--Storm Guard
		e.other:QuestReward(e.self,0,0,0,44,0,5000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
