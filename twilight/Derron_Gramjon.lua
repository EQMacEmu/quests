function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s piercing eyes meets yours. 'Are ye a guest of Vornol's too? Have faith my friend but don't let that durn mage fool you, I know him better than anyone else. Well except for Valana of course.'");
	elseif(e.message:findi("cleric")) then
		e.self:Say("I thought you might be. I have some armor to reward those that prove to be most holy.");
	elseif(e.message:findi("armor")) then
		e.self:Say("The armor I have is a helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. The rest you will have to get from my friend and guard Kayn. Just ask him about armor.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots you must prove yourself by bringing me a star jewel, a mark of belief and a light etched sapphire.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you must prove yourself by bringing me a moon jewel, a mark of truth, and a light etched ruby.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate you must prove yourself by bringing me a sky jewel, a mark of faith, genuine leather padding, and a brazier of light.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves you must prove yourself by bringing me an astral jewel, a mark of purity, a lexicon of omens, and a candle of rites.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm you must prove yourself by bringing me a cloud jewel, a mark of remedy, a vial of holy water, and a holy statuette.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons you must prove yourself by bringing me a sun jewel, a mark of the divine, and decorative bracers of wistfulness.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces you must prove yourself by bringing me a meteor jewel, a mark of the holy, a tome of deities, and a restored tapestry.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4839,item3 = 4840},1,text)) then -- boots
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3742,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4838,item2 = 4829,item3 = 4489},1,text)) then -- bracer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3741,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4798,item2 = 4797,item3 = 4796,item4 = 4492},1,text)) then -- breastplate
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3737,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4818,item3 = 4810,item4 = 4809},1,text)) then -- greaves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3739,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4795,item3 = 4793,item4 = 4794},1,text)) then -- helm
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3736,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4820,item2 = 4819,item3 = 4488},1,text)) then -- pauldrons
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3740,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4799,item2 = 4493,item3 = 4808,item4 = 4800},1,text)) then -- vambs
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3738,25000);
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
