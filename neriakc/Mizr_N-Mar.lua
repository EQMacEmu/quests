-- Mizr_N'Mar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you come to buy a scroll from me?");
	elseif(e.message:findi("coin")) then
		e.self:Say("So, you want a coin do you?")
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then
		e.self:Say("Ahhh - gold. Here is the rune you desire.");
		e.other:QuestReward(e.self,0,0,0,0,10531); -- Rune of Fortune (middle)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10791})) then
		e.self:Say("Ah - the Coin of Tash - and already enchanted by.. ? Tarn? Very good! I have enchanted it further - you must now take the coin to Raine Beteria in the Library of Erudin to get the final enchantment.");
		e.other:QuestReward(e.self,0,0,0,0,10792,1000); -- Gleaming Coin of Tash
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
