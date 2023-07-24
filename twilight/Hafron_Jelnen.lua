function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, friend.  I'm one of master Vornol's four apprentices.  I am being trained to be an expert on all things dealing with the element of fire."); 
	elseif(e.message:findi("armor")) then
		e.self:Say("This armor is indeed mighty if you wish to have it you must do some tasks for me. I have the coif, mail, vambraces, greaves, pauldrons, bracer, and boots. My sister, Sarah, has the rest just ask her about armor and she will help you.");
	elseif(e.message:findi("boots")) then
		e.self:Say("To get the boots you must fetch for me a moon jewel, a mark of the seer, and a hewed augury stone.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("To get the bracer you must fetch for me a sun jewel, a mark of soul, and a spirit gem.");
	elseif(e.message:findi("coif")) then
		e.self:Say("To get the coif you must fetch for me a star jewel, a mark of sight, an ancient sun fetish, and the tablet of spirits.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("To get the greaves you must fetch for me a meteor jewel, a mark of omens, a pouch of false gems, and an adorned cap");
	elseif(e.message:findi("mail")) then
		e.self:Say("To get the mail you must fetch for me a cloud jewel, a mark of vision, a writ of safid, and some throwing bones.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("To get the pauldrons you must fetch for me a astral jewel, a mark of spirit, and Genalan's Chronicle.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("To get the vambraces you must fetch for me a sky jewel, a mark of prophecy, a polished stone fetish, and a woven anklet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4936,item3 = 4937},1,text)) then -- moon jewel, a mark of seers, and a hewed augury stone.
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3755,25000); --  Augur's Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4934,item3 = 4935},1,text)) then -- sun jewel, a mark of soul, and a spirit gem
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3754,25000); --  Augur's Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4898,item3 = 4899,item4 = 4900},1,text)) then -- star jewel, a mark of sight, an ancient sun fetish, and the tablet of spirits.
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3749,25000); --  Augur's Coif
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4929,item3 = 4930,item4 = 4931},1,text)) then -- meteor jewel, a mark of omens, a pouch of false gems, and an adorned cap
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3752,25000); --  Augur's Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4908,item3 =  4909,item4 = 4910},1,text)) then -- cloud jewel, a mark of vision, a writ of safid, and some throwing bones.
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3750,25000); --  Augur's Mail
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4932,item3 = 4933},1,text)) then -- astral jewel, a mark of spirit, and Genalan's Chronicle
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3753,25000); --  Augur's Mantle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4918,item3 = 4927,item4 =  4928},1,text)) then -- sky jewel, a mark of prophecy, a polished stone fetish, and a woven anklet
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3751,25000); --  Augur's Vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
