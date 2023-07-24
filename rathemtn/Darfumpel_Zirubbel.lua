function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am Darfumpel, master jeweler and proprietor of this shop. How might I assist you today? Perhaps you need a stone [cut] or some jewelry [repaired]?");
	elseif(e.message:findi("cut")) then
		e.self:Say("Yes, I use a new gemcutting technique I designed myself. It will bring out the beauty of any gem. However, as arrogant as this may sound, I do not cut just any ordinary stone. They must be rare or of extraordinary quality. Have you an exceptional stone that requires faceting? If so, what type of gem is it?");
	elseif(e.message:findi("repaired")) then
		e.self:Say("Although more mundane a task. I do have a shop to keep up and so I repair jewelry for a nominal fee.");
	elseif(e.message:findi("hyacinth")) then
		e.self:Say("A hyacinth, eh? That is quite a rare stone. Quite fragile and easily shattered, too. With my new technique, I can assure you I will not destroy the gem, however, it will cost you. 1000 platinum coins is my fee. Provide me with the coin and the gem and I will cut it for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Do you have the other requirement?";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10191, platinum = 1000},1,text)) then
		e.self:Say("I have not seen a gem such as this in quite some time! It was not since I dabbled in a bit of necro? Wait? What are you going to use this for? Never mind. I do not wish to know. Here, take your gem and leave!");
		e.other:QuestReward(e.self,0,0,0,0,10192,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50270 -- Darfumpel_Zirubbel
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------