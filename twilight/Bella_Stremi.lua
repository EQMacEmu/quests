function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah hello and welcome, " .. e.other:GetCleanName() .. ". 'Tis a pleasure to see some new faces.  I have the finest wares to be found, be sure to check them out.");
	elseif(e.message:findi("wares")) then
		e.self:Say("Oh I carry the usual items, food and various other things. I may have something you would be interested in if you are a practitioner of the dark arts.");
	elseif(e.message:findi("dark art")) then
		e.self:Say("Frantip and I once accepted in trade this set of armor from a necromancer for services rendered. If you happen to be a necromancer perhaps we could work out a deal for the armor.");
	elseif(e.message:findi("necromancer")) then
		e.self:Say("I have a cap, robes, sleeves, pants, shawl, bracer, and sandals for a necromancer. Frantip has the rest just ask him about armor and I'm sure he'll help you. Which are you interested in?");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap of pestilence you'll have to bring me a sky jewel, an aged gold coin, a dark gem, and a priceless book.");
	elseif(e.message:findi("robe")) then
		e.self:Say("For the robe of pestilence you'll have to bring me a meteor jewel, a miniature armband, a mark of fortune, and a sun wraith eye.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves of pestilence you'll have to bring me an astral jewel, a petrified totem, a frozen hailstone, and a glowing crystal.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the pants of pestilence you'll have to bring me a sun jewel, a divining rod, an aged platinum symbol, and a silver sign.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl of pestilence you'll have to bring me a moon jewel an ancient fossil, and some wrought iron shavings.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer of pestilence you'll have to bring me a star jewel, a granite idol, and an ancient silver coin.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals of pestilence you'll have to bring me a cloud jewel, a blackened ornament, and a snake scale sceptre.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4741,item3 = 4742,item4 = 4743},1,text)) then -- cap
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3723,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4744,item3 = 4745,item4 = 4746},1,text)) then -- robe
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3724,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4748,item3 = 4749,item4 = 4750},1,text)) then -- sleeves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3725,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4751,item3 = 4752,item4 = 4753},1,text)) then -- pants
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3726,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4771,item3 = 4772},1,text)) then -- shawl
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3727,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4773,item3 = 4774},1,text)) then -- bracer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3728,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4775,item3 = 4776},1,text)) then -- sandals
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3729,25000);
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
