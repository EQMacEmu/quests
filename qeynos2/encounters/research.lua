---- Quest:Researcher's Badge (Badge #3)
-- 1 = Started Badge Quest #3 (Completed Quest #2 and turned in badge)
-- 2 = Handed in Research Briefing to start Enchanted Rat Experiment
-- 3 = Successfully completed Experiment (Badge Complete)

local jars = 0;
local spawner = 2000; -- NPC control script ID
local diseased = 2001	--diseased rat
local healthy = 2009;	--healthy rat
local empty = 2019; 	--empty tile
local enchanted = 2010; -- healthy rat (enchanted)

local game1 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -270, -180, 1, 0},	--x,y,z,h
	AC  = {empty, -260, -180, 1, 0},
	AB  = {empty, -250, -180, 1, 0},
	AA  = {healthy, -240, -180, 1, 0},
	BD  = {empty, -270, -190, 1, 0},
	BC  = {diseased,-260, -190, 1, 0},
	BB  = {diseased, -250, -190, 1, 0},
	BA  = {diseased, -240, -190, 1, 0},
	CD  = {diseased, -270, -200, 1, 0},
	CC  = {empty, -260, -200, 1, 0},
	CB  = {diseased, -250, -200, 1, 0},
	CA  = {empty, -240, -200, 1, 0},
	DD	= {healthy, -270, -210, 1, 0},	
	DC	= {empty, -260, -210, 1, 0},
	DB	= {empty, -250, -210, 1, 0},
	DA	= {healthy, -240, -210, 1, 0}
}

local game2 = {	--ordered from left to right  10 x 10 square
	AD  = {empty, -270, -180, 1, 0},	--x,y,z,h
	AC  = {empty, -260, -180, 1, 0},
	AB  = {healthy, -250, -180, 1, 0},
	AA  = {empty, -240, -180, 1, 0},
	BD  = {empty, -270, -190, 1, 0},
	BC  = {empty,-260, -190, 1, 0},
	BB  = {diseased, -250, -190, 1, 0},
	BA  = {diseased, -240, -190, 1, 0},
	CD  = {healthy, -270, -200, 1, 0},
	CC  = {diseased, -260, -200, 1, 0},
	CB  = {empty, -250, -200, 1, 0},
	CA  = {diseased, -240, -200, 1, 0},
	DD	= {healthy, -270, -210, 1, 0},	
	DC	= {empty, -260, -210, 1, 0},
	DB	= {diseased, -250, -210, 1, 0},
	DA	= {healthy, -240, -210, 1, 0}
}

local game3 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -270, -180, 1, 0},	--x,y,z,h
	AC  = {empty, -260, -180, 1, 0},
	AB  = {empty, -250, -180, 1, 0},
	AA  = {healthy, -240, -180, 1, 0},
	BD  = {empty, -270, -190, 1, 0},
	BC  = {diseased,-260, -190, 1, 0},
	BB  = {empty, -250, -190, 1, 0},
	BA  = {diseased, -240, -190, 1, 0},
	CD  = {diseased, -270, -200, 1, 0},
	CC  = {diseased, -260, -200, 1, 0},
	CB  = {diseased, -250, -200, 1, 0},
	CA  = {empty, -240, -200, 1, 0},
	DD	= {healthy, -270, -210, 1, 0},	
	DC	= {empty, -260, -210, 1, 0},
	DB	= {empty, -250, -210, 1, 0},
	DA	= {healthy, -240, -210, 1, 0}
}

local game4 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -270, -180, 1, 0},	--x,y,z,h
	AC  = {empty, -260, -180, 1, 0},
	AB  = {empty, -250, -180, 1, 0},
	AA  = {empty, -240, -180, 1, 0},
	BD  = {diseased, -270, -190, 1, 0},
	BC  = {empty,-260, -190, 1, 0},
	BB  = {diseased, -250, -190, 1, 0},
	BA  = {empty, -240, -190, 1, 0},
	CD  = {diseased, -270, -200, 1, 0},
	CC  = {empty, -260, -200, 1, 0},
	CB  = {diseased, -250, -200, 1, 0},
	CA  = {empty, -240, -200, 1, 0},
	DD	= {empty, -270, -210, 1, 0},	
	DC	= {diseased, -260, -210, 1, 0},
	DB	= {diseased, -250, -210, 1, 0},
	DA	= {empty, -240, -210, 1, 0}
}

