function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1567,item2 = 30369})) then
		e.self:Emote("breathes deeply and blows into an ornate horn. As the sound echoes through the mountain pass, the local inhabitants scurry to take cover.");
		e.self:Say("I'll be right with you, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,30369);
		eq.unique_spawn(118137,0,0,-74,-19,208,0); -- NPC: War
		eq.spawn_condition("greatdivide",1,0);
		eq.spawn_condition("greatdivide",1,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
