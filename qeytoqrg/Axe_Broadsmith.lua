function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. The fishing is sparse here. You would fare better at [Lake Rathe].");
	elseif(e.message:findi("lake rathe")) then
		e.self:Say("Beyond the Plains of Karana can be found a pass to Lake Rathe. I have heard stories of a giant water beast and underwater cities. I wish I knew how to swim.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18893})) then -- A Sealed Letter
		e.self:Say("So you are the new warrior. Let us test your skill. Across the pond is a skeleton. See him? Engage him in combat. He awaits. Return his skull to me and I shall call you a Steel Warrior. Be quick. He will dissipate soon.");
		eq.unique_spawn(4192,0,0,1055,3858,-19); -- a_strange_skeleton
		-- Confirmed Live Factions
		e.other:Faction(e.self,311,2,0); -- Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13397})) then -- Skull
		e.self:Say("So you have returned. Victory is yours, young Steel Warrior. Take this letter of recommendation to Brin Stolunger at the arena in Qeynos. You have passed.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,311,5,0); -- Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Knights of Truth
		e.other:QuestReward(e.self,math.random(10),0,0,0,18895,750); -- Letter of Recommendation
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
