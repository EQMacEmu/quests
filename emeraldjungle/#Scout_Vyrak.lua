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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9038})) then
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. "! Judging by the speed with which it altered that spirit, this totem must be extremely powerful. I've wrapped it, so you should be safe from its magic. Just be sure to keep it in the case. Once you have all of the totems, seal the case and make your way back to Shar Vahl. They will be waiting for you there. I'll continue to look for the person that perpetrated this vile act.");
		e.other:QuestReward(e.self,{items = {9039,9031}}); -- Item: Official Seal of the Khati Sha
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
