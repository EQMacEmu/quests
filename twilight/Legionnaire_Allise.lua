function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stands stoutly at her post.");
	elseif(e.message:findi("armor")) then
		e.self:Emote("smiles at " .. e.other:GetCleanName() .. ". 'Valana must have sent you here. Tell me, are you a monk?'");
	elseif(e.message:findi("monk")) then
		e.self:Say("Good the pieces I have are the veil, cloak, hand wraps, choker, belt, and a bo stick.");
	elseif(e.message:findi("veil")) then
		e.self:Say("To receive the veil you must retrieve for me a sun jewel, a mark of discipline, and some oiled scales.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("To receive the cloak you must retrieve for me a moon jewel, a mark of training, a scorched idol, and a gem of longevity.");
	elseif(e.message:findi("hand wraps")) then
		e.self:Say("To receive the hand wraps you must retrieve for me a star jewel, a mark of rank, and a golden gem.");
	elseif(e.message:findi("choker")) then
		e.self:Say("To receive the choker you must retrieve for me a cloud jewel, a mark of aggression, and some sun fiend bones.");
	elseif(e.message:findi("belt")) then
		e.self:Say("To receive the belt you must retrieve for me a sky jewel, a mark of defense, a protector gem, and an indigo sapphire.");
	elseif(e.message:findi("bo stick")) then
		e.self:Say("To receive the bo stick you must retrieve for me a meteor jewel, a mark of the dragon, an embedded gravel tablet, and a gilded wrist chain.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5254,item3 = 5255},1,text)) then -- veil
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3782,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5256,item3 = 5257,item4 = 5258},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3783,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5259,item3 = 5260},1,text)) then -- hand wraps
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3784,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5261,item3 = 5262},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3785,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5263,item3 = 5264,item4 = 5266},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3786,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5265,item3 = 5267,item4 = 5268},1,text)) then -- bo stick
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3787,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
