function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hrrump?! Who you? " .. e.other:GetCleanName() .. "? What you want with Lynuga? Me am out [collecting]. Leave me be!");
	elseif(e.message:findi("collecting")) then
		e.self:Say("I collect all sorts of things. Gems be my favorite. Me really like rubies. If you have ruby, give to me! Why you want to know? You want to steal my collection?!? I squish you if you do!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local rewarditem = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10035},0)) then -- Handin: Ruby
		e.self:Say("Mmm. Ruby!! Me thank's you! Here take this, me got it off dead someone who try take my collection. Me think's this valuable thing..");
		if (math.random(100) < 6) then -- 5%
			rewarditem = 10082; --  Ivandyr's Hoop
		else
			rewarditem = eq.ChooseRandom(10080, 10081); -- Random: Brutechopper, Midnight Mallet
		end
		e.other:Faction(e.self,222,5,0); -- Faction: Broken Skull Clan
		e.other:Faction(e.self,308,-5,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,235,-5,0); -- Faction: Da Bashers
		e.other:QuestReward(e.self,0,0,0,0,rewarditem,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
	eq.set_timer("depop", 2700000);
end

function event_combat(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop_with_timer();
	end
end