local game5 = {	--ordered from left to right  10 x 10 square
	AD  = {empty, -270, -180, 1, 0},	--x,y,z,h
	AC  = {empty, -260, -180, 1, 0},
	AB  = {empty, -250, -180, 1, 0},
	AA  = {empty, -240, -180, 1, 0},
	BD  = {empty, -270, -190, 1, 0},
	BC  = {diseased,-260, -190, 1, 0},
	BB  = {diseased, -250, -190, 1, 0},
	BA  = {diseased, -240, -190, 1, 0},
	CD  = {empty, -270, -200, 1, 0},
	CC  = {empty, -260, -200, 1, 0},
	CB  = {empty, -250, -200, 1, 0},
	CA  = {diseased, -240, -200, 1, 0},
	DD	= {healthy, -270, -210, 1, 0},	
	DC	= {diseased, -260, -210, 1, 0},
	DB	= {diseased, -250, -210, 1, 0},
	DA	= {empty, -240, -210, 1, 0}
}



function VelarteSay(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetName() .. ". Antonius Bayle and the council have ordered a full investigation of these folks that call themselves the Bloodsabers. I hear his plan is to eventually round up every member of this strange disease worshipping cult and bring them in to answer for their terrible crimes against our city and people. Vegalys Keldrane is heading up the investigation. ");
    elseif(e.message:findi("research")) then
        e.self:Say("We are currently in the process of conducting research into viable ways to bring an end to this terrible plague. This suffering has gone on long enough. Being a researcher doesn't take strength or brute force, though those qualities do sometimes help. Being a researcher takes intelligence first and foremost. No offense, but not everyone has that quality. This will be no easy task. Are you still [interested] in helping us with our research? ");
    elseif(e.message:findi("interested")) then
        e.self:Say("Still interested? Very well then " .. e.other:GetName() .. ", you look rather intelligent. As a show of your commitment to this task, please turn in your Interrogator's Badge");
    elseif(e.message:findi("problem")) then
        e.self:Say("Unfortunately, those vile followers of the Plague Bringer are still attempting to foul up our plans. Several our [test animals] have been stolen from us by a gnome, a member of the Dark Reflection. These animals are very important to our research, as the briefing describes.");
    elseif(e.message:findi("test animals")) then
        e.self:Say("These animals were enchanted with a sort of anti-disease aura. It sounds crazy but we thought that perhaps we could use a sort of 'anti-epidemic' to spread a cure to this disease. However, this aura is as of yet imperfect and also quite [volatile]. We had hoped to use rats to spread the cure, much in the same way they often spread disease.");
    elseif(e.message:findi("volatile")) then
        e.self:Say("Yes, the enchantment we placed on the rodents does not last long at all. It disperses its curing magic almost instantly. We fashioned several containers at great expense and they have the ability to preserve an enchantment for long periods of time. After enchanting a rat we [place them in the container] until we are ready to conduct our tests.");
    elseif(e.message:findi("place them in the container")) then
        e.self:Say("Oh, I assure you it is completely humane and the rats do seem to enjoy prolonged exposure to the enchantment while in the container. In fact, it is all we can do to get them out of the containers once we put them in! In any case, those containers are dreadfully expensive to make and those rats. . . Well, we have begun to become sort of attached to them. Please find this [gnome].");
    elseif(e.message:findi("gnome")) then
        e.self:Say("Her name is Oobnopterbevny Biddilets. She was last seen high tailing it across the Plains of Karana. She infiltrated our temple and stole the containers that had our beloved rodents, which were already enchanted and prepared for our next round of tests. I shudder to think of what this monster may be doing to those poor animals. Anyway, retrieve them at any cost. You will need them for the [test] you will be conducting.");
    elseif(e.message:findi("test")) then
        e.self:Say("The briefing explains how the test is to be conducted but first you need to find the test animals. Get the rodents first from that gnome. Then give me your Researcher's Briefing and we will start the test. Release all three rodents as directed then give me the three Empty Enchanted Jars. If you were able to cure all of the diseased rodents by properly using our enchanted rodents, we will consider this test a success and you shall be rewarded with the Researchers Badge.");
    end
end

