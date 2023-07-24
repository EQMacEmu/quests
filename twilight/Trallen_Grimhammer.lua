function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and well met " .. e.other:GetCleanName() .. ". Don't listen to ol' Latrag over there he'll never stop brewin' the best durn ale to be found.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots yer gonna have to get me a sun jewel. a mark of destiny. and a fleshy vine.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Latrag is goin' on 'bout his armor again isn't he. Well friend be ye a paladin?");
	elseif(e.message:findi("paladin")) then
		e.self:Say("Of course ya are " .. e.other:GetCleanName() .. ". Why would have ya asked me about the armor if ye wasn't eh. I have the boots, mask, cloak, gauntlets, gorget, girdle, and a sword. Which do ye want?");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask yer gonna have to get me a moon jewel, a mark of blessings, and some crystallized dew.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak yer gonna have to get me a star jewel, a mark of the steadfast, a lexicon of the sun, and some glade dew.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets yer gonna have to get me a cloud jewel, a mark of honor, and some naturally formed quartz.");
	elseif(e.message:findi("gorget")) then
		e.self:Say("For the gorget yer gonna have to get me a sky jewel, a mark of gallantry, and a lunar marked stone.");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the girdle yer gonna have to get me a meteor jewel, a mark of heart, a lexicon of the moon, and a dread leech eye.");
	elseif(e.message:findi("sword")) then
		e.self:Say("For the sword yer gonna have to get me an astral jewel, a mark of the noble, a hardened clay sculpture, and a runic ear plug."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5904,item3 = 5905},1,text)) then -- sun jewel, a mark of destiny, and a fleshy vine
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3978,25000); -- Blessed Knight's Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5908,item3 = 5909,item4 = 5910},1,text)) then -- star jewel, a mark of the steadfast, a lexicon of the sun, and some glade dew
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3980,25000); -- Blessed Knight's Cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5911,item3 = 5912},1,text)) then -- cloud jewel, a mark of honor, and some naturally formed quartz
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3981,25000); -- Blessed Knight's Gauntles
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5915,item3 = 5916,item4 = 5917},1,text)) then -- meteor jewel, a mark of heart, a lexicon of the moon, and a dread leech eye
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3983,25000); -- Blessed Knight's Girdle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5913,item3 = 5914},1,text)) then -- sky jewel, a mark of gallantry, and a lunar marked stone
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3982,25000); -- Blessed Knight's Gorget
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5906,item3 = 5907},1,text)) then -- moon jewel, a mark of blessings, and some crystallized dew
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3979,25000); -- Blessed Knight's Mask
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5918,item3 = 5919,item4 = 5920},1,text)) then -- astral jewel, a mark of the noble, a hardened clay sculpture, and a runic ear plug
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3984,25000); -- Blessed Knight's Defender
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
