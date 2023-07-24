function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at " .. e.other:GetCleanName() .. " unblinking with colorless eyes.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22856}, 0)) then
		e.other:QuestReward(e.self,0,0,0,0,24869,5000);
		eq.unique_spawn(126014,6,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
