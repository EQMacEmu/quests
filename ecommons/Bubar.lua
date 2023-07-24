function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
	elseif(e.message:findi("gem case")) then
		e.self:Say("Talking of containers? I do not make containers any longer. Provisions are much more profitable. Do you have one of my containers? Most likely you have locked yourself out then. My specialty was the three-lock case. They always lose one of the keys. Hand me the case and at least two of the keys and I can open it for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I need at least two of the case keys and the gem case.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12351,item2 = 12352,item3 = 12350},1,text)) then
		e.self:Say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		e.other:QuestReward(e.self,0,0,0,0,12349,15000); -- Item: A Sparkling Sapphire
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
 
 -- ZONE: ecommons -- NAME: Bubar -- ID: 22033