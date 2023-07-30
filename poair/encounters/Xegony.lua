local XEGONY_TYPE = 215056; -- #Xegony_the_Queen_of_Air
local PLANAR_PROJECTION_TYPE = 215432; -- Essence_of_Air
local PRISMATIC_TYPE = 215004; -- A_Prismatic_Guardian_of_Xegony
local HIGH_COUNCILMAN_TYPE = 215005; -- High_Councilman_of_the_Queen
local INFUSED_TYPE = 215050; -- An_Air_Infused_Defender
local SCOUT_TYPE = 215049; -- An_Air_Phoenix_Scout
local CLOUDWALKER_TYPE = 215048; -- A_Deadly_Cloudwalker
local DJINNI_TYPE = 215047; -- A_Djinni_Air_Defender
local KNIGHT_TYPE = 215052; -- A_Knight_of_Air
local SERVANT_TYPE = 215051; -- Servant_of_Air
local ARBITOR_TYPE = 215406; -- An_Elemental_Arbitor
local HURIDAF_TYPE = 215405; -- Huridaf_Vorgaasna
local NUQUERNAL_TYPE = 215404; -- Nuquernal_Belegrodian
local RINDALER_TYPE = 215408; -- Rindaler_Egulrtan
local WERUIS_TYPE = 215407; -- Weruis_Herfadban
local WESREH_TYPE = 215403; -- Wesreh_Galleantan
local MUZLAKH_TYPE = 215053; -- #Muzlakh_the_Chosen
local WAVES = {
	{ NUQUERNAL_TYPE, DJINNI_TYPE, 23, 428, 1437 },
	{ WESREH_TYPE, SERVANT_TYPE, -352, 359, 1440 },
	{ RINDALER_TYPE, KNIGHT_TYPE, -534, 268, 1459.97 },
	{ ARBITOR_TYPE, INFUSED_TYPE, -470, -339, 1437 },
	{ WERUIS_TYPE, SCOUT_TYPE, -194, -269, 1443.376 },
	{ HURIDAF_TYPE, CLOUDWALKER_TYPE, 31, -224, 1440.25 },
};
local SPAWNIDS = { 365683, 366211, 366302, 366744, 367102,
	365466, 365559, 365773, 366040, 366441,
	365304, 365447, 366146, 366930, 367528,
	365401, 366167, 367007, 367306, 367517,
	366314, 366857, 366998, 367302, 367416,
	366101, 366152, 366284, 366715, 367134,
	365761, 365797, 366011, 366434, 366583, 366817,
	365312, 365354, 366378,
	367474,
};
local HP_TRIGGERS = { 99, 85, 70, 55, 40, 25 };

local waves = {};
local trigger = 1;
local aggroTime = 0;

function RepopEverything()
	local elist = eq.get_entity_list();
	for _, id in ipairs(SPAWNIDS) do
		elist:GetSpawnByID(id):Repop();
	end
	eq.depop_all(ARBITOR_TYPE);
	eq.depop_all(HURIDAF_TYPE);
	eq.depop_all(NUQUERNAL_TYPE);
	eq.depop_all(RINDALER_TYPE);
	eq.depop_all(WERUIS_TYPE);
	eq.depop_all(WESREH_TYPE);
	eq.debug("Xegony adds repop");
end

