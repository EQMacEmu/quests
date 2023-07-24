function event_spawn(e)
	eq.set_timer("despawn",3600000);
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20451})) then
		e.self:Say("So be it. Do as you have done before and find the next. Teloa is the last.");
		e.other:QuestReward(e.self,0,0,0,0,20451);
		eq.unique_spawn(15170,0,0,-2854,-3840,126.5,61.8); -- spawn teola
		eq.move_to(-1581,-3682,-18,236,true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("growls as his power seeps into the earth.");
		e.self:CastSpell(790,e.self:GetID()); -- Spell: Call of the Storm
	end
end
