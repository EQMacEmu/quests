function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18762})) then
		e.self:Say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes.");
		e.other:Faction(e.self,305,100); 	-- Rogues of the White Rose
		e.other:QuestReward(e.self,0,0,0,0,13513,20); -- torn white tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
