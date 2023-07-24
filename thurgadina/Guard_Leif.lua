-- tundrabear sandwich portion of 3rd coldain prayer shawl

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1415,item2 = 1425})) then
		e.self:Say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,406,2); -- Faction: Coldain
		e.other:Faction(e.self,405,1); -- Faction: Dain Frostreaver IV
		e.other:Faction(e.self,419,-1); -- Faction: Kromrif
		e.other:Faction(e.self,448,-1); -- Faction: Kromzek
		e.other:QuestReward(e.self,0,0,0,0,1419,50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
