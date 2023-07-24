-- Quest for respecialization
-- Quest for Bard Lambent Fire Opal

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("I am Ostorm of the Temple of Solusek Ro, guardian of the sacred crystal of Kintaz.  Be wary and keep your distance, lest the proximity of the crystal [steal] your [memories].");
		elseif(e.message:findi("steal")) then
			e.self:Say("It is the nature of the crystal of Kintaz to steal the memories of those around it. Only I am safe, and then only because of the strong wardings placed on me by Solusek Ro himself. Are you interested in [losing] any [memories]?");
		elseif(e.message:findi("losing")) then
			e.self:Say("Recently, I have been experimenting with the crystal, and have found that those exposed to ruby light filtered through it tend to lose the memories of their most specialized arcane skills. Are you sure you want to [lose advanced memory] of specialization?");
		elseif(e.message:findi("advanced")) then
			e.self:Say("Be warned that once exposed to the crystal, I can not reverse the effects. If you desire exposure, fetch me a ruby.");
		elseif(e.message:findi("gold")) then
			e.self:Say("You do not remember?  You promised me fifty gold coins for allowing you to be exposed to the sacred crystal of Kintaz.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Solusek Ro does not believe in half measures.";
	
	if(e.other:GetFactionValue(e.self) >= 0 and (e.other:GetClass() == 2 or e.other:GetClass() == 6 or e.other:GetClass() == 10 or e.other:GetClass() == 11 or e.other:GetClass() == 12 or e.other:GetClass() == 13 or e.other:GetClass() == 14) and item_lib.check_turn_in(e.self, e.trade, {item1 = 10035})) then
		e.self:Say("..hear me? Ah, you seem to be coming out of your stupor. I think you have been exposed to the crystal long enough. By the time you leave the temple, your memories should have faded. Do you have the [fifty gold] coins that you owe me?");
		e.other:Faction(e.self,415,1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		for skill=43,47,1 do
			e.other:SetSkill(skill,49);
		end
		e.other:Message(7, "Your specialize skills have all been set to 49.");
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then
		e.self:Say("Thank you.");
		e.other:Faction(e.self,415, 2); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416, -2); -- Faction: Shadowed Men
		e.other:Ding();
--Lambent Fire Opal
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10031, item2 = 10031, item3 = 10000},1,text)) then
		e.self:Say("Here is your prize - a lambent fire opal.");
		e.other:Faction(e.self,415, 1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416, -1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,10128,1000);
--magnetized platinum
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16507})) then
		e.self:Say("I see that Gavel has sent you to me.  Very well, I have magnetized your platinum bar - take it.");
		e.other:QuestReward(e.self,0,0,0,0,19049);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
