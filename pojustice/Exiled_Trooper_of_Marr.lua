function event_spawn(e)
	eq.set_timer("depop", 120000);
	eq.set_timer("fd", 100);	-- have to set appearance change on a timer after spawning because the server code is retarded
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	elseif(e.timer == "fd") then
		eq.stop_timer("fd");
		e.self:SetAppearance(3); -- FD
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29281}, 0)) then
		e.other:QuestReward(e.self,{items = {29292,29281}});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
