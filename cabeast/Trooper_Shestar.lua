--Before quest works, must add tradeskills:  Shestar's Scaled Coif(3 Loose Scales (Item 12466), 1 Unfinished Coif(Item 12468)) then, blacksmithing, I believe trivial in teens, does not always work, yields Shestar's Scaled Coif(Item 12467), yields unfinished coif on failure (Item 12468).

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("My father was a great blacksmith.  He taught me how to make great items such as the [Shestar scaled coif].  Alas, smithing was not my rebirth, but rather the life of a warrior.");
	elseif(e.message:findi("shestar scaled coif?")) then
		e.self:Say("The Shestar Scaled Coif was a light coif my father would fashion out of loose scales from the scaled wolves.  I have some scales on me and if you bring me three loose scales I will have enough to create the coif for you, but I require you to also pay a fee of five gold.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	local text = "I asked for three loose wolf scales and my fee of five gold.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12466, item2 = 12466, item3 = 12466, gold = 5},1,text)) then
		e.self:Emote("quickly inserts the scales into a half finished coif and hands you the coif. 'I am afraid that is not enough and I cannot possibly complete the task while on duty. You must go and find an additional three Scaled Wolf Scales and take them, along with the Unfinished Coif, to the nearest forge and complete the smithing yourself. I hope you are a blacksmith.'");
		e.other:QuestReward(e.self,{itemid = 12468}); -- Item: Shestar's Unfinished Coif
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
