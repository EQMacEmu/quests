function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rrrribit.. Please, let me go!! I don't want to be eaten!!");
	elseif(e.message:findi("glib sent me")) then
		e.self:Say("Liessss. ...Groakk.. I do not believe you!! Bring me proof. Bring me the necklace of a basher!! ..Groakk..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 13311})) then
		e.self:Say("Groak.. So you are a friend to the froglok. ..Grooakk.. I am soon to die. My precious legs are a delicacy here. Before I go I must contact my brother Grikk. He is a froglok forager in Innothule. Give him this vial. He will know what it means");
		e.other:QuestReward(e.self,0,0,0,0,13375,500);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 13376})) then
		e.self:Say("Grooak.. You have done much to help me. This will come in handy soon. Thank you. Here is Marda's information. Take it to her. They must know. Farewell.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18884,18885),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
