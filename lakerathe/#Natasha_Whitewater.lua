-- CLERIC EPIC NPC:51138 -- Natasha Whitewater

function event_spawn(e)
	e.self:Shout("The Triumvirate of Water has decreed your fate, Shmendrik Lavawalker!! I am here to deliver said fate!!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Riptide goblins must have their crown returned to them. If you would be so kind as to give me the crown I will make sure that it reaches them. Hopefully they are capable enough to repair the damage that has been done to it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28046})) then -- damage goblin crown
		e.self:Say("I will have this crown returned to the Riptide Goblins immediately! Should you ever come across an Erudite named Omat Vastsea, give him this sea shell. The waters of Norrath shimmer with awareness of your deeds here today!");
		e.other:QuestReward(e.self,0,0,0,0,28047); -- Ornate Sea Shell
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Enough!! Your existence has come to an end!");
		eq.signal(51012,2,2000); -- NPC: Shmendrik_Lavawalker
	elseif(e.signal == 2) then
		e.self:Say("This conflict has been destined by the waters of the Triumvirate!");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(51012)) then
		eq.signal(51012,1,2000); -- NPC: Shmendrik_Lavawalker
		eq.attack_npc_type(51012);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
