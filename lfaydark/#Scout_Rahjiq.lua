function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9034})) then
		e.self:Emote("wraps the totem and returns it with the seal you gave him and says, 'That spirit was very powerful. I'm glad that you were able to release it. Please keep this totem safe until you can return to Shar Vahl. Once you collect all of the totems, seal the box and return it to your master. May the spirits watch over you!'");
		e.other:QuestReward(e.self,{items = {9031,9035},exp = 5000});
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
