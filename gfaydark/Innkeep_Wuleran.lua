function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! Why don't you browse through my selection of fine goods and pick out some things you like " .. e.other:GetCleanName() .. "?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Oh, these look delicious! No doubt they were made with fresh fruit grown locally; I can tell by the aroma. You have quite a talent! Thank you so much. Here is your payment. This should be enough to last me for a little while.");
		e.other:Faction(e.self,276,2); 	--kelethin merchants
		e.other:Faction(e.self,246,1); 	--faydarks champions
		e.other:Faction(e.self,326,1);	--emerald warriors
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("Excellent, I see you made it back safely. Thank you so much, here is your payment as promised. Now I can get back to business as usual.");
		e.other:Faction(e.self,276,4); 	--kelethin merchants
		e.other:Faction(e.self,246,1); 	--faydarks champions
		e.other:Faction(e.self,326,1);	--emerald warriors
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
