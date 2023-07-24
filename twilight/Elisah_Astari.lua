function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Not to be rude, but I am on a very important mission right now and I cannot be bothered.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29868}, 0)) then -- Letter of Relief
		e.self:Say("So you have been sent to relieve me? Not that I need I need it but if you were ordered by Yuka then I will tell you what I know. Tergus Raslin was given the escape route that leads through Twilight Sea. He was to suppose to come through Scarlet Desert, so he should be coming this way. It has been a few days though and I do not know what has become of him. I will head back to Sanctus Seru to let Yuka know you are on the case.");
		e.other:Faction(e.self,1485,10); -- Eye of Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1486,-1); -- Heart of Seru
		e.other:Faction(e.self,1483,1); -- Seru
		e.other:Faction(e.self,1542,-1); -- Haven Smugglers
		e.other:Faction(e.self,1503,-1); -- Validus Custodus
		e.other:Faction(e.self,1504,-2); -- Magus Conlegium
		eq.unique_spawn(170002,1,0,1859,903,55,0);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

