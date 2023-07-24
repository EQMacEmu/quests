--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("curls back his thin, reptilian-like lips, baring a two rows of jagged, unkempt teeth in a sinister sneer of hate. 'Little worm speaks? How quaint and disgusting you are, worm, and how pathetic. Begone from Kartis, little worm, you do not belong among the shadows. Your ears will melt when the shadow speaks the secrets of its mind and infinite memory. But. . . hehehe. . . but. yes. maybe you little worms think yourselves beyond the shadow's venomous tongue. . . maybe you are. . . heheheh. . . maybe you should stay, worm, and learn from Guwan. He knows much of the shadow's words, the shadow that taints and subdues the world of spirits to its will. Yes, stay worm, and learn from the shadow. . . see how. . . hehehehe. . . see how brave you truly are.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4871, 4872, 4873, 4874, 4875, 4876, 4877}); --Rune Etched Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
