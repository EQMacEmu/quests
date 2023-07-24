function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to see you have made it to the Bazaar " .. e.other:GetCleanName() .. ", if you should need any smithing supplies I will be happy to assist.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 26055})) then--Tattered Newsletter
		e.self:Say("Ah great, I have been meaning to go and pick one of these up from the Trade Commissioner but I have been very busy with my work. I'm sure Henry has been waiting for my sales report so here it is. Please return it to him for me if you could and thanks again!");
		e.other:QuestReward(e.self,0,0,0,0,26056,5000); -- Saleals Economy Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
