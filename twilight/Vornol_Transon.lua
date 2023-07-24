function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("pauses for a second staring off into the distance. 'Ah welcome friend. I am Vornol, a summoner of sorts, and master of this tower.'");
	elseif(e.message:findi("magician")) then
		e.self:Say("Most excellent what I have is some armor, if you will do few errands for me it is yours. The pieces I have are the cap, robe, sleeves, pants, shawl, and bracer. My apprentice, the lady Galdara, has the rest. Just ask her about armor and she will tell you what you need to do.");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap you will have to bring back to me a sun jewel, a fire idol, a fire marked scroll and a runed ring of fire.");
	elseif(e.message:findi("robe")) then
		e.self:Say("For the robe you will have to bring back to me a moon jewel, a vial of purified fire, a vial of purified water, and a vial of purified air.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves you will have to bring back to me a star jewel, an air idol, an air marked scroll and a runed ring of air.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the pants you will have to bring back to me a cloud jewel, an earth idol, an earth marked scroll, and a runed ring of earth.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl you will have to bring back to me a sky jewel, a talisman of burning earth, and a vial of purified earth.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you will have to bring back to me a meteor jewel, talisman of moisture, and a vial of aqua waters.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4495,item3 = 4496,item4 = 4497},1,text)) then -- cap
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3684,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4498,item3 = 4499,item4 = 4506},1,text)) then -- robe
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3685,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4507,item3 = 4508,item4 = 4509},1,text)) then -- sleeves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3686,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4510,item3 = 4511,item4 = 4512},1,text)) then -- pants
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3687,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4513,item3 = 4514},1,text)) then -- shawl
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3688,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4584,item3 = 4585},1,text)) then -- bracer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3689,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
