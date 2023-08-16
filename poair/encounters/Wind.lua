local CONTROLLER_TYPE = 215420; -- POAStormriderController
local LIGHTNINGCLAW_TYPE = 215013; -- A_Stormrider_Lightningclaw
local MISCHIEVOUS_TYPE = 215002; -- A_Mischievous_Stormrider
local FEARSOME_TYPE = 215014; -- A_Fearsome_Stormrider
local MENACING_TYPE = 215386; -- A_Menacing_Stormrider
local PRIEST_TYPE = 215387; -- Stormrider_Priest_of_Destruction
local SPORADIC_TYPE = 215388; -- A_Sporadic_Stormrider
local FAKE_BOSS_TYPE = 215389; -- Pherlondien_Clawpike
local BOSS_TYPE = 215390; -- Pherlondien_Clawpike
local TRAP_TYPE = 215424; -- storm_boss_inv 
local PH_TYPE = 215425; -- A_Loathesome_Stormclaw
local AVATAR_TYPE = 215391; -- #Avatar_of_Wind
local GUY_TYPE = 215414; -- stormrider_guy

local ISLAND_SPAWNIDS = { 365989, 366133, 366161, 366543, 366565, 366662, 366887, 367103, 367211, 367463, 
							367524, 365410, 365822, 365827, 365916, 366073, 366294, 366502, 367084, 367375,
							365275, 365420, 365467, 365508, 365676, 366140, 367241 };
local MENACING_LOCS = {
	{ -547, -745, 107, -296, -664, 109, 211 },
	{ -491, -505, 105.7, -288, -640, 111, 211 },
	{ -621, -589, 111.9, -292, -652, 110, 211 },
	{ -409, -897, 108.8, -301, -675, 108, 211 },
	{ -237, -472, 105.7, -275, -647, 112, 211 },
	{ -140, -698, 108.8, -284, -669, 111, 211 },
	{ -189, -577, 105.7, -280, -658, 112, 211 },
	{ -275, -777, 105.7, -288, -680, 111, 211 },
};
local BOSS_LOCS = {
	{ -342, -644, 108.251, 212 },
	{ -401, -631, 108.251, 58 },
	{ -383, -598, 106, 117 },
	{ -382, -656, 105, 17 },
	{ -348, -608, 105, 161 },
};
local TIMER = "stormrider_repop";

local eventActive = false;
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
	eq.set_timer(TIMER, 1081000);
end

function ControllerTimer(e)
	if ( e.timer == TIMER ) then
		
		if ( eventActive ) then
			eq.depop_all(MENACING_TYPE);
			eq.depop_all(PRIEST_TYPE);
			eq.depop_all(SPORADIC_TYPE);
			eq.depop_all(FAKE_BOSS_TYPE);
			eq.depop_all(BOSS_TYPE);
			eq.depop_all(TRAP_TYPE);
			eq.depop_all(PH_TYPE);
			eventActive = false;
			eq.set_timer(TIMER, 1080000); -- 18 mins
		end
		
		RepopIsland();
	end
end

