function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("lets out a resounding belch. 'Har there lad! Ye be sure 'nuff to tell em all that Brewmaster Latrag is retiring.'");
	elseif(e.message:findi("retiring")) then
		e.self:Say("Ya got that right. I'm goin' to concentrate more on me devotion to Brell as a holy knight!");
	elseif(e.message:findi("knight")) then
		e.self:Say("I be a paladin of Brell thar " .. e.other:GetCleanName() .. ". Might ye be a paladin yerself?");
	elseif(e.message:findi("paladin")) then
		e.self:Say("That's good. Ya know I have some armor ye might be interested in.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Yar! I have me a helm, breastplate, vambraces, greaves, pauldrons, and a bracer. If ye want the rest talk to the mighty holy warrior Trallen over there about armor.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate ye gotta bring me a star jewel, a mark of courage, a white marble bowl, and a jagged reed.");
	elseif(e.message:findi("vambrace")) then
		e.self:Say("For the vambraces ye gotta bring me a cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves ye gotta bring me a sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons ye gotta bring me a meteor jewel, a mark of daring, and a life gem.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer ye gotta bring me an astral jewel, a mark of reliance, and some blessed water");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm ye gotta bring me a moon jewel, a mark of valor, a withered branch, and a pale pearl.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5902,item3 = 5903},1,text)) then -- astral jewel, a mark of reliance, and some blessed water
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3977,25000); -- Blessed Knight's Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5891,item3 = 5892,item4 = 5893},1,text)) then -- star jewel, a mark of courage, a white marble bowl, and a jagged reed
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3973,25000); -- Blessed Knight's Breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5897,item3 = 5898,item4 = 5899},1,text)) then -- sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3975,25000); -- Blessed Knight's Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5888,item3 = 5889,item4 = 5890},1,text)) then -- moon jewel, a mark of valor, a withered branch, and a pale pearl
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3972,25000); -- Blessed Knight's Helm
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5900,item3 = 5901},1,text)) then -- meteor jewel, a mark of daring, and a life gem
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3976,25000); -- Blessed Knight's Pauldrons
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5894,item3 = 5895,item4 = 5896},1,text)) then -- cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3974,25000); --  Blessed Knight's Vambraces
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
