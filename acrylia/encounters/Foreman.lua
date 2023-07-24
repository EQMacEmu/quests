local GRIMLING_DEATHGUARD_TYPE = 154170;
local SKELETAL_DEATHGUARD_TYPE = 154048;
local NON_TARGET_FOREMAN_TYPE = 154118;
local FOREMAN_TYPE = 154366;
local BONES_TYPE = 154337;

function GrimDeathguardDeathEvent(e)
	eq.signal(NON_TARGET_FOREMAN_TYPE, 1);
end

function SpawnEvent(e)
	eq.set_timer("depop", 7200000);
end

function DepopTimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function FakeForemanTimerEvent(e)

	if ( e.timer == "check" ) then
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(GRIMLING_DEATHGUARD_TYPE)
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(NON_TARGET_FOREMAN_TYPE)
		) then
			
			local fake = eq.get_entity_list():GetNPCByNPCTypeID(NON_TARGET_FOREMAN_TYPE);
			eq.spawn2(FOREMAN_TYPE, 0, 0, fake:GetX(), fake:GetY(), fake:GetZ(), fake:GetHeading());
			eq.depop_with_timer(NON_TARGET_FOREMAN_TYPE);
			
			local npcList = eq.get_entity_list():GetNPCList();
			
			for npc in npcList.entries do
			
				-- exclude the bones in the Trondol room
				if ( npc.valid and npc:GetNPCTypeID() == BONES_TYPE and npc:GetX() > 300 and npc:GetY() < -200 ) then
				
					eq.spawn2(SKELETAL_DEATHGUARD_TYPE, 0, 0, npc:GetX(), npc:GetY(), npc:GetZ(), npc:GetHeading());
				end			
			end
			eq.signal(BONES_TYPE, 1);
		end
	
		eq.stop_timer("check");
	end
end

function FakeForemanSignalEvent(e)
	if ( e.signal == 1 ) then
		eq.set_timer("check", 1000);
	end
end

function BonesSignalEvent(e)
	if ( e.signal == 1 and e.self:GetX() > 300 and e.self:GetY() < -200 ) then
		eq.depop_with_timer();
	end
end

function event_encounter_load(e)
	
	eq.register_npc_event("Foreman", Event.death, GRIMLING_DEATHGUARD_TYPE, GrimDeathguardDeathEvent);
	
	eq.register_npc_event("Foreman", Event.spawn, FOREMAN_TYPE, SpawnEvent);
	eq.register_npc_event("Foreman", Event.timer, FOREMAN_TYPE, DepopTimerEvent);

	eq.register_npc_event("Foreman", Event.spawn, SKELETAL_DEATHGUARD_TYPE, SpawnEvent);
	eq.register_npc_event("Foreman", Event.timer, SKELETAL_DEATHGUARD_TYPE, DepopTimerEvent);
	
	eq.register_npc_event("Foreman", Event.timer, NON_TARGET_FOREMAN_TYPE, FakeForemanTimerEvent);
	eq.register_npc_event("Foreman", Event.signal, NON_TARGET_FOREMAN_TYPE, FakeForemanSignalEvent);
	eq.register_npc_event("Foreman", Event.signal, BONES_TYPE, BonesSignalEvent);
end
