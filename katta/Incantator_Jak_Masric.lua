function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am in the middle of some important research so regrettably do not have the time to converse.");
	end
end	

function event_trade(e)
	local item_lib = require("items");
	local text = "I require the three autarkic shade robes and the robe of the autarkic shade lord.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7373,item2 = 7374,item3 = 7374,item4 = 7374},1,text)) then
		e.self:Say("Hopefully these robes still contain enough of a magical imprint from the shades to be useful in successfully warding the Magus Conlegium from their kind. Thank you for you assistance. Keep this token as a symbol of your allegiance to the Magus Conlegium.");
		e.other:Faction(e.self,1504,10); -- Magus Conlegium
		e.other:Faction(e.self,1502,1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1503,1); -- Validus Custodus
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1485,-2); -- Eye of Seru
		e.other:Faction(e.self,1541,-2); -- Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,7394,100000); -- Magus Conlegium Token
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
