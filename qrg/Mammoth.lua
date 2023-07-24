function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12139})) then
		e.other:Faction(e.self,343, 1,0); -- Faction: QRG Protected Animals
		e.other:Faction(e.self,302, 1,0); -- Faction: Protectors of Pine
		e.other:Faction(e.self,272, 1,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,366, -1,0); -- Faction: Karana Bandits
		e.other:QuestReward(e.self,0,0,0,0,18809,200); -- Item: Bayle List II
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
