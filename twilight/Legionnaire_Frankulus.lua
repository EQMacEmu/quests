function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs and looks at you. 'Another traveler to our fair city of Katta Castellum, you be careful now.'");
	elseif(e.message:findi("armor")) then
		e.self:Say("Yes I am one of the keepers of the soldier's armor. The pieces I have are the helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. Eandalion keeps the other pieces just ask him about armor.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots you will have to bring to me a cloud jewel, a mark of the martial, and a hope ruby.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you will have to bring to me a star jewel, a mark of the siege, and a blue egg.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate you will have to bring to me a meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves you will have to bring to me a sun jewel, a mark of archery, a golden torch, and a small meteor fragment.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm you will have to bring to me a sky jewel, a mark of battle, some petrified toes, and a fire blossom.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons you will have to bring to me a moon jewel, a mark of swordsmanship, and a water blossom."); 
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces you will have to bring to me an astral jewel, a mark of arms, a small sponge, and a scorched rock.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5496,item3 = 5497},1,text)) then -- cloud jewel, a mark of the martial, and a hope ruby
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3939,25000); -- boots 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5494,item3 = 5495},1,text)) then -- star jewel, a mark of the siege, and a blue egg
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3938,25000); -- bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5483,item3 = 5484,item4 = 5485},1,text)) then -- meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3934,25000); -- breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5489,item3 = 5490,item4 = 5491},1,text)) then -- sun jewel, a mark of archery, a golden torch, and a small meteor fragment
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3936,25000); -- Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5480,item3 = 5481,item4 = 5482},1,text)) then -- sky jewel, a mark of battle, some petrified toes, and a fire blossom
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3933,25000); -- helm
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5492,item3 = 5493},1,text)) then -- moon jewel, a mark of swordsmanship, and a water blossom
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3937,25000); -- pauldrons
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5486,item3 = 5487,item4 = 5488},1,text)) then -- astral jewel, a mark of arms, a small sponge, and a scorched rock
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3935,25000); -- Vambraces
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
