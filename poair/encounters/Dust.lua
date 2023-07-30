local CONTROLLER_TYPE = 215422; -- POASpiderController
local SIGISMOND_TYPE = 215375; --Sigismond_Windwalker
local CRYSTALLINE_TYPE = 215043; -- A_Crystalline_Windwalker
local PRISTINE_TYPE = 215044; -- A_Pristine_Recluse
local WEBSPINNER_TYPE = 215045; -- A_Vorladien_Webspinner
local LOSSENMACHAR_TYPE = 215060; -- #Lossenmachar
local ERRATIC_TYPE = 215402; -- An_Erratic_Arachnid
local ARCHWALKER_TYPE = 215400; -- A_Vorladien_Archwalker
local SPAWN_TYPE = 215401; -- A_Vorladien_Spawn
local AVATAR_TYPE = 215394; -- #Avatar_of_Dust
local GUY_TYPE = 215417; -- spider_man
local PH_TYPE = 215428; -- An_Ominous_Recluse

local ISLAND_SPAWNIDS = { 365476, 365917, 365980, 366466, 366772, 366826, 367087, 367200, 365511, 365661,
							365768, 365770, 365778, 365781, 365869, 366752, 366761, 366814, 367172, 367199,
							365366, 365370, 365373, 365533, 365694, 365791, 366023, 366079, 366156, 366392,
							366471, 366538, 366934, 367344, 366142 };
local ERRATIC_SPAWNIDS = { 369505, 369506, 369507, 369508, 369509, 369510, 369511, 369512, 369513, 369514, 
							369515, 369516, 369517, 369518, 369519 };
local SIGISMOND_SPAWNID = 366131;
local TIMER = "spider_repop";

local eventActive = false;
local kills = 0;
local archwalkerKills = 0;
local moveX, moveY, moveZ;

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
	eq.set_timer(TIMER, 1084000);
end

function ControllerTimer(e)
	if ( e.timer == TIMER ) then
		
		if ( eventActive ) then
			eq.depop_all(ERRATIC_TYPE);
			eq.depop_all(ARCHWALKER_TYPE);
			eq.depop_all(SPAWN_TYPE);			
			eq.depop_all(PH_TYPE);
			
			local elist = eq.get_entity_list();
			if ( elist:IsMobSpawnedByNpcTypeID(SIGISMOND_TYPE) ) then
				elist:GetSpawnByID(SIGISMOND_SPAWNID):Repop();
			end
			
			ToggleErraticSpawns(false);
			eventActive = false;
			kills = 0;
			eq.set_timer(TIMER, 1080000); -- 18 mins
		end
		
		RepopIsland(ISLAND_SPAWNIDS);
		
	elseif ( e.timer == "1h_despawn" ) then
		eq.depop_all(ERRATIC_TYPE);
		eq.depop_all(ARCHWALKER_TYPE);
		eq.depop_all(SPAWN_TYPE);
		eq.stop_timer(e.timer);
		eq.debug("Dust isle 1 hour despawn timer expired");
	end
end

function SpawnArchwalker()
	eq.spawn2(ARCHWALKER_TYPE, 0, 0, -452, 640, 437.576, 10);
end

function ToggleErraticSpawns(state)
	local elist = eq.get_entity_list();

	for _, id in ipairs(ERRATIC_SPAWNIDS) do
		if ( state ) then
			elist:GetSpawnByID(id):Enable();
		else
			elist:GetSpawnByID(id):Disable();
		end
	end
end

function ControllerSignal(e)
	local elist = eq.get_entity_list();
	
	if ( e.signal == 1 ) then

		if ( eventActive ) then
			return;
		end
	
		kills = kills + 1;
		if ( elist:IsMobSpawnedByNpcTypeID(SIGISMOND_TYPE) ) then
			local npc = elist:GetNPCByNPCTypeID(SIGISMOND_TYPE);

			local newSize = 0;
			if ( kills % 3 == 0 ) then
				newSize = 3 + kills / 3;
			elseif ( kills == #ISLAND_SPAWNIDS ) then
				newSize = 16;
			end
			
			if ( newSize > 0 ) then
				npc:ChangeSize(newSize);
			end
		end
		
		if ( CheckIsland() ) then -- true if island spawns are all dead
		
			eventActive = true;
			archwalkerKills = 0;
			SpawnArchwalker();
			ToggleErraticSpawns(true);
			eq.set_timer("1h_despawn", 3600000);
		end
	
	elseif ( e.signal == 2 ) then	-- spawn death

		if ( not elist:IsMobSpawnedByNpcTypeID(SPAWN_TYPE) and not elist:IsMobSpawnedByNpcTypeID(ARCHWALKER_TYPE) ) then
			if ( archwalkerKills < 3 ) then
				SpawnArchwalker();
			else
				local elist = eq.get_entity_list();
				if ( elist:IsMobSpawnedByNpcTypeID(SIGISMOND_TYPE) ) then
					local npc = elist:GetNPCByNPCTypeID(SIGISMOND_TYPE);
					npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
					npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
					npc:SetSpecialAbility(35, 0); -- No Harm from Players off
					npc:SetBodyType(21, false);	-- Animal

				else
					eq.unique_spawn(PH_TYPE, 0, 0, -400, 889, 433.6, 131);
					ToggleErraticSpawns(false);
				end
				eq.stop_timer("1h_despawn");
			end
		end
	end
end

function IslandDeath(e)
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 1);
end

