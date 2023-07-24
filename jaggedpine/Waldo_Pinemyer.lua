function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Eh... Huh... What do you want? Can't you just leave an old man to meditate in peace. Now go away.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8271})) then -- Lunch Bag
		e.self:Say("Huh... Who are you? Oh, you have my lunch. Thank you. Mmmm... This is great. Nerdala sure is an amazing cook.");
		e.other:QuestReward(e.self,0,0,0,0,8272); --  Empty Lunch Bag
	end
	item_lib.return_items(e.self, e.other, e.trade)
end