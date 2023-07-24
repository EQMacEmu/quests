function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hurry, hurry step right up and buy a ticket! Show your skills at battle! Amaze the crowds with your great skill! Buy a ticket from me, and when you think you are prepared for the fight give me the ticket!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29866}, 0)) then -- Arena Ticket
		e.self:Say("So you wish to show off your skills in the arena? Well come on let us see what you are made of! Be warned that this is a fight to the death, if a guard sees you fleeing like a coward they will assist in helping to finish you off!");
		eq.unique_spawn(eq.ChooseRandom(159108,159103,159109),0,0,-231,-1514,-68,128);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29867}, 0)) then -- Arena Medal
		e.self:Say("Wonderful battle skills! You have pleased the audience. Here are a few coins for your valiant effort!");
		e.other:Faction(e.self,1499,10); -- Citizens of Seru
		e.other:Faction(e.self,1484,1); -- Hand of Seru
		e.other:Faction(e.self,1486,1); -- Heart of Seru
		e.other:Faction(e.self,1485,1); -- Eye of Seru
		e.other:Faction(e.self,1487,1); -- Shoulders of Seru
		e.other:Faction(e.self,1502,-5); -- Katta Castellum Citizens
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,10),math.random(1,20),0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
