
function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Ah yes! This is exactly what I am looking for, dear. Let me put these on the shelf right away. Here is some coin for your trouble. Perhaps we can do business again sometime.");
		e.other:Faction(e.self,330,2); -- freeport militia
		e.other:Faction(e.self,336,1); -- coalition of tradefolk underground
		e.other:Faction(e.self,281,-1); -- knights of truth
		e.other:Faction(e.self,362,-1); -- priests of marr
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("Oh, wonderful fresh bread! Thank you for making the trip, that is such a long way. Here, I hope this covers your travel expenses. You have my deepest thanks.");
		e.other:Faction(e.self,330,4); -- freeport militia
		e.other:Faction(e.self,336,1); -- coalition of tradefolk underground
		e.other:Faction(e.self,281,-1); -- knights of truth
		e.other:Faction(e.self,362,-1); -- priests of marr
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end