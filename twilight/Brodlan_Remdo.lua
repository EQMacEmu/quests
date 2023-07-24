function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why hello, I'm in charge of the fishing operations here on Jern's Isle.  [Fish] are my area of expertise.");
	elseif(e.message:findi("fish")) then
		e.self:Say("We have fish come in here all the time. Sometimes we catch an [oddity] now and again.");
	elseif(e.message:findi("oddity")) then
		e.self:Say("Once we pulled up this ancient chest filled with this [dark plate armor].");
	elseif(e.message:findi("armor")) then
		e.self:Say("Looked the like kind of armor a dark knight would wear. if ya want it I'm sure we could arrange a [trade] of some sort.");
	elseif(e.message:findi("trade")) then
		e.self:Say("Since Trevor and I are the ones that found it we split it between ourselves. I have a [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. Ask Trevor about the rest of the armor.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the darkened knight's breastplate fetch me a cloud jewel. a mark of fear. a delicate glass sculpture. and a painted ornament.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the darkened knight's vambraces fetch me a sky jewel. a mark of terror. a runed ornamental mace. and an ancient tablet.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the darkened knight's greaves fetch me a meteor jewel. a mark of dread. the King's Tome. and a polished ivory idol.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the darkened knight's pauldrons fetch me an astral jewel. a mark of hatred. and an ancient petrified tulip.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the darkened knight's bracer fetch me a sun jewel. a mark of intimidation. and a small rough marble figurine.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the darkened knight's boots fetch me a moon jewel. a mark of horror. and a fanged talisman.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5871,item3 = 5872},1,text)) then -- moon jewel, a mark of horror, and a fanged talisman
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3965,25000); -- Darkened Knight's Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5869,item3 = 5870},1,text)) then -- sun jewel, a mark of intimidation, and a small rough marble figurine
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3964,25000); -- Darkened Knight's Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5857,item3 = 5860,item4 = 5859},1,text)) then -- cloud jewel, a mark of fear, a delicate glass sculpture, and a painted ornament
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3960,25000); -- Darkened Knight's Breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5864,item3 = 5865,item4 = 5866},1,text)) then -- meteor jewel, a mark of dread, the Kings Tome, and a polished ivory idol
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3962,25000); -- Darkened Knight's Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5854,item3 = 5855,item4 = 5856},1,text)) then -- star jewel, a mark of shadows, a primitive totem, and a golden spoon
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3959,25000); -- Darkened Knight's Helm
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5873,item3 = 5874},1,text)) then -- star jewel, a mark of dark fate, and a crystalline idol
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3966,25000); -- Darkened Knight's Mask
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5867,item3 = 5868},1,text)) then -- astral jewel, a mark of hatred, and an ancient petrified tulip
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3963,25000); -- Darkened Knight's Pauldrons
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5861,item3 = 5862,item4 = 5863},1,text)) then -- sky jewel, a mark of terror, a runed ornamental mace, and an ancient tablet
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3961,25000); -- Darkened Knight's Vambraces
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
