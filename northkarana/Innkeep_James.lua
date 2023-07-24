function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my shop " .. e.other:GetCleanName() .. ". You'll be happy to hear that I'm fully stocked. It's nice that things are back to normal now that the plague is over.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Ah, praise Karana! These muffins look good enough to eat, har har har! Here is your payment and you have my deepest gratitude. We have to stick together in these times of turmoil you know.");
		e.other:Faction(e.self,291,2,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,-1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,1,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,1,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,{gold = math.random(5,8), exp = 500})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1838}, 0)) then  -- Bag of Bread Loaves
		e.self:Say("Ah finally, fresh bread! All right let me get this on the shelves right away. Here is your payment.");
		e.other:Faction(e.self,291,4,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,-1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,1,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,1,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,{gold = math.random(5,8), platinum = math.random(1,2), exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
