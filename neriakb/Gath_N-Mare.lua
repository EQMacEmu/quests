function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18755})) then --Tattered Note
		e.self:Say("I am Gath N'Mare, master wizard of the Tower of the Spurned. Welcome to our guild. Let's get started, shall we?  Here is your tunic, represent us well with it. Shanez X'Teria is our beginning guild trainer. He will teach you the basics and give you a solid learning foundation of magic.  Good luck, and study hard.");
		e.other:Faction(e.self,363,100); --The Spurned
		e.other:Faction(e.self,239,-15); --The Dead
		e.other:QuestReward(e.self,0,0,0,0,13584,20); --Stained Red Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
