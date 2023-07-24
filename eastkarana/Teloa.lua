function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20451})) then
		e.self:Say("begins walking toward the gathering spot. 'Follow, friend.'");
		eq.start(12);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		eq.signal(15044,1); -- NPC: Althele
		eq.signal(15167,1,2000); -- NPC: Nuien
		eq.signal(15178,1,2000); -- NPC: Sionae
		eq.signal(15043,1,2000); -- NPC: Tholris
	elseif(e.wp == 3) then
		eq.spawn2(15153,14,0,-996,-1529,354,130); -- corruptor
		eq.spawn2(15150,13,0,-1090,-1529,355.4,130); -- reaver
		eq.spawn2(15000,15,0,-1063,-1490,367.5,130); -- reaver
	elseif(e.wp == 4) then
		eq.depop(15178);
		eq.depop(15167);
		eq.depop();		
	end
end