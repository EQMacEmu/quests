function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18760})) then
		e.self:Say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Let's get started with yer training, then, shall we?");
		e.other:Faction(e.self,320,100);	-- Wolves of the North
		e.other:Faction(e.self,327,20); 	-- Shamen of Justice
		e.other:Faction(e.self,328,25);	-- Merchants of Halas
		e.other:Faction(e.self,311,5); 	-- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13511,20); -- Item: Patched Fur Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
