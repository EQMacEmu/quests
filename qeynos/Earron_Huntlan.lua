function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, thirsty adventurer! Please help yourself to the free salty snacks. We are here to serve you at the Lion's Main Tavern. Allow yourself to indulge from our wide selection oof fine spirits.");
	elseif(e.message:findi("kwint")) then
		if(e.other:GetFactionValue(e.self) >= -100) then -- requires apprehensive
			e.self:Say("Kwint? Gave you the line about being my brother, huh? That boy sends me more customers, I tells ya! I give him one free drink for every person he gets to come in. Hey, could you do me a favor and take this voucher to him when you are done drinking? Thanks.");
			e.other:SummonCursorItem(18821); -- Item: A Scrap of Parchment
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end		
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18821})) then
		e.self:Say("What the..? This voucher was for Kwint, not you! I will find someone more trustworthy to take it to him.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,291,-25,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,5,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,-3,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,-2,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,-5,0); -- Faction: Guards of Qeynos
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
