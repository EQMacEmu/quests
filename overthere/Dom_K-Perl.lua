function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my little refuge of the mind. Here you may find passage to the grand worlds within a fine book. I have few books for sale, but any good book is rare in the realm of Norrath. On occasion, I even have [rare finds]. Be sure to use good lighting when reading. Strain the brain, not the eye, I always say.");
	elseif(e.message:findi("rare finds")) then
		e.self:Emote("starts rummaging through a pile of books and scrolls.");
		e.self:Say("Oh yes, yes, yes. Rare books occasionally make their way to me. Ahhh!! I have one title, Before Green. Sounds like a bit of fiction. What would you like to [purchase]?");
	elseif(e.message:findi("purchase")) then
		e.self:Emote("puts on a monocle and begins to look over the book.");
		e.self:Say("Hmmmm, Looks fairly valuable. In honor of the book's title, I shall allow you to trade for it with a fine emerald. What a bargain!");
	elseif(e.message:findi("scribed tome pages")) then
		e.self:Say("I can create a special magic scribed tome page. It has no words, but is not meant to be read. To create one, I will need some illweed parchment and my fee of 2 gold pieces. Once I have these, you may have one scribed tome page.");
	elseif(e.message:findi("spectacle")) then
		e.self:Say("My spare reading spectacles were stolen by froglok raiders in the swamps. I gave chase but the little buggers hop faster than I run. They were hopping with such fury that they dropped a [tome binder].");
	elseif(e.message:findi("binder")) then
		e.self:Say("I have a tome binder with the title 'The Origins of Pain'. Sounds like good reading, but it appears to be missing the pages it once held. If you want it, I shall give it to you for a bottle of blood ink from Cabilis and my spare reading spectacles.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10029})) then --there is no dialogue for this hand in on live, just hands you the book
		e.other:QuestReward(e.self,0,0,0,0,18068,500);
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
