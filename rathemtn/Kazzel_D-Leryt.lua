function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetLevel() >= 50) then
			e.self:Say("Finally, a servant worthy of my needs! Apparently you are of high status, which perhaps means you might know a master [jeweler] capable of faceting a very magical, yet fragile stone?");
		else
			e.self:Say("Begone you pathetic bug. You are not worthy of my presence.");		
		end
	elseif(e.message:findi("jeweler")) then
		e.self:Say("You must provide me with 2000 platinum pieces as a deposit, then you must take this stone to a master jeweler or [Darfumpel], have it faceted and return it to me along with an orb of pure crystal, a gold necklace the color of snow, and the [blood of Xenyari]. Do that and I will provide you with magic beyond that of most knights of darkness.");
	elseif(e.message:findi("darfumpel")) then
		e.self:Say("Darfumpel is a gnomish shopkeeper here in the Rathe Mountains. He apparently has a new technique for gemcutting, however, he will not deal with me due to my affiliation with necromancy. Speak with him. Perhaps he might be willing to aid you for a price, but make sure you hide your true nature. He despises dark magic.");
	elseif(e.message:findi("blood of xenyari")) then
		e.self:Say("Xenyari is a druid who inhabits these parts. She is rarely seen, however, I require a droplet of her blood. Here is the catch though, and one for which you may be well suited if you desire magic of the knights of darkness - Xenyari must give of herself willingly. In other words, you cannot take her blood by force. Rather, she must give you her blood of her own accord.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Quickly now, give me the rest of the ingredients for the telesm...";
	
	if(e.other:GetLevel() >= 50 and item_lib.check_turn_in(e.self, e.trade, {platinum =2000})) then
		e.self:Say("Very well, " .. e.other:GetCleanName() .. ". Take this gem to a master jeweler and return it to me with the other three items.");
		e.other:QuestReward(e.self,0,0,0,0,10191);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10192, item2 = 10147, item3 = 10218, item4 = 10196},1,text)) then
		e.self:Say("You are quite cunning. After I fashion this telesm, take it back to Xenyari. She would 'enjoy' another 'gift,' eh?");
		e.other:QuestReward(e.self,0,0,0,0,10193);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10194})) then
		e.self:Emote("laughs heartily and whispers to you, 'Well done, worm, your servitude to my will has now expired...'");
		e.other:QuestReward(e.self,0,0,0,0,0,25000);
		eq.unique_spawn(50335,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()); --spawn a_monstrous_zombie
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10197})) then
		e.self:Say("Oh! Umm... Well, I was just playing with you. Certainly you know I was joking! We had a deal and I will abide by the terms of our agreement. Here is my payment for your services. Bye..");
		e.other:QuestReward(e.self,0,0,0,0,15692,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50272 -- Kazzel_D-Leryt
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------