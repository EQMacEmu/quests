function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met friend. I am sorry but I musn't converse while I am on duty.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3881}, 0)) then
		e.self:Emote("gasps silently for air and the falls completely still! No one seems to have heard you.");
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1502,1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,1); -- Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-1); -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1485,-1); -- Eye of Seru
		e.other:Faction(e.self,1541,-1); -- Hand Legionnaires
		e.other:QuestReward(e.self,0,0,0,0,3883);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
