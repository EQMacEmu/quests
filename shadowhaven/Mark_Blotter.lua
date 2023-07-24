function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, friend! Feel free to browse my selection of scrolls and scroll accessories but be careful when handling them, some of them are quite old and the parchment has seen better days.");
	elseif(e.message:findi("golden seal tube")) then
		e.self:Say("Ah hah! You are in luck. I just received a sealed golden scroll tube the other day that I think you will find quite acceptable. It seems to be quite old and the craftsmanship is superb! I will part with it for no less than one-thousand gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 1000}, 0)) then
		e.self:Say("Here it is, I am sure you will be very satisfied with this purchase!");
		e.other:QuestReward(e.self,0,0,0,0,10671); -- Sealed Golden Scroll Tube
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
