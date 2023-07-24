function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hiya. I be a fishin'. What, ya need somethin?");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh ya want some of the druid equipment that Rilla and I make?");
	elseif(e.message:findi("druid")) then
		e.self:Say("I can make ya a mask, cloak, gloves, talisman, belt, and a crook. Just ask about each one and I'll tell ya what ya need to bring so I can make it.");
	elseif(e.message:findi("mask")) then
		e.self:Say("'For the earth blessed mask you need to bring me a moon jewel, a mark of storms, and an etched fire opal of nature.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the earth blessed cloak you need to bring me a star jewel, a mark of the earth, an etched peridot of nature, and a tablet of wolves.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("'For the earth blessed gloves you need to bring me a cloud jewel, a mark of blossoms, and an etched pearl of nature.");
	elseif(e.message:findi("talisman")) then
		e.self:Say("For the earth blessed talisman you need to bring me a sky jewel, a mark of rain, and an etched opal of nature.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the earth blessed belt you need to bring me a meteor jewel, a mark of flora, an etched onyx of nature, and an ancient writ of nature.");
	elseif(e.message:findi("crook")) then
		e.self:Say("For the earth blessed crook you need to bring me an astral jewel, mark of fauna, an etched fire emerald of nautre, and a vial of moon dew.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5097,item3 = 5098},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3769,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5099,item3 = 5107,item4 = 6395},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3770,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5108,item3 = 5109},1,text)) then -- gloves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3771,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5110,item3 = 5116},1,text)) then -- talisman
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3772,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5117,item3 = 5118,item4 = 5119},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3773,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5129,item3 = 5190,item4 = 5191},1,text)) then -- crook
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3774,25000);
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
