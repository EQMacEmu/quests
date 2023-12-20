function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ". I am Avir Sterbla, Governor of Magician Studies here at the Magus Conlegium of Katta Castellum. I am currently in the middle of researching more effective magical methods of combating the [vampyres] of the Coterie of the Eternal Night. Governor Drenic Garrison has been assisting me with the scientific side of the research, that having to do with physical materials that have detrimental effects on the vampyres while my research is more with magical elements.");
	elseif(e.message:findi("vampyres")) then
		-- Part of Vampyre Ash and Blood
		e.self:Say("The vampyres are becoming a larger threat to the safety of our citizens and it is the responsibility of the Magus Conlegium to find magical ways of stifling this threat while the Validus Custodus fight them with physical means. However, I am running short on research components. I will trade for every four samples of vampyre blood or every four piles of vampyre ashes.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require four samples of vampyre blood.";
	local text1 = "I require four such samples for my research.  Please see if you can gather more.";	
	
	-- Handin: 4x Vampyre Ashes (2692) or 4x Vampyre Blood (2693)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2692,item2 = 2692,item3 = 2692,item4 = 2692},1,text1) or item_lib.check_turn_in(e.self, e.trade, {item1 = 2693,item2 = 2693,item3 = 2693,item4 = 2693},1,text)) then
		e.self:Say("Thank you " .. e.other:GetCleanName() .. "! These samples will be put to good use I assure you. The Coterie will not stand much longer against the forces of Katta Castellum.");
		e.other:Faction(e.self,1504,3);  -- +Magus Conlegium
		e.other:Faction(e.self,1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(e.self,1503,1);  -- +Validus Custodus
		e.other:Faction(e.self,1483,-1); -- -Seru
		e.other:Faction(e.self,1484,-1); -- -Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- -Eye of Seru
		e.other:Faction(e.self,1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,{items = {10015,10015,10015,10015,10015,10015,10015,10015},exp = 5000}); -- Malachite 8x
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
