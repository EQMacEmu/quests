function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then
		e.self:Say("It is a relief to see you. I was beginning to fear that no one would be able to find me in this miserable swamp. I wanted to get word back to Shar Vahl about my location, but I was afraid that I would lose the trail off this spirit if I were to break off my pursuit. This location is as strange of a destination for our spirit as it is dangerous. I have seen the spirit several times and it is very out of place here. I can't help but think that the transformation has left the spirit confused beyond all repair.");
		eq.spawn2(83244,0,0,2170,-2903,4,0); -- NPC: The_Spirit_of_Sorrow
		eq.unique_spawn(83046,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
