function event_trade(e)
	local item_lib = require("items");

	if(e.self:GetX() == -1164 and e.self:GetY() == -3301 and e.self:GetGrid() == 0) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30272})) then -- Harness of Control
			e.self:Emote("reels in pain as the harness snaps around its neck tightly. A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the giants fortress.");
			e.other:QuestReward(e.self,0,0,0,0,0,20000);
			-- start gridid 54
			eq.start(54);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30274})) then -- Giant Harness of Control
			e.self:Emote("reels in pain as the harness snaps around its neck tightly.  A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the Coldain mines.");
			e.other:QuestReward(e.self,0,0,0,0,0,20000);
			eq.set_timer("korf", 90000);
			-- start gridid 56
			eq.start(56);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
		
	-- waypoint number from gridid 54
	if(e.wp == 13 and e.self:GetGrid() == 54) then
		-- set proximity to make sure the player is following close by.
		eq.set_proximity(-2020-65,-2020+65,-2453-65,-2453+65);
	elseif(e.wp == 17 and e.self:GetGrid() == 56) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118018)) then
			eq.attack_npc_type(118018);
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118019)) then
			eq.depop(118019);
			eq.unique_spawn(118020,57,0,-3194,-6207,-367,0):SetRunning(true);
		end	
	elseif(e.wp == 19 and e.self:GetGrid() == 54) then
		-- clear proximity and if the giants spawned then attack Gralk Dwarfkiller and send signal for Fergul Frostsky to run away.
		eq.clear_proximity();
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118012)) then
			eq.attack_npc_type(118012);
			eq.get_entity_list():GetMobByNpcTypeID(118015):SetRunning(true);
			eq.get_entity_list():GetMobByNpcTypeID(118015):CastToNPC():AssignWaypoints(55);
		end
	end
end

-- if Player enter the proximity then spawns the 2 giants and clear proximity.
function event_enter(e)
	eq.spawn2(118015,0,0,-2397,-2615,294,0); -- NPC: #Fergul_Frostsky
	eq.spawn2(118012,0,0,-2391,-2569,299,0); -- NPC: #Gralk_Dwarfkiller
	eq.clear_proximity();
end

function event_timer(e)
	if(e.timer == "korf") then
		eq.unique_spawn(118018,0,0,-3171,-6187,-370,0); -- NPC: #Relik
		eq.unique_spawn(118019,0,0,-3194,-6207,-367,0); -- NPC: Korf_Brokenhammer_
		eq.stop_timer("korf");
	end
end