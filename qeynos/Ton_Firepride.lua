function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, adventurer!  A mighty warrior such as yourself deserves only the finest in armor and we here at Firepride's were trained by the finest dwarven smiths.  We shall be branching out and crafting [other items] soon, also.");
	elseif(e.message:findi("other items")) then
		e.self:Say("Well, soon I shall be showing my fantastic art in weapons making. I would hate to have the good people of Qeynos continue purchasing inferior weapons from that so-called blacksmith at [Ironforge Estates].");
	elseif(e.message:findi("ironforge estate")) then
		e.self:Say("The Ironforge family has called Qeynos their own for far too long. He was never trained in the dwarven techniques as I was. He will not be cornering the weapons market very much longer.");
	elseif(e.message:findi("tax")) then
		e.other:Faction(e.self,230,-1); -- Faction: Corrupt Qeynos Guards
		e.self:Say("Oh I see, Vicus has got some other sap to do his work. Fine. Here are your stinking taxes. If Kane were in charge, things would be different around here.");
		e.other:SummonCursorItem(13170); -- Item: Fireprides Tax Payment
	elseif(e.message:findi("lanhern")) then
		e.self:Say("Lanhern is a good woman, but she is not wise in the ways of the world. It is best she stays that way.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Away from me, fool! The Knights of Thunder are no friends of mine. They persist in forging their own armor! What?! Are not the talents of Ton Firepride to their liking?!");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13129})) then
		e.self:Say("Ha! This is great. Here's your money, murderer! Hope the guards don't find you. Now get lost! Take the tunic. Maybe Garuc will reward you for such a vile deed. I sure don't want to keep it around here.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,230,20,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-3,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,273,3,0); -- Faction: Kane Bayle
		e.other:Faction(e.self,223,2,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,221,3,0); -- Faction: Bloodsabers
		e.other:QuestReward(e.self, math.random(10), math.random(10), math.random(2),0,13134,400);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


