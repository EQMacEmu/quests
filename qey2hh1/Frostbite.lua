function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("RUFF RUFF");	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12139})) then
		e.self:Emote("spits something into your hand.");	
		-- confirmed live factions
		e.other:Faction(e.self,320,2); -- 320 : Faction Wolves of the North
		e.other:Faction(e.self,327,1); -- 327 : Faction Shaman of Justice
		e.other:Faction(e.self,328,1); -- 328 : Faction Merchant's of Halas		
		e.other:Faction(e.self,311,1); -- 311 : Faction Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13383); -- Item: Koalindl Fish
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12226})) then
		e.self:Emote("takes a whiff of the sweaty shirt and barks.");
		e.other:Ding();
		eq.set_timer("go",15000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	local bad_thief = eq.ChooseRandom(12190,12190,12190,12190,12190,12191);
	local random_x = eq.ChooseRandom(-3461,-3902,-4011);
	local random_y = eq.ChooseRandom(-1457,-3240,-1362);
	
	if(e.timer == "go") then
		eq.stop_timer("go");
		eq.set_timer("depop",1200000);
		eq.unique_spawn(bad_thief,11,0,random_x,random_y,10,0);
		e.self:SetRunning(true);
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(bad_thief);
		
		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob);
		end
	elseif(e.timer == "depop") then
		eq.depop_with_timer();
	end
end

function event_signal(e)
	eq.stop_follow();
	e.self:SetRunning(false);
	eq.move_to(-2236,-3532,34,110);
	eq.stop_timer("depop");
end
