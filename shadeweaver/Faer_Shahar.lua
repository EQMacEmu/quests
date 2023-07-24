--Quest: Garbage Collecting
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings friend, please mind your [garbage]. They attract the hoppers who can be a danger to our young ones.");
	elseif(e.message:findi("garbage")) then
		e.self:Say("Careless travelers from Shadow Haven leave their rubbish along our roads. They attract vermin and can smell just horrid. I try my best to keep the road clean, but it seems that I cannot keep up with the filth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30618, item2 = 30618, item3 = 30618, item4 = 30618})) then
		e.self:Say("Thank you friend, you have done an excellent service for our city. Take this and may it help you on your endeavors.");
		e.other:QuestReward(e.self,7,0,0,0,17890,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
