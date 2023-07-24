function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I've been told that you may be the wolf slayer. I don't know though. You look a little scrawny to be the one. I suggest you prove it and bring me the Wolf Slayer. Once I've seen it we shall speak again."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32170}, 0)) then
		e.self:Say("I'm sorry to have doubted you before. Please forgive me. My mind is not what it used to be. Since you are the wolf slayer perhaps you cn help us find something. We've been unable to find it. If you can combine the Centerstone along with the Wolf Slayer in this box and bring back what you have. I should be able to reward you once we are through here.");
		e.other:QuestReward(e.self,{items = {17073,32170},exp = 10000});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 32300}, 0)) then
		e.self:Say("I knew you'd come through. This is going to make someone really happy. Take this for your troubles.");
		e.other:QuestReward(e.self,0,0,0,0,32189,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
