function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, traveler. I have many wares for sale so please take a look at what I have. If you think all my goods are junk and wish to buy from someone else though I'll understand.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 26057}, 0)) then -- Book of Sales Secrets
		e.self:Say("I see you have brought a book from the Commissioner. Well I'm not much for reading but I will surely try anything that may increase my sales. Anyways I'm sure you aren't that interested in how bad my sales are and would like to be on your way so here you go.");
		e.other:Faction(e.self,1508, 5); -- Traders of the Haven
		e.other:Faction(e.self,1510, 1); -- House of Fordel
		e.other:Faction(e.self,1511, 1); -- House of Midst
		e.other:Faction(e.self,1512, 1); -- House of Stout
		e.other:QuestReward(e.self,0,0,0,0,26058,5000); -- Thars Sales Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
