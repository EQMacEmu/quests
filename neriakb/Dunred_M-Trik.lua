function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am pleased to report that I am fully stocked. Please have a look at the goods I have for sale.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Very good work. I can see you are a talented baker and these muffins look suitable. You do Neriak a great service. Here is your payment. I look forward to conducting future business with you.");
		e.other:Faction(e.self,236,2); -- Faction: Dark Bargainers
		e.other:Faction(e.self,370,1); -- Faction: Dreadguard Inner
		e.other:Faction(e.self,334,1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("You have returned and none too soon! Thank you very much, I will put this bread on sale immediately. Here is your reward as promised. Thank you very much.");
		e.other:Faction(e.self,236,4); -- Faction: Dark Bargainers
		e.other:Faction(e.self,370,1); -- Faction: Dreadguard Inner
		e.other:Faction(e.self,334,1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
