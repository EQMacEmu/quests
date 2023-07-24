-- Beriol's Research

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello stranger. Im very busy with my work, is there something specific you need to speak to me about?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4769}, 0)) then
		e.self:Say("Ah, of course, my teacher Beriol needs some of these books for his research, here they are. It is a shame my studies have taken me so far from my roots. Hopefully I can return home soon and Visit my family and friends. In the mean time It was very nice to meet you and I wish you the best of luck. Please also return of you wish to deliver more books to my friend Beriol.");
 		e.other:Faction(e.self,1511,25); -- house of midst
		e.other:Faction(e.self,1508,2); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,4770,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
