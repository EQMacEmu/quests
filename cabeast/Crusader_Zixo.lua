--Crusader Zixo starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you come to me empty handed, knave? Did you lose your pike?");
	elseif(e.message:findi("no")) then
		e.self:Say("Very good.  Then hold it at your side with pride and while you are at it, try to convince me that you are worth a little more than the slime that you wallowed from.  Straighten up and move out, little wretch!");
	elseif(e.message:findi("yes")) then --The Penance quest
		e.self:Emote("roars at you, heat pouring into his dead eyes. 'Do you know what this means, wretch? I will give you one chance to prevent your floating near my feet. Take this tome and go speak to the Toilmaster. MOVE, while you still have breath.");
		e.other:SummonCursorItem(18271); -- Item: A Ragged Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then	--The Penance quest
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time. 'Lucky you. You have earned a second chance. Praise Cazic-Thule!'");
		e.other:Faction(e.self,440,100); 	--Cabilis Residents
		e.other:Faction(e.self,441,25); 	--Legion of Cabilis
		e.other:QuestReward(e.self,1,1,0,0,5130); -- Item: Partisan's Pike
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
