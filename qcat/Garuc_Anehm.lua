function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- not sure of exact faction, responds between 0 and Scowls
			e.self:Say("Welcome to the Shrine of Bertoxxulous! You appear to be [new to the shrine]. I do not remember seeing you around.");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("new to the shrine")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("New blood to spread Bertoxxulous' disease? We presently need the help of a [young shadowknight]. There are certain deeds which must be carried out.");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("young shadowknight")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Then let your supreme task be the extermination of the Priests of Life. Know that they threaten the will of our Lord Bertoxxulous. For every fallen paladin and cleric of the Temple of Life. you shall rise within our ranks.  So... do you [loathe paladins]?");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("loathe paladins")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("As do we all. The paladins of Qeynos come from either the Hall of Thunder or the Temple of Life. We have put a bounty upon their heads. Destroy these knights and return either the Order of Thunder or the prayer beads of these inferior men. There has even been a report from [Commander Kane].");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("commander kane")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Kane Bayle is the Commander of the Qeynos Guard. He has found it advantageous to befriend the Bloodsabers. We share a [common goal]. He assists us in many ways. He has some new information to reveal.  Go and tell him you are a Bloodsaber. Do not speak with him while he is [on duty]!");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("common goal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Kane Bayle and the leaders of this shrine all wish to overthrow the rule of Antonius Bayle. He, for power, and we for the glory of Bertoxxulous. From this city, our diseased lord shall appear and tread across the land spitting death from his mouth and deforming the land. His glory shall be eternal!");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("on duty")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Kane is quartered within the gatehouse of Qeynos while on duty. At times he can also be found within this shrine.");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Requires Indifferent or better Faction
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13134})) then -- Hurrietas Bloody Dress
		e.self:Say("Hahaha.. I see you actually killed a respected, well-known citizen of Qeynos. No loss for them, but you are certainly a gain for our shrine. Maybe this shall do you some good. If not now, then surely later. You may need it when the Qeynos Guards hunt you down.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,221,10);  -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(1053,2104, 2106, 2108, 2111, 2112, 13301, 15235),500);--Updated to issue random patchwork armor, or a rat-shaped ring or Invis Vs Undead
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13908})) then -- Busted Prayer Beads (*Trintles Prayer Beads)
		e.self:Say("You fool! Brother Trintle was our mole within the Priests of Life. Now you have killed him. For this you shall die!");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,221,-50); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,7); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,-5); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,12); -- Faction: Priests of Life
		e.other:Faction(e.self,230,-1,0); -- Faction: Corrupt Qeynos Guards	
		eq.attack(e.other:GetName())
	-- Requires Amiably or better Faction
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13296})) then -- Prayer Beads (*Temple of Life Beads)
		e.self:Say("Fine work! One less threat to our shrine. Take this. It shall help you become a greater asset to our shrine. Go forth and spread the disease.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,221,10);  -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(1053,2116,2122,5013,5014,5016,5023,6011,13002,13001,13301,17001),500); -- Item(s): Small Patchwork Tunic (2116), Small Tattered Gloves (2122), Rusty Short Sword (5013), Rusty Axe (5014), Rusty Broad Sword (5016), Rusty Two Handed Sword (5023), Rusty Mace (6011), Torch (13002), Small Lantern (13003), Wrist Pouch (17001), Rat Shaped Ring (13301)
	-- Requires Amiably or better Faction
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13287})) then -- Order of Thunder (*Order Of Thunder Medal)
		e.self:Say("Fine work! One less threat to our shrine. Take this. It shall help you become a greater asset to our shrine. Go forth and spread the disease.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,221,10);  -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(1053,2116,2122,5013,5014,5016,5023,6011,13002,13001,13301,17001),500); -- Item(s): Small Patchwork Tunic (2116), Small Tattered Gloves (2122), Rusty Short Sword (5013), Rusty Axe (5014), Rusty Broad Sword (5016), Rusty Two Handed Sword (5023), Rusty Mace (6011), Torch (13002), Small Lantern (13003), Wrist Pouch (17001), Rat Shaped Ring (13301)			
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45070 -- Garuc_Anehm
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
