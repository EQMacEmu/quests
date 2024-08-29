--Nihilist Zeegarn starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mind yourself within Cabilis. We will not tolerate any mischief. If you don't heed my warnings, you may be sentenced to the pit of the Crusaders of Greenmist. You don't want that! Also, you should always wear your robe when entering these walls. You do have your Drape of the Brood, correct?");
	elseif(e.message:findi("yes")) then
		e.self:Say("Very good. Please keep it on and bow before the will of the Cazic-Thule when entering these walls. Be off.");
	elseif(e.message:findi("no")) then 											--The Penance quest
		e.self:Say("What is this?' The Nihilist barks in disbelief. 'You have lost your drape? This is unacceptable! Take this note and report to the Toilmaster at once. Read it on the way and praise Cazic-Thule for any mercy that you may be granted!");
		e.other:SummonCursorItem(18271); -- Item: A Ragged Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then	--The Penance quest --faction hits not confirmed
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.'Lucky you. You have earned a second chance. Praise Cazic-Thule!'");
		e.other:Faction(e.self,443,100); --Brood of Kotiz
		e.other:Faction(e.self,441,25); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,12407); -- Item: Drape of the Brood
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
