function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome back, " .. e.other:GetCleanName() .. ". Why don't you purchase a few things before you head out into the tundra again?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Oh, yes, this is exactly what I needed. These muffins look very fresh too, good work! Here is your payment, as promised. It was a pleasure doing business with you.");
		e.other:Faction(e.self,328,2); 	--Merchants of Halas
		e.other:Faction(e.self,320,1); 	--Wolves of the North
		e.other:Faction(e.self,327,1);	--Shamen of Justice
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("Fresh bread! Thank you so much, I will put this on the shelves straightaway. Here is your payment as promised.");
		e.other:Faction(e.self,328,4); 	--Merchants of Halas
		e.other:Faction(e.self,320,3); 	--Wolves of the North
		e.other:Faction(e.self,327,3);	--Shamen of Justice
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
