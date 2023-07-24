function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. ", it is a pleasure to meet you. As the Governor of Defense for Katta Castellum it is my duty to ensure the safety of the city from outside enemies. At present the most imminent threat to the safety of our citizens is the Coterie of the Eternal Night and their [assassins]. There are other matters of defense as well however that you may be of [assistance] in dealing with.");
	elseif(e.message:findi("assassins")) then
		-- Start of Assassins Part1
		e.self:Say("The Coterie of the Eternal Night has trained several of their members to infiltrate the defenses of Katta Castellum and capture or kill citizens of our great city. Few of these assassins are successful at breaching the gate but the ones that do succeed tend to hide in shadowy corners waiting for an opportune moment to emerge and attack their victims. Should you discover one of these undead assassins slay it immediately. Kill four such assassins and deliver their Coterie Assassin Garrotes to me and you shall be honored by the Validus Custodus.");
	elseif(e.message:findi("assistance")) then
		-- Start of Assistance
		e.self:Say("Ah... Im glad that you have asked. There is a special matter that may benefit from your skills as an adventurer. I would love to explain the matter in full detail, but Im afraid that I am not your best source of information at this juncture. The matter was delegated to Kellari Autumnfall. Seek her out and see if she requires your assistance. She is looking into a matter of grave importance. Tell her that I sent you, should she ask. Be well and good luck with it.");
	elseif(e.message:findi("coterie infiltrators")) then
		-- Start of Assassins Part2
		e.self:Say("They are undead Illusionists capable of disguising themselves as mortals. The signs of an infiltrator are often difficult to spot but should you identify an infiltrator within the city slay it, bring me two of the creatures fangs, a Gem of Condensed Flame and your Reflective Combine Claymore and I shall bestow upon you a greater reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
  -- Handin: 4x Coterie Assassin Garrotes (31799)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31799,item2 = 31799,item3 = 31799,item4 = 31799}, 0)) then
    -- End of Assassins Part1
		e.self:Say("I see you have met with success " .. e.other:GetCleanName() .. "! You have earned the respect of the Validus Custodus. Please take this as a symbol of our gratitude and your bravery. You are gaining notoriety with the Coterie, be wary of the [Coterie Infiltrators].");
		e.other:Faction(e.self,1503,10);  --  +Validus Custodus
		e.other:Faction(e.self,1502,1);  --  +Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  --  +Magus Conlegium
		e.other:Faction(e.self,1505,-1); --  -Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  --  -Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); --  -Seru
		e.other:Faction(e.self,1484,-5); --  -Hand of Seru
		e.other:Faction(e.self,1485,-1);  --  -Eye of Seru
		e.other:Faction(e.self,1541,-1); --  -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,31829,1000); -- Reflective Combine Claymore
	-- Handin: 2x Vampyre Infiltrator Fang (31832), 1x Gem of Condensed Flame (31831), 1x Reflective Combine Claymore (31829)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31832,item2 = 31832,item3 = 31831,item4 = 31829})) then
		-- End of Assassins Part2
		e.self:Say("Congratulations " .. e.other:GetCleanName() .. "! You have done great deeds for the Validus Custodus and the safety of Katta Castellum. I award you with Ashbringer, a weapon wielded in the past by some of the Validus Custodus most fervent undead slayers. May it pass into good hands and may it continue to turn the undead to ash and dust.");
		e.other:Faction(e.self,1503,10);  --  +Validus Custodus
		e.other:Faction(e.self,1502,1);  --  +Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  --  +Magus Conlegium
		e.other:Faction(e.self,1505,-1); --  -Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  --  -Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); --  -Seru
		e.other:Faction(e.self,1484,-5); --  -Hand of Seru
		e.other:Faction(e.self,1485,-1);  --  -Eye of Seru
		e.other:Faction(e.self,1541,-1); --  -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,31830,1000); -- Ashbringer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3873}, 0)) then -- Colain head turn-in for Saureem's Assistance
		e.self:Say("It is very unfortunate that you had to be exposed to such corruption.  Please, do not consider what you have seen during this situation to be the standard for our community.  This was a rare occurrence.  This situation did however allow you to prove yourself to us.  We thank you for your bravery and selfless action in this matter.  May you be followed by favor and may this small gift from my fellow governors and me assist you in your journeys.");
		e.other:Faction(e.self,1503,50);  --  +Validus Custodus
		e.other:Faction(e.self,1502,5);  --  +Katta Castellum Citizens
		e.other:Faction(e.self,1504,5);  --  +Magus Conlegium
		e.other:Faction(e.self,1505,-5); --  -Nathyn Illuminious
		e.other:Faction(e.self,1506,-5);  --  -Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-5); --  -Seru
		e.other:Faction(e.self,1484,-25); --  -Hand of Seru
		e.other:Faction(e.self,1485,-5);  --  -Eye of Seru
		e.other:Faction(e.self,1541,-5); --  -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,3875,1000); -- Elaborately Gilded Wooden Spear
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
