-- resize crafted armor to small size

function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail! I am Ranvigoz Tonsmith. My brother Timtok and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
		elseif(e.message:findi("resize")) then
			e.self:Say("I will resize Crafted Bracers, Greaves, a Pauldron or a Breastplate. My brother will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. Just give me the armor and I will resize it for you.");
		elseif(e.message:findi("crafted armor")) then
			e.self:Say("Crafted Armor is made by the Meadowgreen smiths. They can be found in the southern part of the Karanas.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 6) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4177})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4185); -- Item: Small Crafted Bracers
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4179})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4187); -- Item: Small Crafted Greaves
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4175})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4183); -- Item: Small Crafted Pauldron
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4174})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4182); -- Item: Small Crafted Breastplate
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function factionsay(e)
	e.self:Say("Here is your armor. I hope it fits better now.");
	e.other:Faction(e.self,229,1,0); -- coalition of tradefolk
	e.other:Faction(e.self,281,1,0); -- knights of truth
	e.other:Faction(e.self,291,1,0); -- merchants of qeynos
	e.other:Faction(e.self,336,1,0); -- coalition of trade folk underground
end
-- EOF zone: commons NPC: Ranvigoz_Tonsmith
