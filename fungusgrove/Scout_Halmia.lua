function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am sorry, but I have been ordered to refrain from speaking to anyone that does not carry the Khati Sha Seal of War. If you do not carry such identification, please move out of my camp.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9057}, 0)) then
		e.self:Say("I thank the spirits that you have arrived. I would not have been able to stop the dark animist if he were to attempt to leave. He has made camp in an empty set of huts. He has moved from hut to hut, but made no attempt to leave the area. I would be wary of traps if I were you. I must admit that I was afraid. That is why I moved to this location. He should still be there though.");
		e.other:QuestReward(e.self,0,0,0,0,9062);
		eq.unique_spawn(157009,0,0,-13,638,-259,128);
		eq.unique_spawn(157069,0,0,-86,585,-259,90);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
