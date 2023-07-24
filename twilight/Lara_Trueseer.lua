function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("grimaces in pain. 'The visions are so strong they hurt...please make them stop..");
	elseif(e.message:findi("vision")) then
		e.self:Say("I keep getting these random visions of places unknown to me. Perhaps you could help me with a cure.");
	elseif(e.message:findi("help")) then
		e.self:Say("Ah my thanks! For doing this I can reward you with pieces of a set of armor for enchanters. Are you an enchanter?");
	elseif(e.message:findi("enchanter")) then
		e.self:Say("Very good. I have a cap, robe, sleeves, pants, shawl, and bracer. My friend Xavier has the rest just ask him about armor.");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap I will need an astral jewel, a golden flower, a grail of enchantment, and a mark of beauty.");
	elseif(e.message:findi("robe")) then
		e.self:Say("For the robe I will need a sun jewel, the eye of the enraptured, a mark of affection, and a book of inspiration.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves I will need a moon jewel, a page of prose, a mark of reality, and a truncated ring.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the pants I will need a star jewel, a mark of passion, an adamantium quill, and pristine shik-nar claws.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl I will need a cloud jewel, a mark of understanding, and a hope emerald.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer I will need a sky jewel, a mark of elegance, and a hope sapphire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4675,item3 = 4676,item4 = 4677},1,text)) then -- cap
		e.other:QuestReward(e.self,0,0,0,0,3697,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4678,item3 = 4679,item4 = 4680},1,text)) then -- robe
		e.other:QuestReward(e.self,0,0,0,0,3698,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4681,item3 = 4682,item4 = 4683},1,text)) then -- sleeves
		e.other:QuestReward(e.self,0,0,0,0,3699,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4684,item3 = 4685,item4 = 4686},1,text)) then -- pants
		e.other:QuestReward(e.self,0,0,0,0,3700,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4687,item3 = 4688},1,text)) then -- shawl
		e.other:QuestReward(e.self,0,0,0,0,3701,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4689,item3 = 4690},1,text)) then -- bracer
		e.other:QuestReward(e.self,0,0,0,0,3702,25000);
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
