function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi, I'm one of master Vornol's four apprentices. My specialty is with all things concerning the element of air.");
	elseif(e.message:findi("armor")) then
		e.self:Say("You must have spoken with master Vornol. He has me keeping this armor for him and various tasks for those to do who wish to wear it. Tell me are you a magician?");
	elseif(e.message:findi("magician")) then
		e.self:Say("Very good, the pieces that I have are the sandals, mask, cloak, gloves, choker, belt, and a staff.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you must bring me an astral jewel, a talisman of wind, and a mark of aeration.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask you must bring me a sun jewel, a talisman of earth, and a sack of shadowed soil.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak you must bring me a moon jewel, a water idol, a water marked scroll, and a runed ring of water.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves you must bring me a star jewel, petrified bones, and a vial of dark earth.");
	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker you must bring me a cloud jewel, fiery gourd, and a flaming candle.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt you must bring me a sky jewel, a vial of the morning mist, fastened links and a water etched wand.");
	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff you must me a meteor jewel, a fire etched wand, an earth etched wand, and an air etched wand.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4586,item3 = 4587},1,text)) then -- sandals
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3690,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 4588,item3 = 4589},1,text)) then -- mask
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3691,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 4597,item3 = 4598,item4 = 4599},1,text)) then -- cloak
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3692,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 4600,item3 = 4601},1,text)) then -- gloves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3693,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 4602,item3 = 4603},1,text)) then -- choker
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3694,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 4604,item3 = 4828,item4 = 4605},1,text)) then -- belt
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3695,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 4672,item3 = 4674,item4 = 4673},1,text)) then -- staff
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3696,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1547,5); -- Vornol Transon
end
