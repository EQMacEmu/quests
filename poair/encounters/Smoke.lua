local CONTROLLER_TYPE = 215421; -- POAElementalController
local CONFUSED_TYPE = 215012; -- A_Confused_Air_Elemental
local CHAMPION1_TYPE = 215395; -- An_Elemental_Champion
local CHAMPION2_TYPE = 215447; -- An_Elemental_Champion
local CHAMPION3_TYPE = 215448; -- An_Elemental_Champion
local CHAMPION4_TYPE = 215449; -- An_Elemental_Champion (small one)
local BOSS_TYPE = 215396; -- An_Elemental_Masterpiece
local AVATAR_TYPE = 215392; -- #Avatar_of_Smoke
local GUY_TYPE = 215415; -- elemental_guy
local PH_TYPE = 215427; -- An_Elemental_Anomaly
local SWIRLING_TYPE = 215039; -- A_Swirling_Elemental_Force

local ISLAND_SPAWNIDS = { 365296, 365384, 365387, 365415, 365449, 365471, 365521, 365730, 365852, 365996, 
							366238, 366398, 366425, 366713, 366778, 366918, 367066, 367114, 367117, 367331,
							367514 };
local CHAMP_LOCS = {
	[5] = { CHAMPION1_TYPE, -491, -1274, 320, 64 },
	[10] = { CHAMPION2_TYPE, -434, -1208, 324, 128 },
	[15] = { CHAMPION3_TYPE, -395, -1283, 323, 192 },
	[21] = { CHAMPION4_TYPE, -452, -1341, 320, 0 },
};

local TIMER = "elemental_repop";

local moveX, moveY, moveZ;
local kills = 0;

function RepopIsland()
	local elist = eq.get_entity_list();

	for _, id in ipairs(ISLAND_SPAWNIDS) do
		elist:GetSpawnByID(id):Repop();
	end
end

function CheckIsland()
	local elist = eq.get_entity_list();

	for _, id in ipairs(ISLAND_SPAWNIDS) do
		if ( elist:GetSpawnByID(id):GetNPC().valid ) then
			eq.set_timer(TIMER, 1080000); -- 18 mins
			return false;
		end
	end
	
	eq.set_timer(TIMER, 10800000); -- 3 hours
	return true;
end

function ControllerSpawn(e)
	eq.set_timer(TIMER, 1082000);
end

function ControllerTimer(e)
	if ( e.timer == TIMER ) then
		
		kills = 0;
		eq.depop_all(CHAMPION1_TYPE);
		eq.depop_all(CHAMPION2_TYPE);
		eq.depop_all(CHAMPION3_TYPE);
		eq.depop_all(CHAMPION4_TYPE);
		eq.depop_all(BOSS_TYPE);
		eq.depop_all(PH_TYPE);
		eq.set_timer(TIMER, 1080000); -- 18 mins
		
		RepopIsland(ISLAND_SPAWNIDS);
	end
end

