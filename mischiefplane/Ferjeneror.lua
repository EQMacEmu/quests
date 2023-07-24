function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you have something ferjeneror?");
	elseif(e.message:findi("yes")) then
		e.self:Say("THEN GIVE IT!");
	elseif(e.message:findi("no")) then
		e.self:Say("Then DIE!");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1791}, 0)) then
		e.self:Say("Indeed you found the one I need. I give you this to feed your greed. A paper knight of blackened heart. A paper throne to match his art. A paper crown of darkest night. A throne of ice to chill the sight. Inside the deck you place the four, to guard the wings that fly the floor.");
		e.other:QuestReward(e.self,0,0,0,0,17054,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
