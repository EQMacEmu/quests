-- The Pulsating Rock

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you adventurer. Is there something I can assist you with? I have been quite busy as of late with the study of this [mysterious glowing rock] I was presented with and I do not have much time for small talk.");
	elseif(e.message:findi("mysterious glowing rock")) then
		e.self:Say("Well if you look closely, I have it right here. It has been glowing since I first received it. But since it was delivered to me it has lost a lot of its aura. I feel I will need another sample soon, it seems to lose its [energy] as time goes on.");
	elseif(e.message:findi("energy")) then
		e.self:Say("This I do not know and I am trying to discover. However, as I said before, this rock is slowly losing its energy it seems. I will need another [sample rock] soon.");
	elseif(e.message:findi("sample rock")) then
		e.self:Say("I believe these rocks are from the Paludal Caverns, if my sources were correct. Beetles that crawl over and feed off the rock structures there might explain the glowing, if they are the origins of these mysterious rocks. To further my studies I will need another pulsating rock. Will you [retrieve this rock] for me?");
	elseif(e.message:findi("retrieve this rock")) then
		e.self:Say("Fantastic " .. e.other:GetCleanName() .. ". Please return to me at once with a pulsating rock. We will conclude our dealings at that time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4768}, 0)) then
		e.self:Say("This is it, this is what I am looking for to continue my studies. It is generating the same if not more energy then the rock before it! Excellent work, " .. e.other:GetCleanName() .. ". You have my sincere thanks. Should you collect further samples in the future please bring them to me directly.");
		e.other:Faction(e.self,1511,25); -- house of midst
		e.other:Faction(e.self,1508,2); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
