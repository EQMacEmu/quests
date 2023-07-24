function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, it's so nice to see you again " .. e.other:GetCleanName() .. ". Why don't you have a look around and buy something nice for yourself today?");
	elseif(e.message:findi("tax")) then -- triggers without starting quest
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Oh dear. We had forgotten about those pesky taxes. Here you go, " .. e.other:GetCleanName() .. ". Sorry you had to come collect them. We will try to be on time from now on.");
		e.other:SummonCursorItem(13179); -- Item: Tassens Tax Payment
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Oh my! Smell those muffins, fresh from the oven and ready to serve! They look delicious dear. Here is some money for your trouble.");
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
