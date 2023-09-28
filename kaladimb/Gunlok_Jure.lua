function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  Bow before the greatness of the Clerics of Underfoot!  It is good to be a paladin in such an order as ours - to fight the good fight and defend Kaladim from the evil and undead.  If you be a paladin, then I pray you find the [courage to battle the undead].");
	elseif(e.message:findi("courage")) then
		e.self:Say("Yes!!  To battle the undead is our greatest call.  There has been a rise in the number of dwarven skeletons seen in the Butcherblocks.  If you are a true member of this order, I shall reward you for the return of four bone chips.  We shall defend our land from evil!");
	elseif(e.message:findi("remains")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("My brother Cromil ventured to the Plains of Karana on the continent of Antonica. He never returned. Rumor has it that his undead skeleton is now part of an undead army in the plains. To end this curse, I ask all good paladins of this temple to return his bones to me. Nothing less than a spell is my reward for such a deed.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073},0)) then
		e.self:Say("You have done well. We thank you for your deed with this humble reward. The power behind the raising of our dead shall soon be found. You will earn more respect with more bone chips. I only wish you could assist in the return of the [remains of Cromil].");
		-- confirmed live faction --torven comments this was around 4300xp in AK era, recommends a nerf, setting at 750xp
		e.other:Faction(e.self,227,10);             -- Clerics of Underfoot
		e.other:Faction(e.self,274,10);            -- Kazon Stormhammer
		e.other:Faction(e.self,293,7);            -- Miners Guild 249
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),0,eq.ChooseRandom(2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,5013,5014,5016,5023,6011,13002,13003),750); -- Item(s): Small Patchwork and small tattered set, Rusty Short Sword (5013), Rusty Axe (5014), Rusty Broad Sword (5016), Rusty Two Handed Sword (5023), Rusty Mace (6011), Torch (13002), Small Lantern (13003)
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13332})) then -- Dwarf Bones
		e.self:Say("Many thanks, my friend. Now my brother can rest in peace. Please take this spell. May it serve you well.");
		-- confirmed live faction
		e.other:Faction(e.self,227,20);             -- Clerics of Underfoot
		e.other:Faction(e.self,274,20);            -- Kazon Stormhammer
		e.other:Faction(e.self,293,15);            -- Miners Guild 249
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),0,eq.ChooseRandom(15201,15209,15223,15230),10000); -- random low level cleric/paladin spell.
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
