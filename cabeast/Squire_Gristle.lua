--Squire Gristle starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail Broodling! When you walk the halls of this tower, you should always display the status that you have earned within our ranks. It brings me pride to see the might of the brood displayed by one such as you while I reflect here in the tower. Do you have the tool of your caste with you at this time?");
	elseif(e.message:findi("yes")) then
		e.self:Say("Ah... Yes... very good! Continue to work at this pace and the enemies of the Greenmist will fall beneath the blades of Cazic-Thule! Now move out... To Victory!");
	elseif(e.message:findi("no")) then --The Penance quest
		e.self:Emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. We do have a pit for you, should this prove to be impossible.");
		e.other:SummonCursorItem(18271); -- Item: A Ragged Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then	--The Penance quest
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time. Lucky, you... you have earned a second chance. Praise Cazic-Thule!");
		e.other:Faction(e.self,440,100); 	--Cabilis Residents
		e.other:Faction(e.self,441,25); 	--Legion of Cabilis
		e.other:QuestReward(e.self,1,1,0,0,5120); -- Item: Pawn's Khukri
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
