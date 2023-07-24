local Spawner = 0;
local Where = 0;

function TriggerSpawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126209)) then
		eq.depop(126209)
	end
	eq.set_timer("spawn",1000);
end

function TriggerTimer(e)
	eq.spawn2(126209,0,0,162,475,119,0); -- NPC: DancingDirector
	eq.stop_timer("spawn");
end

function TheaterSpawn(e)
	eq.set_timer("spawn",47000);
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126248)) then
		eq.depop(126248);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126252)) then
		eq.depop(126252);
	end
	eq.spawn2(126248,7,0,66,405,119,0); -- NPC: #Geb
	eq.spawn2(126252,8,0,258,405,119,0); -- NPC: #Selvz
end

function TheaterTimer(e)
	if(e.timer == "spawn") then
		Spawner = Spawner + 1;
		if(Spawner == 1) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126327)) then
				eq.depop(126327);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126331)) then
				eq.depop(126331);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126324)) then
				eq.depop(126324);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126335)) then
				eq.depop(126335);
			end
			eq.spawn2(126327,9,0,66,405,119,0); -- NPC: #Lelp
			eq.spawn2(126331,10,0,66,405,119,0); -- NPC: #Brendaine
			eq.spawn2(126324,11,0,258,405,119,0); -- NPC: #Forlus
			eq.spawn2(126335,12,0,258,405,119,0); -- NPC: #Terana
		elseif(Spawner == 2) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126334)) then
				eq.depop(126334);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126342)) then
				eq.depop(126342);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126338)) then
				eq.depop(126338);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126323)) then
				eq.depop(126323);
			end
			eq.spawn2(126334,13,0,66,405,119,0); -- NPC: #Osfof
			eq.spawn2(126342,14,0,66,405,119,0); -- NPC: #Snide
			eq.spawn2(126338,15,0,258,405,119,0); -- NPC: #Verna
			eq.spawn2(126323,16,0,258,405,119,0); -- NPC: #Lelel
		elseif(Spawner == 3) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126254)) then
				eq.depop(126254);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126173)) then
				eq.depop(126173);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126211)) then
				eq.depop(126211);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126295)) then
				eq.depop(126295);
			end
			eq.spawn2(126254,17,0,66,405,119,0); -- NPC: #Bidalla
			eq.spawn2(126173,18,0,66,405,119,0); -- NPC: #Kelld
			eq.spawn2(126211,19,0,258,405,119,0); -- NPC: #Zerna
			eq.spawn2(126295,20,0,258,405,119,0); -- NPC: #Siris
		elseif(Spawner == 4) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126178)) then
				eq.depop(126178);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126227)) then
				eq.depop(126227);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126251)) then
				eq.depop(126251);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126158)) then
				eq.depop(126158);
			end
			eq.spawn2(126178,21,0,66,405,119,0); -- NPC: #Jinara
			eq.spawn2(126227,22,0,66,405,119,0); -- NPC: #Nerzuz
			eq.spawn2(126251,23,0,258,405,119,0); -- NPC: #Tolas
			eq.spawn2(126158,24,0,258,405,119,0); -- NPC: #Loplo
		elseif(Spawner == 5) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126157)) then
				eq.depop(126157);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126200)) then
				eq.depop(126200);
			end
			eq.spawn2(126157,25,0,66,405,119,0); -- NPC: #Hiana
			eq.spawn2(126200,26,0,258,405,119,0); -- NPC: #Uinus
		elseif(Spawner == 6) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126016)) then
				eq.depop(126016);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126021)) then
				eq.depop(126021);
			end
			eq.spawn2(126016,0,0,153,603,146,128); -- Tunare Puppet
			eq.spawn2(126021,0,0,177,603,147,128); -- Bristlebane Puppet
		elseif(Spawner == 7) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126017)) then
				eq.depop_all(126017);
			end
			eq.spawn2(126017,0,0,151,624,146,128); -- Tribunal Puppet
			eq.spawn2(126017,0,0,138,624,146,128); -- Tribunal Puppet
		elseif(Spawner == 8) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126019)) then
				eq.depop(126019);
			end
			eq.spawn2(126017,0,0,145,624,146,128); -- Tribunal Puppet
			eq.spawn2(126019,0,0,167,624,146,128); -- Erollisi Puppet
		elseif(Spawner == 9) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126015)) then
				eq.depop(126015);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126018)) then
				eq.depop(126018);
			end
			eq.spawn2(126015,0,0,160,624,146,128); -- Innoruuk Puppet
			eq.spawn2(126018,0,0,185,624,146,128); -- Solusek Puppet
		elseif(Spawner == 10) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126020)) then
				eq.depop(126020);
			end
			eq.spawn2(126020,0,0,174,624,146,128); -- Rallos Puppet

			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126248)) then -- check if Geb is up
				if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(126160)) then
					eq.depop(126160);
				end
				eq.stop_timer("spawn");
				eq.spawn2(126160,0,0,162,427,154,0); -- Bristlebane
				Spawner = 0;
			else
				eq.stop_timer("spawn");
				Spawner = 0;
				eq.depop();
			end
		end
	end
