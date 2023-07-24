function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hello, have you seen my daughter?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("daughter")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Yes, my daughter. She went to play near the aqueducts with her doll and now she is gone. If only there was some sign of her..");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13712})) then
		e.self:Emote("tries to keep her composure. She hands you a silver locket with great effort, and then bursts into tears.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,262,2,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,219,1,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,230,-1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,223,-1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,291,1,0); -- Faction: Merchants of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,1316,27440); -- Item: Velvet Choker
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
