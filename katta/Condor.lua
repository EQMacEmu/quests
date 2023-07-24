function event_spawn(e)
	eq.set_timer("attack",1000);
end

function event_timer(e)
	if(e.timer == "attack") then
		eq.attack_npc_type(160141);
		eq.stop_timer("attack");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29846}, 0)) then --  recording stone
		e.self:Say("Pefect, this should give us some idea of what they may or may not know. 'as he puts the stone in his belt pouch.' Very well done, my friend. Have you ever considered a career in espoinage? Take this.  I have little need for it these days - Tilbok will know how to recharge it, 'he says with a wry grin before disappearing back into the shadaows.");
		e.other:Faction(e.self,1503,5);  -- Validus Custodus
		e.other:Faction(e.self,1502,1);  -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  -- Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-2); -- Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- Eye of Seru
		e.other:Faction(e.self,1541,-1); -- Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,5105,5000); -- Mask of Espionage
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
