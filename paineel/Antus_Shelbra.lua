function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". You have come to me searching for tasks and tasks I have. Would you judge yourself an [experienced heretic] or one who has [much to learn]?");
	elseif(e.message:findi("much to learn")) then
		e.self:Say("Very well, " .. e.other:GetCleanName() .. ". I do have a task for you. There is an old and frail Erudite male who now lives in Toxxulia named Aglthin Dasmore. He has left the ways of Cazic-Thule and no longer practices our craft. He has been stripped of his power and wealth, so he spends his time fishing by the river. Our great Lord of Fear has decreed that his life is forfeit. Slay him, and bring me proof of the deed.");
	elseif(e.message:findi("experienced heretic")) then
		e.self:Say("Ah. Excellent. I have just the task for you, " .. e.other:GetCleanName() .. ". In Kerra Ridge, there is a particular cat named Kirran Mirrah that we have been using to gather information about, well, certain aspects of cat society. He is no longer providing information for us and we have something for him that may encourage him to assist again. Ha! Hand him this sealed bag for us. It may just change his point of view. Hahaha!");
		e.other:SummonCursorItem(9968); --Smelly Sealed Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9969})) then --Aglthin's Fishing Pole
		e.self:Say("Yes, this will do.");
		e.other:Faction(e.self,265,3);  --Heretics
		e.other:Faction(e.self,254,-3); --Gate Callers
		e.other:Faction(e.self,242,-3);  --Deepwater Knights
		e.other:Faction(e.self,231,-3);  --Craftkeepers
		e.other:Faction(e.self,233,-3);  --Crimson Hands
		e.other:QuestReward(e.self,4,8,4,0,13697,500); --Staff of the Abattoir Initiate
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 9967})) then --Karran's Head
		e.self:Say("Ah, it seems as if he was not a very cooperative kitty. So much for family. Oh well, take this token change as a show of my appreciation. Cazic-Thule shines on you in all his glorious fear this day, young one.");
		e.other:Faction(e.self,265,5);  --Heretics
		e.other:Faction(e.self,254,-5); --Gate Callers
		e.other:Faction(e.self,242,-5);  --Deepwater Knights
		e.other:Faction(e.self,231,-5);  --Craftkeepers
		e.other:Faction(e.self,233,-5);  --Crimson Hands
		e.other:QuestReward(e.self,2,8,2,2,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:paineel  ID:75089 -- Antus_Shelbra

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
