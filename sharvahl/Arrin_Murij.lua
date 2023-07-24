function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. friend.  May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6266},0)) then
		e.self:Emote("reaches behind the counter and pulls up a large spear shaft. 'Here you go, friend.' He says as he hands the staff to you. 'Be sure to take your finished spear back to Amat when you're done with it. He'll need to see your sonic wolf bane spear and the apprentice cloak you have on before he can promote you to the next rank. If he isn't able to promote you, I can't send out any more vouchers. That's an order from the General. We're training citizens as fast as we can. The war with the grunts seems to be picking up. Well, take care friend and say hello to Amat for me. He's an old war buddy of mine.'");
		e.other:QuestReward(e.self,0,0,0,0,6147); -- Item: Dar Khura Spear Shaft
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
