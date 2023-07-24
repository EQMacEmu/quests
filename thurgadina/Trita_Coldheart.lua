-- frost bunny stew portion of 3rd coldain prayer shawl

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1426,item2 = 1416})) then
		e.self:Say("Thanks for the Snow Bunny Stew, " .. e.other:GetCleanName() .. ", I haven't tasted snow bunny stew this good in quite some time. Be a dear and take this back to Mordin for me.");
		e.other:Faction(e.self,406,2); -- coldain
		e.other:Faction(e.self,405,1); -- dain
		e.other:Faction(e.self,448,-1); -- kzek
		e.other:Faction(e.self,419,-1); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1423,10000);	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
