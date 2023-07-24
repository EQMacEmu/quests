function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("smiles briefly. 'Greetings to ye " .. e.other:GetCleanName() .. ". If you be needin' the goods I've got 'em.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Ah yes, I've been trying to get rid of this armor for some time. Do you happen to be a necromancer?");
	elseif(e.message:findi("necromancer")) then
		e.self:Say("Very good! I have the veil, cloak, gloves, choker, belt, and staff. Which do you want?");
	elseif(e.message:findi("veil")) then
		e.self:Say("For the veil of pestilence you will have to go retrieve for me a sky jewel, a jeweled rod, and a bronze brazier.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak of pestilence you will have to go retrieve for me a meteor jewel, a hardened agate, a veiled lantern, and a white garnet.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves of pestilence you will have to go retrieve for me an astral jewel, an antique lantern, and a glowing meteor fragment.");
	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker of pestilence you will have to go retrieve for me a sun jewel, an ancient relic of Tzon, and a fluorescent gem.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt of pestilence you will have to go retrieve for me a moon jewel, an ancestral statuette, some dark hued wood, and an ocher gem.");
	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff of pestilence you will have to go retrieve for me a star jewel, some cultured spirits, some golden mushrooms, and a gem of awe.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4777,item3 = 4778},1,text)) then -- veil
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3730,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4779,item3 = 4781,item4 = 4782},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3731,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4783,item3 = 4784},1,text)) then -- gloves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3732,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4785,item3 = 4786},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3733,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4787,item3 = 4788,item4 = 4789},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3734,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4790,item3 = 4791,item4 = 4792},1,text)) then -- staff
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3735,25000);
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
