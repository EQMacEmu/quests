function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18719})) then -- Tattered Note
		e.self:Say("Welcome to the Order of Three. I am Kinloc, Guild Master of the Magicians. This tunic of the Order is for you, wear it with honour. Study hard and master your skills, and you will become an important part of our Order. Yestura shall help introduce you to the ways of magic.");
		e.other:Faction(e.self,342,100,0); -- Order of Three
		e.other:Faction(e.self,221,-25,0); -- Bloodsabers
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13543,20); -- Used Blue Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
