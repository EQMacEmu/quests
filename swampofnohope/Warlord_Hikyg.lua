function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What business do you have speaking to an Iksar Warlord? Be gone before you find yourself served as my evening meal. Go to Captain Nedar if you wish to assist my garrison. Fool.");
	elseif(e.message:findi("trooper reporting for duty")) then
		e.self:Say("It is about time they sent new troopers for my garrison!! This is the toughest garrison in Kunark!! And you're going to help prove it. The legion needs to get a hold of some new frog shields called Krup warrior guards. You're going to take this pack and fill it with not one, but four!! When you can return a full, combined pack to me, maybe you will show me that you're not as weak as you look!!");
		e.other:SummonCursorItem(17043); -- Item: Swamp Garrison Pack
	elseif(e.message:findi("geozite")) then
		e.self:Say("Do not speak to me of the geozite tool.  Seek out Drill Master Vygan within the Fortress of Talishan.  He shall answer your questions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I was expecting the heads of Narsh, Barsh and Flendle, as well as your soldier's pike. Then, you will be promoted to the rank of Trooper.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18211})) then
		e.self:Say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this bag. Your task is to seek escaped frogloks near this gate. Apparently, the slaves have been breaking loose from their shackles and attempting to head home. Fill and combine within the bag their broken shackles and return the filled box to me for your geozite tool.");  --not live text
		e.other:QuestReward(e.self,0,0,0,0,17994);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12661})) then
		e.self:Say("Good work, " .. e.other:GetCleanName() .. ". You would make a fine trooper in my garrison. As instructed by the War Baron, I reward you with the geozite tool. May you find your place among the Legion of Cabilis and win many battles.");
		e.other:Faction(e.self, 441,10); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 440,2); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 445,2); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 444,2); -- Faction: Swift Tails
		e.other:Faction(e.self, 442,2); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,math.random(10),0,0,12657);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12435, item2 = 12436, item3 = 12437, item4 = 5133},1,text1)) then
		e.self:Emote("hands you plans for a trooper's pike head. Congratulations. You are now a trooper of the Legion of Cabilis. Now you may fight with honor and a mighty weapon.");
		e.other:Faction(e.self, 440,2); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 441,2); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 445,2); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 444,2); -- Faction: Swift Tails
		e.other:Faction(e.self, 442,2); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,12477,1200);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12913})) then
		e.self:Say("What?!! You crushed all the shields!! You croak-faced skulking brute!! You don't deserve to be in my garrison!! I am going to recommend you for a promotion in hopes that you will be sent to hunt dragons and meet your end!");
		e.other:Faction(e.self, 440,2); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 441,2); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 445,2); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 444,2); -- Faction: Swift Tails
		e.other:Faction(e.self, 442,2); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,18073,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Scripted By: Fatty Beerbelly
--additional work by:  Jaekob
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
