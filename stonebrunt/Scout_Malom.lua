function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031}, 0)) then
		e.self:Say("Thank you for coming. I am surprised that you were able to find me. I barely know where I am at this point. I followed the vile beast that has been corrupting the spirits, but he eluded me after I followed him to that ridge up there. Fortunately, the spirit that you seek has remained at the site of its transformation. Use levitation to work your way up the falls and return to me with the totem that you will acquire from releasing the spirit.");
		eq.unique_spawn(100019,0,0,-3346,4266,2057,0); -- NPC: The_Spirit_of_Torment
		eq.unique_spawn(100022,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