function SpawnWave()
	local tries = 0;
	local roll;
	
	while ( not roll or (tries < 100 and waves[roll]) ) do
	
		roll = math.random(1, 6);
		
		if ( not waves[roll] ) then
			local namedType = WAVES[roll][1];
			local unnamedType = WAVES[roll][2]
			local x = WAVES[roll][3];
			local y = WAVES[roll][4];
			local z = WAVES[roll][5];
			local npcList = eq.get_entity_list():GetNPCList();
			local xegony = eq.get_entity_list():GetNPCByNPCTypeID(XEGONY_TYPE);
			
			for npc in npcList.entries do
				if ( npc.valid and npc:GetNPCTypeID() == unnamedType ) then
					npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
					npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
					npc:SetSpecialAbility(35, 0); -- No Harm from Players off
					npc:SetBodyType(1, false);	-- Humanoid
					npc:SetRunning(true);
					npc:MoveTo(xegony:GetX(), xegony:GetY(), xegony:GetZ(), -1, false);
				end
			end
			local npc = eq.spawn2(namedType, 0, 0, x, y, z, 0):CastToNPC();
			npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
			npc:SetSpecialAbility(25, 0); -- Immune to Aggro off
			npc:SetSpecialAbility(35, 0); -- No Harm from Players off
			npc:SetBodyType(1, false);	-- Humanoid
			npc:SetRunning(true);
			npc:MoveTo(xegony:GetX(), xegony:GetY(), xegony:GetZ(), -1, false);
			
			waves[roll] = true;
			eq.debug("Xegony wave spawned ("..npc:GetCleanName()..")");
			return;
		end
		
		tries = tries + 1;
	end
	eq.debug("Script error: could not spawn Xegony wave");
end

function XegonySpawn(e)
	RepopEverything();
end

function XegonyCombat(e)

	if ( e.joined ) then
		eq.set_timer("check_hp", 6000);
		aggroTime = eq.clock();
		trigger = 1;
		for i = 1, 6 do
			waves[i] = nil;
		end
	else
		eq.stop_timer("check_hp");
		if ( (eq.clock() - aggroTime) > 120 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
		RepopEverything();
	end
end

function XegonyTimer(e)
	if ( e.timer == "check_hp" ) then
	
		if ( not HP_TRIGGERS[trigger] ) then
			return;
		end
		
		if ( (HP_TRIGGERS[trigger] == 99 and e.self:GetHP() < e.self:GetMaxHP()) or e.self:GetHPRatio() <= HP_TRIGGERS[trigger] ) then
			SpawnWave();
			trigger = trigger + 1;
		end
	end
end

function XegonyDeathComplete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function AddCombat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
	else
		eq.stop_timer("drophate");
	end
end

function AddTimer(e)
	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.06666 ) then -- averages to once per 15 seconds
		
			local target = e.self:GetTarget();			
			if ( target and target.valid ) then
			
				local xegony = eq.get_entity_list():GetNPCByNPCTypeID(XEGONY_TYPE);
				if ( xegony and xegony.valid and xegony:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 30 ) then
				
					-- if adds are very close to Xegony, then just reset hate to 1 instead of drop entirely
					-- this behavior was witnessed on Live servers
					e.self:SetHate(target, 1);
					--eq.debug(e.self:GetName().." reduced target's hate ("..target:GetName()..")", 2);
				else
					e.self:RemoveFromHateList(target);
					--eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
				end
			end
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Xegony", Event.spawn, XEGONY_TYPE, XegonySpawn);
	eq.register_npc_event("Xegony", Event.combat, XEGONY_TYPE, XegonyCombat);
	eq.register_npc_event("Xegony", Event.timer, XEGONY_TYPE, XegonyTimer);
	eq.register_npc_event("Xegony", Event.death_complete, XEGONY_TYPE, XegonyDeathComplete);
	
	for i, t in ipairs(WAVES) do
		eq.register_npc_event("Xegony", Event.combat, t[1], AddCombat);
		eq.register_npc_event("Xegony", Event.timer, t[1], AddTimer);
		eq.register_npc_event("Xegony", Event.combat, t[2], AddCombat);
		eq.register_npc_event("Xegony", Event.timer, t[2], AddTimer);
	end
	
	eq.register_npc_event("Xegony", Event.combat, PRISMATIC_TYPE, AddCombat);
	eq.register_npc_event("Xegony", Event.timer, PRISMATIC_TYPE, AddTimer);
	eq.register_npc_event("Xegony", Event.combat, HIGH_COUNCILMAN_TYPE, AddCombat);
	eq.register_npc_event("Xegony", Event.timer, HIGH_COUNCILMAN_TYPE, AddTimer);
	eq.register_npc_event("Xegony", Event.combat, MUZLAKH_TYPE, AddCombat);
	eq.register_npc_event("Xegony", Event.timer, MUZLAKH_TYPE, AddTimer);
end
