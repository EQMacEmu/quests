-- Mining Operation

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I'm waiting to hear from my husband. He's been working on assignment for the Patriarch.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4756}, 0)) then
		e.self:Say("Oh my sweet Daosorak, such a hard worker he is. It brings a smile upon my face to know that his mining operation is going well and that he will be home soon. I thank you for bringing me this letter from him.");
		e.other:Faction(e.self,1512,5); -- house of stout
		e.other:Faction(e.self,1508,1); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
