function event(e)
	eq.set_timer("depop",600000);
end

function event_timer(e)
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10683}, 0)) then
		e.self:Emote("reaches forward as his hands materialize to grasp the box of belongings then places them carefully in his crypt. He then reaches towards " .. e.other:GetCleanName() .. " again as an etherial scimitar materializes in his hands and is offered to " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,1538,10); -- Spirits of Katta Castellum
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1502,1); -- Katta Castellum Citizens
		e.other:QuestReward(e.self,0,0,0,0,10699,1000); --  Scimitar of Ethereal Energy
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
