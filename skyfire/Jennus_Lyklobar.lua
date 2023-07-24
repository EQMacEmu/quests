function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello and well met! A " .. e.other:Race() .. " like you does not often come here.. Do you come seeking what I possess? Fire, fire, fire and fire is mine! I surround myself with fire, I bathe in fire, I consume fire, I am the Master of Fire! Hahahaha, but I digress. Have you come for the element of Fire, seeking to fall to the same fate as Trilith Magi'kot?");
	elseif(e.message:findi("i have come for the element of fire")) then
		e.self:Say("The Element of Fire I can provide you, but you must prove you are able to contain its power. Bring me the Torch of the Elements now kept by a doomed lord of merchants, the burning embers from a notable member of wurmkind who can be found a short journey from here and a blazing wand, which you should be familiar with. And you must surrender the tome Rykas gave you. But I think you would be happier if you stayed with me and learned more of the beauty of the one true element, FIRE! FIRE! Hahahahahahah!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18958, item2 = 28007, item3 = 10376, item4 = 28008})) then
		e.self:Say("I see that you are well versed in the ways of Fire. Indeed, if you are as adept in the other, lesser elements, you may just seize the Orb of Mastery after all, and avoid Magi'kot's fate. Take this element, and guard it well, for more trials are to come, I assure you. Succeed and you shall be remembered always! Oh, and " .. e.other:GetCleanName() .. "? Watch out for the puddles! HAHAHAHAHAHA!");
		e.other:QuestReward(e.self,0,0,0,0,28009,3000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
