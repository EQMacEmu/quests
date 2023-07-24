--The tome keeper will give us one of a few possible tomes, chosen randomly, that will tell us how to proceed on the next part of the Shackle of Tynonnium quest.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shows awareness of you, but ignores you completely.");
	elseif(e.message:findi("peace of mind")) then
		e.self:Emote("begins to speak to you without movement of his rotted mouth, you realize his words are pouring into your mind. 'You seek peace of mind, and may you have it. First though, your Shackle of Steel. One Shackle for one tome.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4196})) then
		e.self:Emote("drops a tattered tome at your feet and says nothing more. You pick it up and place it among your things.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18359,18462,18463,18464,18465,18466,18467,18468,18469,18470));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
