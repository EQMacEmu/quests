function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hullo. Buy sum of my stuff.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Nice muffins, very stinky. Weeze tank you. Here some money. Weeze need more muffins later. You check back again sum time.");
		e.other:Faction(e.self,338,2); -- Faction: Merchants of Oggok
		e.other:Faction(e.self,228,1); -- Faction: Clurg
		e.other:Faction(e.self,337,1); -- Faction: Oggok Guards
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("You nice for getting bread loaves for us. You take some money. Weeze happy now dat weeze got more bread for sale. You maybe check back later if weeze run out of bread again.");
		e.other:Faction(e.self,338,4); -- Faction: Merchants of Oggok
		e.other:Faction(e.self,228,3); -- Faction: Clurg
		e.other:Faction(e.self,337,3); -- Faction: Oggok Guards
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
