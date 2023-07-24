function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Huh? Oh hi " .. e.other:GetCleanName() .. ". Youse want to buy sumthin?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("MMmmm... Deez look like gud muffins. Here's sum money. Tanks. Now meez all stocked again.");
		e.other:Faction(e.self,236,2); -- Faction: Dark Bargainers
		e.other:Faction(e.self,370,1); -- Faction: Dreadguard Inner
		e.other:Faction(e.self,334,1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("You nice for getting bread loaves for us. You take some money. Weeze happy now dat weeze got more bread for sale. You maybe check back later if weeze run out of bread again.");
		e.other:Faction(e.self,236,4); -- Faction: Dark Bargainers
		e.other:Faction(e.self,370,1); -- Faction: Dreadguard Inner
		e.other:Faction(e.self,334,1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
