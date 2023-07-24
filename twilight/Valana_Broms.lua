function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("studies you for a moment and then speaks, 'Greetings, I'm Valana.  Many come here to speak with those in the tower.  What brings you here?");
	elseif(e.message:findi("armor")) then
		e.self:Say("The armor that I have to reward you is a headband, gi, arm wraps, leggings, shawl, wrist wraps, and sandals. My friend and guard Allise has the rest if you wish to speak with her, just ask about armor.");
	elseif(e.message:findi("headband")) then
		e.self:Say("For the headband you must retrieve for me a sun jewel, a mark of peace, an oblong clay bowl, and a great gem.");
	elseif(e.message:findi("gi")) then
		e.self:Say("For the gi you must retrieve for me a moon jewel, a mark of tranquility, sharpened rock hopper claws, and some etched steel shavings.");
	elseif(e.message:findi("arm wraps")) then
		e.self:Say("For the arm wraps you must retrieve for me a star jewel, a mark of harmony, a triple beaded circlet, and some fresh spring water.");
	elseif(e.message:findi("leggings")) then
		e.self:Say("For the leggings you must retrieve for me a cloud jewel, a mark of meditation, Ralcom's Writ, and a jar of ointment.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl you must retrieve for me a sky jewel, a mark of unity and a pewter figurine.");
	elseif(e.message:findi("wrist wraps")) then
		e.self:Say("For the wrist wraps you must retrieve for me a meteor jewel, a mark of true self, and a coiled steel wire.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you must retrieve for me an astral jewel, a mark of form, and some spire spirit dust.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5194,item2 = 5192,item3 = 5193,item4 = 4488},1,text)) then -- headband
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3775,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5197,item2 = 5195,item3 = 4489,item4 = 5196},1,text)) then -- gi
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3776,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5244,item2 = 5198,item3 = 4490,item4 = 5199},1,text)) then -- arm wraps
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3777,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5247,item3 = 5245,item4 = 5246},1,text)) then -- leggings
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3778,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5248,item2 = 5249,item3 = 4492},1,text)) then -- shawl
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3779,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5251,item2 = 5250,item3 = 4493},1,text)) then -- wrist wraps
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3780,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5252,item3 = 5253},1,text)) then -- sandals
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3781,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
