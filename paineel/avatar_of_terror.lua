count = 0;

function event_spawn(e)
	eq.set_timer("shout",17000);
end

function event_timer(e)
	if(e.timer == "shout") then
		count = count + 1;
	end
	if(count) then
		e.self:Shout("Grrrraaaaarrrrrg! The stench of fear permeates the walls of this city! I will forge one item for the faithful of our Lord Cazic-Thule! Make haste!  My time here is short!");
	end
	if(count == 10) then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14106})) then -- mundane mask
		e.self:Say("I grant you a mask crafted with my own essence! Wear it in honor of your devotion to our Lord Cazic-Thule!");
		e.other:Faction(e.self,265,50,0); -- Faction: Heretics
		e.other:Faction(e.self,242,-50,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-50,0); -- Faction: Gate Callers
		e.other:Faction(e.self,231,-50,0); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-50,0); -- Faction: Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,14108,5000); -- terror forged mask
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
