function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
	elseif(e.message:findi("yes")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I don't believe you.  Now, leave!");	
		else
			e.self:Say("I know of you! You leave before Gnasher calls gnoll watchers. You are no friend of gnolls or Gnasher's human friends...");
		end
	elseif(e.message:findi("no")) then
		e.self:Say("Wrong answer!");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18800})) then
		e.self:Say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
		e.other:Faction(e.self,223,5); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,291,-1); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,273,1); -- Faction: Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,13131,200); -- Item: Case of Blackburrow Stout
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
