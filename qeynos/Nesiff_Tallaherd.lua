function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service. I am the finest woodworker in all of Qeynos. Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].");
	elseif(e.message:findi("guard weleth")) then
		e.self:Say("Guard Weleth is like a son to me. He is responsible for purchasing supplies for the Qeynos Guard. He buys arrows from me. He is usually stationed near the North Gate.");
	elseif(e.message:findi("tax")) then
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Tax time again already?? It seems like I just paid yesterday.. High taxes and low sales mean I won't be able to stay in business much longer. Good thing ol' Weleth is taking care of me. Here are my taxes.");
		e.other:SummonCursorItem(13173); -- Item: Tallaherds Tax Payment
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13925})) then -- Crate of Defective Arrows
		e.self:Say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
		-- confirmed live factions
		e.other:Faction(e.self,291,5,0); -- Merchants of Qeynos
		e.other:Faction(e.self,223,-1,0); -- Circle Of Unseen Hands
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:Faction(e.self,229,1,0); -- Coalition of Tradefolk
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,18824,250); -- Slip of Parchment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18012})) then
		e.self:Say("Oh.  Vesteri sent you?  Here you go.  I hope Te'Anara likes it.");
		-- confirmed live factions
		e.other:Faction(e.self,291,1,0); -- Merchants of Qeynos
		e.other:Faction(e.self,223,-1,0); -- Circle Of Unseen Hands
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:Faction(e.self,229,1,0); -- Coalition of Tradefolk
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13864,250); -- Item: Wooden Statue
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
