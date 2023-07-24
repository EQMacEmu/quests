--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to New Tanaan. traveler.  The practice of smithing is a time-honored tradition for my people.  My particular specialty is craftsmanship of plate armor for the larger races of Norrath.  Feel free to search my stock for anything you might need to help aid your pursuit of this skill.");
	elseif(e.message:findi("like elisha dirtyshoes")) then
		e.self:Say("Aye, she's a pretty lass. And I am aware of her feelings toward me. I haven't had the courage to approach her though. My family standard has recently disappeared, and no dwarf is the same when their standard is in jeopardy. Seek out Caden Zharik and demand my standard back, I believe he may have lifted it from me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28085})) then--Boiron's Standard
		e.self:Emote("seems to perk up. 'Ah, 'tis a beauty, is it not? I thank you for its safe return. Perhaps I shall go and visit Elisha after all. Please take this letter to her, so she may be ready for me when I arrive.'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28086,100);--Letter to Elisha
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
