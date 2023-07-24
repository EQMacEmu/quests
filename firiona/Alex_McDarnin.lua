function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail! Do you by chance bring news from the North? I sure do miss the cold. It is just a bit too warm for me down here. Well, I wish you the best of luck in your travels. Tomorrow is a new day and I am off in search of [new writings] to take back to the Tribunal.");
	elseif(e.message:findi("new writings")) then
		e.self:Say("There have been tales of new writings being found in some of the ancient ruins that abound outside of this outpost. These writings will be very valuable to my church. The sooner I can return with the writings, the sooner the Tribunal can put the teachings to work. I am always in need of aides so if [you want to help], just say so.");
	elseif(e.message:findi("I want to help")) then
		e.self:Say("We won't be traveling together, but here is what I need. There are four writings that still elude me. Return one of these and I'll spare one of the four extra writings I have. I am looking for the writings called Talisman of Jasinth, Spirit of Scale, Cripple, and Cannibalize III. Be off, and may your travels be safe!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {19269, 19238, 19264, 19272});
	if(count > 0) then
		repeat
			e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19267,19271,19274,19266),1000);
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
