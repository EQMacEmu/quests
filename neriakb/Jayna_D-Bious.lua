function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18754})) then --Tattered Note
		e.self:Say("Welcome, young magician. I am Jayna D'Bious. You have much to learn, so let's get you started. Here is your guild tunic.  Go find Belux, he is in charge of instructing our new recruits.  Study hard, and you will do well.");
		e.other:Faction(e.self,363,100); --The Spurned
		e.other:Faction(e.self,239,-15); --The Dead
		e.other:QuestReward(e.self,0,0,0,0,13583,20); --Torn Red Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41054 -- Jayna_D`Bious
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
