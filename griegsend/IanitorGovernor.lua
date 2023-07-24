-- this script will repop all 3 fake Ianitors if all spawn as fake to force a spawn

local SPAWNIDS = { 334700, 334701, 334732 };
local INVIS_IANITOR = 163086;

function CheckSpawns()

	local npcList = eq.get_entity_list():GetNPCList();
	local numSpawns = 0;
	
	if ( npcList ) then
	
		for npc in npcList.entries do

			if ( npc.valid and npc:GetNPCTypeID() == INVIS_IANITOR ) then
				numSpawns = numSpawns + 1;
			end
		end

		if ( numSpawns == 3 ) then
			eq.debug("#Prast_Ianitor did not spawn; repopping");
			DepopSpawns();
			eq.set_timer("repop", 3000);
		end
	end
end

function DepopSpawns()
	local npcList = eq.get_entity_list():GetNPCList();

	if ( npcList ) then
	
		for npc in npcList.entries do

			-- have to use npc and not spawn because spawn:Depop just disables the spawn
			if ( npc.valid and npc:GetNPCTypeID() == INVIS_IANITOR ) then
				npc:Depop(true);
			end
		end
	end
end

function event_signal(e)
	if ( e.signal == 1 ) then
		CheckSpawns();
	end
end

function event_timer(e)
	if ( e.timer == "repop" ) then
		eq.stop_timer("repop");
		for _, id in ipairs(SPAWNIDS) do
			eq.spawn_from_spawn2(id);
		end
	end
end