function VelarteTrade(e)
    local item_lib = require("items");
	
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2387},0)) then -- Interrogators Badge
        e.self:Say("It seems Vegalys trusts you, so I guess I can trust you as well. Take this briefing. It explains the current state of our research and it explains the test you will be conducting. If you can conduct the test successfully, the Temple of Life shall be in your debt and we shall use the findings to continue our work. However, we have a [problem] we need assistance with first.");
        e.other:QuestReward(e.self,0,0,0,0,18295,1000); -- Research Briefing
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18295},0)) then -- starts event when Research Briefing handed in
		eq.spawn2(spawner,0,0,-225,-236,3,0)  -- spawns game control NPC script
		e.self:Say("Well done " .. e.other:GetName() .. "!  Now you must recall what you learned in the research briefing to successfully complete the experiment.  Time is of the essence!");
		eq.unique_spawn(2022,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		jars = 0;
		eq.depop_with_timer();
	end
    item_lib.return_items(e.self, e.other, e.trade)
end

function Velarte2Trade(e)
    local item_lib = require("items");
	
	if(jars == 3  and item_lib.check_turn_in(e.self, e.trade, {item1 = 2587, item2 = 2588 , item3 = 2589},0)) then -- many checks to confirm event is a sucess!
		if(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(2001)) then
			e.self:Say("You did it! You have proven you have the intelligence required and you may wear this Researcher's Badge with pride! Thank you for returning the jars.");
			e.other:Faction(e.self,341,5); -- Priest of Life
			e.other:Faction(e.self,280,1); -- Knight of Thunder
			e.other:Faction(e.self,262,2); -- Guards of Qeynos
			e.other:Faction(e.self,221,-1); -- Bloodsabers
			e.other:Faction(e.self,219,1); -- Antonius Bayle
			e.other:QuestReward(e.self,0,0,0,0,2583,10000); -- Researcher's Badge
		else
			e.self:Say("How unfornate. It appears as though the test failed.  I'm very sorry.  Take these coins for your time at least.");
			e.other:Faction(e.self,341,5); -- Priest of Life
			e.other:Faction(e.self,280,1); -- Knight of Thunder
			e.other:Faction(e.self,262,2); -- Guards of Qeynos
			e.other:Faction(e.self,221,-1); -- Bloodsabers
			e.other:Faction(e.self,219,1); -- Antonius Bayle
			e.other:QuestReward(e.self,math.random(5),math.random(5),math.random(5),math.random(5),0,1000);
		end
		jars = 0;
		ClearEvent();
		eq.depop();
	end
    item_lib.return_items(e.self, e.other, e.trade)
end

function SpawnerSpawn(e)
	spawnTiles(eq.ChooseRandom(game1, game2, game3, game4, game5));
	eq.set_timer("game_over", 1080000); -- game should allow for 18 minutes to complete or will otherwise reset/depop
end

function SpawnerTimer(e)
	if e.timer == "game_over" then 
		eq.depop_with_timer(2022);  -- depop Velarte Selire
		jars = 0;
		ClearEvent();
	end
end

function TileTrade(e)
	local item_lib = require("items");
	
	if(jars < 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2584})) then 
		e.other:QuestReward(e.self,{itemid = 2587});
		eq.spawn2(enchanted, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		jars = jars + 1;
		eq.depop(); --depop tile
	elseif(jars < 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2585})) then 
		e.other:QuestReward(e.self,{itemid = 2588});
		eq.spawn2(enchanted, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		jars = jars + 1;
		eq.depop(); --depop tile
	elseif(jars < 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2586})) then 
		e.other:QuestReward(e.self,{itemid = 2589});
		eq.spawn2(enchanted, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		jars = jars + 1;
		eq.depop(); --depop tile
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function EnchantedSpawn(e)
	eq.set_timer("ench", 1000);
end

function Enchantedtimer(e)
	if(e.timer == "ench") then
		eq.stop_timer("ench");
		-- checks for NPC in area
		local x = e.self:GetX();
		local y = e.self:GetY();
		local z = e.self:GetZ();
		
		e.self:Emote("scurries happily out of the jar");
		
		local npc_list = eq.get_entity_list():GetNPCList();
		local minNorth = nil;	--heading to target 128
		local minSouth = nil;	--heading to target 256
		local minWest = nil;	--heading to target 192
		local minEast = nil;	--heading to target 64
		
		if(npc_list ~= nil) then		-- first loop to establish minimum distance to healthy rats
			for npc in npc_list.entries do	
				if (npc:GetNPCTypeID() == healthy) then
					if(npc.valid) then
						if (npc:CalculateHeadingToTarget(x,y) == 128) then --Checks north of tile 
							if(minNorth == nil) then
								minNorth = npc:CalculateDistance(x,y,z);
							elseif(npc:CalculateDistance(x,y,z) < minNorth) then
								minNorth = npc:CalculateDistance(x,y,z);
							end
						end
						if(npc:CalculateHeadingToTarget(x,y) == 256) then  --Checks south of tile 
							if(minSouth == nil) then
								minSouth = npc:CalculateDistance(x,y,z);
							elseif(npc:CalculateDistance(x,y,z) < minSouth) then
								minSouth = npc:CalculateDistance(x,y,z);
							end
						end
						if(npc:CalculateHeadingToTarget(x,y) == 192) then  --Checks west of tile 
							if(minWest == nil) then
								minWest = npc:CalculateDistance(x,y,z);
							elseif(npc:CalculateDistance(x,y,z) < minWest) then
								minWest = npc:CalculateDistance(x,y,z);
							end
						end
						if(npc:CalculateHeadingToTarget(x,y) > 62 and npc:CalculateHeadingToTarget(x,y) < 66) then  --Checks east of tile 
							if(minEast == nil) then
								minEast = npc:CalculateDistance(x,y,z);
							elseif(npc:CalculateDistance(x,y,z) < minEast) then
								minEast = npc:CalculateDistance(x,y,z);
							end	
						end
					end
				end
			end
		end
			
		if(npc_list ~= nil) then		--second loop to use minimum values to determine which diseased rats can be cured in all four directions
			for npc in npc_list.entries do			
				if (npc:GetNPCTypeID() == diseased) then
					if(npc.valid) then
						if(npc:CalculateHeadingToTarget(x,y) == 128) then --Checks north of tile 
							if (minNorth ~= nil and npc:CalculateDistance(x,y,z) < minNorth) then
								eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
								npc:Depop();		--depop diseased rat
							end
						elseif(npc:CalculateHeadingToTarget(x,y) == 256) then  --Checks south of tile 
							if (minSouth ~= nil and npc:CalculateDistance(x,y,z) < minSouth) then
								eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
								npc:Depop();		--depop diseased rat
							end
						elseif(npc:CalculateHeadingToTarget(x,y) == 192) then  --Checks west of tile 
							if (minWest ~= nil and npc:CalculateDistance(x,y,z) < minWest) then
								eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
								npc:Depop();		--depop diseased rat
							end
						elseif(npc:CalculateHeadingToTarget(x,y) > 62 and npc:CalculateHeadingToTarget(x,y) < 66) then  --Checks east of tile 
							if (minEast ~= nil and npc:CalculateDistance(x,y,z) < minEast) then
								eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
								npc:Depop();		--depop diseased rat
							end
						end
					end
				end
			end
		end
		eq.spawn2(healthy, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn healthy rat
		eq.depop();
	end
end

function spawnTiles(game)
	for key,tiles in pairs(game) do
		local mob = eq.spawn2(tiles[1], 0, 0, tiles[2], tiles[3], tiles[4], tiles[5]);
	end
end

function ClearEvent()
	eq.depop_all(diseased);
	eq.depop_all(healthy);
	eq.depop_all(empty);
	eq.depop_all(enchanted);
	eq.depop(spawner);
end

function event_encounter_load(e)
	eq.register_npc_event("research", Event.say, 2052, VelarteSay);
	eq.register_npc_event("research", Event.trade, 2052, VelarteTrade);
	eq.register_npc_event("research", Event.trade, 2022, Velarte2Trade);
	eq.register_npc_event("research", Event.spawn, 2000, SpawnerSpawn);
	eq.register_npc_event("research", Event.timer, 2000, SpawnerTimer);
	eq.register_npc_event("research", Event.trade, 2019, TileTrade);
	eq.register_npc_event("research", Event.spawn, 2010, EnchantedSpawn);
	eq.register_npc_event("research", Event.timer, 2010, Enchantedtimer);
end
