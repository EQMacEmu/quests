function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("He.. Hello. Wou.. would you like to buy something? Be quick or [Kizdean] will return!");
	elseif(e.message:findi("Kizdean")) then
		e.self:Say("Sshhh..Please..save me. Get..rid..of..him.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 17931})) then
		e.self:Say("Oh!!! Thank you. You are my hero. I have been held captive by that horrid dark elf for weeks. Please take this. It was the key to a gem case which was stolen from me by an unseen rogue. If you find the gem case you can take it and the key to the original craftsman. He can open it with only two keys.");
		e.other:QuestReward(e.self,0,0,0,0,12352,15000); -- Tiny Key 2
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF -- ZONE: commons -- NAME: Noresa_Sparkle