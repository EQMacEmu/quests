function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh hello there. I'm in charge of the docks here and wife to Alton.");
	elseif(e.message:findi("alton")) then
		e.self:Say("My husband is the owner of Jern's Rest. It's been his family for ages ever since his great grandaddy Jern built it.");
	elseif(e.message:findi("ranger")) then
		e.self:Say("Very well. If you want the Woodsman's [Mantle], Woodsman's [Mask], Woodsman's [Cape], Woodsman's [Guantlets], Woodsman's [Choker], or Woodsman's [Belt] I have some errands that need to be done.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh you wish to get the armor that Alton's great granddaddy used to wear. If you are a ranger just let me know.");
	elseif(e.message:findi("belt")) then
		e.self:Say("If you want the Woodsman's Belt bring me a moon jewel, a mark of the environment, a gold pointer, and a broken ancient blade.");
	elseif(e.message:findi("cape")) then
		e.self:Say("If you want the Woodsman's Cape bring me a sky jewel, a mark of creatures, a wondrous stone, and a marble statuette.");
	elseif(e.message:findi("choker")) then
		e.self:Say("If you want the Woodsman's Choker bring me an astral jewel, a mark of ambidexterity, and a small ancient sculpture.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("If you want the Woodsman's Guantlets bring me a meteor jewel, a mark of animals, and a tattered old card.");
	elseif(e.message:findi("mantle")) then
		e.self:Say("If you want the Woodsman's Mantle bring me a sun jewel, a mark of rivers, and a temporal sack.");
	elseif(e.message:findi("mask")) then
		e.self:Say("If you want the Woodsman's Mask bring me a cloud jewel, a mark of stone, and a platinum chain.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5850,item2 = 5849,item3 = 5848,item4 = 4489},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3957,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5844,item2 = 5698,item3 = 4492,item4 = 5699},1,text)) then -- cape
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3954,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5981,item3 = 5847},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3956,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5845,item2 = 4493,item3 = 5846},1,text)) then -- gaunts
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3955,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5690,item2 = 4488,item3 = 5691},1,text)) then -- mantle
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3950,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5696,item3 = 5697},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3953,25000);
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
