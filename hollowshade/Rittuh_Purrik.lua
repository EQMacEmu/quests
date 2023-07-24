function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Stock up on goods while you can in the relative safety of this outpost. When you are out in the field, you'll need every bit of protection you can afford.  If you happen upon any Grimlings, spare them no mercy. My husband was tortured by grunts in the forest.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5573}, 0)) then
		e.self:Say("Come to do some work, " .. e.other:GetCleanName() .. ".  Looks like you need to gather some rockhopper tails.  Take this backpack and fill it up");  -- need live text
		e.other:QuestReward(e.self,0,0,0,0,17609);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5582}, 0)) then
		e.self:Say("Well, look at you! You're quite the hunter. Not a bad job at all, young citizen. We can sure use a few more like you. I think a little padding of your daily report is in order considering the amount of work that you've done for us. Take this back to citizen Miann. She'll be pleased with you. I wrote it up pretty nice for you. Take care and good luck with your training.");
		e.other:Faction(e.self,1513,1);
		e.other:QuestReward(e.self,0,0,0,0,5577,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
