function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the royal court of King Raja Kerrath. King of Shar Vahl City. Descendant of the Great Vah Kerrath. Leader of all Vah Shir!  Please be respectful when you enter the royal throne room.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3647},0)) then
		e.self:Say("Ah, you've arrived, good. Ayyad tells me you're a very quick learner and a skilled sculptor. The king has taken a fondness for a new game that has been very popular with the people of late. This game, called Brehad, requires the use of a set of 10 Runed Vah Shir figurines in order to play. The king's set was recently broken by a rather intrusive rhinobeetle. The king would be very pleased if you would create another set for him. Take this Padded Brehad Case and place 10 figurines in it. Return the completed set to me and I'm sure that the king will reward you nicely.");
		e.other:QuestReward(e.self,0,0,0,0,17106,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3644},0)) then
		e.self:Say("Ah you have done it, Take this note to Ayyad and he should give you the final reward"); -- text made up
		e.other:QuestReward(e.self,0,0,0,0,3643,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
