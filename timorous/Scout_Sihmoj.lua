function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend, please show me the Seal of Elder Dumul and I will brief you on the situation.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9045})) then
		e.self:Say("Good to see you, now keep your head down friend. He may look out here at any moment, though he's been asleep most of the day. He's been staying in a ruined building on that island over there. I'm sure you can see it from here. You should be able to surprise him with little trouble. Just take care to avoid any traps he may have set. He's proven to be a very capable magic-user.");
		e.other:QuestReward(e.self,0,0,0,0,17360);
		eq.spawn2(96003,0,0,1988,-9203,10,0)
		eq.unique_spawn(96011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
