function event_say(e) -- no matter what you say, he'll always respond to this text.
	e.self:Say('Close the door and be gone fool! You are going to give away my hiding spot!');
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10400})) then
		e.self:Say('At last I may leave this place!! Good luck destroying my abomination, you will surely need it against my most powerful yet uncontrollable creation!');
		e.other:Faction(e.self,238,1); -- Faction: Dark Reflection
		e.other:Faction(e.self,245,-1); -- Faction: Eldritch Collective
		e.other:Faction(e.self,255,-1); -- Faction: Gem Choppers
		e.other:Faction(e.self,240,-1); -- Faction: Deep Muses
		eq.unique_spawn(63111,0,0,60,622,20,0); -- spawns Khrixs Abomination
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Khrix_Fritchoff  zone - unrest.
