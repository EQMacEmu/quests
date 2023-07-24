function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("nods at " .. e.other:GetCleanName() .. ". 'Hey there!");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh, you've decided you're going to help Lara out with her visions? If so, I can reward you with armor if you happen to be an enchanter.");
	elseif(e.message:findi("enchanter")) then
		e.self:Say("I have the sandals, mask, cloak, gloves, choker, belt, and staff.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you must get for me a meteor jewel, a mark of refinement, and a hope onyx.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask you must get for me an astral jewel, a mark of charm, and a hope pearl.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak you must get for me a sun jewel, a mark of desire, a hope diamond, and a tarnished silver nugget.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves you must get for me a moon jewel, a mark of intellect, and a tarnished gold nugget.");
	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker you must get for me a star jewel, a mark of thought, and a tarnished platinum nugget.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt you must get for me a cloud jewel, a mark of reason, a tarnished electrum nugget, and a friendship bracelet.");
	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff you must get for me a sky jewel, a mark of mind, an enchanted bundle of wood, and a shadow crystal.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4691,item3 = 4692},1,text)) then -- sandals
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3703,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4693,item3 = 4694},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3704,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4695,item3 = 4696,item4 = 4697},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3705,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4698,item3 = 4699},1,text)) then -- gloves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3706,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4701,item3 = 4702},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3707,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4703,item3 = 4704,item4 = 4705},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3708,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4706,item3 = 4707,item4 = 4708},1,text)) then -- staff 
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3709,25000);
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
