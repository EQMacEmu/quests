function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3872}, 0)) then -- note from kellari
		e.self:Say("Of all of the horrid coincidences! Colian just walked by me a few moments ago!  She was heading to the Northeast.  Please run and catch her.  Do not let her escape!  I will go and notify the authorities. Take her back to Governor Unja, if you capture her before help arrives. Good luck!");
		eq.spawn2(172000,1,0,820,743,-61,201);  
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
