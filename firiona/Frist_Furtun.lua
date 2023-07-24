function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to thee, adventurer! I have been sent to this new land by the Clerics of Tunare in search of the new arcane magiks said to exist beyond this outpost. I myself once searched the nearby Outlands, but to go any further would lead to my certain death. Lately, the dangers have proven to be too much for adventurers and ones like myself. Have you also ventured to this land in search of these [new magiks?]");
	elseif(e.message:findi("new magiks")) then
		e.self:Say("Ahh, wonderful! The more souls who search for these scrolls, the sooner I'll be able to return home and share this knowledge. The magiks are in the form of scrolls held by the strongest creatures of the Outlands. You will probably have the best luck searching in the darkest depths of the dungeons beyond this outpost. You might want to talk to the residents of this outpost for locations of these dreadful places. If you should happen to [have] any [duplicate scrolls], please come speak to me. I might be interested in working out a trade for a scroll you do not yet have.");
	elseif(e.message:findi("duplicate scroll")) then
		e.self:Say("Great! The scrolls I am interested in are those of Death Pact, Upheaval, Yaulp IV, and Reckoning. If you bring me any one of these scrolls, I'll let you reach into my bag and pull out one of the four very rare scrolls that have come into my possession.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {19203, 19205, 19209, 19212, 19233});
	if(count > 0) then
		repeat
			e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19210,19224,19420,19206),1000);
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
