function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 8895}, 0)) then -- Runed Coldain Prayer Shawl (mark A or mark B)
		e.self:Emote("holds the shawl up close to one eye to look at the rune sewn into it. He smiles to himself and then drops it to the ground and places one hand on it. A bright blue glow starts to emanate in the snow, then there is a sudden flash! The Avatar has dissipated. All that is left behind is the Shawl lying in the snow, shimmering with a new power. " .. e.other:GetCleanName() .. " slowly bends down to pick it up, and is infused with a blessing from Brell.");
		e.other:QuestReward(e.self,0,0,0,0,1200,100000); -- Blessed Coldain Prayer Shawl
		eq.get_entity_list():GetMobByNpcTypeID(110019):Say("I must go tell the Dain of these events immediately!");
		eq.get_entity_list():GetMobByNpcTypeID(110069):Say("Yar ya do that ya crazy Coldain.");
		eq.depop(110019)
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
