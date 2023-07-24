function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am the leader of this beleagured troop of rangers. Even though the once fair Kithicor slowly succumbs to the [darkness] at hand, we shall not abandon the woods without a fight.");
	elseif(e.message:findi("darkness")) then
		e.self:Say("The denizens of these woods are slowly being overrun by dark fiends and shadowed men. As valiantly as we have fought, our numbers dwindle. We know very little about our aggressors, but if we [acquire some information] or perhaps [fine weapons], then we may yet have a chance to retake the woods once more.");
	elseif(e.message:findi("acquire some information")) then
		e.self:Say("Your tracking skills are invaluable to our cause, brave " .. e.other:GetCleanName() .. ". Our scouts have reported of a Ghoul Messenger. They have spotted him traveling between Kithicor and an undead camp in the Plains of Karana. They have attempted to track the monster and obtain any Strategic Domumentation he may be carrying. Perhaps you can succeed where others have failed. Perhaps you can earn my personal short sword.");
	elseif(e.message:findi("fine weapons")) then
		e.self:Say("My soldiers are valiant, but poorly equipped. I have heard of a magical weapon of great power, some call it the Ebony Blade. Amongst the Froglocks there can be found a Minotaur who wields this sword of might. If you are a ranger and could provide me with this sword then I would gladly exchange it with my own meager weapon. If you prefer, you may attempt to [acquire some information] for us instead.");
	elseif(e.message:findi("another service")) then
		e.self:Say("Very well then, your help will bring us closer to solving the mystery of Kithicor! Find Bryn Fynndel in Lesser Faydark and tell him Morin sent you. His band of elven warriors are observing the activities of the Crushbone Orcs and Mistmoore dark elves, perhaps you can help them shed some light on our plight.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16548})) then --Handin: 1x a Strategic Map of Kithicor (16548)
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. "!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles. Perhaps you are willing to perform [another service] on our behalf?");
		e.other:QuestReward(e.self,0,0,0,0,5422,5000); --Short Sword of Morin (5422)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5405})) then --Handin: 1x Ebony Bladed Sword (5405)
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. "!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles. Perhaps you are willing to perform [another service] on our behalf?");
		e.other:QuestReward(e.self,0,0,0,0,5422,5000); --Short Sword of Morin (5422)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20638})) then --Handin: 1x Sealed Ghoul Boss' Log Book (20638)
		e.self:Say("We meet again, " .. e.other:GetCleanName() .. ".  The ghoul boss' log reveals much of the machinations of our dark oppressors, but not enough.  Deliver these orders to Bryn in Lesser Faydark, and he will provide you with another weapon to aid in our defense of Kithicor.");
		e.other:QuestReward(e.self,0,0,0,0,20639,1000); --Orders for Bryn
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------