function ControllerSignal(e)
	if ( e.signal == 1 ) then
	
		kills = kills + 1;
		if ( CHAMP_LOCS[kills] ) then
			eq.spawn2(CHAMP_LOCS[kills][1], 0, 0, CHAMP_LOCS[kills][2], CHAMP_LOCS[kills][3], CHAMP_LOCS[kills][4], CHAMP_LOCS[kills][5]);
		end
		
		if ( kills == #ISLAND_SPAWNIDS ) then
			local npcList = eq.get_entity_list():GetNPCList();
			local t;
			
			for npc in npcList.entries do
				if ( npc.valid ) then
					t = npc:GetNPCTypeID();
					
					if ( t == CHAMPION1_TYPE or t == CHAMPION2_TYPE or t == CHAMPION3_TYPE or t == CHAMPION4_TYPE ) then
						npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
						npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
						npc:SetSpecialAbility(35, 0); -- No Harm from Players off
						npc:SetBodyType(1, false);	-- Humanoid
						--npc:SetRunning(true);
						--npc:MoveTo(moveX, moveY, moveZ, -1, false);
					end
				end
			end
		end
		
		CheckIsland();
		
	elseif ( e.signal == 2 ) then
	
		local elist = eq.get_entity_list();
		if ( not elist:IsMobSpawnedByNpcTypeID(CHAMPION1_TYPE) and not elist:IsMobSpawnedByNpcTypeID(CHAMPION2_TYPE) 
			and not elist:IsMobSpawnedByNpcTypeID(CHAMPION3_TYPE) and not elist:IsMobSpawnedByNpcTypeID(CHAMPION4_TYPE)
		) then
		
			if ( elist:IsMobSpawnedByNpcTypeID(GUY_TYPE) ) then

				local mob = eq.unique_spawn(BOSS_TYPE, 0, 0, -445, -1284, 323, 0);
				--[[
				if ( mob and mob.valid ) then
					mob:SetRunning(true);
					mob:CastToNPC():MoveTo(moveX, moveY, moveZ, -1, false);
				end
				]]
			else
				eq.unique_spawn(PH_TYPE, 0, 0, -445, -1284, 323, 0);
			end
		end
	end
end

function ConfusedDeath(e)
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 1);
end

function SwirlingDeath(e)
	local mySpawnID = e.self:GetSpawnPointID();
	local found = false;
	for _, id in ipairs(ISLAND_SPAWNIDS) do
		if ( id == mySpawnID ) then
			found = true;
			break;
		end
	end
	if ( not found ) then
		return;
	end
	
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 1);
end

function ChampionDeath(e)
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 2);
end

function BossDeathComplete(e)
	eq.unique_spawn(AVATAR_TYPE, 0, 0, 1396, -680, 18, 0);
	eq.depop_with_timer(GUY_TYPE);
end

function AvatarSpawn(e)
	e.self:Shout("The time has come for all intruders to be tested I will not allow you to pillage this plane any longer!");
	eq.set_timer("depop", 2700000);
end

function AvatarCombat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
		eq.pause_timer("depop");
	else
		eq.stop_timer("drophate");
		eq.resume_timer("depop");
	end
end

function BossTimer(e)
	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.016666 ) then -- averages to once per 60 seconds
			e.self:WipeHateList();
			eq.debug(e.self:GetName().." hate list wiped", 2);
		end
	end
end

function AvatarTimer(e)
	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.016666 ) then -- averages to once per 60 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "depop") then
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Smoke", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("Smoke", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	eq.register_npc_event("Smoke", Event.signal, CONTROLLER_TYPE, ControllerSignal);

	eq.register_npc_event("Smoke", Event.death, CONFUSED_TYPE, ConfusedDeath);
	eq.register_npc_event("Smoke", Event.death, SWIRLING_TYPE, SwirlingDeath);

	eq.register_npc_event("Smoke", Event.death, CHAMPION1_TYPE, ChampionDeath);
	eq.register_npc_event("Smoke", Event.death, CHAMPION2_TYPE, ChampionDeath);
	eq.register_npc_event("Smoke", Event.death, CHAMPION3_TYPE, ChampionDeath);
	eq.register_npc_event("Smoke", Event.death, CHAMPION4_TYPE, ChampionDeath);
	
	eq.register_npc_event("Smoke", Event.death_complete, BOSS_TYPE, BossDeathComplete);
	eq.register_npc_event("Smoke", Event.combat, BOSS_TYPE, AvatarCombat);
	eq.register_npc_event("Smoke", Event.timer, BOSS_TYPE, BossTimer);

	eq.register_npc_event("Smoke", Event.spawn, AVATAR_TYPE, AvatarSpawn);
	eq.register_npc_event("Smoke", Event.combat, AVATAR_TYPE, AvatarCombat);
	eq.register_npc_event("Smoke", Event.timer, AVATAR_TYPE, AvatarTimer);
end
