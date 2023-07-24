-- resize crafted armor to small size

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then	
		if(e.message:findi("hail")) then
			e.self:Say("Hail! I am Timtok Tonsmith. My brother Ranvigoz and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
		elseif(e.message:findi("resize")) then
			e.self:Say("I will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. My brother will resize Crafted Bracers, Greaves, a Pauldrun or a Breastplate. Just give me the armor and I will resize it for you.");
		elseif(e.message:findi("crafted armor")) then
			e.self:Say("Crafted Armor is made by the Meadowgreen smiths. They can be found in the southern part of the Karanas.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4178})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4186); -- Item: Small Crafted Gauntlets
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4176})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4184); -- Item: Small Crafted Vambraces
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4173})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4181); -- Item: Small Crafted Helm
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4180})) then
			factionsay(e)
			e.other:QuestReward(e.self,0,0,0,0,4188); -- Item: Small Crafted Plate Boots
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

-- EOF zone: commons NPC: Timtok_Tonsmith
