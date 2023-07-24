function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I hope you have come to assist in the defense of the gate. We have had numerous assaults by the goblins. No doubt it is due to those [goblin watchers].");
	elseif(e.message:findi("goblin watchers")) then
		e.self:Say("Goblin Watchers are rumored to be the communication link between goblin outposts and patrols. We have found Goblin Watcher Signal Torches on a few of them. You bring me back no less than three and I will reward you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 3x Watcher Signal Torch (12441)
	if(e.other:GetFaction(e.self) < 6) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12441, item2 = 12441, item3 = 12441})) then
			e.self:Say("Good work, " .. e.other:GetCleanName() .. ". You are on your way to becoming a respected ally of the Iksar Empire. Keep up the good work. Take this reward for a job well done.");
			e.other:Faction(e.self,441,3); -- +Legion of Cabilis
			e.other:Faction(e.self,440,1); -- +Cabilis Residents
			e.other:Faction(e.self,445,1); -- +Scaled Mystics
			e.other:Faction(e.self,442,1); -- +Crusaders of Greenmist
			e.other:Faction(e.self,444,1); -- +Swifttails
			e.other:QuestReward(e.self,0,math.random(5),0,0,12357,10);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Scripted By: Fatty Beerbelly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
