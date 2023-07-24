function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time.  If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then
		e.self:Say("It is a comfort to meet you, " .. e.other:GetCleanName() .. ". I was afraid that you might not be able to track me with weather out there being what it is. I must admit that my fondness of the snow is at an all time low right now. The sooner you release the spirit that resides in here, the sooner we can make a way back to a warmer climate.");
		eq.spawn2(73107,0,0,-135,973,-105,0); -- NPC: The_Icebound_Spirit
		eq.unique_spawn(73005,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
