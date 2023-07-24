function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ", It's a good day for a raid, wouldn't you agree?");
	elseif(e.message:findi("agree")) then
		e.self:Say("Well, if you have the courage, round up about six people of my strength and, when you're ready to begin, give me a polished acrylia sphere. I'll lead you on a raid against a grimling camp not far from here. If we're strong enough to take over the camp there will be a good chance for treasure.");
	elseif(e.message:findi("raid")) then
		e.self:Say("'I know the way to a grimling camp close to here. If you have about six people of my strength we have a good chance of taking it over. With luck, a grimling officer will take part in their counterattack, and they can carry valuable treasure indeed. Fetch me a polished acrylia sphere and I'll guide you.");
	end
end

function event_trade(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(167679) ) then -- ##Scout_Husman
		return;
	end
	
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3681}, 0)) then -- Polished Acrylia Sphere
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		e.self:Say("Nothing better than killing grimlings for the king! Follow me closely and fight well. Make certain that I survive, for if I perish the mission will be a failure.");
		eq.unique_spawn(167034,13,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Scout_Husman
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