end

function GebGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function SelvGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function LelpGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function BrendaineGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function ForlusGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function TeranaGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function OsfofGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function SnideGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function VernaGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function LelelGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function BidallaGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function KelldGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function ZernaGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function SirisGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function JinaraGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function NerzuzGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function TolasGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function LoploGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function HianaGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function UinusGo(e)
	if(e.wp == 8) then
		e.self:SetAppearance(1);
	end
end

function BristleSpawn(e)
	eq.set_timer("cazic",47000);
end

function BristleTimer(e)
	Where = Where + 1;
	if(Where == 1) then
		e.self:Shout("Bah!  Where be the Cazic Thule Puppet!  Ridiculously funny!");
	elseif(Where == 2) then
		e.self:Say("Well, there is nothing to see here!  Go home everyone!");
	elseif(Where == 3) then
		eq.stop_timer("cazic");
		Where = 0;
		DepopTheater();
	end
end

function BristleCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("cazic")) then
			eq.pause_timer("cazic");
		end
	else
		eq.resume_timer("cazic");
	end
end

function DepopTheater()
	eq.depop_all(126248);
	eq.depop_all(126252);
	eq.depop_all(126327);
	eq.depop_all(126331);
	eq.depop_all(126324);
	eq.depop_all(126335);
	eq.depop_all(126334);
	eq.depop_all(126342);
	eq.depop_all(126338);
	eq.depop_all(126323);
	eq.depop_all(126254);
	eq.depop_all(126173);
	eq.depop_all(126211);
	eq.depop_all(126295);
	eq.depop_all(126178);
	eq.depop_all(126227);
	eq.depop_all(126251);
	eq.depop_all(126158);
	eq.depop_all(126157);
	eq.depop_all(126200);
	eq.depop_all(126016);
	eq.depop_all(126021);
	eq.depop_all(126017);
	eq.depop_all(126019);
	eq.depop_all(126015);
	eq.depop_all(126018);
	eq.depop_all(126020);
	eq.depop_all(126160);
	eq.depop_all(126209);
end

function event_encounter_load(e)
	eq.register_npc_event("theater", Event.spawn, 126193, TriggerSpawn);
	eq.register_npc_event("theater", Event.timer, 126193, TriggerTimer);
	eq.register_npc_event("theater", Event.spawn, 126209, TheaterSpawn);
	eq.register_npc_event("theater", Event.timer, 126209, TheaterTimer);
	eq.register_npc_event("theater", Event.waypoint_arrive, 126248, GebGo); -- Geb
	eq.register_npc_event("theater", Event.waypoint_arrive, 126252, SelvGo); -- Selvo
	eq.register_npc_event("theater", Event.waypoint_arrive, 126327, LelpGo); -- Lelp
	eq.register_npc_event("theater", Event.waypoint_arrive, 126331, BrendaineGo); -- Brendaine
	eq.register_npc_event("theater", Event.waypoint_arrive, 126324, ForlusGo); -- Forlus
	eq.register_npc_event("theater", Event.waypoint_arrive, 126335, TeranaGo); -- Terana
	eq.register_npc_event("theater", Event.waypoint_arrive, 126334, OsfofGo); -- Osfof
	eq.register_npc_event("theater", Event.waypoint_arrive, 126342, SnideGo); -- Snide
	eq.register_npc_event("theater", Event.waypoint_arrive, 126338, VernaGo); -- Verna
	eq.register_npc_event("theater", Event.waypoint_arrive, 126323, LelelGo); -- Lelel
	eq.register_npc_event("theater", Event.waypoint_arrive, 126254, BidallaGo); -- Bidalla
	eq.register_npc_event("theater", Event.waypoint_arrive, 126173, KelldGo); -- Kelld
	eq.register_npc_event("theater", Event.waypoint_arrive, 126211, ZernaGo); -- Zerna
	eq.register_npc_event("theater", Event.waypoint_arrive, 126295, SirisGo); -- Siris
	eq.register_npc_event("theater", Event.waypoint_arrive, 126178, JinaraGo); -- Jinara
	eq.register_npc_event("theater", Event.waypoint_arrive, 126227, NerzuzGo); -- Nerzuz
	eq.register_npc_event("theater", Event.waypoint_arrive, 126251, TolasGo); -- Tolas
	eq.register_npc_event("theater", Event.waypoint_arrive, 126158, LoploGo); -- Loplo
	eq.register_npc_event("theater", Event.waypoint_arrive, 126157, HianaGo); -- Hiana
	eq.register_npc_event("theater", Event.waypoint_arrive, 126200, UinusGo); -- Uinus
	eq.register_npc_event("theater", Event.spawn, 126160, BristleSpawn);
	eq.register_npc_event("theater", Event.combat, 126160, BristleCombat);
	eq.register_npc_event("theater", Event.timer, 126160, BristleTimer);
end
