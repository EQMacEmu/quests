function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't ya see I'm busy working? Leave me be."); 
	elseif(e.message:findi("armor")) then
		e.self:Say("Bah, Brodlan should know better than opening his big mouth. Anyway this looks like armor for a dark knight if ye want to trade for it.");
	elseif(e.message:findi("trade")) then
		e.self:Say("Good ya want to trade. I have the mask, cloak, gauntlets, gorget, girdle, and mace. Just tell me what piece you want to trade for and I'll tell ya what I want.")
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the darkened knight's cloak you'll have to bring me a cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the darkened knight's gauntlets you'll have bring me a sky jewel, a mark of fright, and a true silver idol");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the darkened knight's girdle you'll have to bring me an astral jewel, a mark of gloom, some gilded beads, and an etched tablet.");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the darkened knigh's gorget you'll have to bring me a meteor jewel, a mark of darkness, a runed stone brazier.");
	elseif(e.message:findi("mace")) then
		e.self:Say("For the darkened knight's mace you'll have to bring me a sun jewel, a mark of night, a beaded circlet, and a heating stone.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5875,item3 = 5876,item4 = 5877},1,text)) then -- cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3967,25000); -- Darkened Knight's Cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5880,item3 = 5881},1,text)) then -- meteor jewel, a mark of darkness, a runed stone brazier
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3969,25000); -- Darkened Knight's Gorget
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5878,item3 = 5879},1,text)) then -- sky jewel, a mark of fright, and a true silver idol
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3968,25000); -- Darkened Knight's Guantlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5882,item3 = 5883,item4 = 5884},1,text)) then -- astral jewel, a mark of gloom, some gilded beads, and an etched tablet
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3970,25000); -- Darkened Knight's Girdle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5885,item3 = 5886,item4 = 5887},1,text)) then -- sun jewel, a mark of night, a beaded circlet, and a heating stone
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3971,25000); -- Darkened Knight's Mace
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1502,5); -- Katta Castellum Citizens
	e.other:Faction(e.self,1503,1); -- Validus Custodus
	e.other:Faction(e.self,1504,1); -- Magus Conlegium
	e.other:Faction(e.self,1499,-2); -- Citizens of Seru
	e.other:Faction(e.self,1483,-1); -- Seru
	e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
end


