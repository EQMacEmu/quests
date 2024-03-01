--Cloak of Greater Pernicity
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. "! I wish I had time to chatter but my duties to the list and the Grand Librarian keep me extremely busy.");
	elseif(e.message:findi("duties")) then
		e.self:Say("I am the aid for the Grand Librarian he has me cataloging tomes on the master list. I spend so much time working on the list I haven't had time to go collect these items from the planes my uncle in Ak'Anon keeps pestering me over. He wants to upgrade his scrapyard back in Ak'Anon, and says only these items will do. Would you be willing to do me a favor?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Wonderful! If you would gather the following; a bundle of superconductive wires, silicorrosive grease, a gold tipped boar horn and a shard of pure energy, then take them to my uncle Sanfyrd in Ak'Anon. I would really appreciate being able to get back to my work uninterrupted.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15980})) then --Note to Fimli
		e.self:Say("Great! I see you got the items to uncle; perhaps he will stop badgering me now and let me be in my work. Hmmmmm, Uncle mentions in his letter that he worked out a way for a gnome to make a giant set of crab crackers. He states it is useless in Norrath but I may be able to make some use of it out here. I guess it wouldn't hurt to share it with you and file it away in the library. To create the cracker combine two metal rods, firewater and a knuckle joint in a toolbox. Interesting indeed, anyways here if your reward; I hope you can put it to good use.");
		e.other:QuestReward(e.self,0,0,0,0,15802,1000); --Cloak of Greater Pernicity
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
