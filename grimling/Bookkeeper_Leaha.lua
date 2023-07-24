function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, friend. May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6219}, 0)) then
		e.self:Say("What's this? Why was Kuash unable to bring this to me himself? Oh, never mind... he's not worth the aggravation at this point. Run this report to Hollowshade and have Guard Kliknaw sign it as well. Then take it back to whomever you got it from... and tell that particular whomever to stop slacking. It's not proper for a citizen to act like that... let alone a Khala Dun.");
		e.self:Emote("sighs");
		e.other:Faction(e.self,1552,1);
		e.other:QuestReward(e.self,0,0,0,0,6220,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
