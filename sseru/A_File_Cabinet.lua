function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 6) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29855}, 0)) then
			e.self:Emote("slams shut after you take the original records out.");
			e.other:QuestReward(e.self,0,0,0,0,29856); -- Original Records
			eq.spawn2(159001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		end
		item_lib.return_items(e.self, e.other, e.trade)
	else
		e.self:Say("I will do nothing to aid beings like you.");
	end
end