function ControllerSignal(e)
	if ( e.signal == 1 ) then
	
		if ( eventActive ) then
			return;
		end
		
		if ( CheckIsland() ) then -- true if island spawns are all dead
		
			eventActive = true;
			
			local mob, t;
			for i, locs in ipairs(MENACING_LOCS) do
			
				mob = eq.spawn2(MENACING_TYPE, 0, 0, locs[1], locs[2], locs[3], 0);
				mob:CastToNPC():MoveTo(locs[4], locs[5], locs[6], locs[7], true);
				
				if ( i < 3 ) then
					t = 60000;
				elseif ( i < 5 ) then
					t = 120000;
				elseif ( i < 7 ) then
					t = 180000;
				else
					t = 240000;
				end
				eq.set_timer("wake", t, mob);
			end
			
			eq.spawn2(PRIEST_TYPE, 0, 0, -259, -677, 115, 211);
		end
		
	elseif ( e.signal == 2 ) then
		local elist = eq.get_entity_list();
		
		if ( not elist:IsMobSpawnedByNpcTypeID(SPORADIC_TYPE)
			and not elist:IsMobSpawnedByNpcTypeID(TRAP_TYPE)
			and not elist:IsMobSpawnedByNpcTypeID(BOSS_TYPE)
		) then
			
			if ( elist:IsMobSpawnedByNpcTypeID(GUY_TYPE) ) then
			
				local bossi = math.random(1, #BOSS_LOCS);
				local t;
				for i, loc in ipairs(BOSS_LOCS) do
					if ( i == bossi ) then
						t = BOSS_TYPE;
					else
						t = FAKE_BOSS_TYPE;
					end
					eq.spawn2(t, 0, 0, loc[1], loc[2], loc[3], loc[4]);
				end
			else
				eq.spawn2(PH_TYPE, 0, 0, -369, -627, 105.75, 201);
			end
		end
	end
end

function IslandDeath(e)
	moveX, moveY, moveZ = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.signal(CONTROLLER_TYPE, 1);
end

function MenacingTimer(e)
	if ( e.timer == "wake" ) then
		eq.stop_timer(e.timer);
		
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(1, false);	-- Humanoid
		e.self:SetRunning(true);

		local priest = eq.get_entity_list():GetNPCByNPCTypeID(PRIEST_TYPE);
		if ( priest.valid and priest:IsEngaged() ) then
			e.self:CastToNPC():MoveTo(priest:GetX(), priest:GetY(), priest:GetZ(), -1, false);
		elseif ( moveX ) then
			e.self:CastToNPC():MoveTo(moveX, moveY, moveZ, -1, false);
		end
		
		eq.set_timer("move", 10000);
		
	elseif ( e.timer == "move" ) then
	
		if ( not e.self:IsEngaged() ) then
		
			local priest = eq.get_entity_list():GetNPCByNPCTypeID(PRIEST_TYPE);
			if ( priest.valid and priest:IsEngaged() ) then
				e.self:CastToNPC():MoveTo(priest:GetX(), priest:GetY(), priest:GetZ(), -1, false);
			end
		end
	end
end

function PriestDeathComplete(e)
	eq.depop_all(MENACING_TYPE);
	
	local rollX, rollY;
	for i = 1, 4 do
		rollX = math.random(-589, -169);
		rollY = math.random(-842, -498);
		eq.spawn2(TRAP_TYPE, 0, 0, rollX, rollY, 115, 0);
	end
end

function TrapCombat(e)
	if ( e.joined ) then
		eq.spawn2(SPORADIC_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
		eq.depop();
	end
end

function SporadicDeath(e)
	eq.signal(CONTROLLER_TYPE, 2);
end

function BossDeath(e)
	eq.unique_spawn(AVATAR_TYPE, 0, 0, -1591, 484, 15, 192);
	eq.depop_with_timer(GUY_TYPE);
	eq.depop_all(FAKE_BOSS_TYPE);
end

function AvatarSpawn(e)
	e.self:Shout("I will certainly make sure that no mortal is allowed to defile this sacred realm!");
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

function event_encounter_load(e)
	eq.register_npc_event("Wind", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("Wind", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	eq.register_npc_event("Wind", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	
	eq.register_npc_event("Wind", Event.death, LIGHTNINGCLAW_TYPE, IslandDeath);
	eq.register_npc_event("Wind", Event.death, MISCHIEVOUS_TYPE, IslandDeath);
	eq.register_npc_event("Wind", Event.death, FEARSOME_TYPE, IslandDeath);
	eq.register_npc_event("Wind", Event.timer, MENACING_TYPE, MenacingTimer);
	eq.register_npc_event("Wind", Event.death_complete, PRIEST_TYPE, PriestDeathComplete);
	eq.register_npc_event("Wind", Event.combat, TRAP_TYPE, TrapCombat);
	eq.register_npc_event("Wind", Event.death_complete, SPORADIC_TYPE, SporadicDeath);
	
	eq.register_npc_event("Wind", Event.death_complete, BOSS_TYPE, BossDeath);
	eq.register_npc_event("Wind", Event.combat, BOSS_TYPE, AvatarCombat);
	eq.register_npc_event("Wind", Event.timer, BOSS_TYPE, AvatarTimer);
	
	eq.register_npc_event("Wind", Event.spawn, AVATAR_TYPE, AvatarSpawn);
	eq.register_npc_event("Wind", Event.combat, AVATAR_TYPE, AvatarCombat);
	eq.register_npc_event("Wind", Event.timer, AVATAR_TYPE, AvatarTimer);
end
