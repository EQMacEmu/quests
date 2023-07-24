-- Part of Coldain Ring 6 Quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who dares disturb my rest? If ye be a friend of the mighty Coldain, then show me proof and I shall tell you of my plight. If not, then be on your way.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30268}, 0)) then
		e.self:Say("Many seasons ago I stood here in life with my comrades, the best warriors Thurgadin had to offer. Along with our faithful wolven army we were poised to eliminate the Kromrif presence in the region. Somehow, the enemy was made aware of our plans and just before our attack, a group of Ry'Gorr oracles charmed our wolves, forcing them to tear down their own masters. We were caught by surprise and died a savage death.");
		eq.get_entity_list():GetMobByNpcTypeID(116534):CastToNPC():AssignWaypoints(16);
		e.other:QuestReward(e.self,0,0,0,0,30268);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end