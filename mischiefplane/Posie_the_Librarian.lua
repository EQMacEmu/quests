function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("SHHHHH! QUIET!! And how dare you enter here without a library card! It's " .. e.other:Race() .. " like you who have ruined your own books! You'll not ruin mine!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9510}, 0)) then
		e.self:Say("Ahh, you brought your card. Let's see here. " .. e.other:GetCleanName() .. ", is it? Here's the only book we have stocked at the moment. It's missing the chapter on wealth but there's an excellent story about melting your clothing in a pot on page 11. It's a one of a kind story written completely in invisible ink. Enjoy!");
		e.other:QuestReward(e.self,0,0,0,0,17325,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
