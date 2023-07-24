function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18753})) then --tattered note
		e.self:Say("Greetings, and welcome to the Tower of the Spurned! I am Camia V'Retta, master enchantress. Here is your guild tunic, wear it with pride.  Go to Ulvex D'Jerna; he whall help you with your new studies.");
		e.other:Faction(e.self,363,100); --The Spurned
		e.other:Faction(e.self,239,-15); --The Dead
		e.other:QuestReward(e.self,0,0,0,0,13582,20); --Ruined Red Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41052 -- Camia_V`Retta
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
