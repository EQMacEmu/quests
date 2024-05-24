function event_waypoint_arrive(e)
	if(e.wp == 5) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38009) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(38010)) then
			e.self:Say("Speed up the digging my pets!");
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38009)) then
				eq.get_entity_list():GetMobByNpcTypeID(38009):Say("We are not your pets!");
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38010)) then
				eq.get_entity_list():GetMobByNpcTypeID(38010):Say("We will speed up when you return our mining caps. There are falling rocks all over this place! We could get killed!");
			end
		end
	elseif(e.wp == 7) then
		e.self:Say("Blast you, skeletons!  Why I ever resurrected you, I don't know!");
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13894})) then
		e.self:Say("Good work, you should be running this operation instead of that Talrigar fellow. Have a small reward. A little bit of the gems I found while tunneling through this rock.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10015,10016,10017,10018),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
