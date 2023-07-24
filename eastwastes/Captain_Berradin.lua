function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1459}, 0)) then -- tainted avalanche ale
		e.self:Say("You gotta be kiddin me, Avalanche Ale? Haven't had a bottle a this stuff in ages. Brell bless you, " .. e.other:GetCleanName() .. "! Glug, glug, glug...");
		eq.set_timer("doanim",53000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "doanim") then
		e.self:DoAnim(15);
		eq.stop_timer("doanim");
		eq.set_timer("depop",5000);
	elseif(e.timer == "depop") then
		e.self:Say("Uhhh... I'm not feeling so good. Someone call for a cleric.");
		-- confirmed respawn at spawnpoint even if pulled out of hut.
		eq.unique_spawn(116037,0,0,2365,-61,150,119); -- NPC: #Captain_Berradin
		eq.stop_timer("depop");
		eq.depop_with_timer();
	end
end
