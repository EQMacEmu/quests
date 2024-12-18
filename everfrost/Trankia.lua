-- Part of the quest for Tishan's Kilt

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmmph.");
 	elseif(e.message:findi("avenge.* brother")) then
		e.self:Say("My brother was part of a raiding party that adventured into the Caverns of Guk. Somewhere within he was betrayed and left for dead by the dastardly brother of Karg IceBear - Martar. I want you to find me what remains of my brothers body and bring it back to me. I am told that he died within a mine shaft.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Wait, " .. e.other:GetCleanName() .. ", are you not forgetting something?";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10528})) then
		e.self:Say("You must be another one from Vilissia. I will tell you what I tell all the others--you must help me [avenge] my [brother] before I will help you attain Tishan's Kilt.");
		e.other:QuestReward(e.self,0,0,0,0,18797,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10556})) then
		e.self:Say("Oh Wulfthan, look what has become of you. I told you that you should not have trusted Martar.  " .. e.other:GetCleanName() .. ", as a final service, I want you to kill Martar IceBear for me. He is known to roam these parts. Bring me the Warthread Kilt that he wears and my two reminder notes, and I will give to you Tishan's Kilt.");
		e.other:QuestReward(e.self,0,0,0,0,18798,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1347,item2 = 18797,item3 = 18798},1,text)) then
		e.self:Say("Ah, Wulfthan, you are at last avenged. Thank you, " .. e.other:GetCleanName() .. "- please take this kilt as a reward for services well done.");
		e.other:QuestReward(e.self,0,0,0,0,2365,1500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- Trankia