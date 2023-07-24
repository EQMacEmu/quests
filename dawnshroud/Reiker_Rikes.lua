-- Fungus covered mushrooms hand in
-- Pt. 2

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I be Reiker Rikes! The fastest gnome in the woods!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local mushroom = item_lib.count_handed_item(e.self, e.trade, {31479});
	
	if(mushroom > 0) then
		repeat
			e.self:Emote("grins. 'These should go nicely in my stew.'");
			e.other:QuestReward(e.self,{exp = 15000});
			mushroom = mushroom - 1;
		until mushroom == 0
	end		
	item_lib.return_items(e.self, e.other, e.trade)
end
