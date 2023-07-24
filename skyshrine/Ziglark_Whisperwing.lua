function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", I am the Herald of Lord Yelinak, the great ice dragon.  I'm charged with taking care of all mundane tasks that are too trivial for the great dragon.");
	elseif(e.message:findi("mundane task")) then
		e.self:Say("I have many tasks. First, I must make sure all inhabitants of the Skyshrine are looked after, the cleaning cubes are keeping all things neat and orderly and also permit passage through the Skyshrine to those worthy.");
	elseif(e.message:findi("passage")) then
		e.self:Say("I hold the keys to all passage through the Skyshrine. Only followers of worth are allowed passage through the Skyshrine.");
	elseif(e.message:findi("worth")) then
		e.self:Say("You must first prove this to me before I allow you through our home.  Wenglawks of Kael is an acquaintance of ours who has been feeding us information on the storm giants' movements through Velious.  Lately our couriers to him have disappeared.  What you must do is take this request to him along with 200 platinum as payment for the storm giants' locations and return the information to me.  After you complete this task for me, we will discuss passage through the Skyshrine.");
		e.other:SummonCursorItem(28600); -- Message to Wenglawks
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28601}, 0)) then
		e.self:Say("Excellent, you have gotten the information back and you are still in one piece!  Perhaps you could be useful to our cause.  Here is the key to leave the Skyshrine.  Just place it on the flaming pot of the dragon statue, near the center of the pool in the courtyard.");
		e.other:QuestReward(e.self,0,0,0,0,28602,1000); -- Shrine Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
