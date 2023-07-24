-- Coldain Ring: Quest 2

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30266}, 0)) then
		e.self:Say("Yes! I've done it! The vile beast is finally dead. I will at last be revered as the mighty hunter I am. Here is your axe back, I broke it on the killing blow. Take it as proof that you are a friend of the greatest hunter in the history of the Coldain!");
		e.other:QuestReward(e.self,0,0,0,0,30267,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Hmmm, fresh prints. They're HUGE! This must be it! This hunting stuff is easier than I thought.");
	elseif(e.wp == 2) then
		e.self:Say("Hmm, that wasn't him.  Let's see now, if I were a rabid tundra beast where would I go? This way!");
	elseif(e.wp == 3) then
		e.self:SetAppearance(1);
	elseif(e.wp == 4) then
		e.self:Say("Ahh, that's better. Back to the hunt... I think I hear something over yonder. Stay low.");
	elseif(e.wp == 5) then
		e.self:Say("Where did that vile beast go now? Wait, what's that over there? Could it be? Only one way to find out!");
	elseif(e.wp == 6) then
		e.self:SetAppearance(1);
		e.self:Say("All this tracking is makin me mighty sleepy. Time for a little nap. You keep a lookout.");
	elseif(e.wp == 7) then
		e.self:Say("Ahh, refreshing! Back to work... I think I smell the beast! This way.");
	elseif(e.wp == 8) then
		e.self:Say("I just don't get it. I thought that was him for sure. I don't see any sign of him now.");
	elseif(e.wp == 9) then
		e.self:Say("Who am I kidding, I'm no hunter. I'll never be a hunter. I may as well give up and become a miner like dad.");
		e.self:SetAppearance(1);
		eq.unique_spawn(116017, 14, 0, 1510, -2532, 307, 0); -- NPC: Rabid_Tundra_Kodiak
	end
end