-- The Supply Run
-- author - robregen
-- date - 4/10/12

function event_say(e)
	if(e.message:findi("missing helmet") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Recently helmets have been stolen from our workers.  One of them reported seeing one of those wreched flying monkey beasts carry one off.  Having those helmets back would be very useful.  If you come across any of the workers helmets, return them to me and I will bestow a reward totem upon you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25266}, 0)) then -- Giant Sack of Supplies
		e.self:Say("It's about time the supplies got here.  Not like it's a long trip from the center of Kael to us out here.  Payment?  I already paid Wenglawks for the supplies I ordered.  Don't give me any trouble, little one.  I have enough trouble with the missing helmets.");
		e.other:Faction(e.self,419,5); -- Kromrif
		e.other:Faction(e.self,448,1); -- Kromzek
		e.other:Faction(e.self,406,-2); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,0,250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
