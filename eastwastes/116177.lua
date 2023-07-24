function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30136}, 0)) then
		e.self:Say("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
		e.other:Faction(e.self,406,5); -- Coldain
		e.other:Faction(e.self,405,1); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-2); -- Kromrif
		eq.unique_spawn(116020, 0, 0, -110, -2715, 152, 200); -- Scarbrow Ga'Thruk
		eq.spawn2(116021, 0, 0, -93, -2696, 149, 200); -- a Ry'Gorr oracle
		eq.spawn2(116021, 0, 0, -91, -2731, 150, 200); -- a Ry'Gorr oracle
		eq.spawn2(116022, 0, 0, -115, -2687, 150, 200); -- a Ry'Gorr invader
		eq.spawn2(116022, 0, 0, -91, -2727, 150, 200); -- a Ry'Gorr invader
		eq.spawn2(116022, 0, 0, -97, -2716, 150, 200); -- a Ry'Gorr invader
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
