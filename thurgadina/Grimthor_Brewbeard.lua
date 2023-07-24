-- part of 7th coldain prayer shawl

function event_say(e)
	if(e.message:findi("cutlass fish oil")) then
		e.self:Say("Grab a pole and fish the waters in Iceclad until you catch yourself three Iceclad Cutlass fish. Place them in this oil extractor and you'll have whatcha need.");
		e.other:SummonCursorItem(17514); -- Item: Fish oil extractor
	elseif(e.message:findi("liquid velium")) then
		e.self:Say("Collect a small piece of velium and a bottle of rubbing alcohol and brew them together in a barrel. It aint easy, but it should prove to be a minor task for the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1856}, 0)) then
		e.self:Say("That looks about right. You're moving along well outlander. Next you'll be needin to brew up a sacred ink to fill the grooves in your rune. Take Iceclad Cutlass fish oil, liquid velium, and some Royal Kromrif blood, brew them in the barrel here then take the product and the rune and combine them in a fletching kit. Show Talem Tucker the resulting item if yer successful.");
		e.other:QuestReward(e.self,0,0,0,0,1856);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

