function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Nug Rellash, assistant brewer and barkeep at the Lion's Mane Tavern. Come in and enjoy the drinks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18821}, 0)) then  -- Scrap of Parchment
		e.self:Say("Let's see here... That is good for one free ale. Here you go. Enjoy it!");
		e.other:Faction(e.self,291,-5); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,1); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,-1); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,-1); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13049,0); -- Item: Free Ale
	end
	item_lib.return_items(e.self, e.other, e.trade)
end