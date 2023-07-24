function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings noble one. I am Jala, Master weaver of Shar Vahl. I have been perfecting the art of [Xakra] weaving lately. Please have a look at what I have crafted, maybe you will find something to suit your fashion needs.");
	elseif(e.message:findi("xakra")) then
		e.self:Say("Xakra is the mystical ethereal silk woven by the Shak Dratha. I believe they use the mystical ethereal shadow silk woven by the Xakra worms. Although this magical silk is quite beautiful, it is also highly unstable if you weave them in large quantities. I have discovered that the hides of rock hoppers manages to hold the silk together fairly well. I can use some help in collecting the silks to continue my craft, if you are [willing].");
	elseif(e.message:findi("willing")) then
		e.self:Say("Wonderful! I'm not much of a hunter myself, so as you can see it can be quite difficult for me to obtain these silks. If you can bring me four of them. I would greatly appreciate it.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2789, item2 = 2789, item3 = 2789, item4 = 2789})) then
		e.self:Say("Woohoo! Thank you so much " .. e.other:GetCleanName() .. "! Hey, maybe you would like to try your hand at weaving as well. If you combine the silks in that loom over there, you can make some decent thread to work with. Make four of them and bring them to me. I will judge your craftsmanship.");
		e.other:Faction(e.self,1513,5); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2791, item2 = 2791, item3 = 2791, item4 = 2791})) then
		e.self:Say("Not bad at all! You definitely have some hidden talent there " .. e.other:GetCleanName() .. ". Keep at it and you may just become a master tailor yourself. Here, take this with you. It will help protect you from the nasty bite of the Xakra worms.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
