function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! Beware the giants of the woods. They have a dwelling somewhere out there. Should you stumble upon it, run! Leave the fighting to us.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("I've been ratted out! Very well. I shall sign the order, but first I shall force you to fetch me a set of goblin scout beads. I hear they make fine counters. Bring me the beads and that despicable order and I shall do as instructed.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "No, NO! I want the goblin scout beads and the legion order.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18247, item2 = 12672},1,text)) then --Legion Order (7 signed), Goblin Scout Beads
		e.self:Say("No, NO! I want the goblin scout beads and the legion order.");
		e.other:QuestReward(e.self,0,0,0,0,18248,500); --Legion Order (8 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
