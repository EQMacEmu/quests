function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! You will have to excuse me. I have no time to talk right now and I prefer to be left alone. Please leave.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18742})) then -- A tattered note
		e.self:Say("Welcome to the Guild, here's your guild robe. Now, let's get to work.");
		e.other:Faction(e.self,296,100,0); -- Opal Dark Briar
		e.other:Faction(e.self,271,25,0); -- Dismal Rage
		e.other:Faction(e.self,239,25,0); -- The Dead
		e.other:Faction(e.self,238,25,0); -- Dark Reflection
		e.other:Faction(e.self,221,25,0); -- Bloodsabers
		e.other:QuestReward(e.self,0,0,0,0,13562,20); -- Dark Stained Robe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:9073 -- Opal_Darkbriar
