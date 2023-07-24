function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18852})) then --Blood Stained Note
		e.other:Faction(e.self,221,100); --Bloodsabers
		e.other:Faction(e.self,262,-15); --Guards of Qeynos
		e.other:Faction(e.self,296,10); --Opal Dark Briar
		e.other:Faction(e.self,341,-25); --Priest of Life
		e.other:Faction(e.self,230,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13597,20); --Dark Purple Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
