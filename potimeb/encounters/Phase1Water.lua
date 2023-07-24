local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local GATHERER1_TYPE = 223035; -- a_triloun_gatherer (wizard)
local GATHERER2_TYPE = 223036; -- a_triloun_gatherer (enchanter)
local DEEPWATER1_TYPE = 223033; -- a_deepwater_triloun (monk)
local DEEPWATER2_TYPE = 223034; -- a_deepwater_triloun (rogue)
local BOSS_TYPE = 223037; -- Anar_of_Water
local MOBS = { GATHERER1_TYPE, GATHERER2_TYPE, DEEPWATER1_TYPE, DEEPWATER2_TYPE, BOSS_TYPE };
local SHADOW_NAME = "Shadow_of_Anar";

local kills, bossStatus, addSpawns;

function WaterSignal(e)
	if ( e.signal == 141 ) then		-- start trial
		kills = 0;
		addSpawns = 0;
		bossStatus = tonumber(e.data);
		if ( bossStatus == 1 ) then
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 867, 500, 192, SHADOW_NAME);
		else
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 867, 500, 192);
		end
		eq.spawn2(GATHERER1_TYPE, 0, 0, 49, 842, 496, 192);
		eq.spawn2(GATHERER2_TYPE, 0, 0, 49, 889, 496, 192);
		
	elseif ( e.signal == 100 ) then		-- depopulate zone
		eq.depop_all(GATHERER1_TYPE);
		eq.depop_all(GATHERER2_TYPE);
		eq.depop_all(DEEPWATER1_TYPE);
		eq.depop_all(DEEPWATER2_TYPE);
		eq.depop_all(BOSS_TYPE);
	end
end

function DeathComplete(e)
	kills = kills + 1;

	if ( kills >= 7 ) then
		local elist = eq.get_entity_list();
		
		if ( not elist:IsMobSpawnedByNpcTypeID(BOSS_TYPE) and not elist:IsMobSpawnedByNpcTypeID(GATHERER1_TYPE)
			and not elist:IsMobSpawnedByNpcTypeID(DEEPWATER1_TYPE) and not elist:IsMobSpawnedByNpcTypeID(GATHERER2_TYPE)
			and not elist:IsMobSpawnedByNpcTypeID(DEEPWATER2_TYPE)
		) then
			eq.signal(INSTANCE_CONTROLLER_TYPE, 5, 0, "4");	-- trial success
		end
	end
end

function BossDeathComplete(e)
	-- in case GMs kill boss with large hits, i.e. #damage with large number
	if ( addSpawns == 0 ) then
		SpawnAdds(e);
		SpawnAdds(e);
	elseif ( addSpawns == 2 ) then
		SpawnAdds(e);
	end
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "1;4");
	DeathComplete(e);
end

function BossSpawn(e)
	eq.set_next_hp_event(90);
	if ( bossStatus == 1 ) then
		e.self:ClearItemList();
	end
end

function BossCombat(e)
	if ( e.joined ) then
		if ( e.self:GetHPRatio() > 91 ) then
			eq.set_next_hp_event(90);
			e.self:ModifyNPCStat("min_hit", "295");
			e.self:ModifyNPCStat("max_hit", "1150");
		end
	end
end

function SpawnAdds(e)
	local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	eq.spawn2(DEEPWATER1_TYPE, 0, 0, x, y, z, 0);
	eq.spawn2(DEEPWATER2_TYPE, 0, 0, x, y, z, 0);
	addSpawns = addSpawns + 2;
end

function BossHP(e)
	if ( e.hp_event == 90 ) then
		eq.set_next_hp_event(45);
	elseif ( e.hp_event == 45 ) then
		eq.set_next_hp_event(20);
	elseif ( e.hp_event == 20 ) then
		e.self:Emote("swirls with newfound power, then begins lashing out furiously at those within reach.");
		e.self:ModifyNPCStat("min_hit", "350");
		e.self:ModifyNPCStat("max_hit", "1300");
		return;
	end
	SpawnAdds(e);
end

function TargetChange(e)
	-- if mob aggros on somebody outside the trial, reset
	if ( e.other and e.other.valid and (e.other:GetY() > 1000 or e.other:GetY() < 750 or e.other:GetX() > 100) ) then
		eq.debug(e.self:GetName().." is aggro on player outside of trial ("..e.other:GetName()..")");
		e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		e.self:WipeHateList();
		e.self:Heal();
		e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase1Water", Event.signal, EVENTS_CONTROLLER_TYPE, WaterSignal);
	eq.register_npc_event("Phase1Water", Event.death_complete, GATHERER1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Water", Event.death_complete, GATHERER2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Water", Event.death_complete, DEEPWATER1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Water", Event.death_complete, DEEPWATER2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Water", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("Phase1Water", Event.combat, BOSS_TYPE, BossCombat);
	eq.register_npc_event("Phase1Water", Event.hp, BOSS_TYPE, BossHP);
	eq.register_npc_event("Phase1Water", Event.death_complete, BOSS_TYPE, BossDeathComplete);
	for _, id in ipairs(MOBS) do
		eq.register_npc_event("Phase1Water", Event.target_change, id, TargetChange);
	end
end
