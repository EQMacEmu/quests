-- part of seventh coldain prayer shawl

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I wasn't always a pottery salesman ye know, I used to forge fine velium weapons and even had me own shop.  Unfortunately no one wanted to buy anything from Brittleblade's, sl I work with clay now, care to purchase somethin?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1198}, 0)) then
		e.self:Say("So, you've been chosen to attempt the rune, eh? Been ages since anyone's even made an attempt. The rune represents the very essence of our people, our culture, and our religion. Take a sea shell runed with enduring breath and a small brick of velium and grind them together in a mortar and pestle. Add water to the powder and model the rune. Fire the rune with water and the best of firing sheets. Show the product to Trademaster Kroven.");
		e.other:QuestReward(e.self,0,0,0,0,1198);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
