function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18757})) then --tattered note
		e.self:Say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		e.other:Faction(e.self,239,100); --The Dead
		e.other:Faction(e.self,303,15); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-15); --King Naythox Thex
		e.other:Faction(e.self,275,-15); --Keeper of the Art
		e.other:Faction(e.self,245,-15); --Eldritch Collective
		e.other:Faction(e.self,1522,-200); --Primodial Malice
		e.other:QuestReward(e.self,0,0,0,0,13586,20); --Black Training Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
