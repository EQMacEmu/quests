function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20635})) then -- Warning to Glidara
		e.self:Say("So the ghoul boss knows of our inquiries?  I fear that villain not!  In fact, we must find out how much information he has received.  Invade the undead ruins nearby and retrieve his log.  Take this ring... it will protect you from his spells.  Return my ring with his log book and we will hopefully crack the mystery of Kithicor.");
		e.other:QuestReward(e.self,0,0,0,0,20640,1000); -- Glidara's Ring
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20640,item2 = 20637})) then -- Glidara's Ring / Ghoul Boss'Log Book
		e.self:Say("Daring work, " .. e.other:GetCleanName() .. ".  I've imprinted my seal on this log so that only Morin may open it.  Deliver the log to Morin.");
		e.other:QuestReward(e.self,0,0,0,0,20638,1000); -- Sealed Ghoul Boss' Log Book
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
