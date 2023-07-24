function event_signal(e)
	e.self:Say("Ooh yeah! So would I, honey.");
	eq.signal(1066,1); -- NPC: Danaria_Hollin
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. "! Welcome to our humble little bakery. We just got a fresh shipment of supplies in, have a look around!");
	elseif(e.message:findi("kane"))then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");		
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1839}, 0)) then  -- Full Muffin Crate
		e.self:Say("Hey, thanks kid! You are one top notch baker! Here's some coin for your trouble.");
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
