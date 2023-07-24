-- --18959 : ella foodcrafter : two tasks; shiny tin bowl and a clue
-- hardened mixture and runecrested bowl : softly glowing stone

function event_waypoint_arrive(e)
	if((e.wp == 13) or (e.wp == 19)) then
		local randtext = eq.ChooseRandom(0,1,2);
		if(randtext == 0) then
			e.self:Emote("hums a little as she drops off supplies for the deputies.");
		elseif(randtext == 1) then
			e.self:Say("Hope things are going well here.");
		elseif(randtext == 2) then
			e.self:Say("Air's nice as always out here.");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi, hi. I've got a lot to do, many mouths to feed, some filthy goblins to smack. If you don't need me for something, please let me go back to my work. Karana watch over you.");
	elseif(e.message:findi("two tasks")) then
		e.self:Say("Well, ya ask before ya act. That's a good sign. What I need isn't easy to find. First, I need a mixture. Plain sounding enough but it's a special one. Cleanses the mind and focuses the earth's energies into a forest walker's mind. I don't know how to make it. I don't even know what it's called. I merely know it exists and we'll be needing it for our task. When ya do find how to make it ya can mix it in that bowl. Keep it when you're done, it's a good bowl.");
	elseif(e.message:findi("second task")) then
		e.self:Say("Good, ya didn't run off without finding out what else ya need to do. Second, I need a special type of bowl. An ancient type of bowl, which strengthened the food placed inside it, once made by the elves of old. Again, I cannot tell ya how it is made for the making was lost to the ages. Seek this knowledge and these items out in the lands. Come to me when ya have found both.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18959})) then
		e.self:Say("Hmmm. I've been waiting for someone to bring me this. I'm sorry such a young one as you has taken up this task. Maybe the sky god blesses ya though. Aye, ya have that look in your eye. Our task is to focus the blessings of the gods and cleanse the filth from the land. I have two tasks for ya.");
		e.other:QuestReward(e.self,0,0,0,0,17860);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20473, item2 = 20460})) then
		e.self:Emote("smiles slowly as she works the mixture in the bowl and it starts to shine with power. 'This is... a piece of a lost magic item known as Nature's Gem. When restored to completeness I've heard its healing powers will be extraordinary. Take it now. I will take the bowl and hopefully do some good from my end. From here, you can go many ways but I can't guide your path step by step. The only advice I can give you is to look for ones such as yourself.'");
		e.other:QuestReward(e.self,0,0,0,0,20462);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20468})) then
		e.self:Emote("hands you a scimitar she usually wears at her side. 'Thank you, " .. e.other:GetCleanName() .. ". With this we can hold back the corruption. We have learned something new though. Not only is this work the responsibility of the lord of hatred alone. For some reason we cannot know the lord of disease has decided it worthy of his time to work in conjunction with Innoruuk. The spirits of the three main continents, Faydwer Antonica and Kunark, have been corrupted. Look for the corrupted forces of the land and heal them. When you have found them all then take my scimitar and the spirits to Xanuusus.'");
		e.other:QuestReward(e.self,0,0,0,0,20440);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
