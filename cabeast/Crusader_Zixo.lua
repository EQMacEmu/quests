--Crusader Zixo starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you come to me empty handed, knave? Did you lose your pike?");
	elseif(e.message:findi("no")) then
		e.self:Say("Ah... Yes... very good! Continue to work at this pace and the enemies of the Legion of Cabilis will fall beneath the blades of Cazic-Thule! Now move out... To Victory!"); --Could not find original text, modified SK version to fit.
	elseif(e.message:findi("yes")) then --The Penance quest
		e.self:Emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit for you, should this prove to be impossible."); --Could not find original text, modified SK version to fit.
		e.other:SummonCursorItem(18271); -- Item: A Ragged Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then	--The Penance quest
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time. 'Lucky you. You have earned a second chance. Praise Cazic-Thule!'");
		e.other:QuestReward(e.self,0,0,0,0,5130); -- Item: Partisan's Pike
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
