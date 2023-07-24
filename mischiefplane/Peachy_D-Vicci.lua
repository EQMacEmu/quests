function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there! Wanna test your luck? I have here my mystery satchel filled with gifts. Sometimes you get something nice, and sometimes ya get nothing at all. Wanna give it a shot? It only costs four funnies.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9504,item2 = 9504,item3 = 9504,item4 = 9504}, 0)) then
		e.self:Emote("reaches into her satchel and pulls out a small box. 'Here ya go! Enjoy it. Come back soon. Just a warning though, I cant give you a box that you already have. There isn't enough for everyone you know!'");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9505,9506,9507,9508,9509,9511,9512,9513,6877));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
