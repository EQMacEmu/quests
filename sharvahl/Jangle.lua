function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hi there! Are you perhaps a musician? I have lots of finely crafted musical instruments for sale. Each one has its own unique tone. Take a look and see if there are any instruments here to suit your performance needs. Just tap me when you are ready to make a purchase.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5960})) then
		e.self:Say("I would love to fill this order for you friend, but the lad that we sent out into the moor to hunt up our last batch of owlbear guts has not returned. No guts, no strings. I'm afraid that I have neither. If your master will allow it, perhaps you could go gather the guts for me. If you complete this task, I will waive the fee for his next couple of orders. I'm sure that he'll find that proposal pleasant enough. Here's a bag to gather the guts in. Please fill it before you return to me.");
		e.other:QuestReward(e.self,0,0,0,0,17612);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5961})) then
		e.self:Say("Thank you for gathering these materials for me. This bag should last for some time. I'll need to clean this bag and make the strings. While I'm doing that, please take this note back to Gawfed and have him specify how many of each string he wants. He only listed the sizes in his note, not the quantities.");
		e.other:Faction(e.self,1513,10); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,5962,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5963})) then
		e.self:Say("Very good, he's got it all written down this time. These strings should work nicely for him, and let's not mention the fact that they are absolutely free. Take care and remember to shop here for all of your Jharin needs.");
		e.other:Faction(e.self,1513,10); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,5965,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
