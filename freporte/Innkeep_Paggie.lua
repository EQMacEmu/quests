function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetCleanName() .. "! You'll be happy to see that I am fully stocked with all my usual goods. Have a look around.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Ah yes! This is exactly what I am looking for, dear. Let me put these on the shelf right away. Here is some coin for your trouble. Perhaps we can do business again some time.");
		e.other:Faction(e.self,63,2); -- coalition of tradefolk
		e.other:Faction(e.self,281,2); -- knights of truth
		e.other:Faction(e.self,291,1); -- merchants of qeynos
		e.other:Faction(e.self,336,2); -- coalition of tradefolk underground
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("Oh, wonderful fresh bread! Thank you for making the trip, that is such a long way. Here, I hope this covers your travel expenses. You have my deepest thanks.");
		e.other:Faction(e.self,63,4); -- coalition of tradefolk
		e.other:Faction(e.self,281,4); -- knights of truth
		e.other:Faction(e.self,291,3); -- merchants of qeynos
		e.other:Faction(e.self,336,4); -- coalition of tradefolk underground
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
