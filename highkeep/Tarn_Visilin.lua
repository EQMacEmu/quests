function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am Tarn Visilin.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10790})) then -- Coin of Tash
		e.self:Say("The Coin of Tash. Very good. I have laid a basic enhancement on it - to get it further enhanced you must take the coin to Mizn N'Mar in the Library of Neriak.");
		e.other:QuestReward(e.self,0,0,0,0,10791,1000); -- Glowing Coin of Tash
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10086,gold = 50})) then -- Gold x 50, Glamour Stone
		e.self:Say("Here is your stone, fully enchanted."); -- Made this text up
		e.other:QuestReward(e.self,0,0,0,0,10087); -- Glowing Glamour Stone
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10019})) then -- Bloodstone
		e.self:Say("I see that Sultin has sent you to me.  Very well, here are your gloves.");
		e.other:QuestReward(e.self,0,0,0,0,2355); -- Gleaming Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
