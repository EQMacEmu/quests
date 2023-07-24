function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 10999,item2 = 11039,item3 = 10975})) then
		e.self:Emote("fashions the ebon drakeling scales into a grip on the shaft of the staff, places the harpies eye within a metal fixture, fastens the fixture to the top of the staff and carves some delicate runes into the wood. 'click... wrrrr... a staff for you sir. Click... wrrr.'");
		e.other:QuestReward(e.self,0,0,0,0, 11081,100);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 10703,item2 = 11082})) then
		e.self:Emote("fashions the coyote pelt into a grip on the shaft of the axe and carves some delicate runes into the blade. 'click... wrrrr... an axe for you sir. Click... wrrr.'");
		e.other:QuestReward(e.self,0,0,0,0, 11077,100);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 13054,item2 = 11084})) then
		e.self:Emote("fashions the giant rat pelt into a grip on the hilt of the stiletto and carves some delicate runes into the blade. 'click... wrrrr... a stiletto for you sir. Click... wrrr.");
		e.other:QuestReward(e.self,0,0,0,0, 11079,100); -- Plague Rust Stiletto
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
