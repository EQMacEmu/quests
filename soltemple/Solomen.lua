function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ah, I see you have found my study.  This is where I study and scribe the history of magic in Norrath.");
	elseif(e.message:findi("history")) then
		e.self:Say("I have worked to chronicle everything from the beginnings of magic to what we consider the modern day of magic.  Solusek Ro has been very generous to those who wield magic in Norrath.  But throughout history there is one thing I have noticed - too much power corrupts the soul.  I have seen and documented that the strongest wizards and those closest to Solusek Ro become corrupted by their power.");
	elseif(e.message:findi("wizard")) then
		e.self:Say("Unfortunately, I don't have time to speak of such things right now.  But I could use your help since you are here.  I have here an envelope that I need delivered to one Camin.  You can find him near the wizard tower in the city of Erudin.  He is a sage like myself whose knowledge rivals my own.  Do you [agree] to undertake my task?");
	elseif(e.message:findi("agree")) then
		e.self:Say("Here you are, then.  Good luck on your journey.");
		e.other:SummonCursorItem(18088); -- Item: Note to Camin
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14340})) then
		e.self:Say("You actually did it! I never would have thought that anyone could have truly followed this path. This is a tribute to your intelligence and patience. Here, take this staff and know that you have made Solusek Ro and all the wizards of the world proud this day.");
		e.other:Faction(e.self,404, -50,0); -- Truespirit
		e.other:QuestReward(e.self,0,0,0,0,14341);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
