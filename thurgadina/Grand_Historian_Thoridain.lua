function event_say(e)
	if(e.message:findi("hail")) then
		eq.signal(115015,1); -- NPC: Loremaster_Dorinan
	end
end    

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1428,item2 = 1418})) then
		e.self:Say("My compliments, " .. e.other:GetCleanName() .. ", what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
		e.other:Faction(e.self,406,5); -- coldain
		e.other:Faction(e.self,405,1); -- dain
		e.other:Faction(e.self,448,-1); -- kzek
		e.other:Faction(e.self,419,-2); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1422,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
