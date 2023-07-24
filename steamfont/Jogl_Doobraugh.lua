function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hellooo!!  My name is Jogl, master engineer with the Eldrithch Collective.  And this here is Charlotte.  Pay no mind to her, She won't bite unless you attack me.");
		eq.signal(56108,1); -- NPC: Charlotte
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 12) then
		eq.signal(56108,2); -- NPC: Charlotte
	end
	if(e.wp == 18) then
		eq.signal(56108,3); -- NPC: Charlotte
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13209})) then
		e.self:Say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
		-- verified live faction
		e.other:Faction(e.self,245,5); -- Faction: Eldritch Collective
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:Faction(e.self,255 ,1); -- Faction: Gem Choppers
		e.other:Faction(e.self,287,-1); -- Faction: Meldrath
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18837,18838),10);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--random 18837 and 18838 for two sepearte quests beginnings Red V and duster
--18837 used for Red V

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
