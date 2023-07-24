function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("roars at you and goes back to cleaning itself.  A gleam of hunger flashes in its eyes.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30066,item2 = 30066,item3 = 30066,item4 = 30066}, 0)) then -- Fresh Chunk of Wooly Rhino 4x
		e.self:Emote("jumps at you and snatches the meat from your hand.  It runs away from you and feasts on the other side of the water.  As it runs away you notice a small shiny object fall from its mouth.");
		e.other:QuestReward(e.self,0,0,0,0,30057); -- Golden Broken Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
