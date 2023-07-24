function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", what can I help you with today?");
	elseif(e.message:findi("pasta")) then
		e.self:Say("So it's pasta recipes you're looking for, huh? Well, I'm going to have to put you to work then. Are you [willing to run a small errand] for me?");
	elseif(e.message:findi("willing") or e.message:findi("small errand")) then
		e.self:Say("Well, that's nice of you. Here, take this Lunch Bag and bring it to Waldo Pinemyer. He is the steward of the Shrine of Karana on the far edge of forest. Take his lunch to him and bring the empty bag back to me and I'll let you have my pasta recipes.");
		e.other:SummonCursorItem(8271); -- Lunch Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8272})) then -- Empty Lunch Bag
		e.self:Say("Oh why thank you dear. Here's the pasta recipes as I promised.");
		e.other:QuestReward(e.self,0,0,0,0,18427); --  Pasta For All
	end
	item_lib.return_items(e.self, e.other, e.trade)
end