function ErraticSpawn(e)
	e.self:MoveTo(moveX, moveY, moveZ, -1, false);
	eq.set_timer("move", 10000);
end

function ErraticTimer(e)
	if ( not e.self:IsEngaged() ) then
	
		local t = SIGISMOND_TYPE;
		if ( archwalkerKills < 3 ) then
			t = ARCHWALKER_TYPE;
		end
		
		local boss = eq.get_entity_list():GetNPCByNPCTypeID(t);
		if ( boss.valid and boss:IsEngaged() ) then
			e.self:CastToNPC():MoveTo(boss:GetX(), boss:GetY(), boss:GetZ() - 3, -1, false);
		end
	end
end

function ArchwalkerDeath(e)

	archwalkerKills = archwalkerKills + 1;
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local hl = e.self:GetHateList();
	local mob;
	
	if ( archwalkerKills < 4 ) then
		for i = 1, 3 do
			mob = eq.spawn2(SPAWN_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
			
			for ent in hl.entries do
				if ( ent.ent:IsClient() ) then
					mob:AddToHateList(ent.ent, 1);
				end
			end
		end
	end
end

function SpawnDeath(e)
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 2);
end

function BossDeathComplete(e)
	ToggleErraticSpawns(false);
	eq.unique_spawn(AVATAR_TYPE, 0, 0, 1671, 527, 344, 192);
	eq.depop_with_timer(GUY_TYPE);
end

function AvatarSpawn(e)
	e.self:Shout("Elementals of Air and Dust, I call upon you to aid me in the defense of this land!");
	eq.set_timer("depop", 2700000);
end

function AvatarCombat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
		eq.pause_timer("depop");
	else
		eq.stop_timer("drophate");
		eq.resume_timer("depop");
		
		-- this is to mimic certain behavior Sony's servers had/has.  NPCs aggroed a long time sometimes warp home or
		-- some distance away in the direction of home and heal somewhat when they hate list wipe.  The exact logic to this
		-- behavior is unknown.  Bosses with the tank hate list drop mechanic need this in order to not trivialize the
		-- encounter using mem blur.  This is a crude solution that works well enough
		local ratio = e.self:GetHPRatio();
		if ( ratio < 50 or math.random(100) > ratio ) then
			e.self:GMMove(e.self:GetGuardPointX(), e.self:GetGuardPointY(), e.self:GetGuardPointZ(), e.self:GetSpawnPointH());
			e.self:SetHP(e.self:GetHP() + math.floor(e.self:GetMaxHP() * 0.3));
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

function GuySpawn(e)
	eq.get_entity_list():GetSpawnByID(SIGISMOND_SPAWNID):Repop();	
end

function event_encounter_load(e)
	eq.register_npc_event("Dust", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("Dust", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	eq.register_npc_event("Dust", Event.signal, CONTROLLER_TYPE, ControllerSignal);

	eq.register_npc_event("Dust", Event.death, CRYSTALLINE_TYPE, IslandDeath);
	eq.register_npc_event("Dust", Event.death, PRISTINE_TYPE, IslandDeath);
	eq.register_npc_event("Dust", Event.death, WEBSPINNER_TYPE, IslandDeath);
	eq.register_npc_event("Dust", Event.death, LOSSENMACHAR_TYPE, IslandDeath);
	
	eq.register_npc_event("Dust", Event.spawn, ERRATIC_TYPE, ErraticSpawn);
	eq.register_npc_event("Dust", Event.timer, ERRATIC_TYPE, ErraticTimer);
	
	eq.register_npc_event("Dust", Event.death, ARCHWALKER_TYPE, ArchwalkerDeath);
	eq.register_npc_event("Dust", Event.death, SPAWN_TYPE, SpawnDeath);

	eq.register_npc_event("Dust", Event.death_complete, SIGISMOND_TYPE, BossDeathComplete);
	eq.register_npc_event("Mist", Event.combat, SIGISMOND_TYPE, AvatarCombat);
	eq.register_npc_event("Mist", Event.timer, SIGISMOND_TYPE, AvatarTimer);

	eq.register_npc_event("Dust", Event.spawn, GUY_TYPE, GuySpawn);
	
	eq.register_npc_event("Dust", Event.spawn, AVATAR_TYPE, AvatarSpawn);
	eq.register_npc_event("Dust", Event.combat, AVATAR_TYPE, AvatarCombat);
	eq.register_npc_event("Dust", Event.timer, AVATAR_TYPE, AvatarTimer);
end
