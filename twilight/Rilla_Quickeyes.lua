function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("OH HI! This is soooo boring, I wish I had something else to do.");
	elseif(e.message:findi("to do")) then
		e.self:Say("If I had the right materials I could make some armor.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh you want me to make some armor? If you're a druid I could make you some.");
	elseif(e.message:findi("druid")) then
		e.self:Say("I can make you a cap, tunic, sleeves, leggings, mantle, bracer, and boots. If you want other druid armor you'll have to talk to Edgar.");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the earth blessed cap you will have to go get me a moon jewel, a mark of the wild, a braided vine bracelet, and an aged dark wood shaft.");
	elseif(e.message:findi("tunic")) then
		e.self:Say("For the earth blessed tunic you will have to go get me a star jewel, a mark of nature, a primal earth rune, and a growth stone.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the earth blessed sleeves you will have to go get me a cloud jewel, a mark of vitality, an etched diamond of nature, and a storm filled vial.");
	elseif(e.message:findi("leggings")) then
		e.self:Say("For the earth blessed leggings you will have to go get me a sky jewel, a mark of life, an etched emerald of nature, and a sack of purified soil.");
	elseif(e.message:findi("mantle")) then
		e.self:Say("For the earth blessed mantle you will have to go get me a meteor jewel, a mark of regeneration, and an etched sapphire of nature.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the earth blessed bracer you will have to go get me an astral jewel, a mark of growth, and an etched ruby of nature.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the earth blessed boots you will have to go get me a sun jewel, a mark of weather, and an etched star ruby of nature.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4961,item3 = 4962,item4 = 4992}, 0)) then -- cap
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3762,25000);  
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4993,item3 = 4994,item4 = 4995}, 0)) then -- tunic
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3763,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4996,item3 = 4997,item4 = 4998}, 0)) then -- sleeves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3764,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4999,item3 = 5000,item4 = 5068}, 0)) then -- leggings
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3765,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5069,item3 = 5079}, 0)) then -- mantle
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3766,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5089,item3 = 5094}, 0)) then -- bracer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3767,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5095,item3 = 5096}, 0)) then -- boots
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3768,25000);
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
