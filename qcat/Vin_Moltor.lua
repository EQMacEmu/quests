function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Heh?? .. BURRP!.. Leave me be will ya.");
	elseif(e.message:findi("paw")) then
		e.self:Say("Paw ya say? Yeah.. Yeah .. I got this ratty old thing still. You want it? Its yours for a Bottle of Kalish and hm.. .. How bad you want it?  Hm..  Two..  No no..  Three Gold..  Er..  NO! Wait. Pie..  Yes! Rat Ear Pie is what I want.. Three Bottles of Kalish and a Rat Eat Pie. If you want the Paw that is my price.");
	elseif(e.message:findi("ring")) then
		e.self:Say("Rings?  I don't know anything about no rings...  My [father] prob'ly sold them or lost them.  They could be anywhere.");
	elseif(e.message:findi("father")) then
		e.self:Say("My father was a drunk and a loser just like me.  He traveled all of Antonica, though.  He even went to Odus once or twice, I think.  He died a long time ago.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "What are you trying to do, cheat me?!  I need three bottles of Kalish and a rat ear pie before I'll give up the paw."
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13016, item2 = 13016, item3 = 13016, item4 = 13192},1,text)) then
		e.self:Say("Ah. Come to ol'Vin my dear sweet Kalish.. Mmmm.. And Rat Ear Pie.. I am going to eat and drink like a KING! Huh? Oh.. The Paw.. Here you go.. Hope it brings you more luck then it did me..");
		e.other:QuestReward(e.self,0,0,0,0,17014);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if((e.wp > 15 and e.wp < 34) or (e.wp > 50 and e.wp < 70)) then
		e.self:SetRunning(true);
	else
		e.self:SetRunning(false);
	end
end
